; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99592 () Bool)

(assert start!99592)

(declare-fun b_free!25177 () Bool)

(declare-fun b_next!25177 () Bool)

(assert (=> start!99592 (= b_free!25177 (not b_next!25177))))

(declare-fun tp!88245 () Bool)

(declare-fun b_and!41199 () Bool)

(assert (=> start!99592 (= tp!88245 b_and!41199)))

(declare-fun b!1179473 () Bool)

(declare-fun res!783653 () Bool)

(declare-fun e!670561 () Bool)

(assert (=> b!1179473 (=> (not res!783653) (not e!670561))))

(declare-datatypes ((array!76152 0))(
  ( (array!76153 (arr!36726 (Array (_ BitVec 32) (_ BitVec 64))) (size!37264 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76152)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76152 (_ BitVec 32)) Bool)

(assert (=> b!1179473 (= res!783653 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46388 () Bool)

(declare-fun mapRes!46388 () Bool)

(declare-fun tp!88244 () Bool)

(declare-fun e!670558 () Bool)

(assert (=> mapNonEmpty!46388 (= mapRes!46388 (and tp!88244 e!670558))))

(declare-datatypes ((V!44737 0))(
  ( (V!44738 (val!14910 Int)) )
))
(declare-datatypes ((ValueCell!14144 0))(
  ( (ValueCellFull!14144 (v!17547 V!44737)) (EmptyCell!14144) )
))
(declare-fun mapValue!46388 () ValueCell!14144)

(declare-fun mapRest!46388 () (Array (_ BitVec 32) ValueCell!14144))

(declare-datatypes ((array!76154 0))(
  ( (array!76155 (arr!36727 (Array (_ BitVec 32) ValueCell!14144)) (size!37265 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76154)

(declare-fun mapKey!46388 () (_ BitVec 32))

(assert (=> mapNonEmpty!46388 (= (arr!36727 _values!996) (store mapRest!46388 mapKey!46388 mapValue!46388))))

(declare-fun res!783647 () Bool)

(assert (=> start!99592 (=> (not res!783647) (not e!670561))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99592 (= res!783647 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37264 _keys!1208))))))

(assert (=> start!99592 e!670561))

(declare-fun tp_is_empty!29707 () Bool)

(assert (=> start!99592 tp_is_empty!29707))

(declare-fun array_inv!28154 (array!76152) Bool)

(assert (=> start!99592 (array_inv!28154 _keys!1208)))

(assert (=> start!99592 true))

(assert (=> start!99592 tp!88245))

(declare-fun e!670556 () Bool)

(declare-fun array_inv!28155 (array!76154) Bool)

(assert (=> start!99592 (and (array_inv!28155 _values!996) e!670556)))

(declare-fun b!1179474 () Bool)

(declare-fun res!783655 () Bool)

(assert (=> b!1179474 (=> (not res!783655) (not e!670561))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1179474 (= res!783655 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37264 _keys!1208))))))

(declare-fun b!1179475 () Bool)

(declare-fun res!783657 () Bool)

(declare-fun e!670549 () Bool)

(assert (=> b!1179475 (=> (not res!783657) (not e!670549))))

(declare-fun lt!532957 () array!76152)

(declare-datatypes ((List!25906 0))(
  ( (Nil!25903) (Cons!25902 (h!27111 (_ BitVec 64)) (t!38066 List!25906)) )
))
(declare-fun arrayNoDuplicates!0 (array!76152 (_ BitVec 32) List!25906) Bool)

(assert (=> b!1179475 (= res!783657 (arrayNoDuplicates!0 lt!532957 #b00000000000000000000000000000000 Nil!25903))))

(declare-fun b!1179476 () Bool)

(declare-fun res!783644 () Bool)

(assert (=> b!1179476 (=> (not res!783644) (not e!670561))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1179476 (= res!783644 (validKeyInArray!0 k0!934))))

(declare-fun b!1179477 () Bool)

(declare-fun res!783650 () Bool)

(assert (=> b!1179477 (=> (not res!783650) (not e!670561))))

(assert (=> b!1179477 (= res!783650 (= (select (arr!36726 _keys!1208) i!673) k0!934))))

(declare-fun b!1179478 () Bool)

(declare-fun e!670557 () Bool)

(declare-fun e!670559 () Bool)

(assert (=> b!1179478 (= e!670557 e!670559)))

(declare-fun res!783648 () Bool)

(assert (=> b!1179478 (=> res!783648 e!670559)))

(assert (=> b!1179478 (= res!783648 (not (validKeyInArray!0 (select (arr!36726 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!19198 0))(
  ( (tuple2!19199 (_1!9610 (_ BitVec 64)) (_2!9610 V!44737)) )
))
(declare-datatypes ((List!25907 0))(
  ( (Nil!25904) (Cons!25903 (h!27112 tuple2!19198) (t!38067 List!25907)) )
))
(declare-datatypes ((ListLongMap!17167 0))(
  ( (ListLongMap!17168 (toList!8599 List!25907)) )
))
(declare-fun lt!532959 () ListLongMap!17167)

(declare-fun lt!532966 () ListLongMap!17167)

(assert (=> b!1179478 (= lt!532959 lt!532966)))

(declare-fun lt!532961 () ListLongMap!17167)

(declare-fun -!1564 (ListLongMap!17167 (_ BitVec 64)) ListLongMap!17167)

(assert (=> b!1179478 (= lt!532966 (-!1564 lt!532961 k0!934))))

(declare-fun zeroValue!944 () V!44737)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532958 () array!76154)

(declare-fun minValue!944 () V!44737)

(declare-fun getCurrentListMapNoExtraKeys!5058 (array!76152 array!76154 (_ BitVec 32) (_ BitVec 32) V!44737 V!44737 (_ BitVec 32) Int) ListLongMap!17167)

(assert (=> b!1179478 (= lt!532959 (getCurrentListMapNoExtraKeys!5058 lt!532957 lt!532958 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1179478 (= lt!532961 (getCurrentListMapNoExtraKeys!5058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38829 0))(
  ( (Unit!38830) )
))
(declare-fun lt!532963 () Unit!38829)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!828 (array!76152 array!76154 (_ BitVec 32) (_ BitVec 32) V!44737 V!44737 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38829)

(assert (=> b!1179478 (= lt!532963 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!828 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1179479 () Bool)

(declare-fun e!670555 () Bool)

(declare-fun e!670560 () Bool)

(assert (=> b!1179479 (= e!670555 e!670560)))

(declare-fun res!783658 () Bool)

(assert (=> b!1179479 (=> res!783658 e!670560)))

(assert (=> b!1179479 (= res!783658 (not (= (select (arr!36726 _keys!1208) from!1455) k0!934)))))

(declare-fun mapIsEmpty!46388 () Bool)

(assert (=> mapIsEmpty!46388 mapRes!46388))

(declare-fun b!1179480 () Bool)

(declare-fun res!783646 () Bool)

(assert (=> b!1179480 (=> (not res!783646) (not e!670561))))

(assert (=> b!1179480 (= res!783646 (and (= (size!37265 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37264 _keys!1208) (size!37265 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1179481 () Bool)

(declare-fun arrayContainsKey!0 (array!76152 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1179481 (= e!670560 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179482 () Bool)

(declare-fun e!670554 () Bool)

(assert (=> b!1179482 (= e!670554 (= lt!532966 lt!532959))))

(declare-fun b!1179483 () Bool)

(assert (=> b!1179483 (= e!670561 e!670549)))

(declare-fun res!783652 () Bool)

(assert (=> b!1179483 (=> (not res!783652) (not e!670549))))

(assert (=> b!1179483 (= res!783652 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532957 mask!1564))))

(assert (=> b!1179483 (= lt!532957 (array!76153 (store (arr!36726 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37264 _keys!1208)))))

(declare-fun b!1179484 () Bool)

(assert (=> b!1179484 (= e!670559 true)))

(assert (=> b!1179484 e!670554))

(declare-fun res!783645 () Bool)

(assert (=> b!1179484 (=> (not res!783645) (not e!670554))))

(assert (=> b!1179484 (= res!783645 (not (= (select (arr!36726 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532965 () Unit!38829)

(declare-fun e!670552 () Unit!38829)

(assert (=> b!1179484 (= lt!532965 e!670552)))

(declare-fun c!116863 () Bool)

(assert (=> b!1179484 (= c!116863 (= (select (arr!36726 _keys!1208) from!1455) k0!934))))

(assert (=> b!1179484 e!670555))

(declare-fun res!783656 () Bool)

(assert (=> b!1179484 (=> (not res!783656) (not e!670555))))

(declare-fun lt!532971 () tuple2!19198)

(declare-fun lt!532970 () ListLongMap!17167)

(declare-fun +!3899 (ListLongMap!17167 tuple2!19198) ListLongMap!17167)

(assert (=> b!1179484 (= res!783656 (= lt!532970 (+!3899 lt!532966 lt!532971)))))

(declare-fun lt!532969 () V!44737)

(declare-fun get!18782 (ValueCell!14144 V!44737) V!44737)

(assert (=> b!1179484 (= lt!532971 (tuple2!19199 (select (arr!36726 _keys!1208) from!1455) (get!18782 (select (arr!36727 _values!996) from!1455) lt!532969)))))

(declare-fun b!1179485 () Bool)

(declare-fun Unit!38831 () Unit!38829)

(assert (=> b!1179485 (= e!670552 Unit!38831)))

(declare-fun b!1179486 () Bool)

(declare-fun e!670553 () Bool)

(assert (=> b!1179486 (= e!670553 e!670557)))

(declare-fun res!783642 () Bool)

(assert (=> b!1179486 (=> res!783642 e!670557)))

(assert (=> b!1179486 (= res!783642 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1179486 (= lt!532970 (getCurrentListMapNoExtraKeys!5058 lt!532957 lt!532958 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1179486 (= lt!532958 (array!76155 (store (arr!36727 _values!996) i!673 (ValueCellFull!14144 lt!532969)) (size!37265 _values!996)))))

(declare-fun dynLambda!2971 (Int (_ BitVec 64)) V!44737)

(assert (=> b!1179486 (= lt!532969 (dynLambda!2971 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532967 () ListLongMap!17167)

(assert (=> b!1179486 (= lt!532967 (getCurrentListMapNoExtraKeys!5058 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1179487 () Bool)

(declare-fun Unit!38832 () Unit!38829)

(assert (=> b!1179487 (= e!670552 Unit!38832)))

(declare-fun lt!532962 () Unit!38829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76152 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38829)

(assert (=> b!1179487 (= lt!532962 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1179487 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532964 () Unit!38829)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76152 (_ BitVec 32) (_ BitVec 32)) Unit!38829)

(assert (=> b!1179487 (= lt!532964 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1179487 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25903)))

(declare-fun lt!532960 () Unit!38829)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76152 (_ BitVec 64) (_ BitVec 32) List!25906) Unit!38829)

(assert (=> b!1179487 (= lt!532960 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25903))))

(assert (=> b!1179487 false))

(declare-fun b!1179488 () Bool)

(declare-fun e!670550 () Bool)

(assert (=> b!1179488 (= e!670550 tp_is_empty!29707)))

(declare-fun b!1179489 () Bool)

(assert (=> b!1179489 (= e!670558 tp_is_empty!29707)))

(declare-fun b!1179490 () Bool)

(assert (=> b!1179490 (= e!670549 (not e!670553))))

(declare-fun res!783649 () Bool)

(assert (=> b!1179490 (=> res!783649 e!670553)))

(assert (=> b!1179490 (= res!783649 (bvsgt from!1455 i!673))))

(assert (=> b!1179490 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532968 () Unit!38829)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76152 (_ BitVec 64) (_ BitVec 32)) Unit!38829)

(assert (=> b!1179490 (= lt!532968 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1179491 () Bool)

(declare-fun res!783654 () Bool)

(assert (=> b!1179491 (=> (not res!783654) (not e!670554))))

(assert (=> b!1179491 (= res!783654 (= lt!532967 (+!3899 lt!532961 lt!532971)))))

(declare-fun b!1179492 () Bool)

(assert (=> b!1179492 (= e!670556 (and e!670550 mapRes!46388))))

(declare-fun condMapEmpty!46388 () Bool)

(declare-fun mapDefault!46388 () ValueCell!14144)

(assert (=> b!1179492 (= condMapEmpty!46388 (= (arr!36727 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14144)) mapDefault!46388)))))

(declare-fun b!1179493 () Bool)

(declare-fun res!783651 () Bool)

(assert (=> b!1179493 (=> (not res!783651) (not e!670561))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1179493 (= res!783651 (validMask!0 mask!1564))))

(declare-fun b!1179494 () Bool)

(declare-fun res!783643 () Bool)

(assert (=> b!1179494 (=> (not res!783643) (not e!670561))))

(assert (=> b!1179494 (= res!783643 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25903))))

(assert (= (and start!99592 res!783647) b!1179493))

(assert (= (and b!1179493 res!783651) b!1179480))

(assert (= (and b!1179480 res!783646) b!1179473))

(assert (= (and b!1179473 res!783653) b!1179494))

(assert (= (and b!1179494 res!783643) b!1179474))

(assert (= (and b!1179474 res!783655) b!1179476))

(assert (= (and b!1179476 res!783644) b!1179477))

(assert (= (and b!1179477 res!783650) b!1179483))

(assert (= (and b!1179483 res!783652) b!1179475))

(assert (= (and b!1179475 res!783657) b!1179490))

(assert (= (and b!1179490 (not res!783649)) b!1179486))

(assert (= (and b!1179486 (not res!783642)) b!1179478))

(assert (= (and b!1179478 (not res!783648)) b!1179484))

(assert (= (and b!1179484 res!783656) b!1179479))

(assert (= (and b!1179479 (not res!783658)) b!1179481))

(assert (= (and b!1179484 c!116863) b!1179487))

(assert (= (and b!1179484 (not c!116863)) b!1179485))

(assert (= (and b!1179484 res!783645) b!1179491))

(assert (= (and b!1179491 res!783654) b!1179482))

(assert (= (and b!1179492 condMapEmpty!46388) mapIsEmpty!46388))

(assert (= (and b!1179492 (not condMapEmpty!46388)) mapNonEmpty!46388))

(get-info :version)

(assert (= (and mapNonEmpty!46388 ((_ is ValueCellFull!14144) mapValue!46388)) b!1179489))

(assert (= (and b!1179492 ((_ is ValueCellFull!14144) mapDefault!46388)) b!1179488))

(assert (= start!99592 b!1179492))

(declare-fun b_lambda!20303 () Bool)

(assert (=> (not b_lambda!20303) (not b!1179486)))

(declare-fun t!38065 () Bool)

(declare-fun tb!9981 () Bool)

(assert (=> (and start!99592 (= defaultEntry!1004 defaultEntry!1004) t!38065) tb!9981))

(declare-fun result!20537 () Bool)

(assert (=> tb!9981 (= result!20537 tp_is_empty!29707)))

(assert (=> b!1179486 t!38065))

(declare-fun b_and!41201 () Bool)

(assert (= b_and!41199 (and (=> t!38065 result!20537) b_and!41201)))

(declare-fun m!1086965 () Bool)

(assert (=> b!1179483 m!1086965))

(declare-fun m!1086967 () Bool)

(assert (=> b!1179483 m!1086967))

(declare-fun m!1086969 () Bool)

(assert (=> b!1179486 m!1086969))

(declare-fun m!1086971 () Bool)

(assert (=> b!1179486 m!1086971))

(declare-fun m!1086973 () Bool)

(assert (=> b!1179486 m!1086973))

(declare-fun m!1086975 () Bool)

(assert (=> b!1179486 m!1086975))

(declare-fun m!1086977 () Bool)

(assert (=> mapNonEmpty!46388 m!1086977))

(declare-fun m!1086979 () Bool)

(assert (=> b!1179493 m!1086979))

(declare-fun m!1086981 () Bool)

(assert (=> b!1179484 m!1086981))

(declare-fun m!1086983 () Bool)

(assert (=> b!1179484 m!1086983))

(declare-fun m!1086985 () Bool)

(assert (=> b!1179484 m!1086985))

(assert (=> b!1179484 m!1086985))

(declare-fun m!1086987 () Bool)

(assert (=> b!1179484 m!1086987))

(declare-fun m!1086989 () Bool)

(assert (=> b!1179475 m!1086989))

(declare-fun m!1086991 () Bool)

(assert (=> b!1179478 m!1086991))

(declare-fun m!1086993 () Bool)

(assert (=> b!1179478 m!1086993))

(declare-fun m!1086995 () Bool)

(assert (=> b!1179478 m!1086995))

(declare-fun m!1086997 () Bool)

(assert (=> b!1179478 m!1086997))

(assert (=> b!1179478 m!1086981))

(declare-fun m!1086999 () Bool)

(assert (=> b!1179478 m!1086999))

(assert (=> b!1179478 m!1086981))

(declare-fun m!1087001 () Bool)

(assert (=> start!99592 m!1087001))

(declare-fun m!1087003 () Bool)

(assert (=> start!99592 m!1087003))

(assert (=> b!1179479 m!1086981))

(declare-fun m!1087005 () Bool)

(assert (=> b!1179491 m!1087005))

(declare-fun m!1087007 () Bool)

(assert (=> b!1179487 m!1087007))

(declare-fun m!1087009 () Bool)

(assert (=> b!1179487 m!1087009))

(declare-fun m!1087011 () Bool)

(assert (=> b!1179487 m!1087011))

(declare-fun m!1087013 () Bool)

(assert (=> b!1179487 m!1087013))

(declare-fun m!1087015 () Bool)

(assert (=> b!1179487 m!1087015))

(declare-fun m!1087017 () Bool)

(assert (=> b!1179477 m!1087017))

(declare-fun m!1087019 () Bool)

(assert (=> b!1179481 m!1087019))

(declare-fun m!1087021 () Bool)

(assert (=> b!1179494 m!1087021))

(declare-fun m!1087023 () Bool)

(assert (=> b!1179476 m!1087023))

(declare-fun m!1087025 () Bool)

(assert (=> b!1179490 m!1087025))

(declare-fun m!1087027 () Bool)

(assert (=> b!1179490 m!1087027))

(declare-fun m!1087029 () Bool)

(assert (=> b!1179473 m!1087029))

(check-sat (not b!1179491) (not b!1179494) (not b_next!25177) (not start!99592) (not b!1179483) (not b!1179476) (not mapNonEmpty!46388) (not b!1179475) (not b!1179484) (not b!1179493) (not b!1179481) tp_is_empty!29707 (not b!1179486) (not b!1179490) (not b_lambda!20303) (not b!1179487) b_and!41201 (not b!1179478) (not b!1179473))
(check-sat b_and!41201 (not b_next!25177))
