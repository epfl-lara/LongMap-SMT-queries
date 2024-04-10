; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99564 () Bool)

(assert start!99564)

(declare-fun b_free!25143 () Bool)

(declare-fun b_next!25143 () Bool)

(assert (=> start!99564 (= b_free!25143 (not b_next!25143))))

(declare-fun tp!88143 () Bool)

(declare-fun b_and!41153 () Bool)

(assert (=> start!99564 (= tp!88143 b_and!41153)))

(declare-fun b!1178490 () Bool)

(declare-fun e!669975 () Bool)

(declare-fun e!669966 () Bool)

(assert (=> b!1178490 (= e!669975 e!669966)))

(declare-fun res!782894 () Bool)

(assert (=> b!1178490 (=> (not res!782894) (not e!669966))))

(declare-datatypes ((array!76149 0))(
  ( (array!76150 (arr!36724 (Array (_ BitVec 32) (_ BitVec 64))) (size!37260 (_ BitVec 32))) )
))
(declare-fun lt!532395 () array!76149)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76149 (_ BitVec 32)) Bool)

(assert (=> b!1178490 (= res!782894 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532395 mask!1564))))

(declare-fun _keys!1208 () array!76149)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1178490 (= lt!532395 (array!76150 (store (arr!36724 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37260 _keys!1208)))))

(declare-fun b!1178491 () Bool)

(declare-fun res!782904 () Bool)

(assert (=> b!1178491 (=> (not res!782904) (not e!669975))))

