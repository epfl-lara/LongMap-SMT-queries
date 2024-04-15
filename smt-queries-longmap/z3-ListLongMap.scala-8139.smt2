; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99694 () Bool)

(assert start!99694)

(declare-fun b_free!25279 () Bool)

(declare-fun b_next!25279 () Bool)

(assert (=> start!99694 (= b_free!25279 (not b_next!25279))))

(declare-fun tp!88551 () Bool)

(declare-fun b_and!41403 () Bool)

(assert (=> start!99694 (= tp!88551 b_and!41403)))

(declare-fun res!786117 () Bool)

(declare-fun e!672480 () Bool)

(assert (=> start!99694 (=> (not res!786117) (not e!672480))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!76352 0))(
  ( (array!76353 (arr!36826 (Array (_ BitVec 32) (_ BitVec 64))) (size!37364 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76352)

(assert (=> start!99694 (= res!786117 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37364 _keys!1208))))))

(assert (=> start!99694 e!672480))

(declare-fun tp_is_empty!29809 () Bool)

(assert (=> start!99694 tp_is_empty!29809))

(declare-fun array_inv!28220 (array!76352) Bool)

(assert (=> start!99694 (array_inv!28220 _keys!1208)))

(assert (=> start!99694 true))

(assert (=> start!99694 tp!88551))

