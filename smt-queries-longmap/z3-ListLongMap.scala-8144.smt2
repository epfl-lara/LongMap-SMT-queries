; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99724 () Bool)

(assert start!99724)

(declare-fun b_free!25309 () Bool)

(declare-fun b_next!25309 () Bool)

(assert (=> start!99724 (= b_free!25309 (not b_next!25309))))

(declare-fun tp!88640 () Bool)

(declare-fun b_and!41463 () Bool)

(assert (=> start!99724 (= tp!88640 b_and!41463)))

(declare-fun b!1183741 () Bool)

(declare-fun res!786793 () Bool)

(declare-fun e!673019 () Bool)

(assert (=> b!1183741 (=> (not res!786793) (not e!673019))))

(declare-datatypes ((array!76412 0))(
  ( (array!76413 (arr!36856 (Array (_ BitVec 32) (_ BitVec 64))) (size!37394 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76412)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44913 0))(
  ( (V!44914 (val!14976 Int)) )
))
(declare-datatypes ((ValueCell!14210 0))(
  ( (ValueCellFull!14210 (v!17613 V!44913)) (EmptyCell!14210) )
))
(declare-datatypes ((array!76414 0))(
  ( (array!76415 (arr!36857 (Array (_ BitVec 32) ValueCell!14210)) (size!37395 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76414)

(assert (=> b!1183741 (= res!786793 (and (= (size!37395 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37394 _keys!1208) (size!37395 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183742 () Bool)

(declare-fun res!786799 () Bool)

(assert (=> b!1183742 (=> (not res!786799) (not e!673019))))

(declare-datatypes ((List!26021 0))(
  ( (Nil!26018) (Cons!26017 (h!27226 (_ BitVec 64)) (t!38313 List!26021)) )
))
(declare-fun arrayNoDuplicates!0 (array!76412 (_ BitVec 32) List!26021) Bool)

(assert (=> b!1183742 (= res!786799 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!26018))))

(declare-fun b!1183743 () Bool)

(declare-fun res!786800 () Bool)

(assert (=> b!1183743 (=> (not res!786800) (not e!673019))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183743 (= res!786800 (validMask!0 mask!1564))))

(declare-fun b!1183744 () Bool)

(declare-fun res!786791 () Bool)

(assert (=> b!1183744 (=> (not res!786791) (not e!673019))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1183744 (= res!786791 (= (select (arr!36856 _keys!1208) i!673) k0!934))))

(declare-fun b!1183745 () Bool)

(declare-fun e!673024 () Bool)

(declare-fun tp_is_empty!29839 () Bool)

(assert (=> b!1183745 (= e!673024 tp_is_empty!29839)))

(declare-fun b!1183746 () Bool)

(declare-fun e!673018 () Bool)

(assert (=> b!1183746 (= e!673018 true)))

(declare-datatypes ((tuple2!19312 0))(
  ( (tuple2!19313 (_1!9667 (_ BitVec 64)) (_2!9667 V!44913)) )
))
(declare-datatypes ((List!26022 0))(
  ( (Nil!26019) (Cons!26018 (h!27227 tuple2!19312) (t!38314 List!26022)) )
))
(declare-datatypes ((ListLongMap!17281 0))(
  ( (ListLongMap!17282 (toList!8656 List!26022)) )
))
(declare-fun lt!536380 () ListLongMap!17281)

(declare-fun lt!536374 () ListLongMap!17281)

(declare-fun -!1610 (ListLongMap!17281 (_ BitVec 64)) ListLongMap!17281)

(assert (=> b!1183746 (= (-!1610 lt!536380 k0!934) lt!536374)))

(declare-fun lt!536383 () V!44913)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((Unit!39050 0))(
  ( (Unit!39051) )
))
(declare-fun lt!536382 () Unit!39050)

(declare-fun lt!536385 () ListLongMap!17281)

(declare-fun addRemoveCommutativeForDiffKeys!157 (ListLongMap!17281 (_ BitVec 64) V!44913 (_ BitVec 64)) Unit!39050)

(assert (=> b!1183746 (= lt!536382 (addRemoveCommutativeForDiffKeys!157 lt!536385 (select (arr!36856 _keys!1208) from!1455) lt!536383 k0!934))))

(declare-fun lt!536367 () ListLongMap!17281)

(declare-fun lt!536369 () ListLongMap!17281)

(declare-fun lt!536373 () ListLongMap!17281)

(assert (=> b!1183746 (and (= lt!536373 lt!536380) (= lt!536369 lt!536367))))

(declare-fun lt!536371 () tuple2!19312)

(declare-fun +!3943 (ListLongMap!17281 tuple2!19312) ListLongMap!17281)

(assert (=> b!1183746 (= lt!536380 (+!3943 lt!536385 lt!536371))))

(assert (=> b!1183746 (not (= (select (arr!36856 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536377 () Unit!39050)

(declare-fun e!673016 () Unit!39050)

(assert (=> b!1183746 (= lt!536377 e!673016)))

(declare-fun c!117061 () Bool)

(assert (=> b!1183746 (= c!117061 (= (select (arr!36856 _keys!1208) from!1455) k0!934))))

(declare-fun e!673020 () Bool)

(assert (=> b!1183746 e!673020))

(declare-fun res!786796 () Bool)

(assert (=> b!1183746 (=> (not res!786796) (not e!673020))))

(declare-fun lt!536368 () ListLongMap!17281)

(assert (=> b!1183746 (= res!786796 (= lt!536368 lt!536374))))

(assert (=> b!1183746 (= lt!536374 (+!3943 lt!536369 lt!536371))))

(assert (=> b!1183746 (= lt!536371 (tuple2!19313 (select (arr!36856 _keys!1208) from!1455) lt!536383))))

(declare-fun lt!536384 () V!44913)

(declare-fun get!18868 (ValueCell!14210 V!44913) V!44913)

(assert (=> b!1183746 (= lt!536383 (get!18868 (select (arr!36857 _values!996) from!1455) lt!536384))))

(declare-fun mapIsEmpty!46586 () Bool)

(declare-fun mapRes!46586 () Bool)

(assert (=> mapIsEmpty!46586 mapRes!46586))

(declare-fun b!1183747 () Bool)

(declare-fun e!673022 () Bool)

(declare-fun e!673014 () Bool)

(assert (=> b!1183747 (= e!673022 e!673014)))

(declare-fun res!786794 () Bool)

(assert (=> b!1183747 (=> res!786794 e!673014)))

(assert (=> b!1183747 (= res!786794 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44913)

(declare-fun lt!536375 () array!76414)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44913)

(declare-fun lt!536378 () array!76412)

(declare-fun getCurrentListMapNoExtraKeys!5111 (array!76412 array!76414 (_ BitVec 32) (_ BitVec 32) V!44913 V!44913 (_ BitVec 32) Int) ListLongMap!17281)

(assert (=> b!1183747 (= lt!536368 (getCurrentListMapNoExtraKeys!5111 lt!536378 lt!536375 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183747 (= lt!536375 (array!76415 (store (arr!36857 _values!996) i!673 (ValueCellFull!14210 lt!536384)) (size!37395 _values!996)))))

(declare-fun dynLambda!3015 (Int (_ BitVec 64)) V!44913)

(assert (=> b!1183747 (= lt!536384 (dynLambda!3015 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183747 (= lt!536373 (getCurrentListMapNoExtraKeys!5111 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!786797 () Bool)

(assert (=> start!99724 (=> (not res!786797) (not e!673019))))

(assert (=> start!99724 (= res!786797 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37394 _keys!1208))))))

(assert (=> start!99724 e!673019))

(assert (=> start!99724 tp_is_empty!29839))

(declare-fun array_inv!28244 (array!76412) Bool)

(assert (=> start!99724 (array_inv!28244 _keys!1208)))

(assert (=> start!99724 true))

(assert (=> start!99724 tp!88640))

(declare-fun e!673013 () Bool)

(declare-fun array_inv!28245 (array!76414) Bool)

(assert (=> start!99724 (and (array_inv!28245 _values!996) e!673013)))

(declare-fun b!1183748 () Bool)

(declare-fun Unit!39052 () Unit!39050)

(assert (=> b!1183748 (= e!673016 Unit!39052)))

(declare-fun lt!536379 () Unit!39050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76412 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39050)

(assert (=> b!1183748 (= lt!536379 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!76412 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183748 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536372 () Unit!39050)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76412 (_ BitVec 32) (_ BitVec 32)) Unit!39050)

(assert (=> b!1183748 (= lt!536372 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183748 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!26018)))

(declare-fun lt!536381 () Unit!39050)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76412 (_ BitVec 64) (_ BitVec 32) List!26021) Unit!39050)

(assert (=> b!1183748 (= lt!536381 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!26018))))

(assert (=> b!1183748 false))

(declare-fun b!1183749 () Bool)

(declare-fun e!673015 () Bool)

(assert (=> b!1183749 (= e!673020 e!673015)))

(declare-fun res!786792 () Bool)

(assert (=> b!1183749 (=> res!786792 e!673015)))

(assert (=> b!1183749 (= res!786792 (not (= (select (arr!36856 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183750 () Bool)

(declare-fun res!786795 () Bool)

(assert (=> b!1183750 (=> (not res!786795) (not e!673019))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183750 (= res!786795 (validKeyInArray!0 k0!934))))

(declare-fun b!1183751 () Bool)

(assert (=> b!1183751 (= e!673014 e!673018)))

(declare-fun res!786802 () Bool)

(assert (=> b!1183751 (=> res!786802 e!673018)))

(assert (=> b!1183751 (= res!786802 (not (validKeyInArray!0 (select (arr!36856 _keys!1208) from!1455))))))

(assert (=> b!1183751 (= lt!536367 lt!536369)))

(assert (=> b!1183751 (= lt!536369 (-!1610 lt!536385 k0!934))))

(assert (=> b!1183751 (= lt!536367 (getCurrentListMapNoExtraKeys!5111 lt!536378 lt!536375 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183751 (= lt!536385 (getCurrentListMapNoExtraKeys!5111 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536376 () Unit!39050)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!872 (array!76412 array!76414 (_ BitVec 32) (_ BitVec 32) V!44913 V!44913 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39050)

(assert (=> b!1183751 (= lt!536376 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!872 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183752 () Bool)

(declare-fun e!673017 () Bool)

(assert (=> b!1183752 (= e!673019 e!673017)))

(declare-fun res!786788 () Bool)

(assert (=> b!1183752 (=> (not res!786788) (not e!673017))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76412 (_ BitVec 32)) Bool)

(assert (=> b!1183752 (= res!786788 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536378 mask!1564))))

(assert (=> b!1183752 (= lt!536378 (array!76413 (store (arr!36856 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37394 _keys!1208)))))

(declare-fun b!1183753 () Bool)

(declare-fun e!673023 () Bool)

(assert (=> b!1183753 (= e!673013 (and e!673023 mapRes!46586))))

(declare-fun condMapEmpty!46586 () Bool)

(declare-fun mapDefault!46586 () ValueCell!14210)

(assert (=> b!1183753 (= condMapEmpty!46586 (= (arr!36857 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14210)) mapDefault!46586)))))

(declare-fun b!1183754 () Bool)

(declare-fun res!786790 () Bool)

(assert (=> b!1183754 (=> (not res!786790) (not e!673017))))

(assert (=> b!1183754 (= res!786790 (arrayNoDuplicates!0 lt!536378 #b00000000000000000000000000000000 Nil!26018))))

(declare-fun b!1183755 () Bool)

(assert (=> b!1183755 (= e!673017 (not e!673022))))

(declare-fun res!786801 () Bool)

(assert (=> b!1183755 (=> res!786801 e!673022)))

(assert (=> b!1183755 (= res!786801 (bvsgt from!1455 i!673))))

(assert (=> b!1183755 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536370 () Unit!39050)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76412 (_ BitVec 64) (_ BitVec 32)) Unit!39050)

(assert (=> b!1183755 (= lt!536370 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183756 () Bool)

(declare-fun res!786789 () Bool)

(assert (=> b!1183756 (=> (not res!786789) (not e!673019))))

(assert (=> b!1183756 (= res!786789 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37394 _keys!1208))))))

(declare-fun mapNonEmpty!46586 () Bool)

(declare-fun tp!88641 () Bool)

(assert (=> mapNonEmpty!46586 (= mapRes!46586 (and tp!88641 e!673024))))

(declare-fun mapValue!46586 () ValueCell!14210)

(declare-fun mapRest!46586 () (Array (_ BitVec 32) ValueCell!14210))

(declare-fun mapKey!46586 () (_ BitVec 32))

(assert (=> mapNonEmpty!46586 (= (arr!36857 _values!996) (store mapRest!46586 mapKey!46586 mapValue!46586))))

(declare-fun b!1183757 () Bool)

(declare-fun res!786798 () Bool)

(assert (=> b!1183757 (=> (not res!786798) (not e!673019))))

(assert (=> b!1183757 (= res!786798 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183758 () Bool)

(declare-fun Unit!39053 () Unit!39050)

(assert (=> b!1183758 (= e!673016 Unit!39053)))

(declare-fun b!1183759 () Bool)

(assert (=> b!1183759 (= e!673015 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183760 () Bool)

(assert (=> b!1183760 (= e!673023 tp_is_empty!29839)))

(assert (= (and start!99724 res!786797) b!1183743))

(assert (= (and b!1183743 res!786800) b!1183741))

(assert (= (and b!1183741 res!786793) b!1183757))

(assert (= (and b!1183757 res!786798) b!1183742))

(assert (= (and b!1183742 res!786799) b!1183756))

(assert (= (and b!1183756 res!786789) b!1183750))

(assert (= (and b!1183750 res!786795) b!1183744))

(assert (= (and b!1183744 res!786791) b!1183752))

(assert (= (and b!1183752 res!786788) b!1183754))

(assert (= (and b!1183754 res!786790) b!1183755))

(assert (= (and b!1183755 (not res!786801)) b!1183747))

(assert (= (and b!1183747 (not res!786794)) b!1183751))

(assert (= (and b!1183751 (not res!786802)) b!1183746))

(assert (= (and b!1183746 res!786796) b!1183749))

(assert (= (and b!1183749 (not res!786792)) b!1183759))

(assert (= (and b!1183746 c!117061) b!1183748))

(assert (= (and b!1183746 (not c!117061)) b!1183758))

(assert (= (and b!1183753 condMapEmpty!46586) mapIsEmpty!46586))

(assert (= (and b!1183753 (not condMapEmpty!46586)) mapNonEmpty!46586))

(get-info :version)

(assert (= (and mapNonEmpty!46586 ((_ is ValueCellFull!14210) mapValue!46586)) b!1183745))

(assert (= (and b!1183753 ((_ is ValueCellFull!14210) mapDefault!46586)) b!1183760))

(assert (= start!99724 b!1183753))

(declare-fun b_lambda!20435 () Bool)

(assert (=> (not b_lambda!20435) (not b!1183747)))

(declare-fun t!38312 () Bool)

(declare-fun tb!10113 () Bool)

(assert (=> (and start!99724 (= defaultEntry!1004 defaultEntry!1004) t!38312) tb!10113))

(declare-fun result!20801 () Bool)

(assert (=> tb!10113 (= result!20801 tp_is_empty!29839)))

(assert (=> b!1183747 t!38312))

(declare-fun b_and!41465 () Bool)

(assert (= b_and!41463 (and (=> t!38312 result!20801) b_and!41465)))

(declare-fun m!1091465 () Bool)

(assert (=> b!1183750 m!1091465))

(declare-fun m!1091467 () Bool)

(assert (=> b!1183749 m!1091467))

(declare-fun m!1091469 () Bool)

(assert (=> b!1183757 m!1091469))

(declare-fun m!1091471 () Bool)

(assert (=> b!1183751 m!1091471))

(declare-fun m!1091473 () Bool)

(assert (=> b!1183751 m!1091473))

(declare-fun m!1091475 () Bool)

(assert (=> b!1183751 m!1091475))

(declare-fun m!1091477 () Bool)

(assert (=> b!1183751 m!1091477))

(assert (=> b!1183751 m!1091467))

(declare-fun m!1091479 () Bool)

(assert (=> b!1183751 m!1091479))

(assert (=> b!1183751 m!1091467))

(declare-fun m!1091481 () Bool)

(assert (=> start!99724 m!1091481))

(declare-fun m!1091483 () Bool)

(assert (=> start!99724 m!1091483))

(declare-fun m!1091485 () Bool)

(assert (=> b!1183748 m!1091485))

(declare-fun m!1091487 () Bool)

(assert (=> b!1183748 m!1091487))

(declare-fun m!1091489 () Bool)

(assert (=> b!1183748 m!1091489))

(declare-fun m!1091491 () Bool)

(assert (=> b!1183748 m!1091491))

(declare-fun m!1091493 () Bool)

(assert (=> b!1183748 m!1091493))

(declare-fun m!1091495 () Bool)

(assert (=> b!1183754 m!1091495))

(declare-fun m!1091497 () Bool)

(assert (=> b!1183759 m!1091497))

(declare-fun m!1091499 () Bool)

(assert (=> b!1183743 m!1091499))

(assert (=> b!1183746 m!1091467))

(declare-fun m!1091501 () Bool)

(assert (=> b!1183746 m!1091501))

(declare-fun m!1091503 () Bool)

(assert (=> b!1183746 m!1091503))

(declare-fun m!1091505 () Bool)

(assert (=> b!1183746 m!1091505))

(declare-fun m!1091507 () Bool)

(assert (=> b!1183746 m!1091507))

(assert (=> b!1183746 m!1091503))

(declare-fun m!1091509 () Bool)

(assert (=> b!1183746 m!1091509))

(declare-fun m!1091511 () Bool)

(assert (=> b!1183746 m!1091511))

(assert (=> b!1183746 m!1091467))

(declare-fun m!1091513 () Bool)

(assert (=> mapNonEmpty!46586 m!1091513))

(declare-fun m!1091515 () Bool)

(assert (=> b!1183742 m!1091515))

(declare-fun m!1091517 () Bool)

(assert (=> b!1183752 m!1091517))

(declare-fun m!1091519 () Bool)

(assert (=> b!1183752 m!1091519))

(declare-fun m!1091521 () Bool)

(assert (=> b!1183755 m!1091521))

(declare-fun m!1091523 () Bool)

(assert (=> b!1183755 m!1091523))

(declare-fun m!1091525 () Bool)

(assert (=> b!1183747 m!1091525))

(declare-fun m!1091527 () Bool)

(assert (=> b!1183747 m!1091527))

(declare-fun m!1091529 () Bool)

(assert (=> b!1183747 m!1091529))

(declare-fun m!1091531 () Bool)

(assert (=> b!1183747 m!1091531))

(declare-fun m!1091533 () Bool)

(assert (=> b!1183744 m!1091533))

(check-sat (not b!1183748) (not b!1183743) (not b_lambda!20435) tp_is_empty!29839 (not b!1183757) (not b!1183751) (not b_next!25309) (not mapNonEmpty!46586) (not b!1183747) (not b!1183746) (not b!1183750) (not b!1183742) (not b!1183759) (not b!1183755) (not b!1183754) (not start!99724) b_and!41465 (not b!1183752))
(check-sat b_and!41465 (not b_next!25309))
