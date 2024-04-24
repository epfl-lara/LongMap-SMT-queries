; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99720 () Bool)

(assert start!99720)

(declare-fun b_free!25063 () Bool)

(declare-fun b_next!25063 () Bool)

(assert (=> start!99720 (= b_free!25063 (not b_next!25063))))

(declare-fun tp!87903 () Bool)

(declare-fun b_and!40995 () Bool)

(assert (=> start!99720 (= tp!87903 b_and!40995)))

(declare-fun b!1177186 () Bool)

(declare-fun e!669254 () Bool)

(declare-fun e!669243 () Bool)

(assert (=> b!1177186 (= e!669254 e!669243)))

(declare-fun res!781493 () Bool)

(assert (=> b!1177186 (=> (not res!781493) (not e!669243))))

(declare-datatypes ((array!76045 0))(
  ( (array!76046 (arr!36666 (Array (_ BitVec 32) (_ BitVec 64))) (size!37203 (_ BitVec 32))) )
))
(declare-fun lt!531075 () array!76045)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76045 (_ BitVec 32)) Bool)

(assert (=> b!1177186 (= res!781493 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531075 mask!1564))))

(declare-fun _keys!1208 () array!76045)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177186 (= lt!531075 (array!76046 (store (arr!36666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37203 _keys!1208)))))

(declare-fun b!1177187 () Bool)

(declare-fun e!669244 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!76045 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177187 (= e!669244 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177188 () Bool)

(declare-fun e!669249 () Bool)

(declare-fun e!669251 () Bool)

(declare-fun mapRes!46217 () Bool)

(assert (=> b!1177188 (= e!669249 (and e!669251 mapRes!46217))))

(declare-fun condMapEmpty!46217 () Bool)

(declare-datatypes ((V!44585 0))(
  ( (V!44586 (val!14853 Int)) )
))
(declare-datatypes ((ValueCell!14087 0))(
  ( (ValueCellFull!14087 (v!17487 V!44585)) (EmptyCell!14087) )
))
(declare-datatypes ((array!76047 0))(
  ( (array!76048 (arr!36667 (Array (_ BitVec 32) ValueCell!14087)) (size!37204 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76047)

(declare-fun mapDefault!46217 () ValueCell!14087)

(assert (=> b!1177188 (= condMapEmpty!46217 (= (arr!36667 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14087)) mapDefault!46217)))))

(declare-fun b!1177189 () Bool)

(declare-fun e!669246 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1177189 (= e!669246 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!37203 _keys!1208))))))

(assert (=> b!1177189 (not (= (select (arr!36666 _keys!1208) from!1455) k0!934))))

(declare-datatypes ((Unit!38808 0))(
  ( (Unit!38809) )
))
(declare-fun lt!531082 () Unit!38808)

(declare-fun e!669250 () Unit!38808)

(assert (=> b!1177189 (= lt!531082 e!669250)))

(declare-fun c!117116 () Bool)

(assert (=> b!1177189 (= c!117116 (= (select (arr!36666 _keys!1208) from!1455) k0!934))))

(declare-fun e!669247 () Bool)

(assert (=> b!1177189 e!669247))

(declare-fun res!781496 () Bool)

(assert (=> b!1177189 (=> (not res!781496) (not e!669247))))

(declare-datatypes ((tuple2!19038 0))(
  ( (tuple2!19039 (_1!9530 (_ BitVec 64)) (_2!9530 V!44585)) )
))
(declare-datatypes ((List!25770 0))(
  ( (Nil!25767) (Cons!25766 (h!26984 tuple2!19038) (t!37817 List!25770)) )
))
(declare-datatypes ((ListLongMap!17015 0))(
  ( (ListLongMap!17016 (toList!8523 List!25770)) )
))
(declare-fun lt!531076 () ListLongMap!17015)

(declare-fun lt!531081 () ListLongMap!17015)

(declare-fun lt!531083 () V!44585)

(declare-fun +!3853 (ListLongMap!17015 tuple2!19038) ListLongMap!17015)

(declare-fun get!18759 (ValueCell!14087 V!44585) V!44585)

(assert (=> b!1177189 (= res!781496 (= lt!531076 (+!3853 lt!531081 (tuple2!19039 (select (arr!36666 _keys!1208) from!1455) (get!18759 (select (arr!36667 _values!996) from!1455) lt!531083)))))))

(declare-fun b!1177190 () Bool)

(assert (=> b!1177190 (= e!669247 e!669244)))

(declare-fun res!781487 () Bool)

(assert (=> b!1177190 (=> res!781487 e!669244)))

