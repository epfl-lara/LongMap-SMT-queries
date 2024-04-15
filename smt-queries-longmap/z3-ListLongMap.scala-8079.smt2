; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99334 () Bool)

(assert start!99334)

(declare-fun b_free!24919 () Bool)

(declare-fun b_next!24919 () Bool)

(assert (=> start!99334 (= b_free!24919 (not b_next!24919))))

(declare-fun tp!87470 () Bool)

(declare-fun b_and!40683 () Bool)

(assert (=> start!99334 (= tp!87470 b_and!40683)))

(declare-fun mapNonEmpty!46001 () Bool)

(declare-fun mapRes!46001 () Bool)

(declare-fun tp!87471 () Bool)

(declare-fun e!665680 () Bool)

(assert (=> mapNonEmpty!46001 (= mapRes!46001 (and tp!87471 e!665680))))

(declare-fun mapKey!46001 () (_ BitVec 32))

(declare-datatypes ((V!44393 0))(
  ( (V!44394 (val!14781 Int)) )
))
(declare-datatypes ((ValueCell!14015 0))(
  ( (ValueCellFull!14015 (v!17418 V!44393)) (EmptyCell!14015) )
))
(declare-fun mapRest!46001 () (Array (_ BitVec 32) ValueCell!14015))

(declare-fun mapValue!46001 () ValueCell!14015)

(declare-datatypes ((array!75642 0))(
  ( (array!75643 (arr!36471 (Array (_ BitVec 32) ValueCell!14015)) (size!37009 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75642)

(assert (=> mapNonEmpty!46001 (= (arr!36471 _values!996) (store mapRest!46001 mapKey!46001 mapValue!46001))))

(declare-fun b!1171187 () Bool)

(declare-fun e!665692 () Bool)

(declare-fun tp_is_empty!29449 () Bool)

(assert (=> b!1171187 (= e!665692 tp_is_empty!29449)))

(declare-fun b!1171188 () Bool)

(declare-fun res!777428 () Bool)

(declare-fun e!665690 () Bool)

(assert (=> b!1171188 (=> res!777428 e!665690)))

(declare-datatypes ((List!25683 0))(
  ( (Nil!25680) (Cons!25679 (h!26888 (_ BitVec 64)) (t!37585 List!25683)) )
))
(declare-fun noDuplicate!1622 (List!25683) Bool)

(assert (=> b!1171188 (= res!777428 (not (noDuplicate!1622 Nil!25680)))))

(declare-fun b!1171189 () Bool)

(declare-fun e!665681 () Bool)

(declare-fun e!665683 () Bool)

(assert (=> b!1171189 (= e!665681 e!665683)))

(declare-fun res!777434 () Bool)

(assert (=> b!1171189 (=> (not res!777434) (not e!665683))))

(declare-datatypes ((array!75644 0))(
  ( (array!75645 (arr!36472 (Array (_ BitVec 32) (_ BitVec 64))) (size!37010 (_ BitVec 32))) )
))
(declare-fun lt!527442 () array!75644)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75644 (_ BitVec 32)) Bool)

(assert (=> b!1171189 (= res!777434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!527442 mask!1564))))

(declare-fun _keys!1208 () array!75644)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1171189 (= lt!527442 (array!75645 (store (arr!36472 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37010 _keys!1208)))))

(declare-fun b!1171190 () Bool)

(declare-fun res!777436 () Bool)

(assert (=> b!1171190 (=> (not res!777436) (not e!665681))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1171190 (= res!777436 (validMask!0 mask!1564))))

(declare-fun b!1171191 () Bool)

(declare-fun res!777432 () Bool)

(assert (=> b!1171191 (=> (not res!777432) (not e!665681))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1171191 (= res!777432 (validKeyInArray!0 k0!934))))

(declare-fun b!1171192 () Bool)

(declare-fun res!777431 () Bool)

