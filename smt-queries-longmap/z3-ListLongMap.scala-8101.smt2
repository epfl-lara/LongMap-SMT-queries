; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99474 () Bool)

(assert start!99474)

(declare-fun b_free!25053 () Bool)

(declare-fun b_next!25053 () Bool)

(assert (=> start!99474 (= b_free!25053 (not b_next!25053))))

(declare-fun tp!87873 () Bool)

(declare-fun b_and!40973 () Bool)

(assert (=> start!99474 (= tp!87873 b_and!40973)))

(declare-fun b!1175587 () Bool)

(declare-fun e!668231 () Bool)

(declare-fun tp_is_empty!29583 () Bool)

(assert (=> b!1175587 (= e!668231 tp_is_empty!29583)))

(declare-fun b!1175588 () Bool)

(declare-fun e!668241 () Bool)

(declare-fun e!668236 () Bool)

(assert (=> b!1175588 (= e!668241 e!668236)))

(declare-fun res!780761 () Bool)

(assert (=> b!1175588 (=> res!780761 e!668236)))

(declare-datatypes ((array!75973 0))(
  ( (array!75974 (arr!36636 (Array (_ BitVec 32) (_ BitVec 64))) (size!37172 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75973)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1175588 (= res!780761 (not (= (select (arr!36636 _keys!1208) from!1455) k0!934)))))

(declare-fun mapNonEmpty!46202 () Bool)

(declare-fun mapRes!46202 () Bool)

(declare-fun tp!87872 () Bool)

(assert (=> mapNonEmpty!46202 (= mapRes!46202 (and tp!87872 e!668231))))

(declare-datatypes ((V!44571 0))(
  ( (V!44572 (val!14848 Int)) )
))
(declare-datatypes ((ValueCell!14082 0))(
  ( (ValueCellFull!14082 (v!17486 V!44571)) (EmptyCell!14082) )
))
(declare-fun mapRest!46202 () (Array (_ BitVec 32) ValueCell!14082))

(declare-fun mapKey!46202 () (_ BitVec 32))

(declare-fun mapValue!46202 () ValueCell!14082)

(declare-datatypes ((array!75975 0))(
  ( (array!75976 (arr!36637 (Array (_ BitVec 32) ValueCell!14082)) (size!37173 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75975)

(assert (=> mapNonEmpty!46202 (= (arr!36637 _values!996) (store mapRest!46202 mapKey!46202 mapValue!46202))))

(declare-fun b!1175589 () Bool)

(declare-fun res!780765 () Bool)

(declare-fun e!668240 () Bool)

(assert (=> b!1175589 (=> (not res!780765) (not e!668240))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1175589 (= res!780765 (validMask!0 mask!1564))))

(declare-fun b!1175590 () Bool)

(declare-datatypes ((Unit!38793 0))(
  ( (Unit!38794) )
))
(declare-fun e!668242 () Unit!38793)

(declare-fun Unit!38795 () Unit!38793)

(assert (=> b!1175590 (= e!668242 Unit!38795)))

(declare-fun res!780763 () Bool)

(assert (=> start!99474 (=> (not res!780763) (not e!668240))))

(assert (=> start!99474 (= res!780763 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37172 _keys!1208))))))

(assert (=> start!99474 e!668240))

(assert (=> start!99474 tp_is_empty!29583))

(declare-fun array_inv!27982 (array!75973) Bool)

(assert (=> start!99474 (array_inv!27982 _keys!1208)))

(assert (=> start!99474 true))

(assert (=> start!99474 tp!87873))

(declare-fun e!668232 () Bool)

(declare-fun array_inv!27983 (array!75975) Bool)

(assert (=> start!99474 (and (array_inv!27983 _values!996) e!668232)))

(declare-fun b!1175591 () Bool)

(declare-fun res!780759 () Bool)

(assert (=> b!1175591 (=> (not res!780759) (not e!668240))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1175591 (= res!780759 (= (select (arr!36636 _keys!1208) i!673) k0!934))))

(declare-fun b!1175592 () Bool)

(declare-fun e!668237 () Bool)

(assert (=> b!1175592 (= e!668240 e!668237)))

(declare-fun res!780760 () Bool)

(assert (=> b!1175592 (=> (not res!780760) (not e!668237))))

(declare-fun lt!530384 () array!75973)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75973 (_ BitVec 32)) Bool)

(assert (=> b!1175592 (= res!780760 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!530384 mask!1564))))

