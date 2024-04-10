; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101762 () Bool)

(assert start!101762)

(declare-fun b_free!26451 () Bool)

(declare-fun b_next!26451 () Bool)

(assert (=> start!101762 (= b_free!26451 (not b_next!26451))))

(declare-fun tp!92399 () Bool)

(declare-fun b_and!44163 () Bool)

(assert (=> start!101762 (= tp!92399 b_and!44163)))

(declare-fun res!814363 () Bool)

(declare-fun e!696011 () Bool)

(assert (=> start!101762 (=> (not res!814363) (not e!696011))))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((array!79089 0))(
  ( (array!79090 (arr!38171 (Array (_ BitVec 32) (_ BitVec 64))) (size!38707 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79089)

(assert (=> start!101762 (= res!814363 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38707 _keys!1208))))))

(assert (=> start!101762 e!696011))

(declare-fun tp_is_empty!31155 () Bool)

(assert (=> start!101762 tp_is_empty!31155))

(declare-fun array_inv!29030 (array!79089) Bool)

(assert (=> start!101762 (array_inv!29030 _keys!1208)))

(assert (=> start!101762 true))

(assert (=> start!101762 tp!92399))

(declare-datatypes ((V!46667 0))(
  ( (V!46668 (val!15634 Int)) )
))
(declare-datatypes ((ValueCell!14868 0))(
  ( (ValueCellFull!14868 (v!18296 V!46667)) (EmptyCell!14868) )
))
(declare-datatypes ((array!79091 0))(
  ( (array!79092 (arr!38172 (Array (_ BitVec 32) ValueCell!14868)) (size!38708 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79091)

(declare-fun e!696016 () Bool)

(declare-fun array_inv!29031 (array!79091) Bool)

(assert (=> start!101762 (and (array_inv!29031 _values!996) e!696016)))

(declare-fun b!1225443 () Bool)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!696010 () Bool)

(declare-fun arrayContainsKey!0 (array!79089 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1225443 (= e!696010 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225444 () Bool)

(declare-fun res!814372 () Bool)

(declare-fun e!696007 () Bool)

(assert (=> b!1225444 (=> (not res!814372) (not e!696007))))

(declare-fun lt!558405 () array!79089)

(declare-datatypes ((List!26951 0))(
  ( (Nil!26948) (Cons!26947 (h!28156 (_ BitVec 64)) (t!40382 List!26951)) )
))
(declare-fun arrayNoDuplicates!0 (array!79089 (_ BitVec 32) List!26951) Bool)

(assert (=> b!1225444 (= res!814372 (arrayNoDuplicates!0 lt!558405 #b00000000000000000000000000000000 Nil!26948))))

(declare-fun b!1225445 () Bool)

(declare-fun e!696013 () Bool)

(declare-fun e!696009 () Bool)

(assert (=> b!1225445 (= e!696013 e!696009)))

(declare-fun res!814364 () Bool)

(assert (=> b!1225445 (=> res!814364 e!696009)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1225445 (= res!814364 (not (validKeyInArray!0 (select (arr!38171 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!20150 0))(
  ( (tuple2!20151 (_1!10086 (_ BitVec 64)) (_2!10086 V!46667)) )
))
(declare-datatypes ((List!26952 0))(
  ( (Nil!26949) (Cons!26948 (h!28157 tuple2!20150) (t!40383 List!26952)) )
))
(declare-datatypes ((ListLongMap!18119 0))(
  ( (ListLongMap!18120 (toList!9075 List!26952)) )
))
(declare-fun lt!558406 () ListLongMap!18119)

(declare-fun lt!558418 () ListLongMap!18119)

(assert (=> b!1225445 (= lt!558406 lt!558418)))

(declare-fun lt!558414 () ListLongMap!18119)

(declare-fun -!1974 (ListLongMap!18119 (_ BitVec 64)) ListLongMap!18119)

(assert (=> b!1225445 (= lt!558418 (-!1974 lt!558414 k0!934))))

(declare-fun zeroValue!944 () V!46667)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558412 () array!79091)

(declare-fun minValue!944 () V!46667)

(declare-fun getCurrentListMapNoExtraKeys!5494 (array!79089 array!79091 (_ BitVec 32) (_ BitVec 32) V!46667 V!46667 (_ BitVec 32) Int) ListLongMap!18119)

(assert (=> b!1225445 (= lt!558406 (getCurrentListMapNoExtraKeys!5494 lt!558405 lt!558412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1225445 (= lt!558414 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!40613 0))(
  ( (Unit!40614) )
))
(declare-fun lt!558409 () Unit!40613)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1180 (array!79089 array!79091 (_ BitVec 32) (_ BitVec 32) V!46667 V!46667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40613)

(assert (=> b!1225445 (= lt!558409 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1180 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1225446 () Bool)

(declare-fun res!814367 () Bool)

(assert (=> b!1225446 (=> (not res!814367) (not e!696011))))

(assert (=> b!1225446 (= res!814367 (validKeyInArray!0 k0!934))))

(declare-fun b!1225447 () Bool)

(declare-fun e!696008 () Unit!40613)

(declare-fun Unit!40615 () Unit!40613)

(assert (=> b!1225447 (= e!696008 Unit!40615)))

(declare-fun b!1225448 () Bool)

(declare-fun res!814361 () Bool)

(assert (=> b!1225448 (=> (not res!814361) (not e!696011))))

(assert (=> b!1225448 (= res!814361 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38707 _keys!1208))))))

(declare-fun b!1225449 () Bool)

(declare-fun e!696014 () Bool)

(assert (=> b!1225449 (= e!696014 tp_is_empty!31155)))

(declare-fun b!1225450 () Bool)

(declare-fun Unit!40616 () Unit!40613)

(assert (=> b!1225450 (= e!696008 Unit!40616)))

(declare-fun lt!558419 () Unit!40613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79089 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40613)

(assert (=> b!1225450 (= lt!558419 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1225450 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558410 () Unit!40613)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79089 (_ BitVec 32) (_ BitVec 32)) Unit!40613)

(assert (=> b!1225450 (= lt!558410 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1225450 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26948)))

(declare-fun lt!558417 () Unit!40613)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79089 (_ BitVec 64) (_ BitVec 32) List!26951) Unit!40613)

(assert (=> b!1225450 (= lt!558417 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26948))))

(assert (=> b!1225450 false))

(declare-fun b!1225451 () Bool)

(declare-fun e!696006 () Bool)

(assert (=> b!1225451 (= e!696006 tp_is_empty!31155)))

(declare-fun b!1225452 () Bool)

(declare-fun mapRes!48631 () Bool)

(assert (=> b!1225452 (= e!696016 (and e!696006 mapRes!48631))))

(declare-fun condMapEmpty!48631 () Bool)

(declare-fun mapDefault!48631 () ValueCell!14868)

(assert (=> b!1225452 (= condMapEmpty!48631 (= (arr!38172 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14868)) mapDefault!48631)))))

(declare-fun b!1225453 () Bool)

(declare-fun res!814370 () Bool)

(assert (=> b!1225453 (=> (not res!814370) (not e!696011))))

(assert (=> b!1225453 (= res!814370 (and (= (size!38708 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38707 _keys!1208) (size!38708 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1225454 () Bool)

(declare-fun res!814366 () Bool)

(assert (=> b!1225454 (=> (not res!814366) (not e!696011))))

(assert (=> b!1225454 (= res!814366 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26948))))

(declare-fun mapIsEmpty!48631 () Bool)

(assert (=> mapIsEmpty!48631 mapRes!48631))

(declare-fun b!1225455 () Bool)

(declare-fun res!814362 () Bool)

(assert (=> b!1225455 (=> (not res!814362) (not e!696011))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79089 (_ BitVec 32)) Bool)

(assert (=> b!1225455 (= res!814362 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1225456 () Bool)

(declare-fun lt!558413 () ListLongMap!18119)

(declare-fun lt!558401 () ListLongMap!18119)

(assert (=> b!1225456 (= e!696009 (= lt!558401 (-!1974 lt!558413 k0!934)))))

(declare-fun lt!558408 () ListLongMap!18119)

(declare-fun lt!558411 () ListLongMap!18119)

(assert (=> b!1225456 (= (-!1974 lt!558408 k0!934) lt!558411)))

(declare-fun lt!558415 () Unit!40613)

(declare-fun lt!558416 () V!46667)

(declare-fun addRemoveCommutativeForDiffKeys!216 (ListLongMap!18119 (_ BitVec 64) V!46667 (_ BitVec 64)) Unit!40613)

(assert (=> b!1225456 (= lt!558415 (addRemoveCommutativeForDiffKeys!216 lt!558414 (select (arr!38171 _keys!1208) from!1455) lt!558416 k0!934))))

(assert (=> b!1225456 (and (= lt!558413 lt!558408) (= lt!558418 lt!558406))))

(declare-fun lt!558404 () tuple2!20150)

(declare-fun +!4129 (ListLongMap!18119 tuple2!20150) ListLongMap!18119)

(assert (=> b!1225456 (= lt!558408 (+!4129 lt!558414 lt!558404))))

(assert (=> b!1225456 (not (= (select (arr!38171 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558403 () Unit!40613)

(assert (=> b!1225456 (= lt!558403 e!696008)))

(declare-fun c!120497 () Bool)

(assert (=> b!1225456 (= c!120497 (= (select (arr!38171 _keys!1208) from!1455) k0!934))))

(declare-fun e!696012 () Bool)

(assert (=> b!1225456 e!696012))

(declare-fun res!814358 () Bool)

(assert (=> b!1225456 (=> (not res!814358) (not e!696012))))

(assert (=> b!1225456 (= res!814358 (= lt!558401 lt!558411))))

(assert (=> b!1225456 (= lt!558411 (+!4129 lt!558418 lt!558404))))

(assert (=> b!1225456 (= lt!558404 (tuple2!20151 (select (arr!38171 _keys!1208) from!1455) lt!558416))))

(declare-fun lt!558402 () V!46667)

(declare-fun get!19499 (ValueCell!14868 V!46667) V!46667)

(assert (=> b!1225456 (= lt!558416 (get!19499 (select (arr!38172 _values!996) from!1455) lt!558402))))

(declare-fun b!1225457 () Bool)

(declare-fun e!696005 () Bool)

(assert (=> b!1225457 (= e!696005 e!696013)))

(declare-fun res!814368 () Bool)

(assert (=> b!1225457 (=> res!814368 e!696013)))

(assert (=> b!1225457 (= res!814368 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1225457 (= lt!558401 (getCurrentListMapNoExtraKeys!5494 lt!558405 lt!558412 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1225457 (= lt!558412 (array!79092 (store (arr!38172 _values!996) i!673 (ValueCellFull!14868 lt!558402)) (size!38708 _values!996)))))

(declare-fun dynLambda!3366 (Int (_ BitVec 64)) V!46667)

(assert (=> b!1225457 (= lt!558402 (dynLambda!3366 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1225457 (= lt!558413 (getCurrentListMapNoExtraKeys!5494 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1225458 () Bool)

(assert (=> b!1225458 (= e!696012 e!696010)))

(declare-fun res!814369 () Bool)

(assert (=> b!1225458 (=> res!814369 e!696010)))

(assert (=> b!1225458 (= res!814369 (not (= (select (arr!38171 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1225459 () Bool)

(declare-fun res!814371 () Bool)

(assert (=> b!1225459 (=> (not res!814371) (not e!696011))))

(assert (=> b!1225459 (= res!814371 (= (select (arr!38171 _keys!1208) i!673) k0!934))))

(declare-fun b!1225460 () Bool)

(assert (=> b!1225460 (= e!696007 (not e!696005))))

(declare-fun res!814365 () Bool)

(assert (=> b!1225460 (=> res!814365 e!696005)))

(assert (=> b!1225460 (= res!814365 (bvsgt from!1455 i!673))))

(assert (=> b!1225460 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558407 () Unit!40613)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79089 (_ BitVec 64) (_ BitVec 32)) Unit!40613)

(assert (=> b!1225460 (= lt!558407 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1225461 () Bool)

(assert (=> b!1225461 (= e!696011 e!696007)))

(declare-fun res!814360 () Bool)

(assert (=> b!1225461 (=> (not res!814360) (not e!696007))))

(assert (=> b!1225461 (= res!814360 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558405 mask!1564))))

(assert (=> b!1225461 (= lt!558405 (array!79090 (store (arr!38171 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38707 _keys!1208)))))

(declare-fun b!1225462 () Bool)

(declare-fun res!814359 () Bool)

(assert (=> b!1225462 (=> (not res!814359) (not e!696011))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1225462 (= res!814359 (validMask!0 mask!1564))))

(declare-fun mapNonEmpty!48631 () Bool)

(declare-fun tp!92398 () Bool)

(assert (=> mapNonEmpty!48631 (= mapRes!48631 (and tp!92398 e!696014))))

(declare-fun mapRest!48631 () (Array (_ BitVec 32) ValueCell!14868))

(declare-fun mapValue!48631 () ValueCell!14868)

(declare-fun mapKey!48631 () (_ BitVec 32))

(assert (=> mapNonEmpty!48631 (= (arr!38172 _values!996) (store mapRest!48631 mapKey!48631 mapValue!48631))))

(assert (= (and start!101762 res!814363) b!1225462))

(assert (= (and b!1225462 res!814359) b!1225453))

(assert (= (and b!1225453 res!814370) b!1225455))

(assert (= (and b!1225455 res!814362) b!1225454))

(assert (= (and b!1225454 res!814366) b!1225448))

(assert (= (and b!1225448 res!814361) b!1225446))

(assert (= (and b!1225446 res!814367) b!1225459))

(assert (= (and b!1225459 res!814371) b!1225461))

(assert (= (and b!1225461 res!814360) b!1225444))

(assert (= (and b!1225444 res!814372) b!1225460))

(assert (= (and b!1225460 (not res!814365)) b!1225457))

(assert (= (and b!1225457 (not res!814368)) b!1225445))

(assert (= (and b!1225445 (not res!814364)) b!1225456))

(assert (= (and b!1225456 res!814358) b!1225458))

(assert (= (and b!1225458 (not res!814369)) b!1225443))

(assert (= (and b!1225456 c!120497) b!1225450))

(assert (= (and b!1225456 (not c!120497)) b!1225447))

(assert (= (and b!1225452 condMapEmpty!48631) mapIsEmpty!48631))

(assert (= (and b!1225452 (not condMapEmpty!48631)) mapNonEmpty!48631))

(get-info :version)

(assert (= (and mapNonEmpty!48631 ((_ is ValueCellFull!14868) mapValue!48631)) b!1225449))

(assert (= (and b!1225452 ((_ is ValueCellFull!14868) mapDefault!48631)) b!1225451))

(assert (= start!101762 b!1225452))

(declare-fun b_lambda!22431 () Bool)

(assert (=> (not b_lambda!22431) (not b!1225457)))

(declare-fun t!40381 () Bool)

(declare-fun tb!11251 () Bool)

(assert (=> (and start!101762 (= defaultEntry!1004 defaultEntry!1004) t!40381) tb!11251))

(declare-fun result!23115 () Bool)

(assert (=> tb!11251 (= result!23115 tp_is_empty!31155)))

(assert (=> b!1225457 t!40381))

(declare-fun b_and!44165 () Bool)

(assert (= b_and!44163 (and (=> t!40381 result!23115) b_and!44165)))

(declare-fun m!1130549 () Bool)

(assert (=> b!1225456 m!1130549))

(declare-fun m!1130551 () Bool)

(assert (=> b!1225456 m!1130551))

(assert (=> b!1225456 m!1130551))

(declare-fun m!1130553 () Bool)

(assert (=> b!1225456 m!1130553))

(declare-fun m!1130555 () Bool)

(assert (=> b!1225456 m!1130555))

(declare-fun m!1130557 () Bool)

(assert (=> b!1225456 m!1130557))

(declare-fun m!1130559 () Bool)

(assert (=> b!1225456 m!1130559))

(declare-fun m!1130561 () Bool)

(assert (=> b!1225456 m!1130561))

(assert (=> b!1225456 m!1130561))

(declare-fun m!1130563 () Bool)

(assert (=> b!1225456 m!1130563))

(declare-fun m!1130565 () Bool)

(assert (=> b!1225457 m!1130565))

(declare-fun m!1130567 () Bool)

(assert (=> b!1225457 m!1130567))

(declare-fun m!1130569 () Bool)

(assert (=> b!1225457 m!1130569))

(declare-fun m!1130571 () Bool)

(assert (=> b!1225457 m!1130571))

(declare-fun m!1130573 () Bool)

(assert (=> b!1225459 m!1130573))

(declare-fun m!1130575 () Bool)

(assert (=> b!1225444 m!1130575))

(declare-fun m!1130577 () Bool)

(assert (=> b!1225445 m!1130577))

(declare-fun m!1130579 () Bool)

(assert (=> b!1225445 m!1130579))

(declare-fun m!1130581 () Bool)

(assert (=> b!1225445 m!1130581))

(declare-fun m!1130583 () Bool)

(assert (=> b!1225445 m!1130583))

(assert (=> b!1225445 m!1130561))

(declare-fun m!1130585 () Bool)

(assert (=> b!1225445 m!1130585))

(assert (=> b!1225445 m!1130561))

(declare-fun m!1130587 () Bool)

(assert (=> b!1225446 m!1130587))

(declare-fun m!1130589 () Bool)

(assert (=> b!1225454 m!1130589))

(declare-fun m!1130591 () Bool)

(assert (=> b!1225450 m!1130591))

(declare-fun m!1130593 () Bool)

(assert (=> b!1225450 m!1130593))

(declare-fun m!1130595 () Bool)

(assert (=> b!1225450 m!1130595))

(declare-fun m!1130597 () Bool)

(assert (=> b!1225450 m!1130597))

(declare-fun m!1130599 () Bool)

(assert (=> b!1225450 m!1130599))

(declare-fun m!1130601 () Bool)

(assert (=> start!101762 m!1130601))

(declare-fun m!1130603 () Bool)

(assert (=> start!101762 m!1130603))

(declare-fun m!1130605 () Bool)

(assert (=> b!1225443 m!1130605))

(assert (=> b!1225458 m!1130561))

(declare-fun m!1130607 () Bool)

(assert (=> mapNonEmpty!48631 m!1130607))

(declare-fun m!1130609 () Bool)

(assert (=> b!1225462 m!1130609))

(declare-fun m!1130611 () Bool)

(assert (=> b!1225460 m!1130611))

(declare-fun m!1130613 () Bool)

(assert (=> b!1225460 m!1130613))

(declare-fun m!1130615 () Bool)

(assert (=> b!1225461 m!1130615))

(declare-fun m!1130617 () Bool)

(assert (=> b!1225461 m!1130617))

(declare-fun m!1130619 () Bool)

(assert (=> b!1225455 m!1130619))

(check-sat (not b!1225462) (not b!1225446) (not b!1225444) (not b!1225443) (not b!1225450) b_and!44165 (not b!1225461) (not b!1225455) (not b!1225445) (not b_lambda!22431) (not b!1225456) (not b!1225460) (not mapNonEmpty!48631) (not b!1225457) (not start!101762) (not b_next!26451) tp_is_empty!31155 (not b!1225454))
(check-sat b_and!44165 (not b_next!26451))
