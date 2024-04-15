; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99838 () Bool)

(assert start!99838)

(declare-fun b_free!25423 () Bool)

(declare-fun b_next!25423 () Bool)

(assert (=> start!99838 (= b_free!25423 (not b_next!25423))))

(declare-fun tp!88982 () Bool)

(declare-fun b_and!41691 () Bool)

(assert (=> start!99838 (= tp!88982 b_and!41691)))

(declare-fun b!1187275 () Bool)

(declare-fun res!789359 () Bool)

(declare-fun e!675070 () Bool)

(assert (=> b!1187275 (=> (not res!789359) (not e!675070))))

(declare-datatypes ((array!76640 0))(
  ( (array!76641 (arr!36970 (Array (_ BitVec 32) (_ BitVec 64))) (size!37508 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76640)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1187275 (= res!789359 (= (select (arr!36970 _keys!1208) i!673) k0!934))))

(declare-fun b!1187276 () Bool)

(declare-fun e!675068 () Bool)

(assert (=> b!1187276 (= e!675068 true)))

(declare-datatypes ((V!45065 0))(
  ( (V!45066 (val!15033 Int)) )
))
(declare-datatypes ((tuple2!19414 0))(
  ( (tuple2!19415 (_1!9718 (_ BitVec 64)) (_2!9718 V!45065)) )
))
(declare-datatypes ((List!26125 0))(
  ( (Nil!26122) (Cons!26121 (h!27330 tuple2!19414) (t!38531 List!26125)) )
))
(declare-datatypes ((ListLongMap!17383 0))(
  ( (ListLongMap!17384 (toList!8707 List!26125)) )
))
(declare-fun lt!539618 () ListLongMap!17383)

(declare-fun lt!539627 () ListLongMap!17383)

(declare-fun -!1656 (ListLongMap!17383 (_ BitVec 64)) ListLongMap!17383)

(assert (=> b!1187276 (= (-!1656 lt!539618 k0!934) lt!539627)))

(declare-fun lt!539632 () V!45065)

(declare-datatypes ((Unit!39247 0))(
  ( (Unit!39248) )
))
(declare-fun lt!539629 () Unit!39247)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lt!539628 () ListLongMap!17383)

(declare-fun addRemoveCommutativeForDiffKeys!199 (ListLongMap!17383 (_ BitVec 64) V!45065 (_ BitVec 64)) Unit!39247)

(assert (=> b!1187276 (= lt!539629 (addRemoveCommutativeForDiffKeys!199 lt!539628 (select (arr!36970 _keys!1208) from!1455) lt!539632 k0!934))))

(declare-fun lt!539616 () ListLongMap!17383)

(declare-fun lt!539623 () ListLongMap!17383)

(declare-fun lt!539630 () ListLongMap!17383)

(assert (=> b!1187276 (and (= lt!539616 lt!539618) (= lt!539623 lt!539630))))

(declare-fun lt!539634 () tuple2!19414)

(declare-fun +!3985 (ListLongMap!17383 tuple2!19414) ListLongMap!17383)

(assert (=> b!1187276 (= lt!539618 (+!3985 lt!539628 lt!539634))))

(assert (=> b!1187276 (not (= (select (arr!36970 _keys!1208) from!1455) k0!934))))

(declare-fun lt!539625 () Unit!39247)

(declare-fun e!675072 () Unit!39247)

(assert (=> b!1187276 (= lt!539625 e!675072)))

(declare-fun c!117232 () Bool)

(assert (=> b!1187276 (= c!117232 (= (select (arr!36970 _keys!1208) from!1455) k0!934))))

(declare-fun e!675067 () Bool)

(assert (=> b!1187276 e!675067))

(declare-fun res!789362 () Bool)

(assert (=> b!1187276 (=> (not res!789362) (not e!675067))))

(declare-fun lt!539633 () ListLongMap!17383)

(assert (=> b!1187276 (= res!789362 (= lt!539633 lt!539627))))

(assert (=> b!1187276 (= lt!539627 (+!3985 lt!539623 lt!539634))))

(assert (=> b!1187276 (= lt!539634 (tuple2!19415 (select (arr!36970 _keys!1208) from!1455) lt!539632))))

(declare-fun lt!539631 () V!45065)

(declare-datatypes ((ValueCell!14267 0))(
  ( (ValueCellFull!14267 (v!17670 V!45065)) (EmptyCell!14267) )
))
(declare-datatypes ((array!76642 0))(
  ( (array!76643 (arr!36971 (Array (_ BitVec 32) ValueCell!14267)) (size!37509 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76642)

(declare-fun get!18948 (ValueCell!14267 V!45065) V!45065)

(assert (=> b!1187276 (= lt!539632 (get!18948 (select (arr!36971 _values!996) from!1455) lt!539631))))

(declare-fun mapNonEmpty!46757 () Bool)

(declare-fun mapRes!46757 () Bool)

(declare-fun tp!88983 () Bool)

(declare-fun e!675069 () Bool)

(assert (=> mapNonEmpty!46757 (= mapRes!46757 (and tp!88983 e!675069))))

(declare-fun mapValue!46757 () ValueCell!14267)

(declare-fun mapRest!46757 () (Array (_ BitVec 32) ValueCell!14267))

(declare-fun mapKey!46757 () (_ BitVec 32))

(assert (=> mapNonEmpty!46757 (= (arr!36971 _values!996) (store mapRest!46757 mapKey!46757 mapValue!46757))))

(declare-fun b!1187277 () Bool)

(declare-fun res!789356 () Bool)

(assert (=> b!1187277 (=> (not res!789356) (not e!675070))))

(declare-datatypes ((List!26126 0))(
  ( (Nil!26123) (Cons!26122 (h!27331 (_ BitVec 64)) (t!38532 List!26126)) )
))
(declare-fun arrayNoDuplicates!0 (array!76640 (_ BitVec 32) List!26126) Bool)

(assert (=> b!1187277 (= res!789356 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26123))))

(declare-fun b!1187278 () Bool)

(declare-fun Unit!39249 () Unit!39247)

(assert (=> b!1187278 (= e!675072 Unit!39249)))

(declare-fun b!1187279 () Bool)

(declare-fun res!789363 () Bool)

(assert (=> b!1187279 (=> (not res!789363) (not e!675070))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(assert (=> b!1187279 (= res!789363 (and (= (size!37509 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37508 _keys!1208) (size!37509 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!46757 () Bool)

(assert (=> mapIsEmpty!46757 mapRes!46757))

(declare-fun b!1187280 () Bool)

(declare-fun e!675071 () Bool)

(declare-fun e!675066 () Bool)

(assert (=> b!1187280 (= e!675071 e!675066)))

(declare-fun res!789355 () Bool)

(assert (=> b!1187280 (=> res!789355 e!675066)))

(assert (=> b!1187280 (= res!789355 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!45065)

(declare-fun lt!539626 () array!76642)

(declare-fun lt!539617 () array!76640)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!45065)

(declare-fun getCurrentListMapNoExtraKeys!5157 (array!76640 array!76642 (_ BitVec 32) (_ BitVec 32) V!45065 V!45065 (_ BitVec 32) Int) ListLongMap!17383)

(assert (=> b!1187280 (= lt!539633 (getCurrentListMapNoExtraKeys!5157 lt!539617 lt!539626 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1187280 (= lt!539626 (array!76643 (store (arr!36971 _values!996) i!673 (ValueCellFull!14267 lt!539631)) (size!37509 _values!996)))))

(declare-fun dynLambda!3056 (Int (_ BitVec 64)) V!45065)

(assert (=> b!1187280 (= lt!539631 (dynLambda!3056 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1187280 (= lt!539616 (getCurrentListMapNoExtraKeys!5157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun e!675076 () Bool)

(declare-fun b!1187281 () Bool)

(declare-fun arrayContainsKey!0 (array!76640 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1187281 (= e!675076 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187282 () Bool)

(declare-fun e!675075 () Bool)

(assert (=> b!1187282 (= e!675075 (not e!675071))))

(declare-fun res!789365 () Bool)

(assert (=> b!1187282 (=> res!789365 e!675071)))

(assert (=> b!1187282 (= res!789365 (bvsgt from!1455 i!673))))

(assert (=> b!1187282 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!539622 () Unit!39247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76640 (_ BitVec 64) (_ BitVec 32)) Unit!39247)

(assert (=> b!1187282 (= lt!539622 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1187283 () Bool)

(declare-fun e!675074 () Bool)

(declare-fun tp_is_empty!29953 () Bool)

(assert (=> b!1187283 (= e!675074 tp_is_empty!29953)))

(declare-fun b!1187284 () Bool)

(assert (=> b!1187284 (= e!675066 e!675068)))

(declare-fun res!789354 () Bool)

(assert (=> b!1187284 (=> res!789354 e!675068)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1187284 (= res!789354 (not (validKeyInArray!0 (select (arr!36970 _keys!1208) from!1455))))))

(assert (=> b!1187284 (= lt!539630 lt!539623)))

(assert (=> b!1187284 (= lt!539623 (-!1656 lt!539628 k0!934))))

(assert (=> b!1187284 (= lt!539630 (getCurrentListMapNoExtraKeys!5157 lt!539617 lt!539626 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1187284 (= lt!539628 (getCurrentListMapNoExtraKeys!5157 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!539624 () Unit!39247)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!908 (array!76640 array!76642 (_ BitVec 32) (_ BitVec 32) V!45065 V!45065 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39247)

(assert (=> b!1187284 (= lt!539624 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!908 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1187285 () Bool)

(declare-fun Unit!39250 () Unit!39247)

(assert (=> b!1187285 (= e!675072 Unit!39250)))

(declare-fun lt!539620 () Unit!39247)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76640 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39247)

(assert (=> b!1187285 (= lt!539620 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1187285 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!539621 () Unit!39247)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76640 (_ BitVec 32) (_ BitVec 32)) Unit!39247)

(assert (=> b!1187285 (= lt!539621 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1187285 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26123)))

(declare-fun lt!539619 () Unit!39247)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76640 (_ BitVec 64) (_ BitVec 32) List!26126) Unit!39247)

(assert (=> b!1187285 (= lt!539619 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26123))))

(assert (=> b!1187285 false))

(declare-fun res!789353 () Bool)

(assert (=> start!99838 (=> (not res!789353) (not e!675070))))

(assert (=> start!99838 (= res!789353 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37508 _keys!1208))))))

(assert (=> start!99838 e!675070))

(assert (=> start!99838 tp_is_empty!29953))

(declare-fun array_inv!28320 (array!76640) Bool)

(assert (=> start!99838 (array_inv!28320 _keys!1208)))

(assert (=> start!99838 true))

(assert (=> start!99838 tp!88982))

(declare-fun e!675073 () Bool)

(declare-fun array_inv!28321 (array!76642) Bool)

(assert (=> start!99838 (and (array_inv!28321 _values!996) e!675073)))

(declare-fun b!1187286 () Bool)

(assert (=> b!1187286 (= e!675073 (and e!675074 mapRes!46757))))

(declare-fun condMapEmpty!46757 () Bool)

(declare-fun mapDefault!46757 () ValueCell!14267)

(assert (=> b!1187286 (= condMapEmpty!46757 (= (arr!36971 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14267)) mapDefault!46757)))))

(declare-fun b!1187287 () Bool)

(declare-fun res!789366 () Bool)

(assert (=> b!1187287 (=> (not res!789366) (not e!675070))))

(assert (=> b!1187287 (= res!789366 (validKeyInArray!0 k0!934))))

(declare-fun b!1187288 () Bool)

(declare-fun res!789360 () Bool)

(assert (=> b!1187288 (=> (not res!789360) (not e!675070))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1187288 (= res!789360 (validMask!0 mask!1564))))

(declare-fun b!1187289 () Bool)

(declare-fun res!789364 () Bool)

(assert (=> b!1187289 (=> (not res!789364) (not e!675070))))

(assert (=> b!1187289 (= res!789364 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37508 _keys!1208))))))

(declare-fun b!1187290 () Bool)

(assert (=> b!1187290 (= e!675070 e!675075)))

(declare-fun res!789358 () Bool)

(assert (=> b!1187290 (=> (not res!789358) (not e!675075))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76640 (_ BitVec 32)) Bool)

(assert (=> b!1187290 (= res!789358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!539617 mask!1564))))

(assert (=> b!1187290 (= lt!539617 (array!76641 (store (arr!36970 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37508 _keys!1208)))))

(declare-fun b!1187291 () Bool)

(declare-fun res!789357 () Bool)

(assert (=> b!1187291 (=> (not res!789357) (not e!675075))))

(assert (=> b!1187291 (= res!789357 (arrayNoDuplicates!0 lt!539617 #b00000000000000000000000000000000 Nil!26123))))

(declare-fun b!1187292 () Bool)

(declare-fun res!789361 () Bool)

(assert (=> b!1187292 (=> (not res!789361) (not e!675070))))

(assert (=> b!1187292 (= res!789361 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1187293 () Bool)

(assert (=> b!1187293 (= e!675069 tp_is_empty!29953)))

(declare-fun b!1187294 () Bool)

(assert (=> b!1187294 (= e!675067 e!675076)))

(declare-fun res!789367 () Bool)

(assert (=> b!1187294 (=> res!789367 e!675076)))

(assert (=> b!1187294 (= res!789367 (not (= (select (arr!36970 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99838 res!789353) b!1187288))

(assert (= (and b!1187288 res!789360) b!1187279))

(assert (= (and b!1187279 res!789363) b!1187292))

(assert (= (and b!1187292 res!789361) b!1187277))

(assert (= (and b!1187277 res!789356) b!1187289))

(assert (= (and b!1187289 res!789364) b!1187287))

(assert (= (and b!1187287 res!789366) b!1187275))

(assert (= (and b!1187275 res!789359) b!1187290))

(assert (= (and b!1187290 res!789358) b!1187291))

(assert (= (and b!1187291 res!789357) b!1187282))

(assert (= (and b!1187282 (not res!789365)) b!1187280))

(assert (= (and b!1187280 (not res!789355)) b!1187284))

(assert (= (and b!1187284 (not res!789354)) b!1187276))

(assert (= (and b!1187276 res!789362) b!1187294))

(assert (= (and b!1187294 (not res!789367)) b!1187281))

(assert (= (and b!1187276 c!117232) b!1187285))

(assert (= (and b!1187276 (not c!117232)) b!1187278))

(assert (= (and b!1187286 condMapEmpty!46757) mapIsEmpty!46757))

(assert (= (and b!1187286 (not condMapEmpty!46757)) mapNonEmpty!46757))

(get-info :version)

(assert (= (and mapNonEmpty!46757 ((_ is ValueCellFull!14267) mapValue!46757)) b!1187293))

(assert (= (and b!1187286 ((_ is ValueCellFull!14267) mapDefault!46757)) b!1187283))

(assert (= start!99838 b!1187286))

(declare-fun b_lambda!20549 () Bool)

(assert (=> (not b_lambda!20549) (not b!1187280)))

(declare-fun t!38530 () Bool)

(declare-fun tb!10227 () Bool)

(assert (=> (and start!99838 (= defaultEntry!1004 defaultEntry!1004) t!38530) tb!10227))

(declare-fun result!21029 () Bool)

(assert (=> tb!10227 (= result!21029 tp_is_empty!29953)))

(assert (=> b!1187280 t!38530))

(declare-fun b_and!41693 () Bool)

(assert (= b_and!41691 (and (=> t!38530 result!21029) b_and!41693)))

(declare-fun m!1095455 () Bool)

(assert (=> b!1187282 m!1095455))

(declare-fun m!1095457 () Bool)

(assert (=> b!1187282 m!1095457))

(declare-fun m!1095459 () Bool)

(assert (=> b!1187290 m!1095459))

(declare-fun m!1095461 () Bool)

(assert (=> b!1187290 m!1095461))

(declare-fun m!1095463 () Bool)

(assert (=> b!1187276 m!1095463))

(declare-fun m!1095465 () Bool)

(assert (=> b!1187276 m!1095465))

(assert (=> b!1187276 m!1095463))

(declare-fun m!1095467 () Bool)

(assert (=> b!1187276 m!1095467))

(declare-fun m!1095469 () Bool)

(assert (=> b!1187276 m!1095469))

(declare-fun m!1095471 () Bool)

(assert (=> b!1187276 m!1095471))

(declare-fun m!1095473 () Bool)

(assert (=> b!1187276 m!1095473))

(declare-fun m!1095475 () Bool)

(assert (=> b!1187276 m!1095475))

(assert (=> b!1187276 m!1095471))

(assert (=> b!1187294 m!1095471))

(declare-fun m!1095477 () Bool)

(assert (=> start!99838 m!1095477))

(declare-fun m!1095479 () Bool)

(assert (=> start!99838 m!1095479))

(declare-fun m!1095481 () Bool)

(assert (=> b!1187285 m!1095481))

(declare-fun m!1095483 () Bool)

(assert (=> b!1187285 m!1095483))

(declare-fun m!1095485 () Bool)

(assert (=> b!1187285 m!1095485))

(declare-fun m!1095487 () Bool)

(assert (=> b!1187285 m!1095487))

(declare-fun m!1095489 () Bool)

(assert (=> b!1187285 m!1095489))

(declare-fun m!1095491 () Bool)

(assert (=> b!1187277 m!1095491))

(declare-fun m!1095493 () Bool)

(assert (=> b!1187284 m!1095493))

(declare-fun m!1095495 () Bool)

(assert (=> b!1187284 m!1095495))

(assert (=> b!1187284 m!1095471))

(declare-fun m!1095497 () Bool)

(assert (=> b!1187284 m!1095497))

(assert (=> b!1187284 m!1095471))

(declare-fun m!1095499 () Bool)

(assert (=> b!1187284 m!1095499))

(declare-fun m!1095501 () Bool)

(assert (=> b!1187284 m!1095501))

(declare-fun m!1095503 () Bool)

(assert (=> b!1187281 m!1095503))

(declare-fun m!1095505 () Bool)

(assert (=> mapNonEmpty!46757 m!1095505))

(declare-fun m!1095507 () Bool)

(assert (=> b!1187291 m!1095507))

(declare-fun m!1095509 () Bool)

(assert (=> b!1187292 m!1095509))

(declare-fun m!1095511 () Bool)

(assert (=> b!1187287 m!1095511))

(declare-fun m!1095513 () Bool)

(assert (=> b!1187275 m!1095513))

(declare-fun m!1095515 () Bool)

(assert (=> b!1187288 m!1095515))

(declare-fun m!1095517 () Bool)

(assert (=> b!1187280 m!1095517))

(declare-fun m!1095519 () Bool)

(assert (=> b!1187280 m!1095519))

(declare-fun m!1095521 () Bool)

(assert (=> b!1187280 m!1095521))

(declare-fun m!1095523 () Bool)

(assert (=> b!1187280 m!1095523))

(check-sat b_and!41693 (not b!1187276) tp_is_empty!29953 (not b!1187285) (not b!1187291) (not b_next!25423) (not b_lambda!20549) (not b!1187284) (not b!1187281) (not b!1187288) (not b!1187280) (not b!1187287) (not start!99838) (not b!1187277) (not b!1187292) (not mapNonEmpty!46757) (not b!1187290) (not b!1187282))
(check-sat b_and!41693 (not b_next!25423))
