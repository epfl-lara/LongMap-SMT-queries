; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99768 () Bool)

(assert start!99768)

(declare-fun b_free!25111 () Bool)

(declare-fun b_next!25111 () Bool)

(assert (=> start!99768 (= b_free!25111 (not b_next!25111))))

(declare-fun tp!88047 () Bool)

(declare-fun b_and!41091 () Bool)

(assert (=> start!99768 (= tp!88047 b_and!41091)))

(declare-fun b!1178739 () Bool)

(declare-fun res!782631 () Bool)

(declare-fun e!670179 () Bool)

(assert (=> b!1178739 (=> (not res!782631) (not e!670179))))

(declare-datatypes ((array!76137 0))(
  ( (array!76138 (arr!36712 (Array (_ BitVec 32) (_ BitVec 64))) (size!37249 (_ BitVec 32))) )
))
(declare-fun lt!532157 () array!76137)

(declare-datatypes ((List!25811 0))(
  ( (Nil!25808) (Cons!25807 (h!27025 (_ BitVec 64)) (t!37906 List!25811)) )
))
(declare-fun arrayNoDuplicates!0 (array!76137 (_ BitVec 32) List!25811) Bool)

(assert (=> b!1178739 (= res!782631 (arrayNoDuplicates!0 lt!532157 #b00000000000000000000000000000000 Nil!25808))))

(declare-fun b!1178740 () Bool)

(declare-fun res!782637 () Bool)

(declare-fun e!670174 () Bool)

(assert (=> b!1178740 (=> (not res!782637) (not e!670174))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1178740 (= res!782637 (validMask!0 mask!1564))))

(declare-fun b!1178741 () Bool)

(declare-datatypes ((Unit!38880 0))(
  ( (Unit!38881) )
))
(declare-fun e!670178 () Unit!38880)

(declare-fun Unit!38882 () Unit!38880)

(assert (=> b!1178741 (= e!670178 Unit!38882)))

(declare-fun b!1178742 () Bool)

(declare-fun res!782642 () Bool)

(assert (=> b!1178742 (=> (not res!782642) (not e!670174))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun _keys!1208 () array!76137)

(assert (=> b!1178742 (= res!782642 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37249 _keys!1208))))))

(declare-fun b!1178743 () Bool)

(declare-fun e!670173 () Bool)

(declare-fun tp_is_empty!29641 () Bool)

(assert (=> b!1178743 (= e!670173 tp_is_empty!29641)))

(declare-fun mapIsEmpty!46289 () Bool)

(declare-fun mapRes!46289 () Bool)

(assert (=> mapIsEmpty!46289 mapRes!46289))

(declare-fun e!670176 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1178744 () Bool)

(declare-fun arrayContainsKey!0 (array!76137 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1178744 (= e!670176 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178745 () Bool)

(declare-fun res!782639 () Bool)

(assert (=> b!1178745 (=> (not res!782639) (not e!670174))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((V!44649 0))(
  ( (V!44650 (val!14877 Int)) )
))
(declare-datatypes ((ValueCell!14111 0))(
  ( (ValueCellFull!14111 (v!17511 V!44649)) (EmptyCell!14111) )
))
(declare-datatypes ((array!76139 0))(
  ( (array!76140 (arr!36713 (Array (_ BitVec 32) ValueCell!14111)) (size!37250 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!76139)

(assert (=> b!1178745 (= res!782639 (and (= (size!37250 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37249 _keys!1208) (size!37250 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1178746 () Bool)

(declare-fun res!782630 () Bool)

(assert (=> b!1178746 (=> (not res!782630) (not e!670174))))

(assert (=> b!1178746 (= res!782630 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25808))))

(declare-fun b!1178747 () Bool)

(declare-fun e!670183 () Bool)

(assert (=> b!1178747 (= e!670183 (and e!670173 mapRes!46289))))

(declare-fun condMapEmpty!46289 () Bool)

(declare-fun mapDefault!46289 () ValueCell!14111)

(assert (=> b!1178747 (= condMapEmpty!46289 (= (arr!36713 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14111)) mapDefault!46289)))))

(declare-fun b!1178748 () Bool)

(declare-fun e!670181 () Bool)

(assert (=> b!1178748 (= e!670181 true)))

(declare-fun e!670184 () Bool)

(assert (=> b!1178748 e!670184))

(declare-fun res!782632 () Bool)

(assert (=> b!1178748 (=> (not res!782632) (not e!670184))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1178748 (= res!782632 (not (= (select (arr!36712 _keys!1208) from!1455) k0!934)))))

(declare-fun lt!532156 () Unit!38880)

(assert (=> b!1178748 (= lt!532156 e!670178)))

(declare-fun c!117188 () Bool)

(assert (=> b!1178748 (= c!117188 (= (select (arr!36712 _keys!1208) from!1455) k0!934))))

(declare-fun e!670172 () Bool)

(assert (=> b!1178748 e!670172))

(declare-fun res!782641 () Bool)

(assert (=> b!1178748 (=> (not res!782641) (not e!670172))))

(declare-datatypes ((tuple2!19080 0))(
  ( (tuple2!19081 (_1!9551 (_ BitVec 64)) (_2!9551 V!44649)) )
))
(declare-datatypes ((List!25812 0))(
  ( (Nil!25809) (Cons!25808 (h!27026 tuple2!19080) (t!37907 List!25812)) )
))
(declare-datatypes ((ListLongMap!17057 0))(
  ( (ListLongMap!17058 (toList!8544 List!25812)) )
))
(declare-fun lt!532161 () ListLongMap!17057)

(declare-fun lt!532155 () ListLongMap!17057)

(declare-fun lt!532148 () tuple2!19080)

(declare-fun +!3871 (ListLongMap!17057 tuple2!19080) ListLongMap!17057)

(assert (=> b!1178748 (= res!782641 (= lt!532161 (+!3871 lt!532155 lt!532148)))))

(declare-fun lt!532158 () V!44649)

(declare-fun get!18792 (ValueCell!14111 V!44649) V!44649)

(assert (=> b!1178748 (= lt!532148 (tuple2!19081 (select (arr!36712 _keys!1208) from!1455) (get!18792 (select (arr!36713 _values!996) from!1455) lt!532158)))))

(declare-fun b!1178749 () Bool)

(declare-fun Unit!38883 () Unit!38880)

(assert (=> b!1178749 (= e!670178 Unit!38883)))

(declare-fun lt!532151 () Unit!38880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!76137 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38880)

(assert (=> b!1178749 (= lt!532151 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(assert (=> b!1178749 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!532160 () Unit!38880)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!76137 (_ BitVec 32) (_ BitVec 32)) Unit!38880)

(assert (=> b!1178749 (= lt!532160 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1178749 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25808)))

(declare-fun lt!532162 () Unit!38880)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!76137 (_ BitVec 64) (_ BitVec 32) List!25811) Unit!38880)

(assert (=> b!1178749 (= lt!532162 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25808))))

(assert (=> b!1178749 false))

(declare-fun b!1178750 () Bool)

(assert (=> b!1178750 (= e!670174 e!670179)))

(declare-fun res!782633 () Bool)

(assert (=> b!1178750 (=> (not res!782633) (not e!670179))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!76137 (_ BitVec 32)) Bool)

(assert (=> b!1178750 (= res!782633 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!532157 mask!1564))))

(assert (=> b!1178750 (= lt!532157 (array!76138 (store (arr!36712 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37249 _keys!1208)))))

(declare-fun b!1178751 () Bool)

(declare-fun e!670177 () Bool)

(assert (=> b!1178751 (= e!670177 tp_is_empty!29641)))

(declare-fun b!1178752 () Bool)

(declare-fun e!670175 () Bool)

(declare-fun e!670180 () Bool)

(assert (=> b!1178752 (= e!670175 e!670180)))

(declare-fun res!782634 () Bool)

(assert (=> b!1178752 (=> res!782634 e!670180)))

(assert (=> b!1178752 (= res!782634 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44649)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!532152 () array!76139)

(declare-fun minValue!944 () V!44649)

(declare-fun getCurrentListMapNoExtraKeys!5023 (array!76137 array!76139 (_ BitVec 32) (_ BitVec 32) V!44649 V!44649 (_ BitVec 32) Int) ListLongMap!17057)

(assert (=> b!1178752 (= lt!532161 (getCurrentListMapNoExtraKeys!5023 lt!532157 lt!532152 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1178752 (= lt!532152 (array!76140 (store (arr!36713 _values!996) i!673 (ValueCellFull!14111 lt!532158)) (size!37250 _values!996)))))

(declare-fun dynLambda!2997 (Int (_ BitVec 64)) V!44649)

(assert (=> b!1178752 (= lt!532158 (dynLambda!2997 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!532149 () ListLongMap!17057)

(assert (=> b!1178752 (= lt!532149 (getCurrentListMapNoExtraKeys!5023 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!46289 () Bool)

(declare-fun tp!88046 () Bool)

(assert (=> mapNonEmpty!46289 (= mapRes!46289 (and tp!88046 e!670177))))

(declare-fun mapValue!46289 () ValueCell!14111)

(declare-fun mapKey!46289 () (_ BitVec 32))

(declare-fun mapRest!46289 () (Array (_ BitVec 32) ValueCell!14111))

(assert (=> mapNonEmpty!46289 (= (arr!36713 _values!996) (store mapRest!46289 mapKey!46289 mapValue!46289))))

(declare-fun b!1178753 () Bool)

(declare-fun lt!532153 () ListLongMap!17057)

(assert (=> b!1178753 (= e!670184 (= lt!532149 (+!3871 lt!532153 lt!532148)))))

(declare-fun res!782640 () Bool)

(assert (=> start!99768 (=> (not res!782640) (not e!670174))))

(assert (=> start!99768 (= res!782640 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37249 _keys!1208))))))

(assert (=> start!99768 e!670174))

(assert (=> start!99768 tp_is_empty!29641))

(declare-fun array_inv!28110 (array!76137) Bool)

(assert (=> start!99768 (array_inv!28110 _keys!1208)))

(assert (=> start!99768 true))

(assert (=> start!99768 tp!88047))

(declare-fun array_inv!28111 (array!76139) Bool)

(assert (=> start!99768 (and (array_inv!28111 _values!996) e!670183)))

(declare-fun b!1178754 () Bool)

(declare-fun res!782645 () Bool)

(assert (=> b!1178754 (=> (not res!782645) (not e!670174))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1178754 (= res!782645 (validKeyInArray!0 k0!934))))

(declare-fun b!1178755 () Bool)

(assert (=> b!1178755 (= e!670180 e!670181)))

(declare-fun res!782635 () Bool)

(assert (=> b!1178755 (=> res!782635 e!670181)))

(assert (=> b!1178755 (= res!782635 (not (validKeyInArray!0 (select (arr!36712 _keys!1208) from!1455))))))

(declare-fun lt!532150 () ListLongMap!17057)

(assert (=> b!1178755 (= lt!532150 lt!532155)))

(declare-fun -!1577 (ListLongMap!17057 (_ BitVec 64)) ListLongMap!17057)

(assert (=> b!1178755 (= lt!532155 (-!1577 lt!532153 k0!934))))

(assert (=> b!1178755 (= lt!532150 (getCurrentListMapNoExtraKeys!5023 lt!532157 lt!532152 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1178755 (= lt!532153 (getCurrentListMapNoExtraKeys!5023 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!532159 () Unit!38880)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!802 (array!76137 array!76139 (_ BitVec 32) (_ BitVec 32) V!44649 V!44649 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38880)

(assert (=> b!1178755 (= lt!532159 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!802 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1178756 () Bool)

(assert (=> b!1178756 (= e!670179 (not e!670175))))

(declare-fun res!782638 () Bool)

(assert (=> b!1178756 (=> res!782638 e!670175)))

(assert (=> b!1178756 (= res!782638 (bvsgt from!1455 i!673))))

(assert (=> b!1178756 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!532154 () Unit!38880)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!76137 (_ BitVec 64) (_ BitVec 32)) Unit!38880)

(assert (=> b!1178756 (= lt!532154 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1178757 () Bool)

(assert (=> b!1178757 (= e!670172 e!670176)))

(declare-fun res!782643 () Bool)

(assert (=> b!1178757 (=> res!782643 e!670176)))

(assert (=> b!1178757 (= res!782643 (not (= (select (arr!36712 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1178758 () Bool)

(declare-fun res!782644 () Bool)

(assert (=> b!1178758 (=> (not res!782644) (not e!670174))))

(assert (=> b!1178758 (= res!782644 (= (select (arr!36712 _keys!1208) i!673) k0!934))))

(declare-fun b!1178759 () Bool)

(declare-fun res!782636 () Bool)

(assert (=> b!1178759 (=> (not res!782636) (not e!670174))))

(assert (=> b!1178759 (= res!782636 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!99768 res!782640) b!1178740))

(assert (= (and b!1178740 res!782637) b!1178745))

(assert (= (and b!1178745 res!782639) b!1178759))

(assert (= (and b!1178759 res!782636) b!1178746))

(assert (= (and b!1178746 res!782630) b!1178742))

(assert (= (and b!1178742 res!782642) b!1178754))

(assert (= (and b!1178754 res!782645) b!1178758))

(assert (= (and b!1178758 res!782644) b!1178750))

(assert (= (and b!1178750 res!782633) b!1178739))

(assert (= (and b!1178739 res!782631) b!1178756))

(assert (= (and b!1178756 (not res!782638)) b!1178752))

(assert (= (and b!1178752 (not res!782634)) b!1178755))

(assert (= (and b!1178755 (not res!782635)) b!1178748))

(assert (= (and b!1178748 res!782641) b!1178757))

(assert (= (and b!1178757 (not res!782643)) b!1178744))

(assert (= (and b!1178748 c!117188) b!1178749))

(assert (= (and b!1178748 (not c!117188)) b!1178741))

(assert (= (and b!1178748 res!782632) b!1178753))

(assert (= (and b!1178747 condMapEmpty!46289) mapIsEmpty!46289))

(assert (= (and b!1178747 (not condMapEmpty!46289)) mapNonEmpty!46289))

(get-info :version)

(assert (= (and mapNonEmpty!46289 ((_ is ValueCellFull!14111) mapValue!46289)) b!1178751))

(assert (= (and b!1178747 ((_ is ValueCellFull!14111) mapDefault!46289)) b!1178743))

(assert (= start!99768 b!1178747))

(declare-fun b_lambda!20249 () Bool)

(assert (=> (not b_lambda!20249) (not b!1178752)))

(declare-fun t!37905 () Bool)

(declare-fun tb!9915 () Bool)

(assert (=> (and start!99768 (= defaultEntry!1004 defaultEntry!1004) t!37905) tb!9915))

(declare-fun result!20405 () Bool)

(assert (=> tb!9915 (= result!20405 tp_is_empty!29641)))

(assert (=> b!1178752 t!37905))

(declare-fun b_and!41093 () Bool)

(assert (= b_and!41091 (and (=> t!37905 result!20405) b_and!41093)))

(declare-fun m!1086969 () Bool)

(assert (=> b!1178757 m!1086969))

(declare-fun m!1086971 () Bool)

(assert (=> b!1178739 m!1086971))

(declare-fun m!1086973 () Bool)

(assert (=> b!1178755 m!1086973))

(declare-fun m!1086975 () Bool)

(assert (=> b!1178755 m!1086975))

(declare-fun m!1086977 () Bool)

(assert (=> b!1178755 m!1086977))

(assert (=> b!1178755 m!1086969))

(declare-fun m!1086979 () Bool)

(assert (=> b!1178755 m!1086979))

(declare-fun m!1086981 () Bool)

(assert (=> b!1178755 m!1086981))

(assert (=> b!1178755 m!1086969))

(declare-fun m!1086983 () Bool)

(assert (=> b!1178753 m!1086983))

(declare-fun m!1086985 () Bool)

(assert (=> b!1178744 m!1086985))

(declare-fun m!1086987 () Bool)

(assert (=> b!1178740 m!1086987))

(declare-fun m!1086989 () Bool)

(assert (=> b!1178754 m!1086989))

(declare-fun m!1086991 () Bool)

(assert (=> b!1178750 m!1086991))

(declare-fun m!1086993 () Bool)

(assert (=> b!1178750 m!1086993))

(declare-fun m!1086995 () Bool)

(assert (=> start!99768 m!1086995))

(declare-fun m!1086997 () Bool)

(assert (=> start!99768 m!1086997))

(declare-fun m!1086999 () Bool)

(assert (=> b!1178758 m!1086999))

(declare-fun m!1087001 () Bool)

(assert (=> b!1178749 m!1087001))

(declare-fun m!1087003 () Bool)

(assert (=> b!1178749 m!1087003))

(declare-fun m!1087005 () Bool)

(assert (=> b!1178749 m!1087005))

(declare-fun m!1087007 () Bool)

(assert (=> b!1178749 m!1087007))

(declare-fun m!1087009 () Bool)

(assert (=> b!1178749 m!1087009))

(declare-fun m!1087011 () Bool)

(assert (=> b!1178752 m!1087011))

(declare-fun m!1087013 () Bool)

(assert (=> b!1178752 m!1087013))

(declare-fun m!1087015 () Bool)

(assert (=> b!1178752 m!1087015))

(declare-fun m!1087017 () Bool)

(assert (=> b!1178752 m!1087017))

(declare-fun m!1087019 () Bool)

(assert (=> b!1178746 m!1087019))

(declare-fun m!1087021 () Bool)

(assert (=> b!1178756 m!1087021))

(declare-fun m!1087023 () Bool)

(assert (=> b!1178756 m!1087023))

(declare-fun m!1087025 () Bool)

(assert (=> b!1178759 m!1087025))

(declare-fun m!1087027 () Bool)

(assert (=> mapNonEmpty!46289 m!1087027))

(assert (=> b!1178748 m!1086969))

(declare-fun m!1087029 () Bool)

(assert (=> b!1178748 m!1087029))

(declare-fun m!1087031 () Bool)

(assert (=> b!1178748 m!1087031))

(assert (=> b!1178748 m!1087031))

(declare-fun m!1087033 () Bool)

(assert (=> b!1178748 m!1087033))

(check-sat (not b!1178746) (not b!1178748) (not b!1178759) (not b!1178754) (not b!1178753) (not b!1178740) (not b!1178755) (not b!1178750) (not b_next!25111) b_and!41093 (not b!1178739) (not b!1178756) (not start!99768) (not b_lambda!20249) (not b!1178744) (not mapNonEmpty!46289) (not b!1178749) (not b!1178752) tp_is_empty!29641)
(check-sat b_and!41093 (not b_next!25111))
