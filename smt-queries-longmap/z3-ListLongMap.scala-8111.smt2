; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99534 () Bool)

(assert start!99534)

(declare-fun b_free!25113 () Bool)

(declare-fun b_next!25113 () Bool)

(assert (=> start!99534 (= b_free!25113 (not b_next!25113))))

(declare-fun tp!88053 () Bool)

(declare-fun b_and!41093 () Bool)

(assert (=> start!99534 (= tp!88053 b_and!41093)))

(declare-fun mapIsEmpty!46292 () Bool)

(declare-fun mapRes!46292 () Bool)

(assert (=> mapIsEmpty!46292 mapRes!46292))

(declare-fun b!1177516 () Bool)

(declare-fun e!669387 () Bool)

(declare-fun e!669381 () Bool)

(assert (=> b!1177516 (= e!669387 e!669381)))

(declare-fun res!782172 () Bool)

(assert (=> b!1177516 (=> res!782172 e!669381)))

(declare-datatypes ((array!76093 0))(
  ( (array!76094 (arr!36696 (Array (_ BitVec 32) (_ BitVec 64))) (size!37232 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76093)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177516 (= res!782172 (not (= (select (arr!36696 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177517 () Bool)

(declare-fun e!669389 () Bool)

(declare-fun e!669382 () Bool)

(assert (=> b!1177517 (= e!669389 (and e!669382 mapRes!46292))))

(declare-fun condMapEmpty!46292 () Bool)

(declare-datatypes ((V!44651 0))(
  ( (V!44652 (val!14878 Int)) )
))
(declare-datatypes ((ValueCell!14112 0))(
  ( (ValueCellFull!14112 (v!17516 V!44651)) (EmptyCell!14112) )
))
(declare-datatypes ((array!76095 0))(
  ( (array!76096 (arr!36697 (Array (_ BitVec 32) ValueCell!14112)) (size!37233 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76095)

(declare-fun mapDefault!46292 () ValueCell!14112)

(assert (=> b!1177517 (= condMapEmpty!46292 (= (arr!36697 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14112)) mapDefault!46292)))))

(declare-datatypes ((tuple2!19036 0))(
  ( (tuple2!19037 (_1!9529 (_ BitVec 64)) (_2!9529 V!44651)) )
))
(declare-fun lt!531722 () tuple2!19036)

(declare-fun e!669383 () Bool)

(declare-fun b!1177518 () Bool)

(declare-datatypes ((List!25773 0))(
  ( (Nil!25770) (Cons!25769 (h!26978 tuple2!19036) (t!37878 List!25773)) )
))
(declare-datatypes ((ListLongMap!17005 0))(
  ( (ListLongMap!17006 (toList!8518 List!25773)) )
))
(declare-fun lt!531719 () ListLongMap!17005)

(declare-fun lt!531720 () ListLongMap!17005)

(declare-fun +!3833 (ListLongMap!17005 tuple2!19036) ListLongMap!17005)

(assert (=> b!1177518 (= e!669383 (= lt!531719 (+!3833 lt!531720 lt!531722)))))

(declare-fun b!1177519 () Bool)

(declare-fun res!782183 () Bool)

(declare-fun e!669386 () Bool)

(assert (=> b!1177519 (=> (not res!782183) (not e!669386))))

(declare-fun lt!531715 () array!76093)

(declare-datatypes ((List!25774 0))(
  ( (Nil!25771) (Cons!25770 (h!26979 (_ BitVec 64)) (t!37879 List!25774)) )
))
(declare-fun arrayNoDuplicates!0 (array!76093 (_ BitVec 32) List!25774) Bool)

(assert (=> b!1177519 (= res!782183 (arrayNoDuplicates!0 lt!531715 #b00000000000000000000000000000000 Nil!25771))))

(declare-fun b!1177520 () Bool)

(declare-datatypes ((Unit!38889 0))(
  ( (Unit!38890) )
))
(declare-fun e!669391 () Unit!38889)

(declare-fun Unit!38891 () Unit!38889)

(assert (=> b!1177520 (= e!669391 Unit!38891)))

(declare-fun b!1177521 () Bool)

(declare-fun Unit!38892 () Unit!38889)

(assert (=> b!1177521 (= e!669391 Unit!38892)))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun lt!531721 () Unit!38889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76093 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38889)

(assert (=> b!1177521 (= lt!531721 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76093 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177521 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531709 () Unit!38889)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76093 (_ BitVec 32) (_ BitVec 32)) Unit!38889)

(assert (=> b!1177521 (= lt!531709 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177521 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25771)))

(declare-fun lt!531716 () Unit!38889)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76093 (_ BitVec 64) (_ BitVec 32) List!25774) Unit!38889)

(assert (=> b!1177521 (= lt!531716 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25771))))

(assert (=> b!1177521 false))

(declare-fun b!1177522 () Bool)

(declare-fun res!782184 () Bool)

(declare-fun e!669380 () Bool)

(assert (=> b!1177522 (=> (not res!782184) (not e!669380))))

(assert (=> b!1177522 (= res!782184 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25771))))

(declare-fun b!1177523 () Bool)

(declare-fun e!669384 () Bool)

(declare-fun e!669388 () Bool)

(assert (=> b!1177523 (= e!669384 e!669388)))

(declare-fun res!782182 () Bool)

(assert (=> b!1177523 (=> res!782182 e!669388)))

(assert (=> b!1177523 (= res!782182 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44651)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun lt!531723 () array!76095)

(declare-fun lt!531714 () ListLongMap!17005)

(declare-fun minValue!944 () V!44651)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!4975 (array!76093 array!76095 (_ BitVec 32) (_ BitVec 32) V!44651 V!44651 (_ BitVec 32) Int) ListLongMap!17005)

(assert (=> b!1177523 (= lt!531714 (getCurrentListMapNoExtraKeys!4975 lt!531715 lt!531723 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!531711 () V!44651)

(assert (=> b!1177523 (= lt!531723 (array!76096 (store (arr!36697 _values!996) i!673 (ValueCellFull!14112 lt!531711)) (size!37233 _values!996)))))

(declare-fun dynLambda!2938 (Int (_ BitVec 64)) V!44651)

(assert (=> b!1177523 (= lt!531711 (dynLambda!2938 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177523 (= lt!531719 (getCurrentListMapNoExtraKeys!4975 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177524 () Bool)

(declare-fun res!782173 () Bool)

(assert (=> b!1177524 (=> (not res!782173) (not e!669380))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177524 (= res!782173 (validMask!0 mask!1564))))

(declare-fun b!1177525 () Bool)

(declare-fun tp_is_empty!29643 () Bool)

(assert (=> b!1177525 (= e!669382 tp_is_empty!29643)))

(declare-fun b!1177526 () Bool)

(declare-fun res!782179 () Bool)

(assert (=> b!1177526 (=> (not res!782179) (not e!669380))))

(assert (=> b!1177526 (= res!782179 (= (select (arr!36696 _keys!1208) i!673) k0!934))))

(declare-fun b!1177527 () Bool)

(declare-fun res!782177 () Bool)

(assert (=> b!1177527 (=> (not res!782177) (not e!669380))))

(assert (=> b!1177527 (= res!782177 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37232 _keys!1208))))))

(declare-fun b!1177528 () Bool)

(declare-fun res!782176 () Bool)

(assert (=> b!1177528 (=> (not res!782176) (not e!669380))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76093 (_ BitVec 32)) Bool)

(assert (=> b!1177528 (= res!782176 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177515 () Bool)

(assert (=> b!1177515 (= e!669380 e!669386)))

(declare-fun res!782181 () Bool)

(assert (=> b!1177515 (=> (not res!782181) (not e!669386))))

(assert (=> b!1177515 (= res!782181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531715 mask!1564))))

(assert (=> b!1177515 (= lt!531715 (array!76094 (store (arr!36696 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37232 _keys!1208)))))

(declare-fun res!782171 () Bool)

(assert (=> start!99534 (=> (not res!782171) (not e!669380))))

(assert (=> start!99534 (= res!782171 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37232 _keys!1208))))))

(assert (=> start!99534 e!669380))

(assert (=> start!99534 tp_is_empty!29643))

(declare-fun array_inv!28024 (array!76093) Bool)

(assert (=> start!99534 (array_inv!28024 _keys!1208)))

(assert (=> start!99534 true))

(assert (=> start!99534 tp!88053))

(declare-fun array_inv!28025 (array!76095) Bool)

(assert (=> start!99534 (and (array_inv!28025 _values!996) e!669389)))

(declare-fun b!1177529 () Bool)

(assert (=> b!1177529 (= e!669386 (not e!669384))))

(declare-fun res!782178 () Bool)

(assert (=> b!1177529 (=> res!782178 e!669384)))

(assert (=> b!1177529 (= res!782178 (bvsgt from!1455 i!673))))

(assert (=> b!1177529 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531718 () Unit!38889)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76093 (_ BitVec 64) (_ BitVec 32)) Unit!38889)

(assert (=> b!1177529 (= lt!531718 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!46292 () Bool)

(declare-fun tp!88052 () Bool)

(declare-fun e!669390 () Bool)

(assert (=> mapNonEmpty!46292 (= mapRes!46292 (and tp!88052 e!669390))))

(declare-fun mapRest!46292 () (Array (_ BitVec 32) ValueCell!14112))

(declare-fun mapKey!46292 () (_ BitVec 32))

(declare-fun mapValue!46292 () ValueCell!14112)

(assert (=> mapNonEmpty!46292 (= (arr!36697 _values!996) (store mapRest!46292 mapKey!46292 mapValue!46292))))

(declare-fun b!1177530 () Bool)

(declare-fun res!782185 () Bool)

(assert (=> b!1177530 (=> (not res!782185) (not e!669380))))

(assert (=> b!1177530 (= res!782185 (and (= (size!37233 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37232 _keys!1208) (size!37233 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177531 () Bool)

(assert (=> b!1177531 (= e!669381 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177532 () Bool)

(declare-fun e!669379 () Bool)

(assert (=> b!1177532 (= e!669379 true)))

(assert (=> b!1177532 e!669383))

(declare-fun res!782170 () Bool)

(assert (=> b!1177532 (=> (not res!782170) (not e!669383))))

(assert (=> b!1177532 (= res!782170 (not (= (select (arr!36696 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531712 () Unit!38889)

(assert (=> b!1177532 (= lt!531712 e!669391)))

(declare-fun c!116793 () Bool)

(assert (=> b!1177532 (= c!116793 (= (select (arr!36696 _keys!1208) from!1455) k0!934))))

(assert (=> b!1177532 e!669387))

(declare-fun res!782180 () Bool)

(assert (=> b!1177532 (=> (not res!782180) (not e!669387))))

(declare-fun lt!531717 () ListLongMap!17005)

(assert (=> b!1177532 (= res!782180 (= lt!531714 (+!3833 lt!531717 lt!531722)))))

(declare-fun get!18751 (ValueCell!14112 V!44651) V!44651)

(assert (=> b!1177532 (= lt!531722 (tuple2!19037 (select (arr!36696 _keys!1208) from!1455) (get!18751 (select (arr!36697 _values!996) from!1455) lt!531711)))))

(declare-fun b!1177533 () Bool)

(assert (=> b!1177533 (= e!669390 tp_is_empty!29643)))

(declare-fun b!1177534 () Bool)

(assert (=> b!1177534 (= e!669388 e!669379)))

(declare-fun res!782174 () Bool)

(assert (=> b!1177534 (=> res!782174 e!669379)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177534 (= res!782174 (not (validKeyInArray!0 (select (arr!36696 _keys!1208) from!1455))))))

(declare-fun lt!531710 () ListLongMap!17005)

(assert (=> b!1177534 (= lt!531710 lt!531717)))

(declare-fun -!1567 (ListLongMap!17005 (_ BitVec 64)) ListLongMap!17005)

(assert (=> b!1177534 (= lt!531717 (-!1567 lt!531720 k0!934))))

(assert (=> b!1177534 (= lt!531710 (getCurrentListMapNoExtraKeys!4975 lt!531715 lt!531723 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177534 (= lt!531720 (getCurrentListMapNoExtraKeys!4975 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531713 () Unit!38889)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!794 (array!76093 array!76095 (_ BitVec 32) (_ BitVec 32) V!44651 V!44651 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38889)

(assert (=> b!1177534 (= lt!531713 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177535 () Bool)

(declare-fun res!782175 () Bool)

(assert (=> b!1177535 (=> (not res!782175) (not e!669380))))

(assert (=> b!1177535 (= res!782175 (validKeyInArray!0 k0!934))))

(assert (= (and start!99534 res!782171) b!1177524))

(assert (= (and b!1177524 res!782173) b!1177530))

(assert (= (and b!1177530 res!782185) b!1177528))

(assert (= (and b!1177528 res!782176) b!1177522))

(assert (= (and b!1177522 res!782184) b!1177527))

(assert (= (and b!1177527 res!782177) b!1177535))

(assert (= (and b!1177535 res!782175) b!1177526))

(assert (= (and b!1177526 res!782179) b!1177515))

(assert (= (and b!1177515 res!782181) b!1177519))

(assert (= (and b!1177519 res!782183) b!1177529))

(assert (= (and b!1177529 (not res!782178)) b!1177523))

(assert (= (and b!1177523 (not res!782182)) b!1177534))

(assert (= (and b!1177534 (not res!782174)) b!1177532))

(assert (= (and b!1177532 res!782180) b!1177516))

(assert (= (and b!1177516 (not res!782172)) b!1177531))

(assert (= (and b!1177532 c!116793) b!1177521))

(assert (= (and b!1177532 (not c!116793)) b!1177520))

(assert (= (and b!1177532 res!782170) b!1177518))

(assert (= (and b!1177517 condMapEmpty!46292) mapIsEmpty!46292))

(assert (= (and b!1177517 (not condMapEmpty!46292)) mapNonEmpty!46292))

(get-info :version)

(assert (= (and mapNonEmpty!46292 ((_ is ValueCellFull!14112) mapValue!46292)) b!1177533))

(assert (= (and b!1177517 ((_ is ValueCellFull!14112) mapDefault!46292)) b!1177525))

(assert (= start!99534 b!1177517))

(declare-fun b_lambda!20257 () Bool)

(assert (=> (not b_lambda!20257) (not b!1177523)))

(declare-fun t!37877 () Bool)

(declare-fun tb!9925 () Bool)

(assert (=> (and start!99534 (= defaultEntry!1004 defaultEntry!1004) t!37877) tb!9925))

(declare-fun result!20417 () Bool)

(assert (=> tb!9925 (= result!20417 tp_is_empty!29643)))

(assert (=> b!1177523 t!37877))

(declare-fun b_and!41095 () Bool)

(assert (= b_and!41093 (and (=> t!37877 result!20417) b_and!41095)))

(declare-fun m!1085463 () Bool)

(assert (=> b!1177532 m!1085463))

(declare-fun m!1085465 () Bool)

(assert (=> b!1177532 m!1085465))

(declare-fun m!1085467 () Bool)

(assert (=> b!1177532 m!1085467))

(assert (=> b!1177532 m!1085467))

(declare-fun m!1085469 () Bool)

(assert (=> b!1177532 m!1085469))

(declare-fun m!1085471 () Bool)

(assert (=> b!1177535 m!1085471))

(declare-fun m!1085473 () Bool)

(assert (=> b!1177526 m!1085473))

(declare-fun m!1085475 () Bool)

(assert (=> b!1177521 m!1085475))

(declare-fun m!1085477 () Bool)

(assert (=> b!1177521 m!1085477))

(declare-fun m!1085479 () Bool)

(assert (=> b!1177521 m!1085479))

(declare-fun m!1085481 () Bool)

(assert (=> b!1177521 m!1085481))

(declare-fun m!1085483 () Bool)

(assert (=> b!1177521 m!1085483))

(declare-fun m!1085485 () Bool)

(assert (=> b!1177528 m!1085485))

(declare-fun m!1085487 () Bool)

(assert (=> b!1177524 m!1085487))

(declare-fun m!1085489 () Bool)

(assert (=> b!1177534 m!1085489))

(declare-fun m!1085491 () Bool)

(assert (=> b!1177534 m!1085491))

(declare-fun m!1085493 () Bool)

(assert (=> b!1177534 m!1085493))

(declare-fun m!1085495 () Bool)

(assert (=> b!1177534 m!1085495))

(assert (=> b!1177534 m!1085463))

(declare-fun m!1085497 () Bool)

(assert (=> b!1177534 m!1085497))

(assert (=> b!1177534 m!1085463))

(declare-fun m!1085499 () Bool)

(assert (=> start!99534 m!1085499))

(declare-fun m!1085501 () Bool)

(assert (=> start!99534 m!1085501))

(assert (=> b!1177516 m!1085463))

(declare-fun m!1085503 () Bool)

(assert (=> b!1177531 m!1085503))

(declare-fun m!1085505 () Bool)

(assert (=> b!1177523 m!1085505))

(declare-fun m!1085507 () Bool)

(assert (=> b!1177523 m!1085507))

(declare-fun m!1085509 () Bool)

(assert (=> b!1177523 m!1085509))

(declare-fun m!1085511 () Bool)

(assert (=> b!1177523 m!1085511))

(declare-fun m!1085513 () Bool)

(assert (=> mapNonEmpty!46292 m!1085513))

(declare-fun m!1085515 () Bool)

(assert (=> b!1177518 m!1085515))

(declare-fun m!1085517 () Bool)

(assert (=> b!1177529 m!1085517))

(declare-fun m!1085519 () Bool)

(assert (=> b!1177529 m!1085519))

(declare-fun m!1085521 () Bool)

(assert (=> b!1177519 m!1085521))

(declare-fun m!1085523 () Bool)

(assert (=> b!1177515 m!1085523))

(declare-fun m!1085525 () Bool)

(assert (=> b!1177515 m!1085525))

(declare-fun m!1085527 () Bool)

(assert (=> b!1177522 m!1085527))

(check-sat (not b!1177519) (not b!1177523) (not b!1177521) (not b!1177522) (not b!1177528) b_and!41095 (not b_lambda!20257) (not b!1177518) (not b!1177529) (not b!1177515) (not b!1177532) tp_is_empty!29643 (not b_next!25113) (not start!99534) (not b!1177524) (not mapNonEmpty!46292) (not b!1177531) (not b!1177534) (not b!1177535))
(check-sat b_and!41095 (not b_next!25113))
