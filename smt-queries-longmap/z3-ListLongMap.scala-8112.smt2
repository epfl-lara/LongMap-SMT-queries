; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99532 () Bool)

(assert start!99532)

(declare-fun b_free!25117 () Bool)

(declare-fun b_next!25117 () Bool)

(assert (=> start!99532 (= b_free!25117 (not b_next!25117))))

(declare-fun tp!88065 () Bool)

(declare-fun b_and!41079 () Bool)

(assert (=> start!99532 (= tp!88065 b_and!41079)))

(declare-fun b!1177521 () Bool)

(declare-fun e!669381 () Bool)

(declare-fun e!669386 () Bool)

(assert (=> b!1177521 (= e!669381 e!669386)))

(declare-fun res!782200 () Bool)

(assert (=> b!1177521 (=> (not res!782200) (not e!669386))))

(declare-datatypes ((array!76032 0))(
  ( (array!76033 (arr!36666 (Array (_ BitVec 32) (_ BitVec 64))) (size!37204 (_ BitVec 32))) )
))
(declare-fun lt!531618 () array!76032)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76032 (_ BitVec 32)) Bool)

(assert (=> b!1177521 (= res!782200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531618 mask!1564))))

(declare-fun _keys!1208 () array!76032)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177521 (= lt!531618 (array!76033 (store (arr!36666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37204 _keys!1208)))))

(declare-fun mapNonEmpty!46298 () Bool)

(declare-fun mapRes!46298 () Bool)

(declare-fun tp!88064 () Bool)

(declare-fun e!669387 () Bool)

(assert (=> mapNonEmpty!46298 (= mapRes!46298 (and tp!88064 e!669387))))

(declare-datatypes ((V!44657 0))(
  ( (V!44658 (val!14880 Int)) )
))
(declare-datatypes ((ValueCell!14114 0))(
  ( (ValueCellFull!14114 (v!17517 V!44657)) (EmptyCell!14114) )
))
(declare-fun mapValue!46298 () ValueCell!14114)

(declare-fun mapRest!46298 () (Array (_ BitVec 32) ValueCell!14114))

(declare-fun mapKey!46298 () (_ BitVec 32))

