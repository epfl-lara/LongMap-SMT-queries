; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99738 () Bool)

(assert start!99738)

(declare-fun b_free!25081 () Bool)

(declare-fun b_next!25081 () Bool)

(assert (=> start!99738 (= b_free!25081 (not b_next!25081))))

(declare-fun tp!87957 () Bool)

(declare-fun b_and!41031 () Bool)

(assert (=> start!99738 (= tp!87957 b_and!41031)))

(declare-fun b!1177764 () Bool)

(declare-datatypes ((Unit!38833 0))(
  ( (Unit!38834) )
))
(declare-fun e!669594 () Unit!38833)

(declare-fun Unit!38835 () Unit!38833)

(assert (=> b!1177764 (= e!669594 Unit!38835)))

(declare-fun b!1177765 () Bool)

(declare-fun e!669595 () Bool)

(declare-fun tp_is_empty!29611 () Bool)

(assert (=> b!1177765 (= e!669595 tp_is_empty!29611)))

(declare-fun b!1177766 () Bool)

(declare-fun res!781921 () Bool)

(declare-fun e!669597 () Bool)

(assert (=> b!1177766 (=> (not res!781921) (not e!669597))))

(declare-datatypes ((array!76077 0))(
  ( (array!76078 (arr!36682 (Array (_ BitVec 32) (_ BitVec 64))) (size!37219 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!76077)

(declare-datatypes ((List!25784 0))(
  ( (Nil!25781) (Cons!25780 (h!26998 (_ BitVec 64)) (t!37849 List!25784)) )
))
(declare-fun arrayNoDuplicates!0 (array!76077 (_ BitVec 32) List!25784) Bool)

(assert (=> b!1177766 (= res!781921 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25781))))

(declare-fun b!1177767 () Bool)

(declare-fun e!669587 () Bool)

(assert (=> b!1177767 (= e!669597 e!669587)))

(declare-fun res!781923 () Bool)

(assert (=> b!1177767 (=> (not res!781923) (not e!669587))))

(declare-fun lt!531483 () array!76077)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76077 (_ BitVec 32)) Bool)

(assert (=> b!1177767 (= res!781923 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!531483 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1177767 (= lt!531483 (array!76078 (store (arr!36682 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37219 _keys!1208)))))

(declare-fun res!781924 () Bool)

(assert (=> start!99738 (=> (not res!781924) (not e!669597))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!99738 (= res!781924 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37219 _keys!1208))))))

(assert (=> start!99738 e!669597))

(assert (=> start!99738 tp_is_empty!29611))

(declare-fun array_inv!28092 (array!76077) Bool)

(assert (=> start!99738 (array_inv!28092 _keys!1208)))

(assert (=> start!99738 true))

(assert (=> start!99738 tp!87957))

