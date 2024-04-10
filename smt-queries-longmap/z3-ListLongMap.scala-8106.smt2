; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99504 () Bool)

(assert start!99504)

(declare-fun b_free!25083 () Bool)

(declare-fun b_next!25083 () Bool)

(assert (=> start!99504 (= b_free!25083 (not b_next!25083))))

(declare-fun tp!87963 () Bool)

(declare-fun b_and!41033 () Bool)

(assert (=> start!99504 (= tp!87963 b_and!41033)))

(declare-fun b!1176540 () Bool)

(declare-fun e!668803 () Bool)

(declare-fun e!668799 () Bool)

(assert (=> b!1176540 (= e!668803 e!668799)))

(declare-fun res!781465 () Bool)

(assert (=> b!1176540 (=> res!781465 e!668799)))

(declare-datatypes ((array!76033 0))(
  ( (array!76034 (arr!36666 (Array (_ BitVec 32) (_ BitVec 64))) (size!37202 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76033)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1176540 (= res!781465 (not (validKeyInArray!0 (select (arr!36666 _keys!1208) from!1455))))))

(declare-datatypes ((V!44611 0))(
  ( (V!44612 (val!14863 Int)) )
))
(declare-datatypes ((tuple2!19006 0))(
  ( (tuple2!19007 (_1!9514 (_ BitVec 64)) (_2!9514 V!44611)) )
))
(declare-datatypes ((List!25744 0))(
  ( (Nil!25741) (Cons!25740 (h!26949 tuple2!19006) (t!37819 List!25744)) )
))
(declare-datatypes ((ListLongMap!16975 0))(
  ( (ListLongMap!16976 (toList!8503 List!25744)) )
))
(declare-fun lt!531035 () ListLongMap!16975)

(declare-fun lt!531040 () ListLongMap!16975)

(assert (=> b!1176540 (= lt!531035 lt!531040)))

(declare-fun lt!531042 () ListLongMap!16975)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun -!1556 (ListLongMap!16975 (_ BitVec 64)) ListLongMap!16975)

(assert (=> b!1176540 (= lt!531040 (-!1556 lt!531042 k0!934))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!14097 0))(
  ( (ValueCellFull!14097 (v!17501 V!44611)) (EmptyCell!14097) )
))
(declare-datatypes ((array!76035 0))(
  ( (array!76036 (arr!36667 (Array (_ BitVec 32) ValueCell!14097)) (size!37203 (_ BitVec 32))) )
))
(declare-fun lt!531043 () array!76035)

(declare-fun zeroValue!944 () V!44611)

(declare-fun lt!531034 () array!76033)

(declare-fun minValue!944 () V!44611)

(declare-fun getCurrentListMapNoExtraKeys!4962 (array!76033 array!76035 (_ BitVec 32) (_ BitVec 32) V!44611 V!44611 (_ BitVec 32) Int) ListLongMap!16975)

