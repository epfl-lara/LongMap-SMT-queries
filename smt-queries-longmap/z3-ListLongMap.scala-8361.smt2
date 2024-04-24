; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!101984 () Bool)

(assert start!101984)

(declare-fun b_free!26437 () Bool)

(declare-fun b_next!26437 () Bool)

(assert (=> start!101984 (= b_free!26437 (not b_next!26437))))

(declare-fun tp!92357 () Bool)

(declare-fun b_and!44137 () Bool)

(assert (=> start!101984 (= tp!92357 b_and!44137)))

(declare-fun b!1226296 () Bool)

(declare-fun res!814557 () Bool)

(declare-fun e!696593 () Bool)

(assert (=> b!1226296 (=> (not res!814557) (not e!696593))))

(declare-datatypes ((array!79103 0))(
  ( (array!79104 (arr!38172 (Array (_ BitVec 32) (_ BitVec 64))) (size!38709 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!79103)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!46649 0))(
  ( (V!46650 (val!15627 Int)) )
))
(declare-datatypes ((ValueCell!14861 0))(
  ( (ValueCellFull!14861 (v!18285 V!46649)) (EmptyCell!14861) )
))
(declare-datatypes ((array!79105 0))(
  ( (array!79106 (arr!38173 (Array (_ BitVec 32) ValueCell!14861)) (size!38710 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!79105)

(assert (=> b!1226296 (= res!814557 (and (= (size!38710 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!38709 _keys!1208) (size!38710 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1226297 () Bool)

(declare-fun res!814559 () Bool)

(assert (=> b!1226297 (=> (not res!814559) (not e!696593))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1226297 (= res!814559 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!38709 _keys!1208))))))

(declare-fun b!1226298 () Bool)

(declare-fun e!696585 () Bool)

(declare-fun e!696589 () Bool)

(declare-fun mapRes!48610 () Bool)

(assert (=> b!1226298 (= e!696585 (and e!696589 mapRes!48610))))

(declare-fun condMapEmpty!48610 () Bool)

(declare-fun mapDefault!48610 () ValueCell!14861)

(assert (=> b!1226298 (= condMapEmpty!48610 (= (arr!38173 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14861)) mapDefault!48610)))))

(declare-fun b!1226299 () Bool)

(declare-fun res!814563 () Bool)

(assert (=> b!1226299 (=> (not res!814563) (not e!696593))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1226299 (= res!814563 (validMask!0 mask!1564))))

(declare-fun b!1226300 () Bool)

(declare-fun res!814549 () Bool)

(declare-fun e!696595 () Bool)

(assert (=> b!1226300 (=> (not res!814549) (not e!696595))))

(declare-fun lt!558498 () array!79103)

(declare-datatypes ((List!26968 0))(
  ( (Nil!26965) (Cons!26964 (h!28182 (_ BitVec 64)) (t!40377 List!26968)) )
))
(declare-fun arrayNoDuplicates!0 (array!79103 (_ BitVec 32) List!26968) Bool)

(assert (=> b!1226300 (= res!814549 (arrayNoDuplicates!0 lt!558498 #b00000000000000000000000000000000 Nil!26965))))

(declare-fun b!1226301 () Bool)

(declare-fun e!696594 () Bool)

(declare-fun e!696587 () Bool)

(assert (=> b!1226301 (= e!696594 e!696587)))

(declare-fun res!814555 () Bool)

(assert (=> b!1226301 (=> res!814555 e!696587)))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1226301 (= res!814555 (not (= (select (arr!38172 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1226303 () Bool)

(declare-fun res!814554 () Bool)

(assert (=> b!1226303 (=> (not res!814554) (not e!696593))))

(assert (=> b!1226303 (= res!814554 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26965))))

(declare-fun b!1226304 () Bool)

(declare-fun res!814552 () Bool)

(assert (=> b!1226304 (=> (not res!814552) (not e!696593))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1226304 (= res!814552 (validKeyInArray!0 k0!934))))

(declare-fun b!1226305 () Bool)

(declare-fun tp_is_empty!31141 () Bool)

(assert (=> b!1226305 (= e!696589 tp_is_empty!31141)))

(declare-fun b!1226306 () Bool)

(declare-fun e!696591 () Bool)

(assert (=> b!1226306 (= e!696591 tp_is_empty!31141)))

(declare-fun b!1226307 () Bool)

(declare-fun res!814556 () Bool)

(assert (=> b!1226307 (=> (not res!814556) (not e!696593))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!79103 (_ BitVec 32)) Bool)

(assert (=> b!1226307 (= res!814556 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1226308 () Bool)

(declare-datatypes ((Unit!40568 0))(
  ( (Unit!40569) )
))
(declare-fun e!696584 () Unit!40568)

(declare-fun Unit!40570 () Unit!40568)

(assert (=> b!1226308 (= e!696584 Unit!40570)))

(declare-fun b!1226309 () Bool)

(declare-fun e!696586 () Bool)

(declare-fun e!696590 () Bool)

(assert (=> b!1226309 (= e!696586 e!696590)))

(declare-fun res!814550 () Bool)

(assert (=> b!1226309 (=> res!814550 e!696590)))

(assert (=> b!1226309 (= res!814550 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!46649)

(declare-fun minValue!944 () V!46649)

(declare-datatypes ((tuple2!20156 0))(
  ( (tuple2!20157 (_1!10089 (_ BitVec 64)) (_2!10089 V!46649)) )
))
(declare-datatypes ((List!26969 0))(
  ( (Nil!26966) (Cons!26965 (h!28183 tuple2!20156) (t!40378 List!26969)) )
))
(declare-datatypes ((ListLongMap!18133 0))(
  ( (ListLongMap!18134 (toList!9082 List!26969)) )
))
(declare-fun lt!558482 () ListLongMap!18133)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!558483 () array!79105)

(declare-fun getCurrentListMapNoExtraKeys!5529 (array!79103 array!79105 (_ BitVec 32) (_ BitVec 32) V!46649 V!46649 (_ BitVec 32) Int) ListLongMap!18133)

(assert (=> b!1226309 (= lt!558482 (getCurrentListMapNoExtraKeys!5529 lt!558498 lt!558483 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!558494 () V!46649)

(assert (=> b!1226309 (= lt!558483 (array!79106 (store (arr!38173 _values!996) i!673 (ValueCellFull!14861 lt!558494)) (size!38710 _values!996)))))

(declare-fun dynLambda!3427 (Int (_ BitVec 64)) V!46649)

(assert (=> b!1226309 (= lt!558494 (dynLambda!3427 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!558490 () ListLongMap!18133)

(assert (=> b!1226309 (= lt!558490 (getCurrentListMapNoExtraKeys!5529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1226310 () Bool)

(declare-fun e!696592 () Bool)

(assert (=> b!1226310 (= e!696590 e!696592)))

(declare-fun res!814558 () Bool)

(assert (=> b!1226310 (=> res!814558 e!696592)))

(assert (=> b!1226310 (= res!814558 (not (validKeyInArray!0 (select (arr!38172 _keys!1208) from!1455))))))

(declare-fun lt!558500 () ListLongMap!18133)

(declare-fun lt!558492 () ListLongMap!18133)

(assert (=> b!1226310 (= lt!558500 lt!558492)))

(declare-fun lt!558497 () ListLongMap!18133)

(declare-fun -!1953 (ListLongMap!18133 (_ BitVec 64)) ListLongMap!18133)

(assert (=> b!1226310 (= lt!558492 (-!1953 lt!558497 k0!934))))

(assert (=> b!1226310 (= lt!558500 (getCurrentListMapNoExtraKeys!5529 lt!558498 lt!558483 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1226310 (= lt!558497 (getCurrentListMapNoExtraKeys!5529 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!558486 () Unit!40568)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1168 (array!79103 array!79105 (_ BitVec 32) (_ BitVec 32) V!46649 V!46649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!40568)

(assert (=> b!1226310 (= lt!558486 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!1168 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1226311 () Bool)

(assert (=> b!1226311 (= e!696593 e!696595)))

(declare-fun res!814562 () Bool)

(assert (=> b!1226311 (=> (not res!814562) (not e!696595))))

(assert (=> b!1226311 (= res!814562 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!558498 mask!1564))))

(assert (=> b!1226311 (= lt!558498 (array!79104 (store (arr!38172 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!38709 _keys!1208)))))

(declare-fun b!1226312 () Bool)

(declare-fun Unit!40571 () Unit!40568)

(assert (=> b!1226312 (= e!696584 Unit!40571)))

(declare-fun lt!558496 () Unit!40568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!79103 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!40568)

(assert (=> b!1226312 (= lt!558496 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!79103 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1226312 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!558485 () Unit!40568)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!79103 (_ BitVec 32) (_ BitVec 32)) Unit!40568)

(assert (=> b!1226312 (= lt!558485 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1226312 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26965)))

(declare-fun lt!558499 () Unit!40568)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!79103 (_ BitVec 64) (_ BitVec 32) List!26968) Unit!40568)

(assert (=> b!1226312 (= lt!558499 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26965))))

(assert (=> b!1226312 false))

(declare-fun b!1226313 () Bool)

(assert (=> b!1226313 (= e!696587 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1226302 () Bool)

(declare-fun res!814561 () Bool)

(assert (=> b!1226302 (=> (not res!814561) (not e!696593))))

(assert (=> b!1226302 (= res!814561 (= (select (arr!38172 _keys!1208) i!673) k0!934))))

(declare-fun res!814560 () Bool)

(assert (=> start!101984 (=> (not res!814560) (not e!696593))))

(assert (=> start!101984 (= res!814560 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!38709 _keys!1208))))))

(assert (=> start!101984 e!696593))

(assert (=> start!101984 tp_is_empty!31141))

(declare-fun array_inv!29122 (array!79103) Bool)

(assert (=> start!101984 (array_inv!29122 _keys!1208)))

(assert (=> start!101984 true))

(assert (=> start!101984 tp!92357))

(declare-fun array_inv!29123 (array!79105) Bool)

(assert (=> start!101984 (and (array_inv!29123 _values!996) e!696585)))

(declare-fun b!1226314 () Bool)

(assert (=> b!1226314 (= e!696595 (not e!696586))))

(declare-fun res!814551 () Bool)

(assert (=> b!1226314 (=> res!814551 e!696586)))

(assert (=> b!1226314 (= res!814551 (bvsgt from!1455 i!673))))

(assert (=> b!1226314 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!558493 () Unit!40568)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!79103 (_ BitVec 64) (_ BitVec 32)) Unit!40568)

(assert (=> b!1226314 (= lt!558493 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!48610 () Bool)

(declare-fun tp!92356 () Bool)

(assert (=> mapNonEmpty!48610 (= mapRes!48610 (and tp!92356 e!696591))))

(declare-fun mapRest!48610 () (Array (_ BitVec 32) ValueCell!14861))

(declare-fun mapKey!48610 () (_ BitVec 32))

(declare-fun mapValue!48610 () ValueCell!14861)

(assert (=> mapNonEmpty!48610 (= (arr!38173 _values!996) (store mapRest!48610 mapKey!48610 mapValue!48610))))

(declare-fun mapIsEmpty!48610 () Bool)

(assert (=> mapIsEmpty!48610 mapRes!48610))

(declare-fun b!1226315 () Bool)

(assert (=> b!1226315 (= e!696592 true)))

(declare-fun lt!558484 () ListLongMap!18133)

(declare-fun lt!558489 () ListLongMap!18133)

(assert (=> b!1226315 (= (-!1953 lt!558484 k0!934) lt!558489)))

(declare-fun lt!558491 () Unit!40568)

(declare-fun lt!558488 () V!46649)

(declare-fun addRemoveCommutativeForDiffKeys!217 (ListLongMap!18133 (_ BitVec 64) V!46649 (_ BitVec 64)) Unit!40568)

(assert (=> b!1226315 (= lt!558491 (addRemoveCommutativeForDiffKeys!217 lt!558497 (select (arr!38172 _keys!1208) from!1455) lt!558488 k0!934))))

(assert (=> b!1226315 (and (= lt!558490 lt!558484) (= lt!558492 lt!558500))))

(declare-fun lt!558495 () tuple2!20156)

(declare-fun +!4182 (ListLongMap!18133 tuple2!20156) ListLongMap!18133)

(assert (=> b!1226315 (= lt!558484 (+!4182 lt!558497 lt!558495))))

(assert (=> b!1226315 (not (= (select (arr!38172 _keys!1208) from!1455) k0!934))))

(declare-fun lt!558487 () Unit!40568)

(assert (=> b!1226315 (= lt!558487 e!696584)))

(declare-fun c!120874 () Bool)

(assert (=> b!1226315 (= c!120874 (= (select (arr!38172 _keys!1208) from!1455) k0!934))))

(assert (=> b!1226315 e!696594))

(declare-fun res!814553 () Bool)

(assert (=> b!1226315 (=> (not res!814553) (not e!696594))))

(assert (=> b!1226315 (= res!814553 (= lt!558482 lt!558489))))

(assert (=> b!1226315 (= lt!558489 (+!4182 lt!558492 lt!558495))))

(assert (=> b!1226315 (= lt!558495 (tuple2!20157 (select (arr!38172 _keys!1208) from!1455) lt!558488))))

(declare-fun get!19542 (ValueCell!14861 V!46649) V!46649)

(assert (=> b!1226315 (= lt!558488 (get!19542 (select (arr!38173 _values!996) from!1455) lt!558494))))

(assert (= (and start!101984 res!814560) b!1226299))

(assert (= (and b!1226299 res!814563) b!1226296))

(assert (= (and b!1226296 res!814557) b!1226307))

(assert (= (and b!1226307 res!814556) b!1226303))

(assert (= (and b!1226303 res!814554) b!1226297))

(assert (= (and b!1226297 res!814559) b!1226304))

(assert (= (and b!1226304 res!814552) b!1226302))

(assert (= (and b!1226302 res!814561) b!1226311))

(assert (= (and b!1226311 res!814562) b!1226300))

(assert (= (and b!1226300 res!814549) b!1226314))

(assert (= (and b!1226314 (not res!814551)) b!1226309))

(assert (= (and b!1226309 (not res!814550)) b!1226310))

(assert (= (and b!1226310 (not res!814558)) b!1226315))

(assert (= (and b!1226315 res!814553) b!1226301))

(assert (= (and b!1226301 (not res!814555)) b!1226313))

(assert (= (and b!1226315 c!120874) b!1226312))

(assert (= (and b!1226315 (not c!120874)) b!1226308))

(assert (= (and b!1226298 condMapEmpty!48610) mapIsEmpty!48610))

(assert (= (and b!1226298 (not condMapEmpty!48610)) mapNonEmpty!48610))

(get-info :version)

(assert (= (and mapNonEmpty!48610 ((_ is ValueCellFull!14861) mapValue!48610)) b!1226306))

(assert (= (and b!1226298 ((_ is ValueCellFull!14861) mapDefault!48610)) b!1226305))

(assert (= start!101984 b!1226298))

(declare-fun b_lambda!22411 () Bool)

(assert (=> (not b_lambda!22411) (not b!1226309)))

(declare-fun t!40376 () Bool)

(declare-fun tb!11229 () Bool)

(assert (=> (and start!101984 (= defaultEntry!1004 defaultEntry!1004) t!40376) tb!11229))

(declare-fun result!23079 () Bool)

(assert (=> tb!11229 (= result!23079 tp_is_empty!31141)))

(assert (=> b!1226309 t!40376))

(declare-fun b_and!44139 () Bool)

(assert (= b_and!44137 (and (=> t!40376 result!23079) b_and!44139)))

(declare-fun m!1131647 () Bool)

(assert (=> b!1226304 m!1131647))

(declare-fun m!1131649 () Bool)

(assert (=> b!1226314 m!1131649))

(declare-fun m!1131651 () Bool)

(assert (=> b!1226314 m!1131651))

(declare-fun m!1131653 () Bool)

(assert (=> b!1226302 m!1131653))

(declare-fun m!1131655 () Bool)

(assert (=> b!1226312 m!1131655))

(declare-fun m!1131657 () Bool)

(assert (=> b!1226312 m!1131657))

(declare-fun m!1131659 () Bool)

(assert (=> b!1226312 m!1131659))

(declare-fun m!1131661 () Bool)

(assert (=> b!1226312 m!1131661))

(declare-fun m!1131663 () Bool)

(assert (=> b!1226312 m!1131663))

(declare-fun m!1131665 () Bool)

(assert (=> mapNonEmpty!48610 m!1131665))

(declare-fun m!1131667 () Bool)

(assert (=> b!1226303 m!1131667))

(declare-fun m!1131669 () Bool)

(assert (=> b!1226307 m!1131669))

(declare-fun m!1131671 () Bool)

(assert (=> b!1226299 m!1131671))

(declare-fun m!1131673 () Bool)

(assert (=> b!1226300 m!1131673))

(declare-fun m!1131675 () Bool)

(assert (=> b!1226310 m!1131675))

(declare-fun m!1131677 () Bool)

(assert (=> b!1226310 m!1131677))

(declare-fun m!1131679 () Bool)

(assert (=> b!1226310 m!1131679))

(declare-fun m!1131681 () Bool)

(assert (=> b!1226310 m!1131681))

(declare-fun m!1131683 () Bool)

(assert (=> b!1226310 m!1131683))

(declare-fun m!1131685 () Bool)

(assert (=> b!1226310 m!1131685))

(assert (=> b!1226310 m!1131683))

(declare-fun m!1131687 () Bool)

(assert (=> b!1226315 m!1131687))

(assert (=> b!1226315 m!1131683))

(declare-fun m!1131689 () Bool)

(assert (=> b!1226315 m!1131689))

(declare-fun m!1131691 () Bool)

(assert (=> b!1226315 m!1131691))

(declare-fun m!1131693 () Bool)

(assert (=> b!1226315 m!1131693))

(assert (=> b!1226315 m!1131683))

(declare-fun m!1131695 () Bool)

(assert (=> b!1226315 m!1131695))

(assert (=> b!1226315 m!1131695))

(declare-fun m!1131697 () Bool)

(assert (=> b!1226315 m!1131697))

(assert (=> b!1226301 m!1131683))

(declare-fun m!1131699 () Bool)

(assert (=> start!101984 m!1131699))

(declare-fun m!1131701 () Bool)

(assert (=> start!101984 m!1131701))

(declare-fun m!1131703 () Bool)

(assert (=> b!1226309 m!1131703))

(declare-fun m!1131705 () Bool)

(assert (=> b!1226309 m!1131705))

(declare-fun m!1131707 () Bool)

(assert (=> b!1226309 m!1131707))

(declare-fun m!1131709 () Bool)

(assert (=> b!1226309 m!1131709))

(declare-fun m!1131711 () Bool)

(assert (=> b!1226311 m!1131711))

(declare-fun m!1131713 () Bool)

(assert (=> b!1226311 m!1131713))

(declare-fun m!1131715 () Bool)

(assert (=> b!1226313 m!1131715))

(check-sat (not b!1226310) (not b_lambda!22411) (not b!1226299) (not b_next!26437) (not b!1226304) (not b!1226313) (not start!101984) b_and!44139 (not mapNonEmpty!48610) (not b!1226311) tp_is_empty!31141 (not b!1226315) (not b!1226314) (not b!1226309) (not b!1226312) (not b!1226300) (not b!1226307) (not b!1226303))
(check-sat b_and!44139 (not b_next!26437))