(declare-datatypes ((V!44609 0))(
  ( (V!44610 (val!14862 Int)) )
))
(declare-datatypes ((ValueCell!14096 0))(
  ( (ValueCellFull!14096 (v!17496 V!44609)) (EmptyCell!14096) )
))
(declare-datatypes ((array!76079 0))(
  ( (array!76080 (arr!36683 (Array (_ BitVec 32) ValueCell!14096)) (size!37220 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76079)

(declare-fun e!669599 () Bool)

(declare-fun array_inv!28093 (array!76079) Bool)

(assert (=> start!99738 (and (array_inv!28093 _values!996) e!669599)))

(declare-fun b!1177768 () Bool)

(declare-fun e!669598 () Bool)

(declare-fun e!669588 () Bool)

(assert (=> b!1177768 (= e!669598 e!669588)))

(declare-fun res!781918 () Bool)

(assert (=> b!1177768 (=> res!781918 e!669588)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1177768 (= res!781918 (not (= (select (arr!36682 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1177769 () Bool)

(declare-fun e!669589 () Bool)

(assert (=> b!1177769 (= e!669589 tp_is_empty!29611)))

(declare-fun b!1177770 () Bool)

(declare-fun res!781910 () Bool)

(assert (=> b!1177770 (=> (not res!781910) (not e!669597))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1177770 (= res!781910 (and (= (size!37220 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37219 _keys!1208) (size!37220 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1177771 () Bool)

(declare-fun mapRes!46244 () Bool)

(assert (=> b!1177771 (= e!669599 (and e!669589 mapRes!46244))))

(declare-fun condMapEmpty!46244 () Bool)

(declare-fun mapDefault!46244 () ValueCell!14096)

(assert (=> b!1177771 (= condMapEmpty!46244 (= (arr!36683 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14096)) mapDefault!46244)))))

(declare-fun b!1177772 () Bool)

(declare-fun e!669592 () Bool)

(assert (=> b!1177772 (= e!669592 true)))

(declare-fun e!669596 () Bool)

(assert (=> b!1177772 e!669596))

(declare-fun res!781922 () Bool)

(assert (=> b!1177772 (=> (not res!781922) (not e!669596))))

(assert (=> b!1177772 (= res!781922 (not (= (select (arr!36682 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!531484 () Unit!38833)

(assert (=> b!1177772 (= lt!531484 e!669594)))

(declare-fun c!117143 () Bool)

(assert (=> b!1177772 (= c!117143 (= (select (arr!36682 _keys!1208) from!1455) k0!934))))

(assert (=> b!1177772 e!669598))

(declare-fun res!781916 () Bool)

(assert (=> b!1177772 (=> (not res!781916) (not e!669598))))

(declare-datatypes ((tuple2!19052 0))(
  ( (tuple2!19053 (_1!9537 (_ BitVec 64)) (_2!9537 V!44609)) )
))
(declare-datatypes ((List!25785 0))(
  ( (Nil!25782) (Cons!25781 (h!26999 tuple2!19052) (t!37850 List!25785)) )
))
(declare-datatypes ((ListLongMap!17029 0))(
  ( (ListLongMap!17030 (toList!8530 List!25785)) )
))
(declare-fun lt!531487 () ListLongMap!17029)

(declare-fun lt!531473 () ListLongMap!17029)

(declare-fun lt!531482 () tuple2!19052)

(declare-fun +!3858 (ListLongMap!17029 tuple2!19052) ListLongMap!17029)

(assert (=> b!1177772 (= res!781916 (= lt!531487 (+!3858 lt!531473 lt!531482)))))

(declare-fun lt!531476 () V!44609)

(declare-fun get!18770 (ValueCell!14096 V!44609) V!44609)

(assert (=> b!1177772 (= lt!531482 (tuple2!19053 (select (arr!36682 _keys!1208) from!1455) (get!18770 (select (arr!36683 _values!996) from!1455) lt!531476)))))

(declare-fun b!1177773 () Bool)

(declare-fun arrayContainsKey!0 (array!76077 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1177773 (= e!669588 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun lt!531475 () ListLongMap!17029)

(declare-fun lt!531478 () ListLongMap!17029)

(declare-fun b!1177774 () Bool)

(assert (=> b!1177774 (= e!669596 (= lt!531478 (+!3858 lt!531475 lt!531482)))))

(declare-fun b!1177775 () Bool)

(declare-fun e!669591 () Bool)

(declare-fun e!669590 () Bool)

(assert (=> b!1177775 (= e!669591 e!669590)))

(declare-fun res!781917 () Bool)

(assert (=> b!1177775 (=> res!781917 e!669590)))

(assert (=> b!1177775 (= res!781917 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44609)

(declare-fun lt!531485 () array!76079)

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44609)

(declare-fun getCurrentListMapNoExtraKeys!5012 (array!76077 array!76079 (_ BitVec 32) (_ BitVec 32) V!44609 V!44609 (_ BitVec 32) Int) ListLongMap!17029)

(assert (=> b!1177775 (= lt!531487 (getCurrentListMapNoExtraKeys!5012 lt!531483 lt!531485 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1177775 (= lt!531485 (array!76080 (store (arr!36683 _values!996) i!673 (ValueCellFull!14096 lt!531476)) (size!37220 _values!996)))))

(declare-fun dynLambda!2987 (Int (_ BitVec 64)) V!44609)

(assert (=> b!1177775 (= lt!531476 (dynLambda!2987 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!1177775 (= lt!531478 (getCurrentListMapNoExtraKeys!5012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1177776 () Bool)

(declare-fun res!781912 () Bool)

(assert (=> b!1177776 (=> (not res!781912) (not e!669587))))

(assert (=> b!1177776 (= res!781912 (arrayNoDuplicates!0 lt!531483 #b00000000000000000000000000000000 Nil!25781))))

(declare-fun mapNonEmpty!46244 () Bool)

(declare-fun tp!87956 () Bool)

(assert (=> mapNonEmpty!46244 (= mapRes!46244 (and tp!87956 e!669595))))

(declare-fun mapRest!46244 () (Array (_ BitVec 32) ValueCell!14096))

(declare-fun mapValue!46244 () ValueCell!14096)

(declare-fun mapKey!46244 () (_ BitVec 32))

(assert (=> mapNonEmpty!46244 (= (arr!36683 _values!996) (store mapRest!46244 mapKey!46244 mapValue!46244))))

(declare-fun b!1177777 () Bool)

(declare-fun res!781913 () Bool)

(assert (=> b!1177777 (=> (not res!781913) (not e!669597))))

(assert (=> b!1177777 (= res!781913 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1177778 () Bool)

(declare-fun res!781925 () Bool)

(assert (=> b!1177778 (=> (not res!781925) (not e!669597))))

(assert (=> b!1177778 (= res!781925 (= (select (arr!36682 _keys!1208) i!673) k0!934))))

(declare-fun b!1177779 () Bool)

(assert (=> b!1177779 (= e!669587 (not e!669591))))

(declare-fun res!781919 () Bool)

(assert (=> b!1177779 (=> res!781919 e!669591)))

(assert (=> b!1177779 (= res!781919 (bvsgt from!1455 i!673))))

(assert (=> b!1177779 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!531486 () Unit!38833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76077 (_ BitVec 64) (_ BitVec 32)) Unit!38833)

(assert (=> b!1177779 (= lt!531486 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1177780 () Bool)

(declare-fun res!781911 () Bool)

(assert (=> b!1177780 (=> (not res!781911) (not e!669597))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1177780 (= res!781911 (validKeyInArray!0 k0!934))))

(declare-fun b!1177781 () Bool)

(declare-fun Unit!38836 () Unit!38833)

(assert (=> b!1177781 (= e!669594 Unit!38836)))

(declare-fun lt!531477 () Unit!38833)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76077 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38833)

(assert (=> b!1177781 (= lt!531477 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1177781 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!531479 () Unit!38833)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76077 (_ BitVec 32) (_ BitVec 32)) Unit!38833)

(assert (=> b!1177781 (= lt!531479 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1177781 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25781)))

(declare-fun lt!531480 () Unit!38833)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76077 (_ BitVec 64) (_ BitVec 32) List!25784) Unit!38833)

(assert (=> b!1177781 (= lt!531480 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25781))))

(assert (=> b!1177781 false))

(declare-fun b!1177782 () Bool)

(declare-fun res!781915 () Bool)

(assert (=> b!1177782 (=> (not res!781915) (not e!669597))))

(assert (=> b!1177782 (= res!781915 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37219 _keys!1208))))))

(declare-fun mapIsEmpty!46244 () Bool)

(assert (=> mapIsEmpty!46244 mapRes!46244))

(declare-fun b!1177783 () Bool)

(declare-fun res!781914 () Bool)

(assert (=> b!1177783 (=> (not res!781914) (not e!669597))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1177783 (= res!781914 (validMask!0 mask!1564))))

(declare-fun b!1177784 () Bool)

(assert (=> b!1177784 (= e!669590 e!669592)))

(declare-fun res!781920 () Bool)

(assert (=> b!1177784 (=> res!781920 e!669592)))

(assert (=> b!1177784 (= res!781920 (not (validKeyInArray!0 (select (arr!36682 _keys!1208) from!1455))))))

(declare-fun lt!531481 () ListLongMap!17029)

(assert (=> b!1177784 (= lt!531481 lt!531473)))

(declare-fun -!1569 (ListLongMap!17029 (_ BitVec 64)) ListLongMap!17029)

(assert (=> b!1177784 (= lt!531473 (-!1569 lt!531475 k0!934))))

(assert (=> b!1177784 (= lt!531481 (getCurrentListMapNoExtraKeys!5012 lt!531483 lt!531485 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1177784 (= lt!531475 (getCurrentListMapNoExtraKeys!5012 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!531474 () Unit!38833)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!794 (array!76077 array!76079 (_ BitVec 32) (_ BitVec 32) V!44609 V!44609 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38833)

(assert (=> b!1177784 (= lt!531474 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!794 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99738 res!781924) b!1177783))

(assert (= (and b!1177783 res!781914) b!1177770))

(assert (= (and b!1177770 res!781910) b!1177777))

(assert (= (and b!1177777 res!781913) b!1177766))

(assert (= (and b!1177766 res!781921) b!1177782))

(assert (= (and b!1177782 res!781915) b!1177780))

(assert (= (and b!1177780 res!781911) b!1177778))

(assert (= (and b!1177778 res!781925) b!1177767))

(assert (= (and b!1177767 res!781923) b!1177776))

(assert (= (and b!1177776 res!781912) b!1177779))

(assert (= (and b!1177779 (not res!781919)) b!1177775))

(assert (= (and b!1177775 (not res!781917)) b!1177784))

(assert (= (and b!1177784 (not res!781920)) b!1177772))

(assert (= (and b!1177772 res!781916) b!1177768))

(assert (= (and b!1177768 (not res!781918)) b!1177773))

(assert (= (and b!1177772 c!117143) b!1177781))

(assert (= (and b!1177772 (not c!117143)) b!1177764))

(assert (= (and b!1177772 res!781922) b!1177774))

(assert (= (and b!1177771 condMapEmpty!46244) mapIsEmpty!46244))

(assert (= (and b!1177771 (not condMapEmpty!46244)) mapNonEmpty!46244))

(get-info :version)

(assert (= (and mapNonEmpty!46244 ((_ is ValueCellFull!14096) mapValue!46244)) b!1177765))

(assert (= (and b!1177771 ((_ is ValueCellFull!14096) mapDefault!46244)) b!1177769))

(assert (= start!99738 b!1177771))

(declare-fun b_lambda!20219 () Bool)

(assert (=> (not b_lambda!20219) (not b!1177775)))

(declare-fun t!37848 () Bool)

(declare-fun tb!9885 () Bool)

(assert (=> (and start!99738 (= defaultEntry!1004 defaultEntry!1004) t!37848) tb!9885))

(declare-fun result!20345 () Bool)

(assert (=> tb!9885 (= result!20345 tp_is_empty!29611)))

(assert (=> b!1177775 t!37848))

(declare-fun b_and!41033 () Bool)

(assert (= b_and!41031 (and (=> t!37848 result!20345) b_and!41033)))

(declare-fun m!1085979 () Bool)

(assert (=> b!1177784 m!1085979))

(declare-fun m!1085981 () Bool)

(assert (=> b!1177784 m!1085981))

(declare-fun m!1085983 () Bool)

(assert (=> b!1177784 m!1085983))

(declare-fun m!1085985 () Bool)

(assert (=> b!1177784 m!1085985))

(declare-fun m!1085987 () Bool)

(assert (=> b!1177784 m!1085987))

(declare-fun m!1085989 () Bool)

(assert (=> b!1177784 m!1085989))

(assert (=> b!1177784 m!1085987))

(declare-fun m!1085991 () Bool)

(assert (=> start!99738 m!1085991))

(declare-fun m!1085993 () Bool)

(assert (=> start!99738 m!1085993))

(declare-fun m!1085995 () Bool)

(assert (=> b!1177778 m!1085995))

(assert (=> b!1177768 m!1085987))

(declare-fun m!1085997 () Bool)

(assert (=> b!1177780 m!1085997))

(declare-fun m!1085999 () Bool)

(assert (=> b!1177766 m!1085999))

(declare-fun m!1086001 () Bool)

(assert (=> b!1177779 m!1086001))

(declare-fun m!1086003 () Bool)

(assert (=> b!1177779 m!1086003))

(declare-fun m!1086005 () Bool)

(assert (=> b!1177776 m!1086005))

(declare-fun m!1086007 () Bool)

(assert (=> mapNonEmpty!46244 m!1086007))

(assert (=> b!1177772 m!1085987))

(declare-fun m!1086009 () Bool)

(assert (=> b!1177772 m!1086009))

(declare-fun m!1086011 () Bool)

(assert (=> b!1177772 m!1086011))

(assert (=> b!1177772 m!1086011))

(declare-fun m!1086013 () Bool)

(assert (=> b!1177772 m!1086013))

(declare-fun m!1086015 () Bool)

(assert (=> b!1177781 m!1086015))

(declare-fun m!1086017 () Bool)

(assert (=> b!1177781 m!1086017))

(declare-fun m!1086019 () Bool)

(assert (=> b!1177781 m!1086019))

(declare-fun m!1086021 () Bool)

(assert (=> b!1177781 m!1086021))

(declare-fun m!1086023 () Bool)

(assert (=> b!1177781 m!1086023))

(declare-fun m!1086025 () Bool)

(assert (=> b!1177774 m!1086025))

(declare-fun m!1086027 () Bool)

(assert (=> b!1177767 m!1086027))

(declare-fun m!1086029 () Bool)

(assert (=> b!1177767 m!1086029))

(declare-fun m!1086031 () Bool)

(assert (=> b!1177773 m!1086031))

(declare-fun m!1086033 () Bool)

(assert (=> b!1177775 m!1086033))

(declare-fun m!1086035 () Bool)

(assert (=> b!1177775 m!1086035))

(declare-fun m!1086037 () Bool)

(assert (=> b!1177775 m!1086037))

(declare-fun m!1086039 () Bool)

(assert (=> b!1177775 m!1086039))

(declare-fun m!1086041 () Bool)

(assert (=> b!1177783 m!1086041))

(declare-fun m!1086043 () Bool)

(assert (=> b!1177777 m!1086043))

(check-sat b_and!41033 (not b!1177779) (not b!1177772) (not b!1177774) (not mapNonEmpty!46244) (not b!1177780) (not b!1177766) (not b!1177784) (not b_next!25081) (not b!1177776) (not b!1177783) (not b!1177781) (not b!1177775) (not b!1177767) tp_is_empty!29611 (not b_lambda!20219) (not b!1177773) (not b!1177777) (not start!99738))
(check-sat b_and!41033 (not b_next!25081))
