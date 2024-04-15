; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99550 () Bool)

(assert start!99550)

(declare-fun b_free!25135 () Bool)

(declare-fun b_next!25135 () Bool)

(assert (=> start!99550 (= b_free!25135 (not b_next!25135))))

(declare-fun tp!88118 () Bool)

(declare-fun b_and!41115 () Bool)

(assert (=> start!99550 (= tp!88118 b_and!41115)))

(declare-fun b!1178106 () Bool)

(declare-fun e!669730 () Bool)

(declare-fun e!669738 () Bool)

(assert (=> b!1178106 (= e!669730 e!669738)))

(declare-fun res!782633 () Bool)

(assert (=> b!1178106 (=> (not res!782633) (not e!669738))))

(declare-datatypes ((array!76068 0))(
  ( (array!76069 (arr!36684 (Array (_ BitVec 32) (_ BitVec 64))) (size!37222 (_ BitVec 32))) )
))
(declare-fun lt!532013 () array!76068)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76068 (_ BitVec 32)) Bool)

(assert (=> b!1178106 (= res!782633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532013 mask!1564))))

(declare-fun _keys!1208 () array!76068)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178106 (= lt!532013 (array!76069 (store (arr!36684 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37222 _keys!1208)))))

(declare-fun b!1178107 () Bool)

(declare-datatypes ((Unit!38762 0))(
  ( (Unit!38763) )
))
(declare-fun e!669740 () Unit!38762)

(declare-fun Unit!38764 () Unit!38762)

(assert (=> b!1178107 (= e!669740 Unit!38764)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!532020 () Unit!38762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76068 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38762)

(assert (=> b!1178107 (= lt!532020 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76068 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178107 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532016 () Unit!38762)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76068 (_ BitVec 32) (_ BitVec 32)) Unit!38762)

(assert (=> b!1178107 (= lt!532016 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25867 0))(
  ( (Nil!25864) (Cons!25863 (h!27072 (_ BitVec 64)) (t!37985 List!25867)) )
))
(declare-fun arrayNoDuplicates!0 (array!76068 (_ BitVec 32) List!25867) Bool)

(assert (=> b!1178107 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25864)))

(declare-fun lt!532025 () Unit!38762)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76068 (_ BitVec 64) (_ BitVec 32) List!25867) Unit!38762)

(assert (=> b!1178107 (= lt!532025 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25864))))

(assert (=> b!1178107 false))

(declare-fun mapIsEmpty!46325 () Bool)

(declare-fun mapRes!46325 () Bool)

(assert (=> mapIsEmpty!46325 mapRes!46325))

(declare-fun b!1178108 () Bool)

(declare-fun e!669742 () Bool)

(declare-fun e!669731 () Bool)

(assert (=> b!1178108 (= e!669742 e!669731)))

(declare-fun res!782640 () Bool)

(assert (=> b!1178108 (=> res!782640 e!669731)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178108 (= res!782640 (not (validKeyInArray!0 (select (arr!36684 _keys!1208) from!1455))))))

(declare-datatypes ((V!44681 0))(
  ( (V!44682 (val!14889 Int)) )
))
(declare-datatypes ((tuple2!19160 0))(
  ( (tuple2!19161 (_1!9591 (_ BitVec 64)) (_2!9591 V!44681)) )
))
(declare-datatypes ((List!25868 0))(
  ( (Nil!25865) (Cons!25864 (h!27073 tuple2!19160) (t!37986 List!25868)) )
))
(declare-datatypes ((ListLongMap!17129 0))(
  ( (ListLongMap!17130 (toList!8580 List!25868)) )
))
(declare-fun lt!532019 () ListLongMap!17129)

(declare-fun lt!532014 () ListLongMap!17129)

(assert (=> b!1178108 (= lt!532019 lt!532014)))

(declare-fun lt!532015 () ListLongMap!17129)

(declare-fun -!1549 (ListLongMap!17129 (_ BitVec 64)) ListLongMap!17129)

(assert (=> b!1178108 (= lt!532014 (-!1549 lt!532015 k0!934))))

(declare-fun zeroValue!944 () V!44681)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14123 0))(
  ( (ValueCellFull!14123 (v!17526 V!44681)) (EmptyCell!14123) )
))
(declare-datatypes ((array!76070 0))(
  ( (array!76071 (arr!36685 (Array (_ BitVec 32) ValueCell!14123)) (size!37223 (_ BitVec 32))) )
))
(declare-fun lt!532021 () array!76070)

(declare-fun minValue!944 () V!44681)

(declare-fun getCurrentListMapNoExtraKeys!5042 (array!76068 array!76070 (_ BitVec 32) (_ BitVec 32) V!44681 V!44681 (_ BitVec 32) Int) ListLongMap!17129)