(declare-datatypes ((V!44873 0))(
  ( (V!44874 (val!14961 Int)) )
))
(declare-datatypes ((ValueCell!14195 0))(
  ( (ValueCellFull!14195 (v!17598 V!44873)) (EmptyCell!14195) )
))
(declare-datatypes ((array!76354 0))(
  ( (array!76355 (arr!36827 (Array (_ BitVec 32) ValueCell!14195)) (size!37365 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76354)

(declare-fun e!672474 () Bool)

(declare-fun array_inv!28221 (array!76354) Bool)

(assert (=> start!99694 (and (array_inv!28221 _values!996) e!672474)))

(declare-fun b!1182811 () Bool)

(declare-fun res!786118 () Bool)

(assert (=> b!1182811 (=> (not res!786118) (not e!672480))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1182811 (= res!786118 (validKeyInArray!0 k0!934))))

(declare-fun b!1182812 () Bool)

(declare-fun res!786125 () Bool)

(assert (=> b!1182812 (=> (not res!786125) (not e!672480))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76352 (_ BitVec 32)) Bool)

(assert (=> b!1182812 (= res!786125 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun mapNonEmpty!46541 () Bool)

(declare-fun mapRes!46541 () Bool)

(declare-fun tp!88550 () Bool)

(declare-fun e!672481 () Bool)

(assert (=> mapNonEmpty!46541 (= mapRes!46541 (and tp!88550 e!672481))))

(declare-fun mapRest!46541 () (Array (_ BitVec 32) ValueCell!14195))

(declare-fun mapValue!46541 () ValueCell!14195)

(declare-fun mapKey!46541 () (_ BitVec 32))

(assert (=> mapNonEmpty!46541 (= (arr!36827 _values!996) (store mapRest!46541 mapKey!46541 mapValue!46541))))

(declare-fun b!1182813 () Bool)

(declare-fun e!672476 () Bool)

(declare-fun e!672473 () Bool)

(assert (=> b!1182813 (= e!672476 e!672473)))

(declare-fun res!786126 () Bool)

(assert (=> b!1182813 (=> res!786126 e!672473)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1182813 (= res!786126 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44873)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!19288 0))(
  ( (tuple2!19289 (_1!9655 (_ BitVec 64)) (_2!9655 V!44873)) )
))
(declare-datatypes ((List!25994 0))(
  ( (Nil!25991) (Cons!25990 (h!27199 tuple2!19288) (t!38256 List!25994)) )
))
(declare-datatypes ((ListLongMap!17257 0))(
  ( (ListLongMap!17258 (toList!8644 List!25994)) )
))
(declare-fun lt!535516 () ListLongMap!17257)

(declare-fun minValue!944 () V!44873)

(declare-fun lt!535517 () array!76354)

(declare-fun lt!535518 () array!76352)

(declare-fun getCurrentListMapNoExtraKeys!5099 (array!76352 array!76354 (_ BitVec 32) (_ BitVec 32) V!44873 V!44873 (_ BitVec 32) Int) ListLongMap!17257)

(assert (=> b!1182813 (= lt!535516 (getCurrentListMapNoExtraKeys!5099 lt!535518 lt!535517 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!535515 () V!44873)

(assert (=> b!1182813 (= lt!535517 (array!76355 (store (arr!36827 _values!996) i!673 (ValueCellFull!14195 lt!535515)) (size!37365 _values!996)))))

(declare-fun dynLambda!3005 (Int (_ BitVec 64)) V!44873)

(assert (=> b!1182813 (= lt!535515 (dynLambda!3005 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!535519 () ListLongMap!17257)

(assert (=> b!1182813 (= lt!535519 (getCurrentListMapNoExtraKeys!5099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1182814 () Bool)

(declare-fun e!672484 () Bool)

(assert (=> b!1182814 (= e!672484 tp_is_empty!29809)))

(declare-fun b!1182815 () Bool)

(declare-fun e!672479 () Bool)

(declare-fun arrayContainsKey!0 (array!76352 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1182815 (= e!672479 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182816 () Bool)

(declare-fun res!786113 () Bool)

(assert (=> b!1182816 (=> (not res!786113) (not e!672480))))

(assert (=> b!1182816 (= res!786113 (and (= (size!37365 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37364 _keys!1208) (size!37365 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1182817 () Bool)

(assert (=> b!1182817 (= e!672481 tp_is_empty!29809)))

(declare-fun b!1182818 () Bool)

(declare-fun res!786121 () Bool)

(assert (=> b!1182818 (=> (not res!786121) (not e!672480))))

(assert (=> b!1182818 (= res!786121 (= (select (arr!36826 _keys!1208) i!673) k0!934))))

(declare-fun b!1182819 () Bool)

(assert (=> b!1182819 (= e!672474 (and e!672484 mapRes!46541))))

(declare-fun condMapEmpty!46541 () Bool)

(declare-fun mapDefault!46541 () ValueCell!14195)

(assert (=> b!1182819 (= condMapEmpty!46541 (= (arr!36827 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14195)) mapDefault!46541)))))

(declare-fun b!1182820 () Bool)

(declare-fun e!672482 () Bool)

(assert (=> b!1182820 (= e!672480 e!672482)))

(declare-fun res!786119 () Bool)

(assert (=> b!1182820 (=> (not res!786119) (not e!672482))))

(assert (=> b!1182820 (= res!786119 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!535518 mask!1564))))

(assert (=> b!1182820 (= lt!535518 (array!76353 (store (arr!36826 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37364 _keys!1208)))))

(declare-fun b!1182821 () Bool)

(declare-datatypes ((Unit!38995 0))(
  ( (Unit!38996) )
))
(declare-fun e!672483 () Unit!38995)

(declare-fun Unit!38997 () Unit!38995)

(assert (=> b!1182821 (= e!672483 Unit!38997)))

(declare-fun b!1182822 () Bool)

(declare-fun res!786122 () Bool)

(assert (=> b!1182822 (=> (not res!786122) (not e!672480))))

(assert (=> b!1182822 (= res!786122 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37364 _keys!1208))))))

(declare-fun b!1182823 () Bool)

(declare-fun res!786115 () Bool)

(assert (=> b!1182823 (=> (not res!786115) (not e!672480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1182823 (= res!786115 (validMask!0 mask!1564))))

(declare-fun b!1182824 () Bool)

(assert (=> b!1182824 (= e!672482 (not e!672476))))

(declare-fun res!786127 () Bool)

(assert (=> b!1182824 (=> res!786127 e!672476)))

(assert (=> b!1182824 (= res!786127 (bvsgt from!1455 i!673))))

(assert (=> b!1182824 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!535514 () Unit!38995)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76352 (_ BitVec 64) (_ BitVec 32)) Unit!38995)

(assert (=> b!1182824 (= lt!535514 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1182825 () Bool)

(declare-fun Unit!38998 () Unit!38995)

(assert (=> b!1182825 (= e!672483 Unit!38998)))

(declare-fun lt!535513 () Unit!38995)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76352 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38995)

(assert (=> b!1182825 (= lt!535513 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1182825 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!535530 () Unit!38995)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76352 (_ BitVec 32) (_ BitVec 32)) Unit!38995)

(assert (=> b!1182825 (= lt!535530 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25995 0))(
  ( (Nil!25992) (Cons!25991 (h!27200 (_ BitVec 64)) (t!38257 List!25995)) )
))
(declare-fun arrayNoDuplicates!0 (array!76352 (_ BitVec 32) List!25995) Bool)

(assert (=> b!1182825 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25992)))

(declare-fun lt!535512 () Unit!38995)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76352 (_ BitVec 64) (_ BitVec 32) List!25995) Unit!38995)

(assert (=> b!1182825 (= lt!535512 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25992))))

(assert (=> b!1182825 false))

(declare-fun b!1182826 () Bool)

(declare-fun res!786124 () Bool)

(assert (=> b!1182826 (=> (not res!786124) (not e!672480))))

(assert (=> b!1182826 (= res!786124 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25992))))

(declare-fun mapIsEmpty!46541 () Bool)

(assert (=> mapIsEmpty!46541 mapRes!46541))

(declare-fun b!1182827 () Bool)

(declare-fun e!672475 () Bool)

(assert (=> b!1182827 (= e!672475 true)))

(declare-fun lt!535520 () ListLongMap!17257)

(declare-fun lt!535521 () ListLongMap!17257)

(declare-fun -!1600 (ListLongMap!17257 (_ BitVec 64)) ListLongMap!17257)

(assert (=> b!1182827 (= (-!1600 lt!535520 k0!934) lt!535521)))

(declare-fun lt!535527 () Unit!38995)

(declare-fun lt!535525 () ListLongMap!17257)

(declare-fun lt!535522 () V!44873)

(declare-fun addRemoveCommutativeForDiffKeys!148 (ListLongMap!17257 (_ BitVec 64) V!44873 (_ BitVec 64)) Unit!38995)

(assert (=> b!1182827 (= lt!535527 (addRemoveCommutativeForDiffKeys!148 lt!535525 (select (arr!36826 _keys!1208) from!1455) lt!535522 k0!934))))

(declare-fun lt!535529 () ListLongMap!17257)

(declare-fun lt!535526 () ListLongMap!17257)

(assert (=> b!1182827 (and (= lt!535519 lt!535520) (= lt!535526 lt!535529))))

(declare-fun lt!535524 () tuple2!19288)

(declare-fun +!3934 (ListLongMap!17257 tuple2!19288) ListLongMap!17257)

(assert (=> b!1182827 (= lt!535520 (+!3934 lt!535525 lt!535524))))

(assert (=> b!1182827 (not (= (select (arr!36826 _keys!1208) from!1455) k0!934))))

(declare-fun lt!535528 () Unit!38995)

(assert (=> b!1182827 (= lt!535528 e!672483)))

(declare-fun c!117016 () Bool)

(assert (=> b!1182827 (= c!117016 (= (select (arr!36826 _keys!1208) from!1455) k0!934))))

(declare-fun e!672478 () Bool)

(assert (=> b!1182827 e!672478))

(declare-fun res!786114 () Bool)

(assert (=> b!1182827 (=> (not res!786114) (not e!672478))))

(assert (=> b!1182827 (= res!786114 (= lt!535516 lt!535521))))

(assert (=> b!1182827 (= lt!535521 (+!3934 lt!535526 lt!535524))))

(assert (=> b!1182827 (= lt!535524 (tuple2!19289 (select (arr!36826 _keys!1208) from!1455) lt!535522))))

(declare-fun get!18849 (ValueCell!14195 V!44873) V!44873)

(assert (=> b!1182827 (= lt!535522 (get!18849 (select (arr!36827 _values!996) from!1455) lt!535515))))

(declare-fun b!1182828 () Bool)

(assert (=> b!1182828 (= e!672473 e!672475)))

(declare-fun res!786116 () Bool)

(assert (=> b!1182828 (=> res!786116 e!672475)))

(assert (=> b!1182828 (= res!786116 (not (validKeyInArray!0 (select (arr!36826 _keys!1208) from!1455))))))

(assert (=> b!1182828 (= lt!535529 lt!535526)))

(assert (=> b!1182828 (= lt!535526 (-!1600 lt!535525 k0!934))))

(assert (=> b!1182828 (= lt!535529 (getCurrentListMapNoExtraKeys!5099 lt!535518 lt!535517 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1182828 (= lt!535525 (getCurrentListMapNoExtraKeys!5099 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!535523 () Unit!38995)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!862 (array!76352 array!76354 (_ BitVec 32) (_ BitVec 32) V!44873 V!44873 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38995)

(assert (=> b!1182828 (= lt!535523 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!862 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1182829 () Bool)

(assert (=> b!1182829 (= e!672478 e!672479)))

(declare-fun res!786120 () Bool)

(assert (=> b!1182829 (=> res!786120 e!672479)))

(assert (=> b!1182829 (= res!786120 (not (= (select (arr!36826 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1182830 () Bool)

(declare-fun res!786123 () Bool)

(assert (=> b!1182830 (=> (not res!786123) (not e!672482))))

(assert (=> b!1182830 (= res!786123 (arrayNoDuplicates!0 lt!535518 #b00000000000000000000000000000000 Nil!25992))))

(assert (= (and start!99694 res!786117) b!1182823))

(assert (= (and b!1182823 res!786115) b!1182816))

(assert (= (and b!1182816 res!786113) b!1182812))

(assert (= (and b!1182812 res!786125) b!1182826))

(assert (= (and b!1182826 res!786124) b!1182822))

(assert (= (and b!1182822 res!786122) b!1182811))

(assert (= (and b!1182811 res!786118) b!1182818))

(assert (= (and b!1182818 res!786121) b!1182820))

(assert (= (and b!1182820 res!786119) b!1182830))

(assert (= (and b!1182830 res!786123) b!1182824))

(assert (= (and b!1182824 (not res!786127)) b!1182813))

(assert (= (and b!1182813 (not res!786126)) b!1182828))

(assert (= (and b!1182828 (not res!786116)) b!1182827))

(assert (= (and b!1182827 res!786114) b!1182829))

(assert (= (and b!1182829 (not res!786120)) b!1182815))

(assert (= (and b!1182827 c!117016) b!1182825))

(assert (= (and b!1182827 (not c!117016)) b!1182821))

(assert (= (and b!1182819 condMapEmpty!46541) mapIsEmpty!46541))

(assert (= (and b!1182819 (not condMapEmpty!46541)) mapNonEmpty!46541))

(get-info :version)

(assert (= (and mapNonEmpty!46541 ((_ is ValueCellFull!14195) mapValue!46541)) b!1182817))

(assert (= (and b!1182819 ((_ is ValueCellFull!14195) mapDefault!46541)) b!1182814))

(assert (= start!99694 b!1182819))

(declare-fun b_lambda!20405 () Bool)

(assert (=> (not b_lambda!20405) (not b!1182813)))

(declare-fun t!38255 () Bool)

(declare-fun tb!10083 () Bool)

(assert (=> (and start!99694 (= defaultEntry!1004 defaultEntry!1004) t!38255) tb!10083))

(declare-fun result!20741 () Bool)

(assert (=> tb!10083 (= result!20741 tp_is_empty!29809)))

(assert (=> b!1182813 t!38255))

(declare-fun b_and!41405 () Bool)

(assert (= b_and!41403 (and (=> t!38255 result!20741) b_and!41405)))

(declare-fun m!1090415 () Bool)

(assert (=> b!1182813 m!1090415))

(declare-fun m!1090417 () Bool)

(assert (=> b!1182813 m!1090417))

(declare-fun m!1090419 () Bool)

(assert (=> b!1182813 m!1090419))

(declare-fun m!1090421 () Bool)

(assert (=> b!1182813 m!1090421))

(declare-fun m!1090423 () Bool)

(assert (=> b!1182824 m!1090423))

(declare-fun m!1090425 () Bool)

(assert (=> b!1182824 m!1090425))

(declare-fun m!1090427 () Bool)

(assert (=> b!1182811 m!1090427))

(declare-fun m!1090429 () Bool)

(assert (=> b!1182815 m!1090429))

(declare-fun m!1090431 () Bool)

(assert (=> b!1182818 m!1090431))

(declare-fun m!1090433 () Bool)

(assert (=> b!1182830 m!1090433))

(declare-fun m!1090435 () Bool)

(assert (=> b!1182825 m!1090435))

(declare-fun m!1090437 () Bool)

(assert (=> b!1182825 m!1090437))

(declare-fun m!1090439 () Bool)

(assert (=> b!1182825 m!1090439))

(declare-fun m!1090441 () Bool)

(assert (=> b!1182825 m!1090441))

(declare-fun m!1090443 () Bool)

(assert (=> b!1182825 m!1090443))

(declare-fun m!1090445 () Bool)

(assert (=> start!99694 m!1090445))

(declare-fun m!1090447 () Bool)

(assert (=> start!99694 m!1090447))

(declare-fun m!1090449 () Bool)

(assert (=> b!1182829 m!1090449))

(declare-fun m!1090451 () Bool)

(assert (=> b!1182828 m!1090451))

(declare-fun m!1090453 () Bool)

(assert (=> b!1182828 m!1090453))

(declare-fun m!1090455 () Bool)

(assert (=> b!1182828 m!1090455))

(assert (=> b!1182828 m!1090449))

(declare-fun m!1090457 () Bool)

(assert (=> b!1182828 m!1090457))

(declare-fun m!1090459 () Bool)

(assert (=> b!1182828 m!1090459))

(assert (=> b!1182828 m!1090449))

(declare-fun m!1090461 () Bool)

(assert (=> b!1182823 m!1090461))

(declare-fun m!1090463 () Bool)

(assert (=> b!1182812 m!1090463))

(declare-fun m!1090465 () Bool)

(assert (=> b!1182820 m!1090465))

(declare-fun m!1090467 () Bool)

(assert (=> b!1182820 m!1090467))

(assert (=> b!1182827 m!1090449))

(declare-fun m!1090469 () Bool)

(assert (=> b!1182827 m!1090469))

(declare-fun m!1090471 () Bool)

(assert (=> b!1182827 m!1090471))

(assert (=> b!1182827 m!1090471))

(declare-fun m!1090473 () Bool)

(assert (=> b!1182827 m!1090473))

(declare-fun m!1090475 () Bool)

(assert (=> b!1182827 m!1090475))

(declare-fun m!1090477 () Bool)

(assert (=> b!1182827 m!1090477))

(declare-fun m!1090479 () Bool)

(assert (=> b!1182827 m!1090479))

(assert (=> b!1182827 m!1090449))

(declare-fun m!1090481 () Bool)

(assert (=> b!1182826 m!1090481))

(declare-fun m!1090483 () Bool)

(assert (=> mapNonEmpty!46541 m!1090483))

(check-sat (not b!1182823) (not b_next!25279) (not b!1182825) (not b!1182813) (not b!1182826) (not b!1182812) (not b!1182824) (not b!1182815) (not b!1182828) (not mapNonEmpty!46541) tp_is_empty!29809 (not b!1182811) (not b!1182820) (not b!1182830) b_and!41405 (not start!99694) (not b!1182827) (not b_lambda!20405))
(check-sat b_and!41405 (not b_next!25279))