(assert (=> b!1178491 (= res!782904 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1178492 () Bool)

(declare-fun e!669974 () Bool)

(declare-fun e!669969 () Bool)

(assert (=> b!1178492 (= e!669974 e!669969)))

(declare-fun res!782897 () Bool)

(assert (=> b!1178492 (=> res!782897 e!669969)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178492 (= res!782897 (not (= (select (arr!36724 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178493 () Bool)

(declare-fun e!669968 () Bool)

(declare-fun tp_is_empty!29673 () Bool)

(assert (=> b!1178493 (= e!669968 tp_is_empty!29673)))

(declare-fun b!1178494 () Bool)

(declare-fun e!669971 () Bool)

(assert (=> b!1178494 (= e!669971 tp_is_empty!29673)))

(declare-datatypes ((V!44691 0))(
  ( (V!44692 (val!14893 Int)) )
))
(declare-datatypes ((tuple2!19056 0))(
  ( (tuple2!19057 (_1!9539 (_ BitVec 64)) (_2!9539 V!44691)) )
))
(declare-datatypes ((List!25794 0))(
  ( (Nil!25791) (Cons!25790 (h!26999 tuple2!19056) (t!37929 List!25794)) )
))
(declare-datatypes ((ListLongMap!17025 0))(
  ( (ListLongMap!17026 (toList!8528 List!25794)) )
))
(declare-fun lt!532391 () ListLongMap!17025)

(declare-fun b!1178495 () Bool)

(declare-fun lt!532386 () tuple2!19056)

(declare-fun e!669972 () Bool)

(declare-fun lt!532396 () ListLongMap!17025)

(declare-fun +!3842 (ListLongMap!17025 tuple2!19056) ListLongMap!17025)

(assert (=> b!1178495 (= e!669972 (= lt!532391 (+!3842 lt!532396 lt!532386)))))

(declare-fun b!1178496 () Bool)

(declare-datatypes ((Unit!38926 0))(
  ( (Unit!38927) )
))
(declare-fun e!669965 () Unit!38926)

(declare-fun Unit!38928 () Unit!38926)

(assert (=> b!1178496 (= e!669965 Unit!38928)))

(declare-fun b!1178497 () Bool)

(declare-fun res!782898 () Bool)

(assert (=> b!1178497 (=> (not res!782898) (not e!669975))))

(declare-datatypes ((List!25795 0))(
  ( (Nil!25792) (Cons!25791 (h!27000 (_ BitVec 64)) (t!37930 List!25795)) )
))
(declare-fun arrayNoDuplicates!0 (array!76149 (_ BitVec 32) List!25795) Bool)

(assert (=> b!1178497 (= res!782898 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25792))))

(declare-fun b!1178498 () Bool)

(declare-fun res!782905 () Bool)

(assert (=> b!1178498 (=> (not res!782905) (not e!669975))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178498 (= res!782905 (validKeyInArray!0 k0!934))))

(declare-fun b!1178499 () Bool)

(declare-fun res!782903 () Bool)

(assert (=> b!1178499 (=> (not res!782903) (not e!669975))))

(assert (=> b!1178499 (= res!782903 (= (select (arr!36724 _keys!1208) i!673) k0!934))))

(declare-fun b!1178500 () Bool)

(declare-fun e!669976 () Bool)

(assert (=> b!1178500 (= e!669966 (not e!669976))))

(declare-fun res!782893 () Bool)

(assert (=> b!1178500 (=> res!782893 e!669976)))

(assert (=> b!1178500 (= res!782893 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76149 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178500 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532389 () Unit!38926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76149 (_ BitVec 64) (_ BitVec 32)) Unit!38926)

(assert (=> b!1178500 (= lt!532389 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178501 () Bool)

(declare-fun res!782896 () Bool)

(assert (=> b!1178501 (=> (not res!782896) (not e!669975))))

(assert (=> b!1178501 (= res!782896 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37260 _keys!1208))))))

(declare-fun mapNonEmpty!46337 () Bool)

(declare-fun mapRes!46337 () Bool)

(declare-fun tp!88142 () Bool)

(assert (=> mapNonEmpty!46337 (= mapRes!46337 (and tp!88142 e!669968))))

(declare-datatypes ((ValueCell!14127 0))(
  ( (ValueCellFull!14127 (v!17531 V!44691)) (EmptyCell!14127) )
))
(declare-fun mapValue!46337 () ValueCell!14127)

(declare-fun mapKey!46337 () (_ BitVec 32))

(declare-fun mapRest!46337 () (Array (_ BitVec 32) ValueCell!14127))

(declare-datatypes ((array!76151 0))(
  ( (array!76152 (arr!36725 (Array (_ BitVec 32) ValueCell!14127)) (size!37261 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76151)

(assert (=> mapNonEmpty!46337 (= (arr!36725 _values!996) (store mapRest!46337 mapKey!46337 mapValue!46337))))

(declare-fun b!1178502 () Bool)

(declare-fun res!782891 () Bool)

(assert (=> b!1178502 (=> (not res!782891) (not e!669966))))

(assert (=> b!1178502 (= res!782891 (arrayNoDuplicates!0 lt!532395 #b00000000000000000000000000000000 Nil!25792))))

(declare-fun b!1178503 () Bool)

(declare-fun e!669973 () Bool)

(assert (=> b!1178503 (= e!669973 (and e!669971 mapRes!46337))))

(declare-fun condMapEmpty!46337 () Bool)

(declare-fun mapDefault!46337 () ValueCell!14127)

(assert (=> b!1178503 (= condMapEmpty!46337 (= (arr!36725 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14127)) mapDefault!46337)))))

(declare-fun b!1178504 () Bool)

(declare-fun Unit!38929 () Unit!38926)

(assert (=> b!1178504 (= e!669965 Unit!38929)))

(declare-fun lt!532388 () Unit!38926)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76149 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38926)

(assert (=> b!1178504 (= lt!532388 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178504 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532390 () Unit!38926)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76149 (_ BitVec 32) (_ BitVec 32)) Unit!38926)

(assert (=> b!1178504 (= lt!532390 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178504 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25792)))

(declare-fun lt!532384 () Unit!38926)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76149 (_ BitVec 64) (_ BitVec 32) List!25795) Unit!38926)

(assert (=> b!1178504 (= lt!532384 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25792))))

(assert (=> b!1178504 false))

(declare-fun b!1178505 () Bool)

(declare-fun res!782899 () Bool)

(assert (=> b!1178505 (=> (not res!782899) (not e!669975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178505 (= res!782899 (validMask!0 mask!1564))))

(declare-fun b!1178506 () Bool)

(declare-fun e!669967 () Bool)

(assert (=> b!1178506 (= e!669967 true)))

(assert (=> b!1178506 e!669972))

(declare-fun res!782890 () Bool)

(assert (=> b!1178506 (=> (not res!782890) (not e!669972))))

(assert (=> b!1178506 (= res!782890 (not (= (select (arr!36724 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532397 () Unit!38926)

(assert (=> b!1178506 (= lt!532397 e!669965)))

(declare-fun c!116838 () Bool)

(assert (=> b!1178506 (= c!116838 (= (select (arr!36724 _keys!1208) from!1455) k0!934))))

(assert (=> b!1178506 e!669974))

(declare-fun res!782902 () Bool)

(assert (=> b!1178506 (=> (not res!782902) (not e!669974))))

(declare-fun lt!532398 () ListLongMap!17025)

(declare-fun lt!532385 () ListLongMap!17025)

(assert (=> b!1178506 (= res!782902 (= lt!532398 (+!3842 lt!532385 lt!532386)))))

(declare-fun lt!532393 () V!44691)

(declare-fun get!18770 (ValueCell!14127 V!44691) V!44691)

(assert (=> b!1178506 (= lt!532386 (tuple2!19057 (select (arr!36724 _keys!1208) from!1455) (get!18770 (select (arr!36725 _values!996) from!1455) lt!532393)))))

(declare-fun b!1178507 () Bool)

(assert (=> b!1178507 (= e!669969 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178508 () Bool)

(declare-fun res!782901 () Bool)

(assert (=> b!1178508 (=> (not res!782901) (not e!669975))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1178508 (= res!782901 (and (= (size!37261 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37260 _keys!1208) (size!37261 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46337 () Bool)

(assert (=> mapIsEmpty!46337 mapRes!46337))

(declare-fun res!782892 () Bool)

(assert (=> start!99564 (=> (not res!782892) (not e!669975))))

(assert (=> start!99564 (= res!782892 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37260 _keys!1208))))))

(assert (=> start!99564 e!669975))

(assert (=> start!99564 tp_is_empty!29673))

(declare-fun array_inv!28042 (array!76149) Bool)

(assert (=> start!99564 (array_inv!28042 _keys!1208)))

(assert (=> start!99564 true))

(assert (=> start!99564 tp!88143))

(declare-fun array_inv!28043 (array!76151) Bool)

(assert (=> start!99564 (and (array_inv!28043 _values!996) e!669973)))

(declare-fun b!1178509 () Bool)

(declare-fun e!669970 () Bool)

(assert (=> b!1178509 (= e!669976 e!669970)))

(declare-fun res!782900 () Bool)

(assert (=> b!1178509 (=> res!782900 e!669970)))

(assert (=> b!1178509 (= res!782900 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44691)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532394 () array!76151)

(declare-fun minValue!944 () V!44691)

(declare-fun getCurrentListMapNoExtraKeys!4984 (array!76149 array!76151 (_ BitVec 32) (_ BitVec 32) V!44691 V!44691 (_ BitVec 32) Int) ListLongMap!17025)

(assert (=> b!1178509 (= lt!532398 (getCurrentListMapNoExtraKeys!4984 lt!532395 lt!532394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178509 (= lt!532394 (array!76152 (store (arr!36725 _values!996) i!673 (ValueCellFull!14127 lt!532393)) (size!37261 _values!996)))))

(declare-fun dynLambda!2946 (Int (_ BitVec 64)) V!44691)

(assert (=> b!1178509 (= lt!532393 (dynLambda!2946 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1178509 (= lt!532391 (getCurrentListMapNoExtraKeys!4984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1178510 () Bool)

(assert (=> b!1178510 (= e!669970 e!669967)))

(declare-fun res!782895 () Bool)

(assert (=> b!1178510 (=> res!782895 e!669967)))

(assert (=> b!1178510 (= res!782895 (not (validKeyInArray!0 (select (arr!36724 _keys!1208) from!1455))))))

(declare-fun lt!532387 () ListLongMap!17025)

(assert (=> b!1178510 (= lt!532387 lt!532385)))

(declare-fun -!1575 (ListLongMap!17025 (_ BitVec 64)) ListLongMap!17025)

(assert (=> b!1178510 (= lt!532385 (-!1575 lt!532396 k0!934))))

(assert (=> b!1178510 (= lt!532387 (getCurrentListMapNoExtraKeys!4984 lt!532395 lt!532394 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178510 (= lt!532396 (getCurrentListMapNoExtraKeys!4984 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532392 () Unit!38926)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!802 (array!76149 array!76151 (_ BitVec 32) (_ BitVec 32) V!44691 V!44691 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38926)

(assert (=> b!1178510 (= lt!532392 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99564 res!782892) b!1178505))

(assert (= (and b!1178505 res!782899) b!1178508))

(assert (= (and b!1178508 res!782901) b!1178491))

(assert (= (and b!1178491 res!782904) b!1178497))

(assert (= (and b!1178497 res!782898) b!1178501))

(assert (= (and b!1178501 res!782896) b!1178498))

(assert (= (and b!1178498 res!782905) b!1178499))

(assert (= (and b!1178499 res!782903) b!1178490))

(assert (= (and b!1178490 res!782894) b!1178502))

(assert (= (and b!1178502 res!782891) b!1178500))

(assert (= (and b!1178500 (not res!782893)) b!1178509))

(assert (= (and b!1178509 (not res!782900)) b!1178510))

(assert (= (and b!1178510 (not res!782895)) b!1178506))

(assert (= (and b!1178506 res!782902) b!1178492))

(assert (= (and b!1178492 (not res!782897)) b!1178507))

(assert (= (and b!1178506 c!116838) b!1178504))

(assert (= (and b!1178506 (not c!116838)) b!1178496))

(assert (= (and b!1178506 res!782890) b!1178495))

(assert (= (and b!1178503 condMapEmpty!46337) mapIsEmpty!46337))

(assert (= (and b!1178503 (not condMapEmpty!46337)) mapNonEmpty!46337))

(get-info :version)

(assert (= (and mapNonEmpty!46337 ((_ is ValueCellFull!14127) mapValue!46337)) b!1178493))

(assert (= (and b!1178503 ((_ is ValueCellFull!14127) mapDefault!46337)) b!1178494))

(assert (= start!99564 b!1178503))

(declare-fun b_lambda!20287 () Bool)

(assert (=> (not b_lambda!20287) (not b!1178509)))

(declare-fun t!37928 () Bool)

(declare-fun tb!9955 () Bool)

(assert (=> (and start!99564 (= defaultEntry!1004 defaultEntry!1004) t!37928) tb!9955))

(declare-fun result!20477 () Bool)

(assert (=> tb!9955 (= result!20477 tp_is_empty!29673)))

(assert (=> b!1178509 t!37928))

(declare-fun b_and!41155 () Bool)

(assert (= b_and!41153 (and (=> t!37928 result!20477) b_and!41155)))

(declare-fun m!1086453 () Bool)

(assert (=> b!1178505 m!1086453))

(declare-fun m!1086455 () Bool)

(assert (=> b!1178495 m!1086455))

(declare-fun m!1086457 () Bool)

(assert (=> b!1178497 m!1086457))

(declare-fun m!1086459 () Bool)

(assert (=> mapNonEmpty!46337 m!1086459))

(declare-fun m!1086461 () Bool)

(assert (=> b!1178510 m!1086461))

(declare-fun m!1086463 () Bool)

(assert (=> b!1178510 m!1086463))

(declare-fun m!1086465 () Bool)

(assert (=> b!1178510 m!1086465))

(declare-fun m!1086467 () Bool)

(assert (=> b!1178510 m!1086467))

(declare-fun m!1086469 () Bool)

(assert (=> b!1178510 m!1086469))

(assert (=> b!1178510 m!1086467))

(declare-fun m!1086471 () Bool)

(assert (=> b!1178510 m!1086471))

(declare-fun m!1086473 () Bool)

(assert (=> b!1178504 m!1086473))

(declare-fun m!1086475 () Bool)

(assert (=> b!1178504 m!1086475))

(declare-fun m!1086477 () Bool)

(assert (=> b!1178504 m!1086477))

(declare-fun m!1086479 () Bool)

(assert (=> b!1178504 m!1086479))

(declare-fun m!1086481 () Bool)

(assert (=> b!1178504 m!1086481))

(declare-fun m!1086483 () Bool)

(assert (=> b!1178491 m!1086483))

(declare-fun m!1086485 () Bool)

(assert (=> b!1178509 m!1086485))

(declare-fun m!1086487 () Bool)

(assert (=> b!1178509 m!1086487))

(declare-fun m!1086489 () Bool)

(assert (=> b!1178509 m!1086489))

(declare-fun m!1086491 () Bool)

(assert (=> b!1178509 m!1086491))

(assert (=> b!1178506 m!1086467))

(declare-fun m!1086493 () Bool)

(assert (=> b!1178506 m!1086493))

(declare-fun m!1086495 () Bool)

(assert (=> b!1178506 m!1086495))

(assert (=> b!1178506 m!1086495))

(declare-fun m!1086497 () Bool)

(assert (=> b!1178506 m!1086497))

(declare-fun m!1086499 () Bool)

(assert (=> b!1178507 m!1086499))

(assert (=> b!1178492 m!1086467))

(declare-fun m!1086501 () Bool)

(assert (=> b!1178490 m!1086501))

(declare-fun m!1086503 () Bool)

(assert (=> b!1178490 m!1086503))

(declare-fun m!1086505 () Bool)

(assert (=> b!1178499 m!1086505))

(declare-fun m!1086507 () Bool)

(assert (=> b!1178498 m!1086507))

(declare-fun m!1086509 () Bool)

(assert (=> b!1178502 m!1086509))

(declare-fun m!1086511 () Bool)

(assert (=> b!1178500 m!1086511))

(declare-fun m!1086513 () Bool)

(assert (=> b!1178500 m!1086513))

(declare-fun m!1086515 () Bool)

(assert (=> start!99564 m!1086515))

(declare-fun m!1086517 () Bool)

(assert (=> start!99564 m!1086517))

(check-sat (not b_lambda!20287) (not b!1178502) (not b!1178509) (not start!99564) (not b!1178506) (not b!1178490) (not b!1178507) (not b!1178505) (not b!1178491) (not b!1178504) (not mapNonEmpty!46337) (not b_next!25143) tp_is_empty!29673 (not b!1178497) (not b!1178500) (not b!1178495) (not b!1178498) b_and!41155 (not b!1178510))
(check-sat b_and!41155 (not b_next!25143))