(assert (=> b!1178108 (= lt!532019 (getCurrentListMapNoExtraKeys!5042 lt!532013 lt!532021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76070)

(assert (=> b!1178108 (= lt!532015 (getCurrentListMapNoExtraKeys!5042 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532026 () Unit!38762)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!813 (array!76068 array!76070 (_ BitVec 32) (_ BitVec 32) V!44681 V!44681 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38762)

(assert (=> b!1178108 (= lt!532026 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!813 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!782642 () Bool)

(assert (=> start!99550 (=> (not res!782642) (not e!669730))))

(assert (=> start!99550 (= res!782642 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37222 _keys!1208))))))

(assert (=> start!99550 e!669730))

(declare-fun tp_is_empty!29665 () Bool)

(assert (=> start!99550 tp_is_empty!29665))

(declare-fun array_inv!28120 (array!76068) Bool)

(assert (=> start!99550 (array_inv!28120 _keys!1208)))

(assert (=> start!99550 true))

(assert (=> start!99550 tp!88118))

(declare-fun e!669734 () Bool)

(declare-fun array_inv!28121 (array!76070) Bool)

(assert (=> start!99550 (and (array_inv!28121 _values!996) e!669734)))

(declare-fun b!1178109 () Bool)

(declare-fun e!669735 () Bool)

(assert (=> b!1178109 (= e!669735 tp_is_empty!29665)))

(declare-fun b!1178110 () Bool)

(declare-fun res!782641 () Bool)

(assert (=> b!1178110 (=> (not res!782641) (not e!669730))))

(assert (=> b!1178110 (= res!782641 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37222 _keys!1208))))))

(declare-fun b!1178111 () Bool)

(declare-fun res!782638 () Bool)

(assert (=> b!1178111 (=> (not res!782638) (not e!669738))))

(assert (=> b!1178111 (= res!782638 (arrayNoDuplicates!0 lt!532013 #b00000000000000000000000000000000 Nil!25864))))

(declare-fun b!1178112 () Bool)

(declare-fun res!782636 () Bool)

(assert (=> b!1178112 (=> (not res!782636) (not e!669730))))

(assert (=> b!1178112 (= res!782636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178113 () Bool)

(assert (=> b!1178113 (= e!669731 true)))

(declare-fun e!669741 () Bool)

(assert (=> b!1178113 e!669741))

(declare-fun res!782634 () Bool)

(assert (=> b!1178113 (=> (not res!782634) (not e!669741))))

(assert (=> b!1178113 (= res!782634 (not (= (select (arr!36684 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532012 () Unit!38762)

(assert (=> b!1178113 (= lt!532012 e!669740)))

(declare-fun c!116800 () Bool)

(assert (=> b!1178113 (= c!116800 (= (select (arr!36684 _keys!1208) from!1455) k0!934))))

(declare-fun e!669736 () Bool)

(assert (=> b!1178113 e!669736))

(declare-fun res!782635 () Bool)

(assert (=> b!1178113 (=> (not res!782635) (not e!669736))))

(declare-fun lt!532022 () ListLongMap!17129)

(declare-fun lt!532017 () tuple2!19160)

(declare-fun +!3881 (ListLongMap!17129 tuple2!19160) ListLongMap!17129)

(assert (=> b!1178113 (= res!782635 (= lt!532022 (+!3881 lt!532014 lt!532017)))))

(declare-fun lt!532023 () V!44681)

(declare-fun get!18753 (ValueCell!14123 V!44681) V!44681)

(assert (=> b!1178113 (= lt!532017 (tuple2!19161 (select (arr!36684 _keys!1208) from!1455) (get!18753 (select (arr!36685 _values!996) from!1455) lt!532023)))))

(declare-fun b!1178114 () Bool)

(declare-fun res!782646 () Bool)

(assert (=> b!1178114 (=> (not res!782646) (not e!669730))))

(assert (=> b!1178114 (= res!782646 (validKeyInArray!0 k0!934))))

(declare-fun b!1178115 () Bool)

(declare-fun Unit!38765 () Unit!38762)

(assert (=> b!1178115 (= e!669740 Unit!38765)))

(declare-fun b!1178116 () Bool)

(declare-fun e!669739 () Bool)

(assert (=> b!1178116 (= e!669738 (not e!669739))))

(declare-fun res!782637 () Bool)

(assert (=> b!1178116 (=> res!782637 e!669739)))

(assert (=> b!1178116 (= res!782637 (bvsgt from!1455 i!673))))

(assert (=> b!1178116 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532018 () Unit!38762)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76068 (_ BitVec 64) (_ BitVec 32)) Unit!38762)

(assert (=> b!1178116 (= lt!532018 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178117 () Bool)

(assert (=> b!1178117 (= e!669739 e!669742)))

(declare-fun res!782639 () Bool)

(assert (=> b!1178117 (=> res!782639 e!669742)))

(assert (=> b!1178117 (= res!782639 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1178117 (= lt!532022 (getCurrentListMapNoExtraKeys!5042 lt!532013 lt!532021 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178117 (= lt!532021 (array!76071 (store (arr!36685 _values!996) i!673 (ValueCellFull!14123 lt!532023)) (size!37223 _values!996)))))

(declare-fun dynLambda!2956 (Int (_ BitVec 64)) V!44681)

(assert (=> b!1178117 (= lt!532023 (dynLambda!2956 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532024 () ListLongMap!17129)

(assert (=> b!1178117 (= lt!532024 (getCurrentListMapNoExtraKeys!5042 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178118 () Bool)

(declare-fun res!782643 () Bool)

(assert (=> b!1178118 (=> (not res!782643) (not e!669730))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178118 (= res!782643 (validMask!0 mask!1564))))

(declare-fun b!1178119 () Bool)

(declare-fun res!782644 () Bool)

(assert (=> b!1178119 (=> (not res!782644) (not e!669730))))

(assert (=> b!1178119 (= res!782644 (= (select (arr!36684 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46325 () Bool)

(declare-fun tp!88119 () Bool)

(declare-fun e!669733 () Bool)

(assert (=> mapNonEmpty!46325 (= mapRes!46325 (and tp!88119 e!669733))))

(declare-fun mapKey!46325 () (_ BitVec 32))

(declare-fun mapValue!46325 () ValueCell!14123)

(declare-fun mapRest!46325 () (Array (_ BitVec 32) ValueCell!14123))

(assert (=> mapNonEmpty!46325 (= (arr!36685 _values!996) (store mapRest!46325 mapKey!46325 mapValue!46325))))

(declare-fun e!669737 () Bool)

(declare-fun b!1178120 () Bool)

(assert (=> b!1178120 (= e!669737 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178121 () Bool)

(declare-fun res!782645 () Bool)

(assert (=> b!1178121 (=> (not res!782645) (not e!669730))))

(assert (=> b!1178121 (= res!782645 (and (= (size!37223 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37222 _keys!1208) (size!37223 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178122 () Bool)

(assert (=> b!1178122 (= e!669734 (and e!669735 mapRes!46325))))

(declare-fun condMapEmpty!46325 () Bool)

(declare-fun mapDefault!46325 () ValueCell!14123)

(assert (=> b!1178122 (= condMapEmpty!46325 (= (arr!36685 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14123)) mapDefault!46325)))))

(declare-fun b!1178123 () Bool)

(assert (=> b!1178123 (= e!669741 (= lt!532024 (+!3881 lt!532015 lt!532017)))))

(declare-fun b!1178124 () Bool)

(assert (=> b!1178124 (= e!669736 e!669737)))

(declare-fun res!782632 () Bool)

(assert (=> b!1178124 (=> res!782632 e!669737)))

(assert (=> b!1178124 (= res!782632 (not (= (select (arr!36684 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178125 () Bool)

(declare-fun res!782647 () Bool)

(assert (=> b!1178125 (=> (not res!782647) (not e!669730))))

(assert (=> b!1178125 (= res!782647 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25864))))

(declare-fun b!1178126 () Bool)

(assert (=> b!1178126 (= e!669733 tp_is_empty!29665)))

(assert (= (and start!99550 res!782642) b!1178118))

(assert (= (and b!1178118 res!782643) b!1178121))

(assert (= (and b!1178121 res!782645) b!1178112))

(assert (= (and b!1178112 res!782636) b!1178125))

(assert (= (and b!1178125 res!782647) b!1178110))

(assert (= (and b!1178110 res!782641) b!1178114))

(assert (= (and b!1178114 res!782646) b!1178119))

(assert (= (and b!1178119 res!782644) b!1178106))

(assert (= (and b!1178106 res!782633) b!1178111))

(assert (= (and b!1178111 res!782638) b!1178116))

(assert (= (and b!1178116 (not res!782637)) b!1178117))

(assert (= (and b!1178117 (not res!782639)) b!1178108))

(assert (= (and b!1178108 (not res!782640)) b!1178113))

(assert (= (and b!1178113 res!782635) b!1178124))

(assert (= (and b!1178124 (not res!782632)) b!1178120))

(assert (= (and b!1178113 c!116800) b!1178107))

(assert (= (and b!1178113 (not c!116800)) b!1178115))

(assert (= (and b!1178113 res!782634) b!1178123))

(assert (= (and b!1178122 condMapEmpty!46325) mapIsEmpty!46325))

(assert (= (and b!1178122 (not condMapEmpty!46325)) mapNonEmpty!46325))

(get-info :version)

(assert (= (and mapNonEmpty!46325 ((_ is ValueCellFull!14123) mapValue!46325)) b!1178126))

(assert (= (and b!1178122 ((_ is ValueCellFull!14123) mapDefault!46325)) b!1178109))

(assert (= start!99550 b!1178122))

(declare-fun b_lambda!20261 () Bool)

(assert (=> (not b_lambda!20261) (not b!1178117)))

(declare-fun t!37984 () Bool)

(declare-fun tb!9939 () Bool)

(assert (=> (and start!99550 (= defaultEntry!1004 defaultEntry!1004) t!37984) tb!9939))

(declare-fun result!20453 () Bool)

(assert (=> tb!9939 (= result!20453 tp_is_empty!29665)))

(assert (=> b!1178117 t!37984))

(declare-fun b_and!41117 () Bool)

(assert (= b_and!41115 (and (=> t!37984 result!20453) b_and!41117)))

(declare-fun m!1085579 () Bool)

(assert (=> b!1178112 m!1085579))

(declare-fun m!1085581 () Bool)

(assert (=> b!1178124 m!1085581))

(declare-fun m!1085583 () Bool)

(assert (=> b!1178116 m!1085583))

(declare-fun m!1085585 () Bool)

(assert (=> b!1178116 m!1085585))

(declare-fun m!1085587 () Bool)

(assert (=> mapNonEmpty!46325 m!1085587))

(declare-fun m!1085589 () Bool)

(assert (=> b!1178107 m!1085589))

(declare-fun m!1085591 () Bool)

(assert (=> b!1178107 m!1085591))

(declare-fun m!1085593 () Bool)

(assert (=> b!1178107 m!1085593))

(declare-fun m!1085595 () Bool)

(assert (=> b!1178107 m!1085595))

(declare-fun m!1085597 () Bool)

(assert (=> b!1178107 m!1085597))

(declare-fun m!1085599 () Bool)

(assert (=> b!1178119 m!1085599))

(declare-fun m!1085601 () Bool)

(assert (=> b!1178108 m!1085601))

(declare-fun m!1085603 () Bool)

(assert (=> b!1178108 m!1085603))

(declare-fun m!1085605 () Bool)

(assert (=> b!1178108 m!1085605))

(declare-fun m!1085607 () Bool)

(assert (=> b!1178108 m!1085607))

(assert (=> b!1178108 m!1085581))

(declare-fun m!1085609 () Bool)

(assert (=> b!1178108 m!1085609))

(assert (=> b!1178108 m!1085581))

(declare-fun m!1085611 () Bool)

(assert (=> b!1178117 m!1085611))

(declare-fun m!1085613 () Bool)

(assert (=> b!1178117 m!1085613))

(declare-fun m!1085615 () Bool)

(assert (=> b!1178117 m!1085615))

(declare-fun m!1085617 () Bool)

(assert (=> b!1178117 m!1085617))

(declare-fun m!1085619 () Bool)

(assert (=> b!1178123 m!1085619))

(declare-fun m!1085621 () Bool)

(assert (=> b!1178125 m!1085621))

(declare-fun m!1085623 () Bool)

(assert (=> b!1178106 m!1085623))

(declare-fun m!1085625 () Bool)

(assert (=> b!1178106 m!1085625))

(declare-fun m!1085627 () Bool)

(assert (=> b!1178120 m!1085627))

(declare-fun m!1085629 () Bool)

(assert (=> start!99550 m!1085629))

(declare-fun m!1085631 () Bool)

(assert (=> start!99550 m!1085631))

(assert (=> b!1178113 m!1085581))

(declare-fun m!1085633 () Bool)

(assert (=> b!1178113 m!1085633))

(declare-fun m!1085635 () Bool)

(assert (=> b!1178113 m!1085635))

(assert (=> b!1178113 m!1085635))

(declare-fun m!1085637 () Bool)

(assert (=> b!1178113 m!1085637))

(declare-fun m!1085639 () Bool)

(assert (=> b!1178114 m!1085639))

(declare-fun m!1085641 () Bool)

(assert (=> b!1178111 m!1085641))

(declare-fun m!1085643 () Bool)

(assert (=> b!1178118 m!1085643))

(check-sat (not b!1178117) (not b!1178116) (not b!1178108) (not b!1178111) (not start!99550) (not b!1178120) b_and!41117 (not b!1178118) (not b!1178113) (not b_next!25135) (not b!1178114) (not b_lambda!20261) (not b!1178107) (not b!1178123) (not mapNonEmpty!46325) tp_is_empty!29665 (not b!1178125) (not b!1178112) (not b!1178106))
(check-sat b_and!41117 (not b_next!25135))