(assert (=> b!1176540 (= lt!531035 (getCurrentListMapNoExtraKeys!4962 lt!531034 lt!531043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun _values!996 () array!76035)

(assert (=> b!1176540 (= lt!531042 (getCurrentListMapNoExtraKeys!4962 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun i!673 () (_ BitVec 32))

(declare-datatypes ((Unit!38839 0))(
  ( (Unit!38840) )
))
(declare-fun lt!531046 () Unit!38839)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!783 (array!76033 array!76035 (_ BitVec 32) (_ BitVec 32) V!44611 V!44611 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38839)

(assert (=> b!1176540 (= lt!531046 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!783 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1176541 () Bool)

(declare-fun res!781451 () Bool)

(declare-fun e!668794 () Bool)

(assert (=> b!1176541 (=> (not res!781451) (not e!668794))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76033 (_ BitVec 32)) Bool)

(assert (=> b!1176541 (= res!781451 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun e!668806 () Bool)

(declare-fun b!1176542 () Bool)

(declare-fun arrayContainsKey!0 (array!76033 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1176542 (= e!668806 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176543 () Bool)

(declare-fun e!668795 () Unit!38839)

(declare-fun Unit!38841 () Unit!38839)

(assert (=> b!1176543 (= e!668795 Unit!38841)))

(declare-fun b!1176544 () Bool)

(declare-fun e!668798 () Bool)

(assert (=> b!1176544 (= e!668798 e!668806)))

(declare-fun res!781462 () Bool)

(assert (=> b!1176544 (=> res!781462 e!668806)))

(assert (=> b!1176544 (= res!781462 (not (= (select (arr!36666 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1176546 () Bool)

(declare-fun res!781459 () Bool)

(assert (=> b!1176546 (=> (not res!781459) (not e!668794))))

(assert (=> b!1176546 (= res!781459 (validKeyInArray!0 k0!934))))

(declare-fun b!1176547 () Bool)

(declare-fun e!668797 () Bool)

(assert (=> b!1176547 (= e!668794 e!668797)))

(declare-fun res!781458 () Bool)

(assert (=> b!1176547 (=> (not res!781458) (not e!668797))))

(assert (=> b!1176547 (= res!781458 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531034 mask!1564))))

(assert (=> b!1176547 (= lt!531034 (array!76034 (store (arr!36666 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37202 _keys!1208)))))

(declare-fun b!1176548 () Bool)

(assert (=> b!1176548 (= e!668799 true)))

(declare-fun e!668801 () Bool)

(assert (=> b!1176548 e!668801))

(declare-fun res!781450 () Bool)

(assert (=> b!1176548 (=> (not res!781450) (not e!668801))))

(assert (=> b!1176548 (= res!781450 (not (= (select (arr!36666 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531041 () Unit!38839)

(assert (=> b!1176548 (= lt!531041 e!668795)))

(declare-fun c!116748 () Bool)

(assert (=> b!1176548 (= c!116748 (= (select (arr!36666 _keys!1208) from!1455) k0!934))))

(assert (=> b!1176548 e!668798))

(declare-fun res!781453 () Bool)

(assert (=> b!1176548 (=> (not res!781453) (not e!668798))))

(declare-fun lt!531048 () ListLongMap!16975)

(declare-fun lt!531037 () tuple2!19006)

(declare-fun +!3819 (ListLongMap!16975 tuple2!19006) ListLongMap!16975)

(assert (=> b!1176548 (= res!781453 (= lt!531048 (+!3819 lt!531040 lt!531037)))))

(declare-fun lt!531044 () V!44611)

(declare-fun get!18727 (ValueCell!14097 V!44611) V!44611)

(assert (=> b!1176548 (= lt!531037 (tuple2!19007 (select (arr!36666 _keys!1208) from!1455) (get!18727 (select (arr!36667 _values!996) from!1455) lt!531044)))))

(declare-fun b!1176549 () Bool)

(declare-fun res!781456 () Bool)

(assert (=> b!1176549 (=> (not res!781456) (not e!668794))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1176549 (= res!781456 (validMask!0 mask!1564))))

(declare-fun b!1176550 () Bool)

(declare-fun res!781454 () Bool)

(assert (=> b!1176550 (=> (not res!781454) (not e!668794))))

(assert (=> b!1176550 (= res!781454 (and (= (size!37203 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37202 _keys!1208) (size!37203 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1176551 () Bool)

(declare-fun e!668804 () Bool)

(assert (=> b!1176551 (= e!668804 e!668803)))

(declare-fun res!781463 () Bool)

(assert (=> b!1176551 (=> res!781463 e!668803)))

(assert (=> b!1176551 (= res!781463 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1176551 (= lt!531048 (getCurrentListMapNoExtraKeys!4962 lt!531034 lt!531043 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1176551 (= lt!531043 (array!76036 (store (arr!36667 _values!996) i!673 (ValueCellFull!14097 lt!531044)) (size!37203 _values!996)))))

(declare-fun dynLambda!2927 (Int (_ BitVec 64)) V!44611)

(assert (=> b!1176551 (= lt!531044 (dynLambda!2927 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!531036 () ListLongMap!16975)

(assert (=> b!1176551 (= lt!531036 (getCurrentListMapNoExtraKeys!4962 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1176552 () Bool)

(declare-fun res!781461 () Bool)

(assert (=> b!1176552 (=> (not res!781461) (not e!668794))))

(assert (=> b!1176552 (= res!781461 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37202 _keys!1208))))))

(declare-fun b!1176553 () Bool)

(declare-fun res!781464 () Bool)

(assert (=> b!1176553 (=> (not res!781464) (not e!668794))))

(assert (=> b!1176553 (= res!781464 (= (select (arr!36666 _keys!1208) i!673) k0!934))))

(declare-fun b!1176554 () Bool)

(assert (=> b!1176554 (= e!668801 (= lt!531036 (+!3819 lt!531042 lt!531037)))))

(declare-fun b!1176555 () Bool)

(declare-fun Unit!38842 () Unit!38839)

(assert (=> b!1176555 (= e!668795 Unit!38842)))

(declare-fun lt!531045 () Unit!38839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76033 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38839)

(assert (=> b!1176555 (= lt!531045 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1176555 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531038 () Unit!38839)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76033 (_ BitVec 32) (_ BitVec 32)) Unit!38839)

(assert (=> b!1176555 (= lt!531038 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(declare-datatypes ((List!25745 0))(
  ( (Nil!25742) (Cons!25741 (h!26950 (_ BitVec 64)) (t!37820 List!25745)) )
))
(declare-fun arrayNoDuplicates!0 (array!76033 (_ BitVec 32) List!25745) Bool)

(assert (=> b!1176555 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25742)))

(declare-fun lt!531039 () Unit!38839)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76033 (_ BitVec 64) (_ BitVec 32) List!25745) Unit!38839)

(assert (=> b!1176555 (= lt!531039 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25742))))

(assert (=> b!1176555 false))

(declare-fun mapIsEmpty!46247 () Bool)

(declare-fun mapRes!46247 () Bool)

(assert (=> mapIsEmpty!46247 mapRes!46247))

(declare-fun b!1176556 () Bool)

(declare-fun e!668805 () Bool)

(declare-fun tp_is_empty!29613 () Bool)

(assert (=> b!1176556 (= e!668805 tp_is_empty!29613)))

(declare-fun res!781452 () Bool)

(assert (=> start!99504 (=> (not res!781452) (not e!668794))))

(assert (=> start!99504 (= res!781452 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37202 _keys!1208))))))

(assert (=> start!99504 e!668794))

(assert (=> start!99504 tp_is_empty!29613))

(declare-fun array_inv!28002 (array!76033) Bool)

(assert (=> start!99504 (array_inv!28002 _keys!1208)))

(assert (=> start!99504 true))

(assert (=> start!99504 tp!87963))

(declare-fun e!668802 () Bool)

(declare-fun array_inv!28003 (array!76035) Bool)

(assert (=> start!99504 (and (array_inv!28003 _values!996) e!668802)))

(declare-fun b!1176545 () Bool)

(assert (=> b!1176545 (= e!668797 (not e!668804))))

(declare-fun res!781455 () Bool)

(assert (=> b!1176545 (=> res!781455 e!668804)))

(assert (=> b!1176545 (= res!781455 (bvsgt from!1455 i!673))))

(assert (=> b!1176545 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531047 () Unit!38839)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76033 (_ BitVec 64) (_ BitVec 32)) Unit!38839)

(assert (=> b!1176545 (= lt!531047 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1176557 () Bool)

(declare-fun res!781460 () Bool)

(assert (=> b!1176557 (=> (not res!781460) (not e!668797))))

(assert (=> b!1176557 (= res!781460 (arrayNoDuplicates!0 lt!531034 #b00000000000000000000000000000000 Nil!25742))))

(declare-fun b!1176558 () Bool)

(declare-fun e!668796 () Bool)

(assert (=> b!1176558 (= e!668796 tp_is_empty!29613)))

(declare-fun b!1176559 () Bool)

(assert (=> b!1176559 (= e!668802 (and e!668805 mapRes!46247))))

(declare-fun condMapEmpty!46247 () Bool)

(declare-fun mapDefault!46247 () ValueCell!14097)

(assert (=> b!1176559 (= condMapEmpty!46247 (= (arr!36667 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14097)) mapDefault!46247)))))

(declare-fun mapNonEmpty!46247 () Bool)

(declare-fun tp!87962 () Bool)

(assert (=> mapNonEmpty!46247 (= mapRes!46247 (and tp!87962 e!668796))))

(declare-fun mapRest!46247 () (Array (_ BitVec 32) ValueCell!14097))

(declare-fun mapKey!46247 () (_ BitVec 32))

(declare-fun mapValue!46247 () ValueCell!14097)

(assert (=> mapNonEmpty!46247 (= (arr!36667 _values!996) (store mapRest!46247 mapKey!46247 mapValue!46247))))

(declare-fun b!1176560 () Bool)

(declare-fun res!781457 () Bool)

(assert (=> b!1176560 (=> (not res!781457) (not e!668794))))

(assert (=> b!1176560 (= res!781457 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25742))))

(assert (= (and start!99504 res!781452) b!1176549))

(assert (= (and b!1176549 res!781456) b!1176550))

(assert (= (and b!1176550 res!781454) b!1176541))

(assert (= (and b!1176541 res!781451) b!1176560))

(assert (= (and b!1176560 res!781457) b!1176552))

(assert (= (and b!1176552 res!781461) b!1176546))

(assert (= (and b!1176546 res!781459) b!1176553))

(assert (= (and b!1176553 res!781464) b!1176547))

(assert (= (and b!1176547 res!781458) b!1176557))

(assert (= (and b!1176557 res!781460) b!1176545))

(assert (= (and b!1176545 (not res!781455)) b!1176551))

(assert (= (and b!1176551 (not res!781463)) b!1176540))

(assert (= (and b!1176540 (not res!781465)) b!1176548))

(assert (= (and b!1176548 res!781453) b!1176544))

(assert (= (and b!1176544 (not res!781462)) b!1176542))

(assert (= (and b!1176548 c!116748) b!1176555))

(assert (= (and b!1176548 (not c!116748)) b!1176543))

(assert (= (and b!1176548 res!781450) b!1176554))

(assert (= (and b!1176559 condMapEmpty!46247) mapIsEmpty!46247))

(assert (= (and b!1176559 (not condMapEmpty!46247)) mapNonEmpty!46247))

(get-info :version)

(assert (= (and mapNonEmpty!46247 ((_ is ValueCellFull!14097) mapValue!46247)) b!1176558))

(assert (= (and b!1176559 ((_ is ValueCellFull!14097) mapDefault!46247)) b!1176556))

(assert (= start!99504 b!1176559))

(declare-fun b_lambda!20227 () Bool)

(assert (=> (not b_lambda!20227) (not b!1176551)))

(declare-fun t!37818 () Bool)

(declare-fun tb!9895 () Bool)

(assert (=> (and start!99504 (= defaultEntry!1004 defaultEntry!1004) t!37818) tb!9895))

(declare-fun result!20357 () Bool)

(assert (=> tb!9895 (= result!20357 tp_is_empty!29613)))

(assert (=> b!1176551 t!37818))

(declare-fun b_and!41035 () Bool)

(assert (= b_and!41033 (and (=> t!37818 result!20357) b_and!41035)))

(declare-fun m!1084473 () Bool)

(assert (=> b!1176554 m!1084473))

(declare-fun m!1084475 () Bool)

(assert (=> b!1176540 m!1084475))

(declare-fun m!1084477 () Bool)

(assert (=> b!1176540 m!1084477))

(declare-fun m!1084479 () Bool)

(assert (=> b!1176540 m!1084479))

(declare-fun m!1084481 () Bool)

(assert (=> b!1176540 m!1084481))

(declare-fun m!1084483 () Bool)

(assert (=> b!1176540 m!1084483))

(declare-fun m!1084485 () Bool)

(assert (=> b!1176540 m!1084485))

(assert (=> b!1176540 m!1084483))

(assert (=> b!1176548 m!1084483))

(declare-fun m!1084487 () Bool)

(assert (=> b!1176548 m!1084487))

(declare-fun m!1084489 () Bool)

(assert (=> b!1176548 m!1084489))

(assert (=> b!1176548 m!1084489))

(declare-fun m!1084491 () Bool)

(assert (=> b!1176548 m!1084491))

(assert (=> b!1176544 m!1084483))

(declare-fun m!1084493 () Bool)

(assert (=> b!1176542 m!1084493))

(declare-fun m!1084495 () Bool)

(assert (=> b!1176560 m!1084495))

(declare-fun m!1084497 () Bool)

(assert (=> start!99504 m!1084497))

(declare-fun m!1084499 () Bool)

(assert (=> start!99504 m!1084499))

(declare-fun m!1084501 () Bool)

(assert (=> mapNonEmpty!46247 m!1084501))

(declare-fun m!1084503 () Bool)

(assert (=> b!1176553 m!1084503))

(declare-fun m!1084505 () Bool)

(assert (=> b!1176547 m!1084505))

(declare-fun m!1084507 () Bool)

(assert (=> b!1176547 m!1084507))

(declare-fun m!1084509 () Bool)

(assert (=> b!1176551 m!1084509))

(declare-fun m!1084511 () Bool)

(assert (=> b!1176551 m!1084511))

(declare-fun m!1084513 () Bool)

(assert (=> b!1176551 m!1084513))

(declare-fun m!1084515 () Bool)

(assert (=> b!1176551 m!1084515))

(declare-fun m!1084517 () Bool)

(assert (=> b!1176555 m!1084517))

(declare-fun m!1084519 () Bool)

(assert (=> b!1176555 m!1084519))

(declare-fun m!1084521 () Bool)

(assert (=> b!1176555 m!1084521))

(declare-fun m!1084523 () Bool)

(assert (=> b!1176555 m!1084523))

(declare-fun m!1084525 () Bool)

(assert (=> b!1176555 m!1084525))

(declare-fun m!1084527 () Bool)

(assert (=> b!1176545 m!1084527))

(declare-fun m!1084529 () Bool)

(assert (=> b!1176545 m!1084529))

(declare-fun m!1084531 () Bool)

(assert (=> b!1176546 m!1084531))

(declare-fun m!1084533 () Bool)

(assert (=> b!1176549 m!1084533))

(declare-fun m!1084535 () Bool)

(assert (=> b!1176557 m!1084535))

(declare-fun m!1084537 () Bool)

(assert (=> b!1176541 m!1084537))

(check-sat (not b!1176546) (not b!1176548) tp_is_empty!29613 (not start!99504) (not b_next!25083) (not b!1176551) (not b!1176549) (not b!1176555) b_and!41035 (not b!1176560) (not b!1176557) (not b!1176554) (not b_lambda!20227) (not b!1176542) (not mapNonEmpty!46247) (not b!1176547) (not b!1176545) (not b!1176541) (not b!1176540))
(check-sat b_and!41035 (not b_next!25083))
