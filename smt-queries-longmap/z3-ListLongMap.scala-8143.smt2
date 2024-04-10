; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99726 () Bool)

(assert start!99726)

(declare-fun b_free!25305 () Bool)

(declare-fun b_next!25305 () Bool)

(assert (=> start!99726 (= b_free!25305 (not b_next!25305))))

(declare-fun tp!88629 () Bool)

(declare-fun b_and!41477 () Bool)

(assert (=> start!99726 (= tp!88629 b_and!41477)))

(declare-fun b!1183741 () Bool)

(declare-fun e!673029 () Bool)

(declare-fun e!673027 () Bool)

(assert (=> b!1183741 (= e!673029 e!673027)))

(declare-fun res!786771 () Bool)

(assert (=> b!1183741 (=> res!786771 e!673027)))

(declare-datatypes ((array!76471 0))(
  ( (array!76472 (arr!36885 (Array (_ BitVec 32) (_ BitVec 64))) (size!37421 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76471)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1183741 (= res!786771 (not (= (select (arr!36885 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1183742 () Bool)

(declare-fun res!786765 () Bool)

(declare-fun e!673030 () Bool)

(assert (=> b!1183742 (=> (not res!786765) (not e!673030))))

(declare-datatypes ((List!25937 0))(
  ( (Nil!25934) (Cons!25933 (h!27142 (_ BitVec 64)) (t!38234 List!25937)) )
))
(declare-fun arrayNoDuplicates!0 (array!76471 (_ BitVec 32) List!25937) Bool)

(assert (=> b!1183742 (= res!786765 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25934))))

(declare-fun b!1183743 () Bool)

(declare-fun res!786767 () Bool)

(assert (=> b!1183743 (=> (not res!786767) (not e!673030))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76471 (_ BitVec 32)) Bool)

(assert (=> b!1183743 (= res!786767 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1183744 () Bool)

(declare-fun res!786775 () Bool)

(assert (=> b!1183744 (=> (not res!786775) (not e!673030))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1183744 (= res!786775 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37421 _keys!1208))))))

(declare-fun b!1183745 () Bool)

(declare-fun e!673021 () Bool)

(declare-fun e!673019 () Bool)

(declare-fun mapRes!46580 () Bool)

(assert (=> b!1183745 (= e!673021 (and e!673019 mapRes!46580))))

(declare-fun condMapEmpty!46580 () Bool)

(declare-datatypes ((V!44907 0))(
  ( (V!44908 (val!14974 Int)) )
))
(declare-datatypes ((ValueCell!14208 0))(
  ( (ValueCellFull!14208 (v!17612 V!44907)) (EmptyCell!14208) )
))
(declare-datatypes ((array!76473 0))(
  ( (array!76474 (arr!36886 (Array (_ BitVec 32) ValueCell!14208)) (size!37422 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76473)

(declare-fun mapDefault!46580 () ValueCell!14208)

(assert (=> b!1183745 (= condMapEmpty!46580 (= (arr!36886 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14208)) mapDefault!46580)))))

(declare-fun b!1183746 () Bool)

(declare-fun e!673026 () Bool)

(declare-fun tp_is_empty!29835 () Bool)

(assert (=> b!1183746 (= e!673026 tp_is_empty!29835)))

(declare-fun b!1183747 () Bool)

(declare-fun e!673023 () Bool)

(assert (=> b!1183747 (= e!673030 e!673023)))

(declare-fun res!786777 () Bool)

(assert (=> b!1183747 (=> (not res!786777) (not e!673023))))

(declare-fun lt!536462 () array!76471)

(assert (=> b!1183747 (= res!786777 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!536462 mask!1564))))

(assert (=> b!1183747 (= lt!536462 (array!76472 (store (arr!36885 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37421 _keys!1208)))))

(declare-fun b!1183748 () Bool)

(declare-datatypes ((Unit!39181 0))(
  ( (Unit!39182) )
))
(declare-fun e!673020 () Unit!39181)

(declare-fun Unit!39183 () Unit!39181)

(assert (=> b!1183748 (= e!673020 Unit!39183)))

(declare-fun b!1183749 () Bool)

(declare-fun e!673025 () Bool)

(assert (=> b!1183749 (= e!673025 true)))

(declare-datatypes ((tuple2!19198 0))(
  ( (tuple2!19199 (_1!9610 (_ BitVec 64)) (_2!9610 V!44907)) )
))
(declare-datatypes ((List!25938 0))(
  ( (Nil!25935) (Cons!25934 (h!27143 tuple2!19198) (t!38235 List!25938)) )
))
(declare-datatypes ((ListLongMap!17167 0))(
  ( (ListLongMap!17168 (toList!8599 List!25938)) )
))
(declare-fun lt!536459 () ListLongMap!17167)

(declare-fun lt!536460 () ListLongMap!17167)

(declare-fun -!1634 (ListLongMap!17167 (_ BitVec 64)) ListLongMap!17167)

(assert (=> b!1183749 (= (-!1634 lt!536459 k0!934) lt!536460)))

(declare-fun lt!536463 () Unit!39181)

(declare-fun lt!536456 () V!44907)

(declare-fun lt!536446 () ListLongMap!17167)

(declare-fun addRemoveCommutativeForDiffKeys!160 (ListLongMap!17167 (_ BitVec 64) V!44907 (_ BitVec 64)) Unit!39181)

(assert (=> b!1183749 (= lt!536463 (addRemoveCommutativeForDiffKeys!160 lt!536446 (select (arr!36885 _keys!1208) from!1455) lt!536456 k0!934))))

(declare-fun lt!536449 () ListLongMap!17167)

(declare-fun lt!536461 () ListLongMap!17167)

(declare-fun lt!536454 () ListLongMap!17167)

(assert (=> b!1183749 (and (= lt!536461 lt!536459) (= lt!536449 lt!536454))))

(declare-fun lt!536447 () tuple2!19198)

(declare-fun +!3897 (ListLongMap!17167 tuple2!19198) ListLongMap!17167)

(assert (=> b!1183749 (= lt!536459 (+!3897 lt!536446 lt!536447))))

(assert (=> b!1183749 (not (= (select (arr!36885 _keys!1208) from!1455) k0!934))))

(declare-fun lt!536457 () Unit!39181)

(assert (=> b!1183749 (= lt!536457 e!673020)))

(declare-fun c!117081 () Bool)

(assert (=> b!1183749 (= c!117081 (= (select (arr!36885 _keys!1208) from!1455) k0!934))))

(assert (=> b!1183749 e!673029))

(declare-fun res!786766 () Bool)

(assert (=> b!1183749 (=> (not res!786766) (not e!673029))))

(declare-fun lt!536453 () ListLongMap!17167)

(assert (=> b!1183749 (= res!786766 (= lt!536453 lt!536460))))

(assert (=> b!1183749 (= lt!536460 (+!3897 lt!536449 lt!536447))))

(assert (=> b!1183749 (= lt!536447 (tuple2!19199 (select (arr!36885 _keys!1208) from!1455) lt!536456))))

(declare-fun lt!536451 () V!44907)

(declare-fun get!18872 (ValueCell!14208 V!44907) V!44907)

(assert (=> b!1183749 (= lt!536456 (get!18872 (select (arr!36886 _values!996) from!1455) lt!536451))))

(declare-fun b!1183750 () Bool)

(declare-fun res!786774 () Bool)

(assert (=> b!1183750 (=> (not res!786774) (not e!673030))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1183750 (= res!786774 (validMask!0 mask!1564))))

(declare-fun b!1183751 () Bool)

(declare-fun res!786769 () Bool)

(assert (=> b!1183751 (=> (not res!786769) (not e!673030))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1183751 (= res!786769 (and (= (size!37422 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37421 _keys!1208) (size!37422 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1183752 () Bool)

(declare-fun e!673024 () Bool)

(assert (=> b!1183752 (= e!673023 (not e!673024))))

(declare-fun res!786770 () Bool)

(assert (=> b!1183752 (=> res!786770 e!673024)))

(assert (=> b!1183752 (= res!786770 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!76471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1183752 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!536450 () Unit!39181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76471 (_ BitVec 64) (_ BitVec 32)) Unit!39181)

(assert (=> b!1183752 (= lt!536450 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1183753 () Bool)

(declare-fun Unit!39184 () Unit!39181)

(assert (=> b!1183753 (= e!673020 Unit!39184)))

(declare-fun lt!536448 () Unit!39181)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76471 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!39181)

(assert (=> b!1183753 (= lt!536448 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1183753 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!536458 () Unit!39181)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76471 (_ BitVec 32) (_ BitVec 32)) Unit!39181)

(assert (=> b!1183753 (= lt!536458 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1183753 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25934)))

(declare-fun lt!536455 () Unit!39181)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76471 (_ BitVec 64) (_ BitVec 32) List!25937) Unit!39181)

(assert (=> b!1183753 (= lt!536455 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25934))))

(assert (=> b!1183753 false))

(declare-fun b!1183754 () Bool)

(declare-fun res!786764 () Bool)

(assert (=> b!1183754 (=> (not res!786764) (not e!673030))))

(assert (=> b!1183754 (= res!786764 (= (select (arr!36885 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!46580 () Bool)

(declare-fun tp!88628 () Bool)

(assert (=> mapNonEmpty!46580 (= mapRes!46580 (and tp!88628 e!673026))))

(declare-fun mapValue!46580 () ValueCell!14208)

(declare-fun mapKey!46580 () (_ BitVec 32))

(declare-fun mapRest!46580 () (Array (_ BitVec 32) ValueCell!14208))

(assert (=> mapNonEmpty!46580 (= (arr!36886 _values!996) (store mapRest!46580 mapKey!46580 mapValue!46580))))

(declare-fun b!1183755 () Bool)

(declare-fun res!786768 () Bool)

(assert (=> b!1183755 (=> (not res!786768) (not e!673030))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1183755 (= res!786768 (validKeyInArray!0 k0!934))))

(declare-fun b!1183756 () Bool)

(assert (=> b!1183756 (= e!673019 tp_is_empty!29835)))

(declare-fun b!1183757 () Bool)

(declare-fun res!786778 () Bool)

(assert (=> b!1183757 (=> (not res!786778) (not e!673023))))

(assert (=> b!1183757 (= res!786778 (arrayNoDuplicates!0 lt!536462 #b00000000000000000000000000000000 Nil!25934))))

(declare-fun res!786776 () Bool)

(assert (=> start!99726 (=> (not res!786776) (not e!673030))))

(assert (=> start!99726 (= res!786776 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37421 _keys!1208))))))

(assert (=> start!99726 e!673030))

(assert (=> start!99726 tp_is_empty!29835))

(declare-fun array_inv!28152 (array!76471) Bool)

(assert (=> start!99726 (array_inv!28152 _keys!1208)))

(assert (=> start!99726 true))

(assert (=> start!99726 tp!88629))

(declare-fun array_inv!28153 (array!76473) Bool)

(assert (=> start!99726 (and (array_inv!28153 _values!996) e!673021)))

(declare-fun b!1183758 () Bool)

(declare-fun e!673022 () Bool)

(assert (=> b!1183758 (= e!673024 e!673022)))

(declare-fun res!786773 () Bool)

(assert (=> b!1183758 (=> res!786773 e!673022)))

(assert (=> b!1183758 (= res!786773 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44907)

(declare-fun lt!536452 () array!76473)

(declare-fun minValue!944 () V!44907)

(declare-fun defaultEntry!1004 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5049 (array!76471 array!76473 (_ BitVec 32) (_ BitVec 32) V!44907 V!44907 (_ BitVec 32) Int) ListLongMap!17167)

(assert (=> b!1183758 (= lt!536453 (getCurrentListMapNoExtraKeys!5049 lt!536462 lt!536452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1183758 (= lt!536452 (array!76474 (store (arr!36886 _values!996) i!673 (ValueCellFull!14208 lt!536451)) (size!37422 _values!996)))))

(declare-fun dynLambda!3000 (Int (_ BitVec 64)) V!44907)

(assert (=> b!1183758 (= lt!536451 (dynLambda!3000 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1183758 (= lt!536461 (getCurrentListMapNoExtraKeys!5049 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapIsEmpty!46580 () Bool)

(assert (=> mapIsEmpty!46580 mapRes!46580))

(declare-fun b!1183759 () Bool)

(assert (=> b!1183759 (= e!673022 e!673025)))

(declare-fun res!786772 () Bool)

(assert (=> b!1183759 (=> res!786772 e!673025)))

(assert (=> b!1183759 (= res!786772 (not (validKeyInArray!0 (select (arr!36885 _keys!1208) from!1455))))))

(assert (=> b!1183759 (= lt!536454 lt!536449)))

(assert (=> b!1183759 (= lt!536449 (-!1634 lt!536446 k0!934))))

(assert (=> b!1183759 (= lt!536454 (getCurrentListMapNoExtraKeys!5049 lt!536462 lt!536452 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1183759 (= lt!536446 (getCurrentListMapNoExtraKeys!5049 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!536445 () Unit!39181)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!854 (array!76471 array!76473 (_ BitVec 32) (_ BitVec 32) V!44907 V!44907 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!39181)

(assert (=> b!1183759 (= lt!536445 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!854 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1183760 () Bool)

(assert (=> b!1183760 (= e!673027 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(assert (= (and start!99726 res!786776) b!1183750))

(assert (= (and b!1183750 res!786774) b!1183751))

(assert (= (and b!1183751 res!786769) b!1183743))

(assert (= (and b!1183743 res!786767) b!1183742))

(assert (= (and b!1183742 res!786765) b!1183744))

(assert (= (and b!1183744 res!786775) b!1183755))

(assert (= (and b!1183755 res!786768) b!1183754))

(assert (= (and b!1183754 res!786764) b!1183747))

(assert (= (and b!1183747 res!786777) b!1183757))

(assert (= (and b!1183757 res!786778) b!1183752))

(assert (= (and b!1183752 (not res!786770)) b!1183758))

(assert (= (and b!1183758 (not res!786773)) b!1183759))

(assert (= (and b!1183759 (not res!786772)) b!1183749))

(assert (= (and b!1183749 res!786766) b!1183741))

(assert (= (and b!1183741 (not res!786771)) b!1183760))

(assert (= (and b!1183749 c!117081) b!1183753))

(assert (= (and b!1183749 (not c!117081)) b!1183748))

(assert (= (and b!1183745 condMapEmpty!46580) mapIsEmpty!46580))

(assert (= (and b!1183745 (not condMapEmpty!46580)) mapNonEmpty!46580))

(get-info :version)

(assert (= (and mapNonEmpty!46580 ((_ is ValueCellFull!14208) mapValue!46580)) b!1183746))

(assert (= (and b!1183745 ((_ is ValueCellFull!14208) mapDefault!46580)) b!1183756))

(assert (= start!99726 b!1183745))

(declare-fun b_lambda!20449 () Bool)

(assert (=> (not b_lambda!20449) (not b!1183758)))

(declare-fun t!38233 () Bool)

(declare-fun tb!10117 () Bool)

(assert (=> (and start!99726 (= defaultEntry!1004 defaultEntry!1004) t!38233) tb!10117))

(declare-fun result!20801 () Bool)

(assert (=> tb!10117 (= result!20801 tp_is_empty!29835)))

(assert (=> b!1183758 t!38233))

(declare-fun b_and!41479 () Bool)

(assert (= b_and!41477 (and (=> t!38233 result!20801) b_and!41479)))

(declare-fun m!1091935 () Bool)

(assert (=> b!1183755 m!1091935))

(declare-fun m!1091937 () Bool)

(assert (=> b!1183757 m!1091937))

(declare-fun m!1091939 () Bool)

(assert (=> b!1183747 m!1091939))

(declare-fun m!1091941 () Bool)

(assert (=> b!1183747 m!1091941))

(declare-fun m!1091943 () Bool)

(assert (=> b!1183750 m!1091943))

(declare-fun m!1091945 () Bool)

(assert (=> b!1183753 m!1091945))

(declare-fun m!1091947 () Bool)

(assert (=> b!1183753 m!1091947))

(declare-fun m!1091949 () Bool)

(assert (=> b!1183753 m!1091949))

(declare-fun m!1091951 () Bool)

(assert (=> b!1183753 m!1091951))

(declare-fun m!1091953 () Bool)

(assert (=> b!1183753 m!1091953))

(declare-fun m!1091955 () Bool)

(assert (=> b!1183752 m!1091955))

(declare-fun m!1091957 () Bool)

(assert (=> b!1183752 m!1091957))

(declare-fun m!1091959 () Bool)

(assert (=> b!1183759 m!1091959))

(declare-fun m!1091961 () Bool)

(assert (=> b!1183759 m!1091961))

(declare-fun m!1091963 () Bool)

(assert (=> b!1183759 m!1091963))

(declare-fun m!1091965 () Bool)

(assert (=> b!1183759 m!1091965))

(declare-fun m!1091967 () Bool)

(assert (=> b!1183759 m!1091967))

(declare-fun m!1091969 () Bool)

(assert (=> b!1183759 m!1091969))

(assert (=> b!1183759 m!1091967))

(assert (=> b!1183741 m!1091967))

(declare-fun m!1091971 () Bool)

(assert (=> b!1183758 m!1091971))

(declare-fun m!1091973 () Bool)

(assert (=> b!1183758 m!1091973))

(declare-fun m!1091975 () Bool)

(assert (=> b!1183758 m!1091975))

(declare-fun m!1091977 () Bool)

(assert (=> b!1183758 m!1091977))

(declare-fun m!1091979 () Bool)

(assert (=> mapNonEmpty!46580 m!1091979))

(declare-fun m!1091981 () Bool)

(assert (=> b!1183743 m!1091981))

(declare-fun m!1091983 () Bool)

(assert (=> b!1183742 m!1091983))

(declare-fun m!1091985 () Bool)

(assert (=> b!1183760 m!1091985))

(declare-fun m!1091987 () Bool)

(assert (=> b!1183749 m!1091987))

(declare-fun m!1091989 () Bool)

(assert (=> b!1183749 m!1091989))

(assert (=> b!1183749 m!1091987))

(assert (=> b!1183749 m!1091967))

(declare-fun m!1091991 () Bool)

(assert (=> b!1183749 m!1091991))

(declare-fun m!1091993 () Bool)

(assert (=> b!1183749 m!1091993))

(assert (=> b!1183749 m!1091967))

(declare-fun m!1091995 () Bool)

(assert (=> b!1183749 m!1091995))

(declare-fun m!1091997 () Bool)

(assert (=> b!1183749 m!1091997))

(declare-fun m!1091999 () Bool)

(assert (=> b!1183754 m!1091999))

(declare-fun m!1092001 () Bool)

(assert (=> start!99726 m!1092001))

(declare-fun m!1092003 () Bool)

(assert (=> start!99726 m!1092003))

(check-sat (not b!1183753) (not b!1183759) (not b!1183758) (not b!1183743) b_and!41479 (not start!99726) tp_is_empty!29835 (not b!1183742) (not b!1183755) (not b!1183747) (not mapNonEmpty!46580) (not b!1183752) (not b!1183749) (not b_next!25305) (not b!1183757) (not b!1183760) (not b_lambda!20449) (not b!1183750))
(check-sat b_and!41479 (not b_next!25305))
