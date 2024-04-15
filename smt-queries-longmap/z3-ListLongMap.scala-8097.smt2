; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99442 () Bool)

(assert start!99442)

(declare-fun b_free!25027 () Bool)

(declare-fun b_next!25027 () Bool)

(assert (=> start!99442 (= b_free!25027 (not b_next!25027))))

(declare-fun tp!87795 () Bool)

(declare-fun b_and!40899 () Bool)

(assert (=> start!99442 (= tp!87795 b_and!40899)))

(declare-fun b!1174657 () Bool)

(declare-fun e!667695 () Bool)

(declare-fun e!667692 () Bool)

(assert (=> b!1174657 (= e!667695 (not e!667692))))

(declare-fun res!780109 () Bool)

(assert (=> b!1174657 (=> res!780109 e!667692)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1174657 (= res!780109 (bvsgt from!1455 i!673))))

(declare-datatypes ((array!75854 0))(
  ( (array!75855 (arr!36577 (Array (_ BitVec 32) (_ BitVec 64))) (size!37115 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75854)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!75854 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1174657 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!38585 0))(
  ( (Unit!38586) )
))
(declare-fun lt!529656 () Unit!38585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75854 (_ BitVec 64) (_ BitVec 32)) Unit!38585)

(assert (=> b!1174657 (= lt!529656 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174659 () Bool)

(declare-fun e!667691 () Bool)

(declare-fun tp_is_empty!29557 () Bool)

(assert (=> b!1174659 (= e!667691 tp_is_empty!29557)))

(declare-fun b!1174660 () Bool)

(declare-fun res!780107 () Bool)

(declare-fun e!667693 () Bool)

(assert (=> b!1174660 (=> (not res!780107) (not e!667693))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75854 (_ BitVec 32)) Bool)

(assert (=> b!1174660 (= res!780107 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1174661 () Bool)

(declare-fun e!667687 () Bool)

(declare-fun e!667690 () Bool)

(assert (=> b!1174661 (= e!667687 e!667690)))

(declare-fun res!780111 () Bool)

(assert (=> b!1174661 (=> res!780111 e!667690)))

(assert (=> b!1174661 (= res!780111 (not (= (select (arr!36577 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1174662 () Bool)

(declare-fun res!780103 () Bool)

(assert (=> b!1174662 (=> (not res!780103) (not e!667693))))

(declare-datatypes ((List!25776 0))(
  ( (Nil!25773) (Cons!25772 (h!26981 (_ BitVec 64)) (t!37786 List!25776)) )
))
(declare-fun arrayNoDuplicates!0 (array!75854 (_ BitVec 32) List!25776) Bool)

(assert (=> b!1174662 (= res!780103 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25773))))

(declare-fun b!1174663 () Bool)

(declare-fun e!667686 () Unit!38585)

(declare-fun Unit!38587 () Unit!38585)

(assert (=> b!1174663 (= e!667686 Unit!38587)))

(declare-fun lt!529643 () Unit!38585)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75854 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38585)

(assert (=> b!1174663 (= lt!529643 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1174663 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529645 () Unit!38585)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75854 (_ BitVec 32) (_ BitVec 32)) Unit!38585)

(assert (=> b!1174663 (= lt!529645 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1174663 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25773)))

(declare-fun lt!529644 () Unit!38585)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75854 (_ BitVec 64) (_ BitVec 32) List!25776) Unit!38585)

(assert (=> b!1174663 (= lt!529644 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25773))))

(assert (=> b!1174663 false))

(declare-fun b!1174664 () Bool)

(declare-fun Unit!38588 () Unit!38585)

(assert (=> b!1174664 (= e!667686 Unit!38588)))

(declare-fun b!1174665 () Bool)

(declare-fun res!780115 () Bool)

(assert (=> b!1174665 (=> (not res!780115) (not e!667693))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1174665 (= res!780115 (validMask!0 mask!1564))))

(declare-fun b!1174666 () Bool)

(assert (=> b!1174666 (= e!667693 e!667695)))

(declare-fun res!780110 () Bool)

(assert (=> b!1174666 (=> (not res!780110) (not e!667695))))

(declare-fun lt!529655 () array!75854)

(assert (=> b!1174666 (= res!780110 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529655 mask!1564))))

(assert (=> b!1174666 (= lt!529655 (array!75855 (store (arr!36577 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37115 _keys!1208)))))

(declare-fun b!1174667 () Bool)

(declare-fun res!780105 () Bool)

(assert (=> b!1174667 (=> (not res!780105) (not e!667695))))

(assert (=> b!1174667 (= res!780105 (arrayNoDuplicates!0 lt!529655 #b00000000000000000000000000000000 Nil!25773))))

(declare-fun b!1174668 () Bool)

(declare-fun e!667696 () Bool)

(assert (=> b!1174668 (= e!667696 true)))

(assert (=> b!1174668 (not (= (select (arr!36577 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529646 () Unit!38585)

(assert (=> b!1174668 (= lt!529646 e!667686)))

(declare-fun c!116638 () Bool)

(assert (=> b!1174668 (= c!116638 (= (select (arr!36577 _keys!1208) from!1455) k0!934))))

(assert (=> b!1174668 e!667687))

(declare-fun res!780112 () Bool)

(assert (=> b!1174668 (=> (not res!780112) (not e!667687))))

(declare-datatypes ((V!44537 0))(
  ( (V!44538 (val!14835 Int)) )
))
(declare-fun lt!529647 () V!44537)

(declare-datatypes ((ValueCell!14069 0))(
  ( (ValueCellFull!14069 (v!17472 V!44537)) (EmptyCell!14069) )
))
(declare-datatypes ((array!75856 0))(
  ( (array!75857 (arr!36578 (Array (_ BitVec 32) ValueCell!14069)) (size!37116 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75856)

(declare-datatypes ((tuple2!19064 0))(
  ( (tuple2!19065 (_1!9543 (_ BitVec 64)) (_2!9543 V!44537)) )
))
(declare-datatypes ((List!25777 0))(
  ( (Nil!25774) (Cons!25773 (h!26982 tuple2!19064) (t!37787 List!25777)) )
))
(declare-datatypes ((ListLongMap!17033 0))(
  ( (ListLongMap!17034 (toList!8532 List!25777)) )
))
(declare-fun lt!529653 () ListLongMap!17033)

(declare-fun lt!529654 () ListLongMap!17033)

(declare-fun +!3839 (ListLongMap!17033 tuple2!19064) ListLongMap!17033)

(declare-fun get!18681 (ValueCell!14069 V!44537) V!44537)

(assert (=> b!1174668 (= res!780112 (= lt!529653 (+!3839 lt!529654 (tuple2!19065 (select (arr!36577 _keys!1208) from!1455) (get!18681 (select (arr!36578 _values!996) from!1455) lt!529647)))))))

(declare-fun mapNonEmpty!46163 () Bool)

(declare-fun mapRes!46163 () Bool)

(declare-fun tp!87794 () Bool)

(assert (=> mapNonEmpty!46163 (= mapRes!46163 (and tp!87794 e!667691))))

(declare-fun mapRest!46163 () (Array (_ BitVec 32) ValueCell!14069))

(declare-fun mapKey!46163 () (_ BitVec 32))

(declare-fun mapValue!46163 () ValueCell!14069)

(assert (=> mapNonEmpty!46163 (= (arr!36578 _values!996) (store mapRest!46163 mapKey!46163 mapValue!46163))))

(declare-fun b!1174669 () Bool)

(declare-fun e!667685 () Bool)

(assert (=> b!1174669 (= e!667685 e!667696)))

(declare-fun res!780106 () Bool)

(assert (=> b!1174669 (=> res!780106 e!667696)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1174669 (= res!780106 (not (validKeyInArray!0 (select (arr!36577 _keys!1208) from!1455))))))

(declare-fun lt!529651 () ListLongMap!17033)

(assert (=> b!1174669 (= lt!529651 lt!529654)))

(declare-fun lt!529649 () ListLongMap!17033)

(declare-fun -!1518 (ListLongMap!17033 (_ BitVec 64)) ListLongMap!17033)

(assert (=> b!1174669 (= lt!529654 (-!1518 lt!529649 k0!934))))

(declare-fun zeroValue!944 () V!44537)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44537)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!529650 () array!75856)

(declare-fun getCurrentListMapNoExtraKeys!5004 (array!75854 array!75856 (_ BitVec 32) (_ BitVec 32) V!44537 V!44537 (_ BitVec 32) Int) ListLongMap!17033)

(assert (=> b!1174669 (= lt!529651 (getCurrentListMapNoExtraKeys!5004 lt!529655 lt!529650 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1174669 (= lt!529649 (getCurrentListMapNoExtraKeys!5004 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529648 () Unit!38585)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!782 (array!75854 array!75856 (_ BitVec 32) (_ BitVec 32) V!44537 V!44537 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38585)

(assert (=> b!1174669 (= lt!529648 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!782 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!780102 () Bool)

(assert (=> start!99442 (=> (not res!780102) (not e!667693))))

(assert (=> start!99442 (= res!780102 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37115 _keys!1208))))))

(assert (=> start!99442 e!667693))

(assert (=> start!99442 tp_is_empty!29557))

(declare-fun array_inv!28050 (array!75854) Bool)

(assert (=> start!99442 (array_inv!28050 _keys!1208)))

(assert (=> start!99442 true))

(assert (=> start!99442 tp!87795))

(declare-fun e!667694 () Bool)

(declare-fun array_inv!28051 (array!75856) Bool)

(assert (=> start!99442 (and (array_inv!28051 _values!996) e!667694)))

(declare-fun b!1174658 () Bool)

(declare-fun e!667688 () Bool)

(assert (=> b!1174658 (= e!667688 tp_is_empty!29557)))

(declare-fun b!1174670 () Bool)

(declare-fun res!780114 () Bool)

(assert (=> b!1174670 (=> (not res!780114) (not e!667693))))

(assert (=> b!1174670 (= res!780114 (= (select (arr!36577 _keys!1208) i!673) k0!934))))

(declare-fun b!1174671 () Bool)

(assert (=> b!1174671 (= e!667694 (and e!667688 mapRes!46163))))

(declare-fun condMapEmpty!46163 () Bool)

(declare-fun mapDefault!46163 () ValueCell!14069)

(assert (=> b!1174671 (= condMapEmpty!46163 (= (arr!36578 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14069)) mapDefault!46163)))))

(declare-fun mapIsEmpty!46163 () Bool)

(assert (=> mapIsEmpty!46163 mapRes!46163))

(declare-fun b!1174672 () Bool)

(declare-fun res!780113 () Bool)

(assert (=> b!1174672 (=> (not res!780113) (not e!667693))))

(assert (=> b!1174672 (= res!780113 (validKeyInArray!0 k0!934))))

(declare-fun b!1174673 () Bool)

(declare-fun res!780108 () Bool)

(assert (=> b!1174673 (=> (not res!780108) (not e!667693))))

(assert (=> b!1174673 (= res!780108 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37115 _keys!1208))))))

(declare-fun b!1174674 () Bool)

(assert (=> b!1174674 (= e!667692 e!667685)))

(declare-fun res!780101 () Bool)

(assert (=> b!1174674 (=> res!780101 e!667685)))

(assert (=> b!1174674 (= res!780101 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(assert (=> b!1174674 (= lt!529653 (getCurrentListMapNoExtraKeys!5004 lt!529655 lt!529650 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1174674 (= lt!529650 (array!75857 (store (arr!36578 _values!996) i!673 (ValueCellFull!14069 lt!529647)) (size!37116 _values!996)))))

(declare-fun dynLambda!2921 (Int (_ BitVec 64)) V!44537)

(assert (=> b!1174674 (= lt!529647 (dynLambda!2921 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529652 () ListLongMap!17033)

(assert (=> b!1174674 (= lt!529652 (getCurrentListMapNoExtraKeys!5004 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1174675 () Bool)

(assert (=> b!1174675 (= e!667690 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1174676 () Bool)

(declare-fun res!780104 () Bool)

(assert (=> b!1174676 (=> (not res!780104) (not e!667693))))

(assert (=> b!1174676 (= res!780104 (and (= (size!37116 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37115 _keys!1208) (size!37116 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!99442 res!780102) b!1174665))

(assert (= (and b!1174665 res!780115) b!1174676))

(assert (= (and b!1174676 res!780104) b!1174660))

(assert (= (and b!1174660 res!780107) b!1174662))

(assert (= (and b!1174662 res!780103) b!1174673))

(assert (= (and b!1174673 res!780108) b!1174672))

(assert (= (and b!1174672 res!780113) b!1174670))

(assert (= (and b!1174670 res!780114) b!1174666))

(assert (= (and b!1174666 res!780110) b!1174667))

(assert (= (and b!1174667 res!780105) b!1174657))

(assert (= (and b!1174657 (not res!780109)) b!1174674))

(assert (= (and b!1174674 (not res!780101)) b!1174669))

(assert (= (and b!1174669 (not res!780106)) b!1174668))

(assert (= (and b!1174668 res!780112) b!1174661))

(assert (= (and b!1174661 (not res!780111)) b!1174675))

(assert (= (and b!1174668 c!116638) b!1174663))

(assert (= (and b!1174668 (not c!116638)) b!1174664))

(assert (= (and b!1174671 condMapEmpty!46163) mapIsEmpty!46163))

(assert (= (and b!1174671 (not condMapEmpty!46163)) mapNonEmpty!46163))

(get-info :version)

(assert (= (and mapNonEmpty!46163 ((_ is ValueCellFull!14069) mapValue!46163)) b!1174659))

(assert (= (and b!1174671 ((_ is ValueCellFull!14069) mapDefault!46163)) b!1174658))

(assert (= start!99442 b!1174671))

(declare-fun b_lambda!20153 () Bool)

(assert (=> (not b_lambda!20153) (not b!1174674)))

(declare-fun t!37785 () Bool)

(declare-fun tb!9831 () Bool)

(assert (=> (and start!99442 (= defaultEntry!1004 defaultEntry!1004) t!37785) tb!9831))

(declare-fun result!20237 () Bool)

(assert (=> tb!9831 (= result!20237 tp_is_empty!29557)))

(assert (=> b!1174674 t!37785))

(declare-fun b_and!40901 () Bool)

(assert (= b_and!40899 (and (=> t!37785 result!20237) b_and!40901)))

(declare-fun m!1082057 () Bool)

(assert (=> b!1174672 m!1082057))

(declare-fun m!1082059 () Bool)

(assert (=> b!1174666 m!1082059))

(declare-fun m!1082061 () Bool)

(assert (=> b!1174666 m!1082061))

(declare-fun m!1082063 () Bool)

(assert (=> b!1174657 m!1082063))

(declare-fun m!1082065 () Bool)

(assert (=> b!1174657 m!1082065))

(declare-fun m!1082067 () Bool)

(assert (=> b!1174662 m!1082067))

(declare-fun m!1082069 () Bool)

(assert (=> b!1174661 m!1082069))

(declare-fun m!1082071 () Bool)

(assert (=> mapNonEmpty!46163 m!1082071))

(declare-fun m!1082073 () Bool)

(assert (=> b!1174660 m!1082073))

(assert (=> b!1174668 m!1082069))

(declare-fun m!1082075 () Bool)

(assert (=> b!1174668 m!1082075))

(assert (=> b!1174668 m!1082075))

(declare-fun m!1082077 () Bool)

(assert (=> b!1174668 m!1082077))

(declare-fun m!1082079 () Bool)

(assert (=> b!1174668 m!1082079))

(declare-fun m!1082081 () Bool)

(assert (=> start!99442 m!1082081))

(declare-fun m!1082083 () Bool)

(assert (=> start!99442 m!1082083))

(declare-fun m!1082085 () Bool)

(assert (=> b!1174665 m!1082085))

(declare-fun m!1082087 () Bool)

(assert (=> b!1174663 m!1082087))

(declare-fun m!1082089 () Bool)

(assert (=> b!1174663 m!1082089))

(declare-fun m!1082091 () Bool)

(assert (=> b!1174663 m!1082091))

(declare-fun m!1082093 () Bool)

(assert (=> b!1174663 m!1082093))

(declare-fun m!1082095 () Bool)

(assert (=> b!1174663 m!1082095))

(declare-fun m!1082097 () Bool)

(assert (=> b!1174669 m!1082097))

(assert (=> b!1174669 m!1082069))

(declare-fun m!1082099 () Bool)

(assert (=> b!1174669 m!1082099))

(declare-fun m!1082101 () Bool)

(assert (=> b!1174669 m!1082101))

(assert (=> b!1174669 m!1082069))

(declare-fun m!1082103 () Bool)

(assert (=> b!1174669 m!1082103))

(declare-fun m!1082105 () Bool)

(assert (=> b!1174669 m!1082105))

(declare-fun m!1082107 () Bool)

(assert (=> b!1174670 m!1082107))

(declare-fun m!1082109 () Bool)

(assert (=> b!1174667 m!1082109))

(declare-fun m!1082111 () Bool)

(assert (=> b!1174675 m!1082111))

(declare-fun m!1082113 () Bool)

(assert (=> b!1174674 m!1082113))

(declare-fun m!1082115 () Bool)

(assert (=> b!1174674 m!1082115))

(declare-fun m!1082117 () Bool)

(assert (=> b!1174674 m!1082117))

(declare-fun m!1082119 () Bool)

(assert (=> b!1174674 m!1082119))

(check-sat (not b_next!25027) (not b!1174672) (not b!1174657) (not b_lambda!20153) (not b!1174663) (not b!1174662) (not b!1174675) (not b!1174667) b_and!40901 tp_is_empty!29557 (not start!99442) (not mapNonEmpty!46163) (not b!1174669) (not b!1174674) (not b!1174666) (not b!1174665) (not b!1174660) (not b!1174668))
(check-sat b_and!40901 (not b_next!25027))