(assert (=> b!1175592 (= lt!530384 (array!75974 (store (arr!36636 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37172 _keys!1208)))))

(declare-fun mapIsEmpty!46202 () Bool)

(assert (=> mapIsEmpty!46202 mapRes!46202))

(declare-fun b!1175593 () Bool)

(declare-fun arrayContainsKey!0 (array!75973 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1175593 (= e!668236 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175594 () Bool)

(declare-fun res!780758 () Bool)

(assert (=> b!1175594 (=> (not res!780758) (not e!668240))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1175594 (= res!780758 (validKeyInArray!0 k0!934))))

(declare-fun b!1175595 () Bool)

(declare-fun e!668238 () Bool)

(assert (=> b!1175595 (= e!668238 tp_is_empty!29583)))

(declare-fun b!1175596 () Bool)

(declare-fun res!780756 () Bool)

(assert (=> b!1175596 (=> (not res!780756) (not e!668240))))

(assert (=> b!1175596 (= res!780756 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37172 _keys!1208))))))

(declare-fun b!1175597 () Bool)

(declare-fun e!668239 () Bool)

(declare-fun e!668233 () Bool)

(assert (=> b!1175597 (= e!668239 e!668233)))

(declare-fun res!780762 () Bool)

(assert (=> b!1175597 (=> res!780762 e!668233)))

(assert (=> b!1175597 (= res!780762 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44571)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!530382 () array!75975)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!18984 0))(
  ( (tuple2!18985 (_1!9503 (_ BitVec 64)) (_2!9503 V!44571)) )
))
(declare-datatypes ((List!25723 0))(
  ( (Nil!25720) (Cons!25719 (h!26928 tuple2!18984) (t!37768 List!25723)) )
))
(declare-datatypes ((ListLongMap!16953 0))(
  ( (ListLongMap!16954 (toList!8492 List!25723)) )
))
(declare-fun lt!530385 () ListLongMap!16953)

(declare-fun minValue!944 () V!44571)

(declare-fun getCurrentListMapNoExtraKeys!4952 (array!75973 array!75975 (_ BitVec 32) (_ BitVec 32) V!44571 V!44571 (_ BitVec 32) Int) ListLongMap!16953)