(assert (=> b!1177190 (= res!781487 (not (= (select (arr!36666 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177191 () Bool)

(declare-fun Unit!38810 () Unit!38808)

(assert (=> b!1177191 (= e!669250 Unit!38810)))

(declare-fun b!1177192 () Bool)

(declare-fun res!781486 () Bool)

(assert (=> b!1177192 (=> (not res!781486) (not e!669254))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177192 (= res!781486 (validKeyInArray!0 k0!934))))

(declare-fun b!1177193 () Bool)

(declare-fun res!781492 () Bool)

(assert (=> b!1177193 (=> (not res!781492) (not e!669243))))

(declare-datatypes ((List!25771 0))(
  ( (Nil!25768) (Cons!25767 (h!26985 (_ BitVec 64)) (t!37818 List!25771)) )
))
(declare-fun arrayNoDuplicates!0 (array!76045 (_ BitVec 32) List!25771) Bool)

(assert (=> b!1177193 (= res!781492 (arrayNoDuplicates!0 lt!531075 #b00000000000000000000000000000000 Nil!25768))))

(declare-fun b!1177194 () Bool)

(declare-fun e!669248 () Bool)

(declare-fun tp_is_empty!29593 () Bool)

(assert (=> b!1177194 (= e!669248 tp_is_empty!29593)))

(declare-fun b!1177195 () Bool)

(declare-fun res!781488 () Bool)

(assert (=> b!1177195 (=> (not res!781488) (not e!669254))))

(assert (=> b!1177195 (= res!781488 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177196 () Bool)

(declare-fun e!669252 () Bool)

(assert (=> b!1177196 (= e!669243 (not e!669252))))

(declare-fun res!781497 () Bool)

(assert (=> b!1177196 (=> res!781497 e!669252)))

(assert (=> b!1177196 (= res!781497 (bvsgt from!1455 i!673))))

(assert (=> b!1177196 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531078 () Unit!38808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76045 (_ BitVec 64) (_ BitVec 32)) Unit!38808)

(assert (=> b!1177196 (= lt!531078 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177197 () Bool)

(declare-fun res!781490 () Bool)

(assert (=> b!1177197 (=> (not res!781490) (not e!669254))))

(assert (=> b!1177197 (= res!781490 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25768))))

(declare-fun mapNonEmpty!46217 () Bool)

(declare-fun tp!87902 () Bool)

(assert (=> mapNonEmpty!46217 (= mapRes!46217 (and tp!87902 e!669248))))

(declare-fun mapKey!46217 () (_ BitVec 32))

(declare-fun mapRest!46217 () (Array (_ BitVec 32) ValueCell!14087))

(declare-fun mapValue!46217 () ValueCell!14087)

(assert (=> mapNonEmpty!46217 (= (arr!36667 _values!996) (store mapRest!46217 mapKey!46217 mapValue!46217))))

(declare-fun b!1177198 () Bool)

(declare-fun e!669253 () Bool)

(assert (=> b!1177198 (= e!669253 e!669246)))

(declare-fun res!781498 () Bool)

(assert (=> b!1177198 (=> res!781498 e!669246)))

(assert (=> b!1177198 (= res!781498 (not (validKeyInArray!0 (select (arr!36666 _keys!1208) from!1455))))))

(declare-fun lt!531086 () ListLongMap!17015)

(assert (=> b!1177198 (= lt!531086 lt!531081)))

(declare-fun lt!531079 () ListLongMap!17015)

(declare-fun -!1564 (ListLongMap!17015 (_ BitVec 64)) ListLongMap!17015)

(assert (=> b!1177198 (= lt!531081 (-!1564 lt!531079 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!531087 () array!76047)

(declare-fun minValue!944 () V!44585)

(declare-fun zeroValue!944 () V!44585)

(declare-fun getCurrentListMapNoExtraKeys!5005 (array!76045 array!76047 (_ BitVec 32) (_ BitVec 32) V!44585 V!44585 (_ BitVec 32) Int) ListLongMap!17015)

(assert (=> b!1177198 (= lt!531086 (getCurrentListMapNoExtraKeys!5005 lt!531075 lt!531087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177198 (= lt!531079 (getCurrentListMapNoExtraKeys!5005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531080 () Unit!38808)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!789 (array!76045 array!76047 (_ BitVec 32) (_ BitVec 32) V!44585 V!44585 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38808)

(assert (=> b!1177198 (= lt!531080 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!789 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1177199 () Bool)

(declare-fun res!781495 () Bool)

(assert (=> b!1177199 (=> (not res!781495) (not e!669254))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177199 (= res!781495 (validMask!0 mask!1564))))

(declare-fun b!1177200 () Bool)

(assert (=> b!1177200 (= e!669251 tp_is_empty!29593)))

(declare-fun b!1177201 () Bool)

(assert (=> b!1177201 (= e!669252 e!669253)))

(declare-fun res!781499 () Bool)

(assert (=> b!1177201 (=> res!781499 e!669253)))

(assert (=> b!1177201 (= res!781499 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1177201 (= lt!531076 (getCurrentListMapNoExtraKeys!5005 lt!531075 lt!531087 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177201 (= lt!531087 (array!76048 (store (arr!36667 _values!996) i!673 (ValueCellFull!14087 lt!531083)) (size!37204 _values!996)))))

(declare-fun dynLambda!2981 (Int (_ BitVec 64)) V!44585)

(assert (=> b!1177201 (= lt!531083 (dynLambda!2981 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531085 () ListLongMap!17015)

(assert (=> b!1177201 (= lt!531085 (getCurrentListMapNoExtraKeys!5005 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46217 () Bool)

(assert (=> mapIsEmpty!46217 mapRes!46217))

(declare-fun b!1177202 () Bool)

(declare-fun res!781491 () Bool)

(assert (=> b!1177202 (=> (not res!781491) (not e!669254))))

(assert (=> b!1177202 (= res!781491 (= (select (arr!36666 _keys!1208) i!673) k0!934))))

(declare-fun b!1177203 () Bool)

(declare-fun Unit!38811 () Unit!38808)

(assert (=> b!1177203 (= e!669250 Unit!38811)))

(declare-fun lt!531077 () Unit!38808)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76045 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38808)

(assert (=> b!1177203 (= lt!531077 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177203 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531088 () Unit!38808)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76045 (_ BitVec 32) (_ BitVec 32)) Unit!38808)

(assert (=> b!1177203 (= lt!531088 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177203 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25768)))

(declare-fun lt!531084 () Unit!38808)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76045 (_ BitVec 64) (_ BitVec 32) List!25771) Unit!38808)

(assert (=> b!1177203 (= lt!531084 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25768))))

(assert (=> b!1177203 false))

(declare-fun res!781494 () Bool)

(assert (=> start!99720 (=> (not res!781494) (not e!669254))))

(assert (=> start!99720 (= res!781494 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37203 _keys!1208))))))

(assert (=> start!99720 e!669254))

(assert (=> start!99720 tp_is_empty!29593))

(declare-fun array_inv!28084 (array!76045) Bool)

(assert (=> start!99720 (array_inv!28084 _keys!1208)))

(assert (=> start!99720 true))

(assert (=> start!99720 tp!87903))

(declare-fun array_inv!28085 (array!76047) Bool)

(assert (=> start!99720 (and (array_inv!28085 _values!996) e!669249)))

(declare-fun b!1177204 () Bool)

(declare-fun res!781485 () Bool)

(assert (=> b!1177204 (=> (not res!781485) (not e!669254))))

(assert (=> b!1177204 (= res!781485 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37203 _keys!1208))))))

(declare-fun b!1177205 () Bool)

(declare-fun res!781489 () Bool)

(assert (=> b!1177205 (=> (not res!781489) (not e!669254))))

(assert (=> b!1177205 (= res!781489 (and (= (size!37204 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37203 _keys!1208) (size!37204 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99720 res!781494) b!1177199))

(assert (= (and b!1177199 res!781495) b!1177205))

(assert (= (and b!1177205 res!781489) b!1177195))

(assert (= (and b!1177195 res!781488) b!1177197))

(assert (= (and b!1177197 res!781490) b!1177204))

(assert (= (and b!1177204 res!781485) b!1177192))

(assert (= (and b!1177192 res!781486) b!1177202))

(assert (= (and b!1177202 res!781491) b!1177186))

(assert (= (and b!1177186 res!781493) b!1177193))

(assert (= (and b!1177193 res!781492) b!1177196))

(assert (= (and b!1177196 (not res!781497)) b!1177201))

(assert (= (and b!1177201 (not res!781499)) b!1177198))

(assert (= (and b!1177198 (not res!781498)) b!1177189))

(assert (= (and b!1177189 res!781496) b!1177190))

(assert (= (and b!1177190 (not res!781487)) b!1177187))

(assert (= (and b!1177189 c!117116) b!1177203))

(assert (= (and b!1177189 (not c!117116)) b!1177191))

(assert (= (and b!1177188 condMapEmpty!46217) mapIsEmpty!46217))

(assert (= (and b!1177188 (not condMapEmpty!46217)) mapNonEmpty!46217))

(get-info :version)

(assert (= (and mapNonEmpty!46217 ((_ is ValueCellFull!14087) mapValue!46217)) b!1177194))

(assert (= (and b!1177188 ((_ is ValueCellFull!14087) mapDefault!46217)) b!1177200))

(assert (= start!99720 b!1177188))

(declare-fun b_lambda!20201 () Bool)

(assert (=> (not b_lambda!20201) (not b!1177201)))

(declare-fun t!37816 () Bool)

(declare-fun tb!9867 () Bool)

(assert (=> (and start!99720 (= defaultEntry!1004 defaultEntry!1004) t!37816) tb!9867))

(declare-fun result!20309 () Bool)

(assert (=> tb!9867 (= result!20309 tp_is_empty!29593)))

(assert (=> b!1177201 t!37816))

(declare-fun b_and!40997 () Bool)

(assert (= b_and!40995 (and (=> t!37816 result!20309) b_and!40997)))

(declare-fun m!1085391 () Bool)

(assert (=> b!1177198 m!1085391))

(declare-fun m!1085393 () Bool)

(assert (=> b!1177198 m!1085393))

(declare-fun m!1085395 () Bool)

(assert (=> b!1177198 m!1085395))

(declare-fun m!1085397 () Bool)

(assert (=> b!1177198 m!1085397))

(declare-fun m!1085399 () Bool)

(assert (=> b!1177198 m!1085399))

(declare-fun m!1085401 () Bool)

(assert (=> b!1177198 m!1085401))

(assert (=> b!1177198 m!1085399))

(declare-fun m!1085403 () Bool)

(assert (=> b!1177197 m!1085403))

(declare-fun m!1085405 () Bool)

(assert (=> mapNonEmpty!46217 m!1085405))

(declare-fun m!1085407 () Bool)

(assert (=> b!1177192 m!1085407))

(declare-fun m!1085409 () Bool)

(assert (=> b!1177203 m!1085409))

(declare-fun m!1085411 () Bool)

(assert (=> b!1177203 m!1085411))

(declare-fun m!1085413 () Bool)

(assert (=> b!1177203 m!1085413))

(declare-fun m!1085415 () Bool)

(assert (=> b!1177203 m!1085415))

(declare-fun m!1085417 () Bool)

(assert (=> b!1177203 m!1085417))

(declare-fun m!1085419 () Bool)

(assert (=> b!1177187 m!1085419))

(declare-fun m!1085421 () Bool)

(assert (=> b!1177202 m!1085421))

(declare-fun m!1085423 () Bool)

(assert (=> b!1177193 m!1085423))

(declare-fun m!1085425 () Bool)

(assert (=> b!1177186 m!1085425))

(declare-fun m!1085427 () Bool)

(assert (=> b!1177186 m!1085427))

(declare-fun m!1085429 () Bool)

(assert (=> b!1177195 m!1085429))

(declare-fun m!1085431 () Bool)

(assert (=> b!1177201 m!1085431))

(declare-fun m!1085433 () Bool)

(assert (=> b!1177201 m!1085433))

(declare-fun m!1085435 () Bool)

(assert (=> b!1177201 m!1085435))

(declare-fun m!1085437 () Bool)

(assert (=> b!1177201 m!1085437))

(declare-fun m!1085439 () Bool)

(assert (=> start!99720 m!1085439))

(declare-fun m!1085441 () Bool)

(assert (=> start!99720 m!1085441))

(assert (=> b!1177190 m!1085399))

(declare-fun m!1085443 () Bool)

(assert (=> b!1177196 m!1085443))

(declare-fun m!1085445 () Bool)

(assert (=> b!1177196 m!1085445))

(assert (=> b!1177189 m!1085399))

(declare-fun m!1085447 () Bool)

(assert (=> b!1177189 m!1085447))

(assert (=> b!1177189 m!1085447))

(declare-fun m!1085449 () Bool)

(assert (=> b!1177189 m!1085449))

(declare-fun m!1085451 () Bool)

(assert (=> b!1177189 m!1085451))

(declare-fun m!1085453 () Bool)

(assert (=> b!1177199 m!1085453))

(check-sat (not b!1177198) (not b!1177189) (not b_lambda!20201) tp_is_empty!29593 (not mapNonEmpty!46217) (not b_next!25063) (not b!1177193) (not b!1177201) (not b!1177192) (not b!1177187) (not b!1177199) (not b!1177186) b_and!40997 (not b!1177203) (not b!1177196) (not b!1177197) (not b!1177195) (not start!99720))
(check-sat b_and!40997 (not b_next!25063))
