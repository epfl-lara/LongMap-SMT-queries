; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99636 () Bool)

(assert start!99636)

(declare-fun b_free!24979 () Bool)

(declare-fun b_next!24979 () Bool)

(assert (=> start!99636 (= b_free!24979 (not b_next!24979))))

(declare-fun tp!87650 () Bool)

(declare-fun b_and!40827 () Bool)

(assert (=> start!99636 (= tp!87650 b_and!40827)))

(declare-fun mapIsEmpty!46091 () Bool)

(declare-fun mapRes!46091 () Bool)

(assert (=> mapIsEmpty!46091 mapRes!46091))

(declare-datatypes ((array!75885 0))(
  ( (array!75886 (arr!36586 (Array (_ BitVec 32) (_ BitVec 64))) (size!37123 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75885)

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun e!667742 () Bool)

(declare-fun b!1174582 () Bool)

(declare-fun arrayContainsKey!0 (array!75885 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174582 (= e!667742 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174583 () Bool)

(declare-fun res!779606 () Bool)

(declare-fun e!667739 () Bool)

(assert (=> b!1174583 (=> (not res!779606) (not e!667739))))

(assert (=> b!1174583 (= res!779606 (= (select (arr!36586 _keys!1208) i!673) k0!934))))

(declare-fun b!1174584 () Bool)

(declare-fun res!779605 () Bool)

(assert (=> b!1174584 (=> (not res!779605) (not e!667739))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!44473 0))(
  ( (V!44474 (val!14811 Int)) )
))
(declare-datatypes ((ValueCell!14045 0))(
  ( (ValueCellFull!14045 (v!17445 V!44473)) (EmptyCell!14045) )
))
(declare-datatypes ((array!75887 0))(
  ( (array!75888 (arr!36587 (Array (_ BitVec 32) ValueCell!14045)) (size!37124 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75887)

(assert (=> b!1174584 (= res!779605 (and (= (size!37124 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37123 _keys!1208) (size!37124 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1174585 () Bool)

(declare-fun e!667741 () Bool)

(declare-fun e!667735 () Bool)

(assert (=> b!1174585 (= e!667741 e!667735)))

(declare-fun res!779609 () Bool)

(assert (=> b!1174585 (=> res!779609 e!667735)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174585 (= res!779609 (not (validKeyInArray!0 (select (arr!36586 _keys!1208) from!1455))))))

(declare-datatypes ((tuple2!18964 0))(
  ( (tuple2!18965 (_1!9493 (_ BitVec 64)) (_2!9493 V!44473)) )
))
(declare-datatypes ((List!25701 0))(
  ( (Nil!25698) (Cons!25697 (h!26915 tuple2!18964) (t!37664 List!25701)) )
))
(declare-datatypes ((ListLongMap!16941 0))(
  ( (ListLongMap!16942 (toList!8486 List!25701)) )
))
(declare-fun lt!529311 () ListLongMap!16941)

(declare-fun lt!529312 () ListLongMap!16941)

(assert (=> b!1174585 (= lt!529311 lt!529312)))

(declare-fun lt!529321 () ListLongMap!16941)

(declare-fun -!1534 (ListLongMap!16941 (_ BitVec 64)) ListLongMap!16941)

(assert (=> b!1174585 (= lt!529312 (-!1534 lt!529321 k0!934))))

(declare-fun zeroValue!944 () V!44473)

(declare-fun lt!529313 () array!75885)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!529318 () array!75887)

(declare-fun minValue!944 () V!44473)

(declare-fun getCurrentListMapNoExtraKeys!4971 (array!75885 array!75887 (_ BitVec 32) (_ BitVec 32) V!44473 V!44473 (_ BitVec 32) Int) ListLongMap!16941)

(assert (=> b!1174585 (= lt!529311 (getCurrentListMapNoExtraKeys!4971 lt!529313 lt!529318 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174585 (= lt!529321 (getCurrentListMapNoExtraKeys!4971 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-datatypes ((Unit!38679 0))(
  ( (Unit!38680) )
))
(declare-fun lt!529322 () Unit!38679)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!759 (array!75885 array!75887 (_ BitVec 32) (_ BitVec 32) V!44473 V!44473 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38679)

(assert (=> b!1174585 (= lt!529322 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!759 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1174586 () Bool)

(declare-fun e!667740 () Bool)

(declare-fun e!667738 () Bool)

(assert (=> b!1174586 (= e!667740 (not e!667738))))

(declare-fun res!779601 () Bool)

(assert (=> b!1174586 (=> res!779601 e!667738)))

(assert (=> b!1174586 (= res!779601 (bvsgt from!1455 i!673))))

(assert (=> b!1174586 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529323 () Unit!38679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75885 (_ BitVec 64) (_ BitVec 32)) Unit!38679)

(assert (=> b!1174586 (= lt!529323 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174587 () Bool)

(declare-fun res!779596 () Bool)

(assert (=> b!1174587 (=> (not res!779596) (not e!667739))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174587 (= res!779596 (validMask!0 mask!1564))))

(declare-fun b!1174588 () Bool)

(declare-fun e!667731 () Bool)

(declare-fun tp_is_empty!29509 () Bool)

(assert (=> b!1174588 (= e!667731 tp_is_empty!29509)))

(declare-fun b!1174590 () Bool)

(declare-fun e!667732 () Bool)

(assert (=> b!1174590 (= e!667732 (and e!667731 mapRes!46091))))

(declare-fun condMapEmpty!46091 () Bool)

(declare-fun mapDefault!46091 () ValueCell!14045)

(assert (=> b!1174590 (= condMapEmpty!46091 (= (arr!36587 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14045)) mapDefault!46091)))))

(declare-fun b!1174591 () Bool)

(declare-fun e!667734 () Unit!38679)

(declare-fun Unit!38681 () Unit!38679)

(assert (=> b!1174591 (= e!667734 Unit!38681)))

(declare-fun b!1174592 () Bool)

(declare-fun res!779599 () Bool)

(assert (=> b!1174592 (=> (not res!779599) (not e!667739))))

(declare-datatypes ((List!25702 0))(
  ( (Nil!25699) (Cons!25698 (h!26916 (_ BitVec 64)) (t!37665 List!25702)) )
))
(declare-fun arrayNoDuplicates!0 (array!75885 (_ BitVec 32) List!25702) Bool)

(assert (=> b!1174592 (= res!779599 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25699))))

(declare-fun b!1174593 () Bool)

(assert (=> b!1174593 (= e!667738 e!667741)))

(declare-fun res!779602 () Bool)

(assert (=> b!1174593 (=> res!779602 e!667741)))

(assert (=> b!1174593 (= res!779602 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun lt!529317 () ListLongMap!16941)

(assert (=> b!1174593 (= lt!529317 (getCurrentListMapNoExtraKeys!4971 lt!529313 lt!529318 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun lt!529316 () V!44473)

(assert (=> b!1174593 (= lt!529318 (array!75888 (store (arr!36587 _values!996) i!673 (ValueCellFull!14045 lt!529316)) (size!37124 _values!996)))))

(declare-fun dynLambda!2949 (Int (_ BitVec 64)) V!44473)

(assert (=> b!1174593 (= lt!529316 (dynLambda!2949 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529315 () ListLongMap!16941)

(assert (=> b!1174593 (= lt!529315 (getCurrentListMapNoExtraKeys!4971 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174594 () Bool)

(declare-fun e!667736 () Bool)

(assert (=> b!1174594 (= e!667736 tp_is_empty!29509)))

(declare-fun b!1174595 () Bool)

(declare-fun res!779607 () Bool)

(assert (=> b!1174595 (=> (not res!779607) (not e!667739))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75885 (_ BitVec 32)) Bool)

(assert (=> b!1174595 (= res!779607 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174596 () Bool)

(declare-fun res!779604 () Bool)

(assert (=> b!1174596 (=> (not res!779604) (not e!667740))))

(assert (=> b!1174596 (= res!779604 (arrayNoDuplicates!0 lt!529313 #b00000000000000000000000000000000 Nil!25699))))

(declare-fun mapNonEmpty!46091 () Bool)

(declare-fun tp!87651 () Bool)

(assert (=> mapNonEmpty!46091 (= mapRes!46091 (and tp!87651 e!667736))))

(declare-fun mapKey!46091 () (_ BitVec 32))

(declare-fun mapRest!46091 () (Array (_ BitVec 32) ValueCell!14045))

(declare-fun mapValue!46091 () ValueCell!14045)

(assert (=> mapNonEmpty!46091 (= (arr!36587 _values!996) (store mapRest!46091 mapKey!46091 mapValue!46091))))

(declare-fun b!1174597 () Bool)

(declare-fun res!779597 () Bool)

(assert (=> b!1174597 (=> (not res!779597) (not e!667739))))

(assert (=> b!1174597 (= res!779597 (validKeyInArray!0 k0!934))))

(declare-fun res!779608 () Bool)

(assert (=> start!99636 (=> (not res!779608) (not e!667739))))

(assert (=> start!99636 (= res!779608 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37123 _keys!1208))))))

(assert (=> start!99636 e!667739))

(assert (=> start!99636 tp_is_empty!29509))

(declare-fun array_inv!28032 (array!75885) Bool)

(assert (=> start!99636 (array_inv!28032 _keys!1208)))

(assert (=> start!99636 true))

(assert (=> start!99636 tp!87650))

(declare-fun array_inv!28033 (array!75887) Bool)

(assert (=> start!99636 (and (array_inv!28033 _values!996) e!667732)))

(declare-fun b!1174589 () Bool)

(assert (=> b!1174589 (= e!667739 e!667740)))

(declare-fun res!779595 () Bool)

(assert (=> b!1174589 (=> (not res!779595) (not e!667740))))

(assert (=> b!1174589 (= res!779595 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529313 mask!1564))))

(assert (=> b!1174589 (= lt!529313 (array!75886 (store (arr!36586 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37123 _keys!1208)))))

(declare-fun b!1174598 () Bool)

(declare-fun Unit!38682 () Unit!38679)

(assert (=> b!1174598 (= e!667734 Unit!38682)))

(declare-fun lt!529320 () Unit!38679)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75885 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38679)

(assert (=> b!1174598 (= lt!529320 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174598 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529324 () Unit!38679)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75885 (_ BitVec 32) (_ BitVec 32)) Unit!38679)

(assert (=> b!1174598 (= lt!529324 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174598 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25699)))

(declare-fun lt!529319 () Unit!38679)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75885 (_ BitVec 64) (_ BitVec 32) List!25702) Unit!38679)

(assert (=> b!1174598 (= lt!529319 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25699))))

(assert (=> b!1174598 false))

(declare-fun b!1174599 () Bool)

(declare-fun res!779598 () Bool)

(assert (=> b!1174599 (=> (not res!779598) (not e!667739))))

(assert (=> b!1174599 (= res!779598 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37123 _keys!1208))))))

(declare-fun b!1174600 () Bool)

(assert (=> b!1174600 (= e!667735 true)))

(assert (=> b!1174600 (not (= (select (arr!36586 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529314 () Unit!38679)

(assert (=> b!1174600 (= lt!529314 e!667734)))

(declare-fun c!116990 () Bool)

(assert (=> b!1174600 (= c!116990 (= (select (arr!36586 _keys!1208) from!1455) k0!934))))

(declare-fun e!667733 () Bool)

(assert (=> b!1174600 e!667733))

(declare-fun res!779603 () Bool)

(assert (=> b!1174600 (=> (not res!779603) (not e!667733))))

(declare-fun +!3819 (ListLongMap!16941 tuple2!18964) ListLongMap!16941)

(declare-fun get!18697 (ValueCell!14045 V!44473) V!44473)

(assert (=> b!1174600 (= res!779603 (= lt!529317 (+!3819 lt!529312 (tuple2!18965 (select (arr!36586 _keys!1208) from!1455) (get!18697 (select (arr!36587 _values!996) from!1455) lt!529316)))))))

(declare-fun b!1174601 () Bool)

(assert (=> b!1174601 (= e!667733 e!667742)))

(declare-fun res!779600 () Bool)

(assert (=> b!1174601 (=> res!779600 e!667742)))

(assert (=> b!1174601 (= res!779600 (not (= (select (arr!36586 _keys!1208) from!1455) k0!934)))))

(assert (= (and start!99636 res!779608) b!1174587))

(assert (= (and b!1174587 res!779596) b!1174584))

(assert (= (and b!1174584 res!779605) b!1174595))

(assert (= (and b!1174595 res!779607) b!1174592))

(assert (= (and b!1174592 res!779599) b!1174599))

(assert (= (and b!1174599 res!779598) b!1174597))

(assert (= (and b!1174597 res!779597) b!1174583))

(assert (= (and b!1174583 res!779606) b!1174589))

(assert (= (and b!1174589 res!779595) b!1174596))

(assert (= (and b!1174596 res!779604) b!1174586))

(assert (= (and b!1174586 (not res!779601)) b!1174593))

(assert (= (and b!1174593 (not res!779602)) b!1174585))

(assert (= (and b!1174585 (not res!779609)) b!1174600))

(assert (= (and b!1174600 res!779603) b!1174601))

(assert (= (and b!1174601 (not res!779600)) b!1174582))

(assert (= (and b!1174600 c!116990) b!1174598))

(assert (= (and b!1174600 (not c!116990)) b!1174591))

(assert (= (and b!1174590 condMapEmpty!46091) mapIsEmpty!46091))

(assert (= (and b!1174590 (not condMapEmpty!46091)) mapNonEmpty!46091))

(get-info :version)

(assert (= (and mapNonEmpty!46091 ((_ is ValueCellFull!14045) mapValue!46091)) b!1174594))

(assert (= (and b!1174590 ((_ is ValueCellFull!14045) mapDefault!46091)) b!1174588))

(assert (= start!99636 b!1174590))

(declare-fun b_lambda!20117 () Bool)

(assert (=> (not b_lambda!20117) (not b!1174593)))

(declare-fun t!37663 () Bool)

(declare-fun tb!9783 () Bool)

(assert (=> (and start!99636 (= defaultEntry!1004 defaultEntry!1004) t!37663) tb!9783))

(declare-fun result!20141 () Bool)

(assert (=> tb!9783 (= result!20141 tp_is_empty!29509)))

(assert (=> b!1174593 t!37663))

(declare-fun b_and!40829 () Bool)

(assert (= b_and!40827 (and (=> t!37663 result!20141) b_and!40829)))

(declare-fun m!1082703 () Bool)

(assert (=> b!1174593 m!1082703))

(declare-fun m!1082705 () Bool)

(assert (=> b!1174593 m!1082705))

(declare-fun m!1082707 () Bool)

(assert (=> b!1174593 m!1082707))

(declare-fun m!1082709 () Bool)

(assert (=> b!1174593 m!1082709))

(declare-fun m!1082711 () Bool)

(assert (=> b!1174595 m!1082711))

(declare-fun m!1082713 () Bool)

(assert (=> b!1174600 m!1082713))

(declare-fun m!1082715 () Bool)

(assert (=> b!1174600 m!1082715))

(assert (=> b!1174600 m!1082715))

(declare-fun m!1082717 () Bool)

(assert (=> b!1174600 m!1082717))

(declare-fun m!1082719 () Bool)

(assert (=> b!1174600 m!1082719))

(declare-fun m!1082721 () Bool)

(assert (=> b!1174598 m!1082721))

(declare-fun m!1082723 () Bool)

(assert (=> b!1174598 m!1082723))

(declare-fun m!1082725 () Bool)

(assert (=> b!1174598 m!1082725))

(declare-fun m!1082727 () Bool)

(assert (=> b!1174598 m!1082727))

(declare-fun m!1082729 () Bool)

(assert (=> b!1174598 m!1082729))

(declare-fun m!1082731 () Bool)

(assert (=> b!1174582 m!1082731))

(declare-fun m!1082733 () Bool)

(assert (=> b!1174583 m!1082733))

(declare-fun m!1082735 () Bool)

(assert (=> start!99636 m!1082735))

(declare-fun m!1082737 () Bool)

(assert (=> start!99636 m!1082737))

(declare-fun m!1082739 () Bool)

(assert (=> mapNonEmpty!46091 m!1082739))

(declare-fun m!1082741 () Bool)

(assert (=> b!1174592 m!1082741))

(declare-fun m!1082743 () Bool)

(assert (=> b!1174597 m!1082743))

(declare-fun m!1082745 () Bool)

(assert (=> b!1174589 m!1082745))

(declare-fun m!1082747 () Bool)

(assert (=> b!1174589 m!1082747))

(declare-fun m!1082749 () Bool)

(assert (=> b!1174586 m!1082749))

(declare-fun m!1082751 () Bool)

(assert (=> b!1174586 m!1082751))

(declare-fun m!1082753 () Bool)

(assert (=> b!1174587 m!1082753))

(declare-fun m!1082755 () Bool)

(assert (=> b!1174585 m!1082755))

(declare-fun m!1082757 () Bool)

(assert (=> b!1174585 m!1082757))

(declare-fun m!1082759 () Bool)

(assert (=> b!1174585 m!1082759))

(declare-fun m!1082761 () Bool)

(assert (=> b!1174585 m!1082761))

(assert (=> b!1174585 m!1082713))

(declare-fun m!1082763 () Bool)

(assert (=> b!1174585 m!1082763))

(assert (=> b!1174585 m!1082713))

(declare-fun m!1082765 () Bool)

(assert (=> b!1174596 m!1082765))

(assert (=> b!1174601 m!1082713))

(check-sat (not b!1174600) (not b!1174596) (not b_next!24979) (not b!1174582) (not b!1174595) (not b!1174598) (not b!1174585) (not b!1174586) tp_is_empty!29509 (not b!1174589) (not start!99636) (not b!1174587) (not b!1174597) (not b!1174593) (not mapNonEmpty!46091) (not b_lambda!20117) (not b!1174592) b_and!40829)
(check-sat b_and!40829 (not b_next!24979))