(assert (=> b!1175597 (= lt!530385 (getCurrentListMapNoExtraKeys!4952 lt!530384 lt!530382 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!530394 () V!44571)

(assert (=> b!1175597 (= lt!530382 (array!75976 (store (arr!36637 _values!996) i!673 (ValueCellFull!14082 lt!530394)) (size!37173 _values!996)))))

(declare-fun dynLambda!2918 (Int (_ BitVec 64)) V!44571)

(assert (=> b!1175597 (= lt!530394 (dynLambda!2918 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!530386 () ListLongMap!16953)

(assert (=> b!1175597 (= lt!530386 (getCurrentListMapNoExtraKeys!4952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1175598 () Bool)

(declare-fun res!780753 () Bool)

(assert (=> b!1175598 (=> (not res!780753) (not e!668240))))

(assert (=> b!1175598 (= res!780753 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1175599 () Bool)

(assert (=> b!1175599 (= e!668237 (not e!668239))))

(declare-fun res!780766 () Bool)

(assert (=> b!1175599 (=> res!780766 e!668239)))

(assert (=> b!1175599 (= res!780766 (bvsgt from!1455 i!673))))

(assert (=> b!1175599 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!530388 () Unit!38793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75973 (_ BitVec 64) (_ BitVec 32)) Unit!38793)

(assert (=> b!1175599 (= lt!530388 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1175600 () Bool)

(declare-fun res!780757 () Bool)

(assert (=> b!1175600 (=> (not res!780757) (not e!668237))))

(declare-datatypes ((List!25724 0))(
  ( (Nil!25721) (Cons!25720 (h!26929 (_ BitVec 64)) (t!37769 List!25724)) )
))
(declare-fun arrayNoDuplicates!0 (array!75973 (_ BitVec 32) List!25724) Bool)

(assert (=> b!1175600 (= res!780757 (arrayNoDuplicates!0 lt!530384 #b00000000000000000000000000000000 Nil!25721))))

(declare-fun b!1175601 () Bool)

(declare-fun Unit!38796 () Unit!38793)

(assert (=> b!1175601 (= e!668242 Unit!38796)))

(declare-fun lt!530383 () Unit!38793)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75973 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38793)

(assert (=> b!1175601 (= lt!530383 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1175601 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!530392 () Unit!38793)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75973 (_ BitVec 32) (_ BitVec 32)) Unit!38793)

(assert (=> b!1175601 (= lt!530392 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1175601 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25721)))

(declare-fun lt!530387 () Unit!38793)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75973 (_ BitVec 64) (_ BitVec 32) List!25724) Unit!38793)

(assert (=> b!1175601 (= lt!530387 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25721))))

(assert (=> b!1175601 false))

(declare-fun b!1175602 () Bool)

(declare-fun e!668234 () Bool)

(assert (=> b!1175602 (= e!668233 e!668234)))

(declare-fun res!780754 () Bool)

(assert (=> b!1175602 (=> res!780754 e!668234)))

(assert (=> b!1175602 (= res!780754 (not (validKeyInArray!0 (select (arr!36636 _keys!1208) from!1455))))))

(declare-fun lt!530393 () ListLongMap!16953)

(declare-fun lt!530389 () ListLongMap!16953)

(assert (=> b!1175602 (= lt!530393 lt!530389)))

(declare-fun lt!530390 () ListLongMap!16953)

(declare-fun -!1548 (ListLongMap!16953 (_ BitVec 64)) ListLongMap!16953)

(assert (=> b!1175602 (= lt!530389 (-!1548 lt!530390 k0!934))))

(assert (=> b!1175602 (= lt!530393 (getCurrentListMapNoExtraKeys!4952 lt!530384 lt!530382 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1175602 (= lt!530390 (getCurrentListMapNoExtraKeys!4952 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!530381 () Unit!38793)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!775 (array!75973 array!75975 (_ BitVec 32) (_ BitVec 32) V!44571 V!44571 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38793)

(assert (=> b!1175602 (= lt!530381 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!775 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1175603 () Bool)

(declare-fun res!780764 () Bool)

(assert (=> b!1175603 (=> (not res!780764) (not e!668240))))

(assert (=> b!1175603 (= res!780764 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25721))))

(declare-fun b!1175604 () Bool)

(declare-fun res!780755 () Bool)

(assert (=> b!1175604 (=> (not res!780755) (not e!668240))))

(assert (=> b!1175604 (= res!780755 (and (= (size!37173 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37172 _keys!1208) (size!37173 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1175605 () Bool)

(assert (=> b!1175605 (= e!668232 (and e!668238 mapRes!46202))))

(declare-fun condMapEmpty!46202 () Bool)

(declare-fun mapDefault!46202 () ValueCell!14082)

(assert (=> b!1175605 (= condMapEmpty!46202 (= (arr!36637 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14082)) mapDefault!46202)))))

(declare-fun b!1175606 () Bool)

(assert (=> b!1175606 (= e!668234 true)))

(assert (=> b!1175606 (not (= (select (arr!36636 _keys!1208) from!1455) k0!934))))

(declare-fun lt!530391 () Unit!38793)

(assert (=> b!1175606 (= lt!530391 e!668242)))

(declare-fun c!116703 () Bool)

(assert (=> b!1175606 (= c!116703 (= (select (arr!36636 _keys!1208) from!1455) k0!934))))

(assert (=> b!1175606 e!668241))

(declare-fun res!780752 () Bool)

(assert (=> b!1175606 (=> (not res!780752) (not e!668241))))

(declare-fun +!3808 (ListLongMap!16953 tuple2!18984) ListLongMap!16953)

(declare-fun get!18706 (ValueCell!14082 V!44571) V!44571)

(assert (=> b!1175606 (= res!780752 (= lt!530385 (+!3808 lt!530389 (tuple2!18985 (select (arr!36636 _keys!1208) from!1455) (get!18706 (select (arr!36637 _values!996) from!1455) lt!530394)))))))

(assert (= (and start!99474 res!780763) b!1175589))

(assert (= (and b!1175589 res!780765) b!1175604))

(assert (= (and b!1175604 res!780755) b!1175598))

(assert (= (and b!1175598 res!780753) b!1175603))

(assert (= (and b!1175603 res!780764) b!1175596))

(assert (= (and b!1175596 res!780756) b!1175594))

(assert (= (and b!1175594 res!780758) b!1175591))

(assert (= (and b!1175591 res!780759) b!1175592))

(assert (= (and b!1175592 res!780760) b!1175600))

(assert (= (and b!1175600 res!780757) b!1175599))

(assert (= (and b!1175599 (not res!780766)) b!1175597))

(assert (= (and b!1175597 (not res!780762)) b!1175602))

(assert (= (and b!1175602 (not res!780754)) b!1175606))

(assert (= (and b!1175606 res!780752) b!1175588))

(assert (= (and b!1175588 (not res!780761)) b!1175593))

(assert (= (and b!1175606 c!116703) b!1175601))

(assert (= (and b!1175606 (not c!116703)) b!1175590))

(assert (= (and b!1175605 condMapEmpty!46202) mapIsEmpty!46202))

(assert (= (and b!1175605 (not condMapEmpty!46202)) mapNonEmpty!46202))

(get-info :version)

(assert (= (and mapNonEmpty!46202 ((_ is ValueCellFull!14082) mapValue!46202)) b!1175587))

(assert (= (and b!1175605 ((_ is ValueCellFull!14082) mapDefault!46202)) b!1175595))

(assert (= start!99474 b!1175605))

(declare-fun b_lambda!20197 () Bool)

(assert (=> (not b_lambda!20197) (not b!1175597)))

(declare-fun t!37767 () Bool)

(declare-fun tb!9865 () Bool)

(assert (=> (and start!99474 (= defaultEntry!1004 defaultEntry!1004) t!37767) tb!9865))

(declare-fun result!20297 () Bool)

(assert (=> tb!9865 (= result!20297 tp_is_empty!29583)))

(assert (=> b!1175597 t!37767))

(declare-fun b_and!40975 () Bool)

(assert (= b_and!40973 (and (=> t!37767 result!20297) b_and!40975)))

(declare-fun m!1083499 () Bool)

(assert (=> b!1175598 m!1083499))

(declare-fun m!1083501 () Bool)

(assert (=> b!1175599 m!1083501))

(declare-fun m!1083503 () Bool)

(assert (=> b!1175599 m!1083503))

(declare-fun m!1083505 () Bool)

(assert (=> b!1175603 m!1083505))

(declare-fun m!1083507 () Bool)

(assert (=> b!1175602 m!1083507))

(declare-fun m!1083509 () Bool)

(assert (=> b!1175602 m!1083509))

(declare-fun m!1083511 () Bool)

(assert (=> b!1175602 m!1083511))

(declare-fun m!1083513 () Bool)

(assert (=> b!1175602 m!1083513))

(declare-fun m!1083515 () Bool)

(assert (=> b!1175602 m!1083515))

(declare-fun m!1083517 () Bool)

(assert (=> b!1175602 m!1083517))

(assert (=> b!1175602 m!1083515))

(declare-fun m!1083519 () Bool)

(assert (=> b!1175600 m!1083519))

(declare-fun m!1083521 () Bool)

(assert (=> b!1175594 m!1083521))

(assert (=> b!1175606 m!1083515))

(declare-fun m!1083523 () Bool)

(assert (=> b!1175606 m!1083523))

(assert (=> b!1175606 m!1083523))

(declare-fun m!1083525 () Bool)

(assert (=> b!1175606 m!1083525))

(declare-fun m!1083527 () Bool)

(assert (=> b!1175606 m!1083527))

(declare-fun m!1083529 () Bool)

(assert (=> start!99474 m!1083529))

(declare-fun m!1083531 () Bool)

(assert (=> start!99474 m!1083531))

(declare-fun m!1083533 () Bool)

(assert (=> b!1175601 m!1083533))

(declare-fun m!1083535 () Bool)

(assert (=> b!1175601 m!1083535))

(declare-fun m!1083537 () Bool)

(assert (=> b!1175601 m!1083537))

(declare-fun m!1083539 () Bool)

(assert (=> b!1175601 m!1083539))

(declare-fun m!1083541 () Bool)

(assert (=> b!1175601 m!1083541))

(declare-fun m!1083543 () Bool)

(assert (=> b!1175597 m!1083543))

(declare-fun m!1083545 () Bool)

(assert (=> b!1175597 m!1083545))

(declare-fun m!1083547 () Bool)

(assert (=> b!1175597 m!1083547))

(declare-fun m!1083549 () Bool)

(assert (=> b!1175597 m!1083549))

(assert (=> b!1175588 m!1083515))

(declare-fun m!1083551 () Bool)

(assert (=> mapNonEmpty!46202 m!1083551))

(declare-fun m!1083553 () Bool)

(assert (=> b!1175591 m!1083553))

(declare-fun m!1083555 () Bool)

(assert (=> b!1175589 m!1083555))

(declare-fun m!1083557 () Bool)

(assert (=> b!1175592 m!1083557))

(declare-fun m!1083559 () Bool)

(assert (=> b!1175592 m!1083559))

(declare-fun m!1083561 () Bool)

(assert (=> b!1175593 m!1083561))

(check-sat (not b!1175598) (not b!1175594) (not b!1175600) (not b!1175601) (not b!1175606) (not b!1175593) (not b!1175597) tp_is_empty!29583 (not mapNonEmpty!46202) (not b!1175602) (not b!1175599) (not b_next!25053) (not b!1175592) (not b!1175589) (not b!1175603) (not b_lambda!20197) (not start!99474) b_and!40975)
(check-sat b_and!40975 (not b_next!25053))