(assert (=> b!1171192 (=> (not res!777431) (not e!665681))))

(declare-fun arrayNoDuplicates!0 (array!75644 (_ BitVec 32) List!25683) Bool)

(assert (=> b!1171192 (= res!777431 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25680))))

(declare-fun b!1171193 () Bool)

(declare-fun res!777445 () Bool)

(assert (=> b!1171193 (=> (not res!777445) (not e!665681))))

(assert (=> b!1171193 (= res!777445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1171194 () Bool)

(declare-fun e!665688 () Bool)

(assert (=> b!1171194 (= e!665683 (not e!665688))))

(declare-fun res!777429 () Bool)

(assert (=> b!1171194 (=> res!777429 e!665688)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1171194 (= res!777429 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75644 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1171194 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38451 0))(
  ( (Unit!38452) )
))
(declare-fun lt!527441 () Unit!38451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75644 (_ BitVec 64) (_ BitVec 32)) Unit!38451)

(assert (=> b!1171194 (= lt!527441 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171195 () Bool)

(declare-fun e!665685 () Bool)

(declare-fun e!665686 () Bool)

(assert (=> b!1171195 (= e!665685 e!665686)))

(declare-fun res!777438 () Bool)

(assert (=> b!1171195 (=> res!777438 e!665686)))

(assert (=> b!1171195 (= res!777438 (not (= (select (arr!36472 _keys!1208) from!1455) k0!934)))))

(declare-fun e!665687 () Bool)

(assert (=> b!1171195 e!665687))

(declare-fun res!777433 () Bool)

(assert (=> b!1171195 (=> (not res!777433) (not e!665687))))

(declare-datatypes ((tuple2!18970 0))(
  ( (tuple2!18971 (_1!9496 (_ BitVec 64)) (_2!9496 V!44393)) )
))
(declare-datatypes ((List!25684 0))(
  ( (Nil!25681) (Cons!25680 (h!26889 tuple2!18970) (t!37586 List!25684)) )
))
(declare-datatypes ((ListLongMap!16939 0))(
  ( (ListLongMap!16940 (toList!8485 List!25684)) )
))
(declare-fun lt!527436 () ListLongMap!16939)

(declare-fun lt!527440 () V!44393)

(declare-fun lt!527439 () ListLongMap!16939)

(declare-fun +!3804 (ListLongMap!16939 tuple2!18970) ListLongMap!16939)

(declare-fun get!18610 (ValueCell!14015 V!44393) V!44393)

(assert (=> b!1171195 (= res!777433 (= lt!527436 (+!3804 lt!527439 (tuple2!18971 (select (arr!36472 _keys!1208) from!1455) (get!18610 (select (arr!36471 _values!996) from!1455) lt!527440)))))))

(declare-fun b!1171196 () Bool)

(declare-fun res!777439 () Bool)

(assert (=> b!1171196 (=> (not res!777439) (not e!665681))))

(assert (=> b!1171196 (= res!777439 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37010 _keys!1208))))))

(declare-fun b!1171197 () Bool)

(assert (=> b!1171197 (= e!665690 true)))

(declare-fun lt!527437 () Bool)

(declare-fun contains!6825 (List!25683 (_ BitVec 64)) Bool)

