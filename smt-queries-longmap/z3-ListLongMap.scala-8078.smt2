; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99570 () Bool)

(assert start!99570)

(declare-fun b_free!24913 () Bool)

(declare-fun b_next!24913 () Bool)

(assert (=> start!99570 (= b_free!24913 (not b_next!24913))))

(declare-fun tp!87452 () Bool)

(declare-fun b_and!40695 () Bool)

(assert (=> start!99570 (= tp!87452 b_and!40695)))

(declare-fun b!1172396 () Bool)

(declare-fun res!777842 () Bool)

(declare-fun e!666473 () Bool)

(assert (=> b!1172396 (=> (not res!777842) (not e!666473))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1172396 (= res!777842 (validKeyInArray!0 k0!934))))

(declare-fun b!1172397 () Bool)

(declare-fun e!666481 () Bool)

(assert (=> b!1172397 (= e!666481 true)))

(declare-fun lt!527996 () Bool)

(declare-datatypes ((List!25641 0))(
  ( (Nil!25638) (Cons!25637 (h!26855 (_ BitVec 64)) (t!37538 List!25641)) )
))
(declare-fun contains!6873 (List!25641 (_ BitVec 64)) Bool)

(assert (=> b!1172397 (= lt!527996 (contains!6873 Nil!25638 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172398 () Bool)

(declare-fun res!777847 () Bool)

(assert (=> b!1172398 (=> res!777847 e!666481)))

(declare-fun noDuplicate!1622 (List!25641) Bool)

(assert (=> b!1172398 (= res!777847 (not (noDuplicate!1622 Nil!25638)))))

(declare-fun b!1172399 () Bool)

(declare-fun res!777831 () Bool)

(assert (=> b!1172399 (=> res!777831 e!666481)))

(assert (=> b!1172399 (= res!777831 (contains!6873 Nil!25638 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun b!1172400 () Bool)

(declare-fun e!666485 () Bool)

(declare-fun tp_is_empty!29443 () Bool)

(assert (=> b!1172400 (= e!666485 tp_is_empty!29443)))

(declare-fun mapIsEmpty!45992 () Bool)

(declare-fun mapRes!45992 () Bool)

(assert (=> mapIsEmpty!45992 mapRes!45992))

(declare-fun b!1172401 () Bool)

(declare-fun res!777843 () Bool)

(assert (=> b!1172401 (=> (not res!777843) (not e!666473))))

(declare-datatypes ((array!75755 0))(
  ( (array!75756 (arr!36521 (Array (_ BitVec 32) (_ BitVec 64))) (size!37058 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75755)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44385 0))(
  ( (V!44386 (val!14778 Int)) )
))
(declare-datatypes ((ValueCell!14012 0))(
  ( (ValueCellFull!14012 (v!17412 V!44385)) (EmptyCell!14012) )
))
(declare-datatypes ((array!75757 0))(
  ( (array!75758 (arr!36522 (Array (_ BitVec 32) ValueCell!14012)) (size!37059 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75757)

(assert (=> b!1172401 (= res!777843 (and (= (size!37059 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37058 _keys!1208) (size!37059 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1172402 () Bool)

(declare-fun e!666477 () Bool)

(declare-fun e!666476 () Bool)

(assert (=> b!1172402 (= e!666477 (not e!666476))))

(declare-fun res!777833 () Bool)

(assert (=> b!1172402 (=> res!777833 e!666476)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1172402 (= res!777833 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!75755 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1172402 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38603 0))(
  ( (Unit!38604) )
))
(declare-fun lt!527997 () Unit!38603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75755 (_ BitVec 64) (_ BitVec 32)) Unit!38603)

(assert (=> b!1172402 (= lt!527997 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun e!666482 () Bool)

(declare-fun b!1172403 () Bool)

(assert (=> b!1172403 (= e!666482 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!45992 () Bool)

(declare-fun tp!87453 () Bool)

(declare-fun e!666475 () Bool)

(assert (=> mapNonEmpty!45992 (= mapRes!45992 (and tp!87453 e!666475))))

(declare-fun mapRest!45992 () (Array (_ BitVec 32) ValueCell!14012))

(declare-fun mapKey!45992 () (_ BitVec 32))

(declare-fun mapValue!45992 () ValueCell!14012)

(assert (=> mapNonEmpty!45992 (= (arr!36522 _values!996) (store mapRest!45992 mapKey!45992 mapValue!45992))))

(declare-fun b!1172404 () Bool)

(declare-fun res!777846 () Bool)

(assert (=> b!1172404 (=> (not res!777846) (not e!666473))))

(assert (=> b!1172404 (= res!777846 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37058 _keys!1208))))))

(declare-fun res!777839 () Bool)

(assert (=> start!99570 (=> (not res!777839) (not e!666473))))

(assert (=> start!99570 (= res!777839 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37058 _keys!1208))))))

(assert (=> start!99570 e!666473))

(assert (=> start!99570 tp_is_empty!29443))

(declare-fun array_inv!27982 (array!75755) Bool)

(assert (=> start!99570 (array_inv!27982 _keys!1208)))

(assert (=> start!99570 true))

(assert (=> start!99570 tp!87452))

(declare-fun e!666479 () Bool)

(declare-fun array_inv!27983 (array!75757) Bool)

(assert (=> start!99570 (and (array_inv!27983 _values!996) e!666479)))

(declare-fun b!1172405 () Bool)

(declare-fun res!777834 () Bool)

(assert (=> b!1172405 (=> (not res!777834) (not e!666473))))

(declare-fun arrayNoDuplicates!0 (array!75755 (_ BitVec 32) List!25641) Bool)

(assert (=> b!1172405 (= res!777834 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25638))))

(declare-fun b!1172406 () Bool)

(assert (=> b!1172406 (= e!666479 (and e!666485 mapRes!45992))))

(declare-fun condMapEmpty!45992 () Bool)

(declare-fun mapDefault!45992 () ValueCell!14012)

(assert (=> b!1172406 (= condMapEmpty!45992 (= (arr!36522 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14012)) mapDefault!45992)))))

(declare-fun b!1172407 () Bool)

(declare-fun res!777837 () Bool)

(assert (=> b!1172407 (=> (not res!777837) (not e!666473))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1172407 (= res!777837 (validMask!0 mask!1564))))

(declare-fun b!1172408 () Bool)

(assert (=> b!1172408 (= e!666473 e!666477)))

(declare-fun res!777830 () Bool)

(assert (=> b!1172408 (=> (not res!777830) (not e!666477))))

(declare-fun lt!528004 () array!75755)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75755 (_ BitVec 32)) Bool)

(assert (=> b!1172408 (= res!777830 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!528004 mask!1564))))

(assert (=> b!1172408 (= lt!528004 (array!75756 (store (arr!36521 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37058 _keys!1208)))))

(declare-fun b!1172409 () Bool)

(declare-fun e!666483 () Bool)

(assert (=> b!1172409 (= e!666476 e!666483)))

(declare-fun res!777835 () Bool)

(assert (=> b!1172409 (=> res!777835 e!666483)))

(assert (=> b!1172409 (= res!777835 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44385)

(declare-fun lt!527995 () array!75757)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44385)

(declare-datatypes ((tuple2!18906 0))(
  ( (tuple2!18907 (_1!9464 (_ BitVec 64)) (_2!9464 V!44385)) )
))
(declare-datatypes ((List!25642 0))(
  ( (Nil!25639) (Cons!25638 (h!26856 tuple2!18906) (t!37539 List!25642)) )
))
(declare-datatypes ((ListLongMap!16883 0))(
  ( (ListLongMap!16884 (toList!8457 List!25642)) )
))
(declare-fun lt!528005 () ListLongMap!16883)

(declare-fun getCurrentListMapNoExtraKeys!4944 (array!75755 array!75757 (_ BitVec 32) (_ BitVec 32) V!44385 V!44385 (_ BitVec 32) Int) ListLongMap!16883)

(assert (=> b!1172409 (= lt!528005 (getCurrentListMapNoExtraKeys!4944 lt!528004 lt!527995 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!527999 () V!44385)

(assert (=> b!1172409 (= lt!527995 (array!75758 (store (arr!36522 _values!996) i!673 (ValueCellFull!14012 lt!527999)) (size!37059 _values!996)))))

(declare-fun dynLambda!2925 (Int (_ BitVec 64)) V!44385)

(assert (=> b!1172409 (= lt!527999 (dynLambda!2925 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!528007 () ListLongMap!16883)

(assert (=> b!1172409 (= lt!528007 (getCurrentListMapNoExtraKeys!4944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1172410 () Bool)

(declare-fun res!777840 () Bool)

(assert (=> b!1172410 (=> (not res!777840) (not e!666477))))

(assert (=> b!1172410 (= res!777840 (arrayNoDuplicates!0 lt!528004 #b00000000000000000000000000000000 Nil!25638))))

(declare-fun b!1172411 () Bool)

(declare-fun e!666484 () Bool)

(assert (=> b!1172411 (= e!666483 e!666484)))

(declare-fun res!777844 () Bool)

(assert (=> b!1172411 (=> res!777844 e!666484)))

(assert (=> b!1172411 (= res!777844 (not (validKeyInArray!0 (select (arr!36521 _keys!1208) from!1455))))))

(declare-fun lt!528003 () ListLongMap!16883)

(declare-fun lt!528006 () ListLongMap!16883)

(assert (=> b!1172411 (= lt!528003 lt!528006)))

(declare-fun lt!527998 () ListLongMap!16883)

(declare-fun -!1512 (ListLongMap!16883 (_ BitVec 64)) ListLongMap!16883)

(assert (=> b!1172411 (= lt!528006 (-!1512 lt!527998 k0!934))))

(assert (=> b!1172411 (= lt!528003 (getCurrentListMapNoExtraKeys!4944 lt!528004 lt!527995 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1172411 (= lt!527998 (getCurrentListMapNoExtraKeys!4944 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!528002 () Unit!38603)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!737 (array!75755 array!75757 (_ BitVec 32) (_ BitVec 32) V!44385 V!44385 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38603)

(assert (=> b!1172411 (= lt!528002 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!737 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1172412 () Bool)

(declare-fun res!777841 () Bool)

(assert (=> b!1172412 (=> (not res!777841) (not e!666473))))

(assert (=> b!1172412 (= res!777841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1172413 () Bool)

(declare-fun e!666474 () Bool)

(assert (=> b!1172413 (= e!666484 e!666474)))

(declare-fun res!777832 () Bool)

(assert (=> b!1172413 (=> res!777832 e!666474)))

(assert (=> b!1172413 (= res!777832 (not (= (select (arr!36521 _keys!1208) from!1455) k0!934)))))

(declare-fun e!666480 () Bool)

(assert (=> b!1172413 e!666480))

(declare-fun res!777838 () Bool)

(assert (=> b!1172413 (=> (not res!777838) (not e!666480))))

(declare-fun +!3796 (ListLongMap!16883 tuple2!18906) ListLongMap!16883)

(declare-fun get!18652 (ValueCell!14012 V!44385) V!44385)

(assert (=> b!1172413 (= res!777838 (= lt!528005 (+!3796 lt!528006 (tuple2!18907 (select (arr!36521 _keys!1208) from!1455) (get!18652 (select (arr!36522 _values!996) from!1455) lt!527999)))))))

(declare-fun b!1172414 () Bool)

(assert (=> b!1172414 (= e!666474 e!666481)))

(declare-fun res!777836 () Bool)

(assert (=> b!1172414 (=> res!777836 e!666481)))

(assert (=> b!1172414 (= res!777836 (or (bvsge (size!37058 _keys!1208) #b01111111111111111111111111111111) (bvsge (bvadd #b00000000000000000000000000000001 from!1455) (size!37058 _keys!1208)) (bvsge from!1455 (size!37058 _keys!1208))))))

(assert (=> b!1172414 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25638)))

(declare-fun lt!528000 () Unit!38603)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75755 (_ BitVec 32) (_ BitVec 32)) Unit!38603)

(assert (=> b!1172414 (= lt!528000 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1172414 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!528001 () Unit!38603)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75755 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38603)

(assert (=> b!1172414 (= lt!528001 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun b!1172415 () Bool)

(assert (=> b!1172415 (= e!666475 tp_is_empty!29443)))

(declare-fun b!1172416 () Bool)

(declare-fun res!777848 () Bool)

(assert (=> b!1172416 (=> (not res!777848) (not e!666473))))

(assert (=> b!1172416 (= res!777848 (= (select (arr!36521 _keys!1208) i!673) k0!934))))

(declare-fun b!1172417 () Bool)

(assert (=> b!1172417 (= e!666480 e!666482)))

(declare-fun res!777845 () Bool)

(assert (=> b!1172417 (=> res!777845 e!666482)))

(assert (=> b!1172417 (= res!777845 (not (= (select (arr!36521 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99570 res!777839) b!1172407))

(assert (= (and b!1172407 res!777837) b!1172401))

(assert (= (and b!1172401 res!777843) b!1172412))

(assert (= (and b!1172412 res!777841) b!1172405))

(assert (= (and b!1172405 res!777834) b!1172404))

(assert (= (and b!1172404 res!777846) b!1172396))

(assert (= (and b!1172396 res!777842) b!1172416))

(assert (= (and b!1172416 res!777848) b!1172408))

(assert (= (and b!1172408 res!777830) b!1172410))

(assert (= (and b!1172410 res!777840) b!1172402))

(assert (= (and b!1172402 (not res!777833)) b!1172409))

(assert (= (and b!1172409 (not res!777835)) b!1172411))

(assert (= (and b!1172411 (not res!777844)) b!1172413))

(assert (= (and b!1172413 res!777838) b!1172417))

(assert (= (and b!1172417 (not res!777845)) b!1172403))

(assert (= (and b!1172413 (not res!777832)) b!1172414))

(assert (= (and b!1172414 (not res!777836)) b!1172398))

(assert (= (and b!1172398 (not res!777847)) b!1172399))

(assert (= (and b!1172399 (not res!777831)) b!1172397))

(assert (= (and b!1172406 condMapEmpty!45992) mapIsEmpty!45992))

(assert (= (and b!1172406 (not condMapEmpty!45992)) mapNonEmpty!45992))

(get-info :version)

(assert (= (and mapNonEmpty!45992 ((_ is ValueCellFull!14012) mapValue!45992)) b!1172415))

(assert (= (and b!1172406 ((_ is ValueCellFull!14012) mapDefault!45992)) b!1172400))

(assert (= start!99570 b!1172406))

(declare-fun b_lambda!20051 () Bool)

(assert (=> (not b_lambda!20051) (not b!1172409)))

(declare-fun t!37537 () Bool)

(declare-fun tb!9717 () Bool)

(assert (=> (and start!99570 (= defaultEntry!1004 defaultEntry!1004) t!37537) tb!9717))

(declare-fun result!20009 () Bool)

(assert (=> tb!9717 (= result!20009 tp_is_empty!29443)))

(assert (=> b!1172409 t!37537))

(declare-fun b_and!40697 () Bool)

(assert (= b_and!40695 (and (=> t!37537 result!20009) b_and!40697)))

(declare-fun m!1080495 () Bool)

(assert (=> b!1172410 m!1080495))

(declare-fun m!1080497 () Bool)

(assert (=> b!1172397 m!1080497))

(declare-fun m!1080499 () Bool)

(assert (=> b!1172396 m!1080499))

(declare-fun m!1080501 () Bool)

(assert (=> b!1172398 m!1080501))

(declare-fun m!1080503 () Bool)

(assert (=> b!1172409 m!1080503))

(declare-fun m!1080505 () Bool)

(assert (=> b!1172409 m!1080505))

(declare-fun m!1080507 () Bool)

(assert (=> b!1172409 m!1080507))

(declare-fun m!1080509 () Bool)

(assert (=> b!1172409 m!1080509))

(declare-fun m!1080511 () Bool)

(assert (=> b!1172416 m!1080511))

(declare-fun m!1080513 () Bool)

(assert (=> mapNonEmpty!45992 m!1080513))

(declare-fun m!1080515 () Bool)

(assert (=> b!1172402 m!1080515))

(declare-fun m!1080517 () Bool)

(assert (=> b!1172402 m!1080517))

(declare-fun m!1080519 () Bool)

(assert (=> b!1172412 m!1080519))

(declare-fun m!1080521 () Bool)

(assert (=> b!1172407 m!1080521))

(declare-fun m!1080523 () Bool)

(assert (=> b!1172413 m!1080523))

(declare-fun m!1080525 () Bool)

(assert (=> b!1172413 m!1080525))

(assert (=> b!1172413 m!1080525))

(declare-fun m!1080527 () Bool)

(assert (=> b!1172413 m!1080527))

(declare-fun m!1080529 () Bool)

(assert (=> b!1172413 m!1080529))

(declare-fun m!1080531 () Bool)

(assert (=> b!1172399 m!1080531))

(declare-fun m!1080533 () Bool)

(assert (=> b!1172405 m!1080533))

(declare-fun m!1080535 () Bool)

(assert (=> start!99570 m!1080535))

(declare-fun m!1080537 () Bool)

(assert (=> start!99570 m!1080537))

(declare-fun m!1080539 () Bool)

(assert (=> b!1172414 m!1080539))

(declare-fun m!1080541 () Bool)

(assert (=> b!1172414 m!1080541))

(declare-fun m!1080543 () Bool)

(assert (=> b!1172414 m!1080543))

(declare-fun m!1080545 () Bool)

(assert (=> b!1172414 m!1080545))

(assert (=> b!1172417 m!1080523))

(declare-fun m!1080547 () Bool)

(assert (=> b!1172411 m!1080547))

(declare-fun m!1080549 () Bool)

(assert (=> b!1172411 m!1080549))

(declare-fun m!1080551 () Bool)

(assert (=> b!1172411 m!1080551))

(declare-fun m!1080553 () Bool)

(assert (=> b!1172411 m!1080553))

(assert (=> b!1172411 m!1080523))

(declare-fun m!1080555 () Bool)

(assert (=> b!1172411 m!1080555))

(assert (=> b!1172411 m!1080523))

(declare-fun m!1080557 () Bool)

(assert (=> b!1172408 m!1080557))

(declare-fun m!1080559 () Bool)

(assert (=> b!1172408 m!1080559))

(declare-fun m!1080561 () Bool)

(assert (=> b!1172403 m!1080561))

(check-sat (not b!1172403) (not b!1172398) (not start!99570) (not b!1172411) (not b!1172413) (not b!1172399) (not b!1172397) (not b!1172407) (not b!1172410) (not b_next!24913) (not b!1172396) (not b!1172402) b_and!40697 tp_is_empty!29443 (not b_lambda!20051) (not mapNonEmpty!45992) (not b!1172414) (not b!1172409) (not b!1172408) (not b!1172412) (not b!1172405))
(check-sat b_and!40697 (not b_next!24913))