(declare-datatypes ((array!76034 0))(
  ( (array!76035 (arr!36667 (Array (_ BitVec 32) ValueCell!14114)) (size!37205 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76034)

(assert (=> mapNonEmpty!46298 (= (arr!36667 _values!996) (store mapRest!46298 mapKey!46298 mapValue!46298))))

(declare-fun b!1177522 () Bool)

(declare-fun res!782211 () Bool)

(assert (=> b!1177522 (=> (not res!782211) (not e!669381))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177522 (= res!782211 (validMask!0 mask!1564))))

(declare-fun b!1177523 () Bool)

(declare-fun e!669390 () Bool)

(declare-fun e!669383 () Bool)

(assert (=> b!1177523 (= e!669390 e!669383)))

(declare-fun res!782202 () Bool)

(assert (=> b!1177523 (=> res!782202 e!669383)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177523 (= res!782202 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44657)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!531613 () array!76034)

(declare-datatypes ((tuple2!19142 0))(
  ( (tuple2!19143 (_1!9582 (_ BitVec 64)) (_2!9582 V!44657)) )
))
(declare-datatypes ((List!25851 0))(
  ( (Nil!25848) (Cons!25847 (h!27056 tuple2!19142) (t!37951 List!25851)) )
))
(declare-datatypes ((ListLongMap!17111 0))(
  ( (ListLongMap!17112 (toList!8571 List!25851)) )
))
(declare-fun lt!531609 () ListLongMap!17111)

(declare-fun minValue!944 () V!44657)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5037 (array!76032 array!76034 (_ BitVec 32) (_ BitVec 32) V!44657 V!44657 (_ BitVec 32) Int) ListLongMap!17111)

(assert (=> b!1177523 (= lt!531609 (getCurrentListMapNoExtraKeys!5037 lt!531618 lt!531613 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531614 () V!44657)

(assert (=> b!1177523 (= lt!531613 (array!76035 (store (arr!36667 _values!996) i!673 (ValueCellFull!14114 lt!531614)) (size!37205 _values!996)))))

(declare-fun dynLambda!2953 (Int (_ BitVec 64)) V!44657)

(assert (=> b!1177523 (= lt!531614 (dynLambda!2953 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531619 () ListLongMap!17111)

(assert (=> b!1177523 (= lt!531619 (getCurrentListMapNoExtraKeys!5037 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177524 () Bool)

(declare-fun res!782201 () Bool)

(assert (=> b!1177524 (=> (not res!782201) (not e!669381))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177524 (= res!782201 (validKeyInArray!0 k0!934))))

(declare-fun b!1177526 () Bool)

(declare-fun res!782212 () Bool)

(assert (=> b!1177526 (=> (not res!782212) (not e!669381))))

(assert (=> b!1177526 (= res!782212 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37204 _keys!1208))))))

(declare-fun b!1177527 () Bool)

(declare-fun res!782213 () Bool)

(assert (=> b!1177527 (=> (not res!782213) (not e!669381))))

(assert (=> b!1177527 (= res!782213 (= (select (arr!36666 _keys!1208) i!673) k0!934))))

(declare-fun b!1177528 () Bool)

(declare-fun tp_is_empty!29647 () Bool)

(assert (=> b!1177528 (= e!669387 tp_is_empty!29647)))

(declare-fun b!1177529 () Bool)

(declare-fun res!782203 () Bool)

(assert (=> b!1177529 (=> (not res!782203) (not e!669381))))

(assert (=> b!1177529 (= res!782203 (and (= (size!37205 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37204 _keys!1208) (size!37205 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177530 () Bool)

(declare-fun e!669379 () Bool)

(declare-fun arrayContainsKey!0 (array!76032 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177530 (= e!669379 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177531 () Bool)

(declare-fun e!669382 () Bool)

(assert (=> b!1177531 (= e!669382 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37204 _keys!1208))))))

(declare-fun e!669384 () Bool)

(assert (=> b!1177531 e!669384))

(declare-fun res!782207 () Bool)

(assert (=> b!1177531 (=> (not res!782207) (not e!669384))))

(assert (=> b!1177531 (= res!782207 (not (= (select (arr!36666 _keys!1208) from!1455) k0!934)))))

(declare-datatypes ((Unit!38730 0))(
  ( (Unit!38731) )
))
(declare-fun lt!531616 () Unit!38730)

(declare-fun e!669385 () Unit!38730)

(assert (=> b!1177531 (= lt!531616 e!669385)))

(declare-fun c!116773 () Bool)

(assert (=> b!1177531 (= c!116773 (= (select (arr!36666 _keys!1208) from!1455) k0!934))))

(declare-fun e!669389 () Bool)

(assert (=> b!1177531 e!669389))

(declare-fun res!782208 () Bool)

(assert (=> b!1177531 (=> (not res!782208) (not e!669389))))

(declare-fun lt!531608 () ListLongMap!17111)

(declare-fun lt!531610 () tuple2!19142)

(declare-fun +!3873 (ListLongMap!17111 tuple2!19142) ListLongMap!17111)

(assert (=> b!1177531 (= res!782208 (= lt!531609 (+!3873 lt!531608 lt!531610)))))

(declare-fun get!18741 (ValueCell!14114 V!44657) V!44657)

(assert (=> b!1177531 (= lt!531610 (tuple2!19143 (select (arr!36666 _keys!1208) from!1455) (get!18741 (select (arr!36667 _values!996) from!1455) lt!531614)))))

(declare-fun b!1177532 () Bool)

(declare-fun res!782204 () Bool)

(assert (=> b!1177532 (=> (not res!782204) (not e!669381))))

(declare-datatypes ((List!25852 0))(
  ( (Nil!25849) (Cons!25848 (h!27057 (_ BitVec 64)) (t!37952 List!25852)) )
))
(declare-fun arrayNoDuplicates!0 (array!76032 (_ BitVec 32) List!25852) Bool)

(assert (=> b!1177532 (= res!782204 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25849))))

(declare-fun b!1177533 () Bool)

(declare-fun e!669391 () Bool)

(assert (=> b!1177533 (= e!669391 tp_is_empty!29647)))

(declare-fun b!1177534 () Bool)

(declare-fun Unit!38732 () Unit!38730)

(assert (=> b!1177534 (= e!669385 Unit!38732)))

(declare-fun mapIsEmpty!46298 () Bool)

(assert (=> mapIsEmpty!46298 mapRes!46298))

(declare-fun b!1177535 () Bool)

(declare-fun e!669388 () Bool)

(assert (=> b!1177535 (= e!669388 (and e!669391 mapRes!46298))))

(declare-fun condMapEmpty!46298 () Bool)

(declare-fun mapDefault!46298 () ValueCell!14114)

(assert (=> b!1177535 (= condMapEmpty!46298 (= (arr!36667 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14114)) mapDefault!46298)))))

(declare-fun b!1177536 () Bool)

(declare-fun res!782209 () Bool)

(assert (=> b!1177536 (=> (not res!782209) (not e!669381))))

(assert (=> b!1177536 (= res!782209 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177537 () Bool)

(assert (=> b!1177537 (= e!669386 (not e!669390))))

(declare-fun res!782205 () Bool)

(assert (=> b!1177537 (=> res!782205 e!669390)))

(assert (=> b!1177537 (= res!782205 (bvsgt from!1455 i!673))))

(assert (=> b!1177537 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531617 () Unit!38730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76032 (_ BitVec 64) (_ BitVec 32)) Unit!38730)

(assert (=> b!1177537 (= lt!531617 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177538 () Bool)

(declare-fun Unit!38733 () Unit!38730)

(assert (=> b!1177538 (= e!669385 Unit!38733)))

(declare-fun lt!531612 () Unit!38730)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76032 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38730)

(assert (=> b!1177538 (= lt!531612 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177538 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531620 () Unit!38730)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76032 (_ BitVec 32) (_ BitVec 32)) Unit!38730)

(assert (=> b!1177538 (= lt!531620 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177538 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25849)))

(declare-fun lt!531607 () Unit!38730)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76032 (_ BitVec 64) (_ BitVec 32) List!25852) Unit!38730)

(assert (=> b!1177538 (= lt!531607 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25849))))

(assert (=> b!1177538 false))

(declare-fun b!1177539 () Bool)

(assert (=> b!1177539 (= e!669383 e!669382)))

(declare-fun res!782214 () Bool)

(assert (=> b!1177539 (=> res!782214 e!669382)))

(assert (=> b!1177539 (= res!782214 (not (validKeyInArray!0 (select (arr!36666 _keys!1208) from!1455))))))

(declare-fun lt!531615 () ListLongMap!17111)

(assert (=> b!1177539 (= lt!531615 lt!531608)))

(declare-fun lt!531621 () ListLongMap!17111)

(declare-fun -!1544 (ListLongMap!17111 (_ BitVec 64)) ListLongMap!17111)

(assert (=> b!1177539 (= lt!531608 (-!1544 lt!531621 k0!934))))

(assert (=> b!1177539 (= lt!531615 (getCurrentListMapNoExtraKeys!5037 lt!531618 lt!531613 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177539 (= lt!531621 (getCurrentListMapNoExtraKeys!5037 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531611 () Unit!38730)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!808 (array!76032 array!76034 (_ BitVec 32) (_ BitVec 32) V!44657 V!44657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38730)

(assert (=> b!1177539 (= lt!531611 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!808 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177525 () Bool)

(declare-fun res!782206 () Bool)

(assert (=> b!1177525 (=> (not res!782206) (not e!669386))))

(assert (=> b!1177525 (= res!782206 (arrayNoDuplicates!0 lt!531618 #b00000000000000000000000000000000 Nil!25849))))

(declare-fun res!782210 () Bool)

(assert (=> start!99532 (=> (not res!782210) (not e!669381))))

(assert (=> start!99532 (= res!782210 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37204 _keys!1208))))))

(assert (=> start!99532 e!669381))

(assert (=> start!99532 tp_is_empty!29647))

(declare-fun array_inv!28112 (array!76032) Bool)

(assert (=> start!99532 (array_inv!28112 _keys!1208)))

(assert (=> start!99532 true))

(assert (=> start!99532 tp!88065))

(declare-fun array_inv!28113 (array!76034) Bool)

(assert (=> start!99532 (and (array_inv!28113 _values!996) e!669388)))

(declare-fun b!1177540 () Bool)

(assert (=> b!1177540 (= e!669384 (= lt!531619 (+!3873 lt!531621 lt!531610)))))

(declare-fun b!1177541 () Bool)

(assert (=> b!1177541 (= e!669389 e!669379)))

(declare-fun res!782215 () Bool)

(assert (=> b!1177541 (=> res!782215 e!669379)))

(assert (=> b!1177541 (= res!782215 (not (= (select (arr!36666 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99532 res!782210) b!1177522))

(assert (= (and b!1177522 res!782211) b!1177529))

(assert (= (and b!1177529 res!782203) b!1177536))

(assert (= (and b!1177536 res!782209) b!1177532))

(assert (= (and b!1177532 res!782204) b!1177526))

(assert (= (and b!1177526 res!782212) b!1177524))

(assert (= (and b!1177524 res!782201) b!1177527))

(assert (= (and b!1177527 res!782213) b!1177521))

(assert (= (and b!1177521 res!782200) b!1177525))

(assert (= (and b!1177525 res!782206) b!1177537))

(assert (= (and b!1177537 (not res!782205)) b!1177523))

(assert (= (and b!1177523 (not res!782202)) b!1177539))

(assert (= (and b!1177539 (not res!782214)) b!1177531))

(assert (= (and b!1177531 res!782208) b!1177541))

(assert (= (and b!1177541 (not res!782215)) b!1177530))

(assert (= (and b!1177531 c!116773) b!1177538))

(assert (= (and b!1177531 (not c!116773)) b!1177534))

(assert (= (and b!1177531 res!782207) b!1177540))

(assert (= (and b!1177535 condMapEmpty!46298) mapIsEmpty!46298))

(assert (= (and b!1177535 (not condMapEmpty!46298)) mapNonEmpty!46298))

(get-info :version)

(assert (= (and mapNonEmpty!46298 ((_ is ValueCellFull!14114) mapValue!46298)) b!1177528))

(assert (= (and b!1177535 ((_ is ValueCellFull!14114) mapDefault!46298)) b!1177533))

(assert (= start!99532 b!1177535))

(declare-fun b_lambda!20243 () Bool)

(assert (=> (not b_lambda!20243) (not b!1177523)))

(declare-fun t!37950 () Bool)

(declare-fun tb!9921 () Bool)

(assert (=> (and start!99532 (= defaultEntry!1004 defaultEntry!1004) t!37950) tb!9921))

(declare-fun result!20417 () Bool)

(assert (=> tb!9921 (= result!20417 tp_is_empty!29647)))

(assert (=> b!1177523 t!37950))

(declare-fun b_and!41081 () Bool)

(assert (= b_and!41079 (and (=> t!37950 result!20417) b_and!41081)))

(declare-fun m!1084985 () Bool)

(assert (=> b!1177538 m!1084985))

(declare-fun m!1084987 () Bool)

(assert (=> b!1177538 m!1084987))

(declare-fun m!1084989 () Bool)

(assert (=> b!1177538 m!1084989))

(declare-fun m!1084991 () Bool)

(assert (=> b!1177538 m!1084991))

(declare-fun m!1084993 () Bool)

(assert (=> b!1177538 m!1084993))

(declare-fun m!1084995 () Bool)

(assert (=> b!1177541 m!1084995))

(declare-fun m!1084997 () Bool)

(assert (=> b!1177532 m!1084997))

(declare-fun m!1084999 () Bool)

(assert (=> b!1177539 m!1084999))

(declare-fun m!1085001 () Bool)

(assert (=> b!1177539 m!1085001))

(declare-fun m!1085003 () Bool)

(assert (=> b!1177539 m!1085003))

(assert (=> b!1177539 m!1084995))

(declare-fun m!1085005 () Bool)

(assert (=> b!1177539 m!1085005))

(declare-fun m!1085007 () Bool)

(assert (=> b!1177539 m!1085007))

(assert (=> b!1177539 m!1084995))

(declare-fun m!1085009 () Bool)

(assert (=> b!1177521 m!1085009))

(declare-fun m!1085011 () Bool)

(assert (=> b!1177521 m!1085011))

(assert (=> b!1177531 m!1084995))

(declare-fun m!1085013 () Bool)

(assert (=> b!1177531 m!1085013))

(declare-fun m!1085015 () Bool)

(assert (=> b!1177531 m!1085015))

(assert (=> b!1177531 m!1085015))

(declare-fun m!1085017 () Bool)

(assert (=> b!1177531 m!1085017))

(declare-fun m!1085019 () Bool)

(assert (=> b!1177540 m!1085019))

(declare-fun m!1085021 () Bool)

(assert (=> b!1177527 m!1085021))

(declare-fun m!1085023 () Bool)

(assert (=> b!1177537 m!1085023))

(declare-fun m!1085025 () Bool)

(assert (=> b!1177537 m!1085025))

(declare-fun m!1085027 () Bool)

(assert (=> b!1177524 m!1085027))

(declare-fun m!1085029 () Bool)

(assert (=> mapNonEmpty!46298 m!1085029))

(declare-fun m!1085031 () Bool)

(assert (=> b!1177523 m!1085031))

(declare-fun m!1085033 () Bool)

(assert (=> b!1177523 m!1085033))

(declare-fun m!1085035 () Bool)

(assert (=> b!1177523 m!1085035))

(declare-fun m!1085037 () Bool)

(assert (=> b!1177523 m!1085037))

(declare-fun m!1085039 () Bool)

(assert (=> b!1177536 m!1085039))

(declare-fun m!1085041 () Bool)

(assert (=> b!1177530 m!1085041))

(declare-fun m!1085043 () Bool)

(assert (=> start!99532 m!1085043))

(declare-fun m!1085045 () Bool)

(assert (=> start!99532 m!1085045))

(declare-fun m!1085047 () Bool)

(assert (=> b!1177525 m!1085047))

(declare-fun m!1085049 () Bool)

(assert (=> b!1177522 m!1085049))

(check-sat (not b!1177536) (not b!1177523) (not b!1177539) (not b!1177521) (not b!1177524) (not b!1177540) (not b!1177537) (not b_lambda!20243) (not b!1177532) (not mapNonEmpty!46298) (not b!1177522) tp_is_empty!29647 (not start!99532) (not b!1177538) (not b!1177531) (not b!1177530) b_and!41081 (not b_next!25117) (not b!1177525))
(check-sat b_and!41081 (not b_next!25117))