(assert (=> b!1171197 (= lt!527437 (contains!6825 Nil!25680 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171199 () Bool)

(declare-fun e!665682 () Bool)

(assert (=> b!1171199 (= e!665688 e!665682)))

(declare-fun res!777427 () Bool)

(assert (=> b!1171199 (=> res!777427 e!665682)))

(assert (=> b!1171199 (= res!777427 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44393)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!527443 () array!75642)

(declare-fun minValue!944 () V!44393)

(declare-fun getCurrentListMapNoExtraKeys!4960 (array!75644 array!75642 (_ BitVec 32) (_ BitVec 32) V!44393 V!44393 (_ BitVec 32) Int) ListLongMap!16939)

(assert (=> b!1171199 (= lt!527436 (getCurrentListMapNoExtraKeys!4960 lt!527442 lt!527443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1171199 (= lt!527443 (array!75643 (store (arr!36471 _values!996) i!673 (ValueCellFull!14015 lt!527440)) (size!37009 _values!996)))))

(declare-fun dynLambda!2885 (Int (_ BitVec 64)) V!44393)

(assert (=> b!1171199 (= lt!527440 (dynLambda!2885 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!527444 () ListLongMap!16939)

(assert (=> b!1171199 (= lt!527444 (getCurrentListMapNoExtraKeys!4960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46001 () Bool)

(assert (=> mapIsEmpty!46001 mapRes!46001))

(declare-fun e!665691 () Bool)

(declare-fun b!1171200 () Bool)

(assert (=> b!1171200 (= e!665691 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1171201 () Bool)

(declare-fun res!777440 () Bool)

(assert (=> b!1171201 (=> (not res!777440) (not e!665681))))

(assert (=> b!1171201 (= res!777440 (and (= (size!37009 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37010 _keys!1208) (size!37009 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1171202 () Bool)

(assert (=> b!1171202 (= e!665682 e!665685)))

(declare-fun res!777442 () Bool)

(assert (=> b!1171202 (=> res!777442 e!665685)))

(assert (=> b!1171202 (= res!777442 (not (validKeyInArray!0 (select (arr!36472 _keys!1208) from!1455))))))

(declare-fun lt!527445 () ListLongMap!16939)

(assert (=> b!1171202 (= lt!527445 lt!527439)))

(declare-fun lt!527448 () ListLongMap!16939)

(declare-fun -!1481 (ListLongMap!16939 (_ BitVec 64)) ListLongMap!16939)

(assert (=> b!1171202 (= lt!527439 (-!1481 lt!527448 k0!934))))

(assert (=> b!1171202 (= lt!527445 (getCurrentListMapNoExtraKeys!4960 lt!527442 lt!527443 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1171202 (= lt!527448 (getCurrentListMapNoExtraKeys!4960 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!527447 () Unit!38451)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!745 (array!75644 array!75642 (_ BitVec 32) (_ BitVec 32) V!44393 V!44393 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38451)

(assert (=> b!1171202 (= lt!527447 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!745 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1171203 () Bool)

(declare-fun res!777435 () Bool)

(assert (=> b!1171203 (=> (not res!777435) (not e!665681))))

(assert (=> b!1171203 (= res!777435 (= (select (arr!36472 _keys!1208) i!673) k0!934))))

(declare-fun b!1171204 () Bool)

(declare-fun res!777443 () Bool)

(assert (=> b!1171204 (=> res!777443 e!665690)))

(assert (=> b!1171204 (= res!777443 (contains!6825 Nil!25680 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1171205 () Bool)

(assert (=> b!1171205 (= e!665687 e!665691)))

(declare-fun res!777437 () Bool)

(assert (=> b!1171205 (=> res!777437 e!665691)))

(assert (=> b!1171205 (= res!777437 (not (= (select (arr!36472 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1171206 () Bool)

(assert (=> b!1171206 (= e!665686 e!665690)))

(declare-fun res!777441 () Bool)

(assert (=> b!1171206 (=> res!777441 e!665690)))

(assert (=> b!1171206 (= res!777441 (or (bvsge (size!37010 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37010 _keys!1208)) (bvsge from!1455 (size!37010 _keys!1208))))))

(assert (=> b!1171206 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25680)))

(declare-fun lt!527438 () Unit!38451)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75644 (_ BitVec 32) (_ BitVec 32)) Unit!38451)

(assert (=> b!1171206 (= lt!527438 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1171206 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!527446 () Unit!38451)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75644 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38451)

(assert (=> b!1171206 (= lt!527446 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1171207 () Bool)

(declare-fun e!665689 () Bool)

(assert (=> b!1171207 (= e!665689 (and e!665692 mapRes!46001))))

(declare-fun condMapEmpty!46001 () Bool)

(declare-fun mapDefault!46001 () ValueCell!14015)

(assert (=> b!1171207 (= condMapEmpty!46001 (= (arr!36471 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14015)) mapDefault!46001)))))

(declare-fun b!1171208 () Bool)

(assert (=> b!1171208 (= e!665680 tp_is_empty!29449)))

(declare-fun res!777444 () Bool)

(assert (=> start!99334 (=> (not res!777444) (not e!665681))))

(assert (=> start!99334 (= res!777444 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37010 _keys!1208))))))

(assert (=> start!99334 e!665681))

(assert (=> start!99334 tp_is_empty!29449))

(declare-fun array_inv!27974 (array!75644) Bool)

(assert (=> start!99334 (array_inv!27974 _keys!1208)))

(assert (=> start!99334 true))

(assert (=> start!99334 tp!87470))

(declare-fun array_inv!27975 (array!75642) Bool)

(assert (=> start!99334 (and (array_inv!27975 _values!996) e!665689)))

(declare-fun b!1171198 () Bool)

(declare-fun res!777430 () Bool)

(assert (=> b!1171198 (=> (not res!777430) (not e!665683))))

(assert (=> b!1171198 (= res!777430 (arrayNoDuplicates!0 lt!527442 #b00000000000000000000000000000000 Nil!25680))))

(assert (= (and start!99334 res!777444) b!1171190))

(assert (= (and b!1171190 res!777436) b!1171201))

(assert (= (and b!1171201 res!777440) b!1171193))

(assert (= (and b!1171193 res!777445) b!1171192))

(assert (= (and b!1171192 res!777431) b!1171196))

(assert (= (and b!1171196 res!777439) b!1171191))

(assert (= (and b!1171191 res!777432) b!1171203))

(assert (= (and b!1171203 res!777435) b!1171189))

(assert (= (and b!1171189 res!777434) b!1171198))

(assert (= (and b!1171198 res!777430) b!1171194))

(assert (= (and b!1171194 (not res!777429)) b!1171199))

(assert (= (and b!1171199 (not res!777427)) b!1171202))

(assert (= (and b!1171202 (not res!777442)) b!1171195))

(assert (= (and b!1171195 res!777433) b!1171205))

(assert (= (and b!1171205 (not res!777437)) b!1171200))

(assert (= (and b!1171195 (not res!777438)) b!1171206))

(assert (= (and b!1171206 (not res!777441)) b!1171188))

(assert (= (and b!1171188 (not res!777428)) b!1171204))

(assert (= (and b!1171204 (not res!777443)) b!1171197))

(assert (= (and b!1171207 condMapEmpty!46001) mapIsEmpty!46001))

(assert (= (and b!1171207 (not condMapEmpty!46001)) mapNonEmpty!46001))

(get-info :version)

(assert (= (and mapNonEmpty!46001 ((_ is ValueCellFull!14015) mapValue!46001)) b!1171208))

(assert (= (and b!1171207 ((_ is ValueCellFull!14015) mapDefault!46001)) b!1171187))

(assert (= start!99334 b!1171207))

(declare-fun b_lambda!20045 () Bool)

(assert (=> (not b_lambda!20045) (not b!1171199)))

(declare-fun t!37584 () Bool)

(declare-fun tb!9723 () Bool)

(assert (=> (and start!99334 (= defaultEntry!1004 defaultEntry!1004) t!37584) tb!9723))

(declare-fun result!20021 () Bool)

(assert (=> tb!9723 (= result!20021 tp_is_empty!29449)))

(assert (=> b!1171199 t!37584))

(declare-fun b_and!40685 () Bool)

(assert (= b_and!40683 (and (=> t!37584 result!20021) b_and!40685)))

(declare-fun m!1078517 () Bool)

(assert (=> b!1171192 m!1078517))

(declare-fun m!1078519 () Bool)

(assert (=> mapNonEmpty!46001 m!1078519))

(declare-fun m!1078521 () Bool)

(assert (=> b!1171193 m!1078521))

(declare-fun m!1078523 () Bool)

(assert (=> start!99334 m!1078523))

(declare-fun m!1078525 () Bool)

(assert (=> start!99334 m!1078525))

(declare-fun m!1078527 () Bool)

(assert (=> b!1171199 m!1078527))

(declare-fun m!1078529 () Bool)

(assert (=> b!1171199 m!1078529))

(declare-fun m!1078531 () Bool)

(assert (=> b!1171199 m!1078531))

(declare-fun m!1078533 () Bool)

(assert (=> b!1171199 m!1078533))

(declare-fun m!1078535 () Bool)

(assert (=> b!1171198 m!1078535))

(declare-fun m!1078537 () Bool)

(assert (=> b!1171206 m!1078537))

(declare-fun m!1078539 () Bool)

(assert (=> b!1171206 m!1078539))

(declare-fun m!1078541 () Bool)

(assert (=> b!1171206 m!1078541))

(declare-fun m!1078543 () Bool)

(assert (=> b!1171206 m!1078543))

(declare-fun m!1078545 () Bool)

(assert (=> b!1171197 m!1078545))

(declare-fun m!1078547 () Bool)

(assert (=> b!1171189 m!1078547))

(declare-fun m!1078549 () Bool)

(assert (=> b!1171189 m!1078549))

(declare-fun m!1078551 () Bool)

(assert (=> b!1171191 m!1078551))

(declare-fun m!1078553 () Bool)

(assert (=> b!1171200 m!1078553))

(declare-fun m!1078555 () Bool)

(assert (=> b!1171194 m!1078555))

(declare-fun m!1078557 () Bool)

(assert (=> b!1171194 m!1078557))

(declare-fun m!1078559 () Bool)

(assert (=> b!1171188 m!1078559))

(declare-fun m!1078561 () Bool)

(assert (=> b!1171195 m!1078561))

(declare-fun m!1078563 () Bool)

(assert (=> b!1171195 m!1078563))

(assert (=> b!1171195 m!1078563))

(declare-fun m!1078565 () Bool)

(assert (=> b!1171195 m!1078565))

(declare-fun m!1078567 () Bool)

(assert (=> b!1171195 m!1078567))

(assert (=> b!1171205 m!1078561))

(declare-fun m!1078569 () Bool)

(assert (=> b!1171190 m!1078569))

(declare-fun m!1078571 () Bool)

(assert (=> b!1171204 m!1078571))

(declare-fun m!1078573 () Bool)

(assert (=> b!1171203 m!1078573))

(declare-fun m!1078575 () Bool)

(assert (=> b!1171202 m!1078575))

(declare-fun m!1078577 () Bool)

(assert (=> b!1171202 m!1078577))

(declare-fun m!1078579 () Bool)

(assert (=> b!1171202 m!1078579))

(declare-fun m!1078581 () Bool)

(assert (=> b!1171202 m!1078581))

(assert (=> b!1171202 m!1078561))

(declare-fun m!1078583 () Bool)

(assert (=> b!1171202 m!1078583))

(assert (=> b!1171202 m!1078561))

(check-sat (not b!1171195) tp_is_empty!29449 (not b!1171188) (not b!1171197) (not b!1171193) (not start!99334) (not b_lambda!20045) (not b!1171192) (not b!1171202) (not b!1171189) (not mapNonEmpty!46001) (not b!1171206) (not b_next!24919) (not b!1171200) (not b!1171198) (not b!1171194) (not b!1171190) (not b!1171199) b_and!40685 (not b!1171204) (not b!1171191))
(check-sat b_and!40685 (not b_next!24919))
