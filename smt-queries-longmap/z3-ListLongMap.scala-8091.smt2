; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!99414 () Bool)

(assert start!99414)

(declare-fun b_free!24993 () Bool)

(declare-fun b_next!24993 () Bool)

(assert (=> start!99414 (= b_free!24993 (not b_next!24993))))

(declare-fun tp!87692 () Bool)

(declare-fun b_and!40853 () Bool)

(assert (=> start!99414 (= tp!87692 b_and!40853)))

(declare-fun b!1173727 () Bool)

(declare-fun res!779406 () Bool)

(declare-fun e!667159 () Bool)

(assert (=> b!1173727 (=> (not res!779406) (not e!667159))))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1173727 (= res!779406 (validMask!0 mask!1564))))

(declare-fun b!1173728 () Bool)

(declare-fun e!667151 () Bool)

(declare-fun tp_is_empty!29523 () Bool)

(assert (=> b!1173728 (= e!667151 tp_is_empty!29523)))

(declare-fun b!1173729 () Bool)

(declare-fun res!779414 () Bool)

(assert (=> b!1173729 (=> (not res!779414) (not e!667159))))

(declare-datatypes ((array!75857 0))(
  ( (array!75858 (arr!36578 (Array (_ BitVec 32) (_ BitVec 64))) (size!37114 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!75857)

(declare-datatypes ((List!25675 0))(
  ( (Nil!25672) (Cons!25671 (h!26880 (_ BitVec 64)) (t!37660 List!25675)) )
))
(declare-fun arrayNoDuplicates!0 (array!75857 (_ BitVec 32) List!25675) Bool)

(assert (=> b!1173729 (= res!779414 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!25672))))

(declare-fun b!1173730 () Bool)

(declare-fun e!667153 () Bool)

(assert (=> b!1173730 (= e!667159 e!667153)))

(declare-fun res!779415 () Bool)

(assert (=> b!1173730 (=> (not res!779415) (not e!667153))))

(declare-fun lt!529122 () array!75857)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!75857 (_ BitVec 32)) Bool)

(assert (=> b!1173730 (= res!779415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!529122 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1173730 (= lt!529122 (array!75858 (store (arr!36578 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!37114 _keys!1208)))))

(declare-fun b!1173731 () Bool)

(declare-datatypes ((Unit!38708 0))(
  ( (Unit!38709) )
))
(declare-fun e!667162 () Unit!38708)

(declare-fun Unit!38710 () Unit!38708)

(assert (=> b!1173731 (= e!667162 Unit!38710)))

(declare-fun lt!529133 () Unit!38708)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!75857 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!38708)

(assert (=> b!1173731 (= lt!529133 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!1208 k0!934 i!673 (bvadd #b00000000000000000000000000000001 from!1455)))))

(declare-fun arrayContainsKey!0 (array!75857 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1173731 (arrayContainsKey!0 _keys!1208 k0!934 (bvadd #b00000000000000000000000000000001 from!1455))))

(declare-fun lt!529132 () Unit!38708)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!75857 (_ BitVec 32) (_ BitVec 32)) Unit!38708)

(assert (=> b!1173731 (= lt!529132 (lemmaNoDuplicateFromThenFromBigger!0 _keys!1208 #b00000000000000000000000000000000 from!1455))))

(assert (=> b!1173731 (arrayNoDuplicates!0 _keys!1208 from!1455 Nil!25672)))

(declare-fun lt!529134 () Unit!38708)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!75857 (_ BitVec 64) (_ BitVec 32) List!25675) Unit!38708)

(assert (=> b!1173731 (= lt!529134 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!1208 k0!934 from!1455 Nil!25672))))

(assert (=> b!1173731 false))

(declare-fun b!1173732 () Bool)

(declare-fun e!667160 () Bool)

(assert (=> b!1173732 (= e!667160 (arrayContainsKey!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173734 () Bool)

(declare-fun res!779410 () Bool)

(assert (=> b!1173734 (=> (not res!779410) (not e!667159))))

(assert (=> b!1173734 (= res!779410 (= (select (arr!36578 _keys!1208) i!673) k0!934))))

(declare-fun mapIsEmpty!46112 () Bool)

(declare-fun mapRes!46112 () Bool)

(assert (=> mapIsEmpty!46112 mapRes!46112))

(declare-fun b!1173735 () Bool)

(declare-fun e!667154 () Bool)

(assert (=> b!1173735 (= e!667154 true)))

(assert (=> b!1173735 (not (= (select (arr!36578 _keys!1208) from!1455) k0!934))))

(declare-fun lt!529131 () Unit!38708)

(assert (=> b!1173735 (= lt!529131 e!667162)))

(declare-fun c!116613 () Bool)

(assert (=> b!1173735 (= c!116613 (= (select (arr!36578 _keys!1208) from!1455) k0!934))))

(declare-fun e!667157 () Bool)

(assert (=> b!1173735 e!667157))

(declare-fun res!779403 () Bool)

(assert (=> b!1173735 (=> (not res!779403) (not e!667157))))

(declare-datatypes ((V!44491 0))(
  ( (V!44492 (val!14818 Int)) )
))
(declare-datatypes ((tuple2!18938 0))(
  ( (tuple2!18939 (_1!9480 (_ BitVec 64)) (_2!9480 V!44491)) )
))
(declare-datatypes ((List!25676 0))(
  ( (Nil!25673) (Cons!25672 (h!26881 tuple2!18938) (t!37661 List!25676)) )
))
(declare-datatypes ((ListLongMap!16907 0))(
  ( (ListLongMap!16908 (toList!8469 List!25676)) )
))
(declare-fun lt!529123 () ListLongMap!16907)

(declare-fun lt!529130 () V!44491)

(declare-datatypes ((ValueCell!14052 0))(
  ( (ValueCellFull!14052 (v!17456 V!44491)) (EmptyCell!14052) )
))
(declare-datatypes ((array!75859 0))(
  ( (array!75860 (arr!36579 (Array (_ BitVec 32) ValueCell!14052)) (size!37115 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!75859)

(declare-fun lt!529126 () ListLongMap!16907)

(declare-fun +!3787 (ListLongMap!16907 tuple2!18938) ListLongMap!16907)

(declare-fun get!18665 (ValueCell!14052 V!44491) V!44491)

(assert (=> b!1173735 (= res!779403 (= lt!529123 (+!3787 lt!529126 (tuple2!18939 (select (arr!36578 _keys!1208) from!1455) (get!18665 (select (arr!36579 _values!996) from!1455) lt!529130)))))))

(declare-fun b!1173736 () Bool)

(declare-fun e!667156 () Bool)

(assert (=> b!1173736 (= e!667153 (not e!667156))))

(declare-fun res!779404 () Bool)

(assert (=> b!1173736 (=> res!779404 e!667156)))

(assert (=> b!1173736 (= res!779404 (bvsgt from!1455 i!673))))

(assert (=> b!1173736 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!529127 () Unit!38708)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!75857 (_ BitVec 64) (_ BitVec 32)) Unit!38708)

(assert (=> b!1173736 (= lt!529127 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1173737 () Bool)

(declare-fun e!667155 () Bool)

(assert (=> b!1173737 (= e!667156 e!667155)))

(declare-fun res!779409 () Bool)

(assert (=> b!1173737 (=> res!779409 e!667155)))

(assert (=> b!1173737 (= res!779409 (or (= from!1455 i!673) (bvsge from!1455 i!673)))))

(declare-fun zeroValue!944 () V!44491)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun minValue!944 () V!44491)

(declare-fun lt!529128 () array!75859)

(declare-fun getCurrentListMapNoExtraKeys!4931 (array!75857 array!75859 (_ BitVec 32) (_ BitVec 32) V!44491 V!44491 (_ BitVec 32) Int) ListLongMap!16907)

(assert (=> b!1173737 (= lt!529123 (getCurrentListMapNoExtraKeys!4931 lt!529122 lt!529128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(assert (=> b!1173737 (= lt!529128 (array!75860 (store (arr!36579 _values!996) i!673 (ValueCellFull!14052 lt!529130)) (size!37115 _values!996)))))

(declare-fun dynLambda!2901 (Int (_ BitVec 64)) V!44491)

(assert (=> b!1173737 (= lt!529130 (dynLambda!2901 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!529121 () ListLongMap!16907)

(assert (=> b!1173737 (= lt!529121 (getCurrentListMapNoExtraKeys!4931 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun res!779413 () Bool)

(assert (=> start!99414 (=> (not res!779413) (not e!667159))))

(assert (=> start!99414 (= res!779413 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!37114 _keys!1208))))))

(assert (=> start!99414 e!667159))

(assert (=> start!99414 tp_is_empty!29523))

(declare-fun array_inv!27946 (array!75857) Bool)

(assert (=> start!99414 (array_inv!27946 _keys!1208)))

(assert (=> start!99414 true))

(assert (=> start!99414 tp!87692))

(declare-fun e!667161 () Bool)

(declare-fun array_inv!27947 (array!75859) Bool)

(assert (=> start!99414 (and (array_inv!27947 _values!996) e!667161)))

(declare-fun b!1173733 () Bool)

(declare-fun Unit!38711 () Unit!38708)

(assert (=> b!1173733 (= e!667162 Unit!38711)))

(declare-fun b!1173738 () Bool)

(declare-fun e!667158 () Bool)

(assert (=> b!1173738 (= e!667161 (and e!667158 mapRes!46112))))

(declare-fun condMapEmpty!46112 () Bool)

(declare-fun mapDefault!46112 () ValueCell!14052)

(assert (=> b!1173738 (= condMapEmpty!46112 (= (arr!36579 _values!996) ((as const (Array (_ BitVec 32) ValueCell!14052)) mapDefault!46112)))))

(declare-fun b!1173739 () Bool)

(assert (=> b!1173739 (= e!667158 tp_is_empty!29523)))

(declare-fun mapNonEmpty!46112 () Bool)

(declare-fun tp!87693 () Bool)

(assert (=> mapNonEmpty!46112 (= mapRes!46112 (and tp!87693 e!667151))))

(declare-fun mapKey!46112 () (_ BitVec 32))

(declare-fun mapRest!46112 () (Array (_ BitVec 32) ValueCell!14052))

(declare-fun mapValue!46112 () ValueCell!14052)

(assert (=> mapNonEmpty!46112 (= (arr!36579 _values!996) (store mapRest!46112 mapKey!46112 mapValue!46112))))

(declare-fun b!1173740 () Bool)

(declare-fun res!779408 () Bool)

(assert (=> b!1173740 (=> (not res!779408) (not e!667159))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1173740 (= res!779408 (validKeyInArray!0 k0!934))))

(declare-fun b!1173741 () Bool)

(declare-fun res!779405 () Bool)

(assert (=> b!1173741 (=> (not res!779405) (not e!667159))))

(assert (=> b!1173741 (= res!779405 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!37114 _keys!1208))))))

(declare-fun b!1173742 () Bool)

(assert (=> b!1173742 (= e!667157 e!667160)))

(declare-fun res!779411 () Bool)

(assert (=> b!1173742 (=> res!779411 e!667160)))

(assert (=> b!1173742 (= res!779411 (not (= (select (arr!36578 _keys!1208) from!1455) k0!934)))))

(declare-fun b!1173743 () Bool)

(declare-fun res!779407 () Bool)

(assert (=> b!1173743 (=> (not res!779407) (not e!667153))))

(assert (=> b!1173743 (= res!779407 (arrayNoDuplicates!0 lt!529122 #b00000000000000000000000000000000 Nil!25672))))

(declare-fun b!1173744 () Bool)

(declare-fun res!779402 () Bool)

(assert (=> b!1173744 (=> (not res!779402) (not e!667159))))

(assert (=> b!1173744 (= res!779402 (and (= (size!37115 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!37114 _keys!1208) (size!37115 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1173745 () Bool)

(declare-fun res!779416 () Bool)

(assert (=> b!1173745 (=> (not res!779416) (not e!667159))))

(assert (=> b!1173745 (= res!779416 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1173746 () Bool)

(assert (=> b!1173746 (= e!667155 e!667154)))

(declare-fun res!779412 () Bool)

(assert (=> b!1173746 (=> res!779412 e!667154)))

(assert (=> b!1173746 (= res!779412 (not (validKeyInArray!0 (select (arr!36578 _keys!1208) from!1455))))))

(declare-fun lt!529124 () ListLongMap!16907)

(assert (=> b!1173746 (= lt!529124 lt!529126)))

(declare-fun lt!529129 () ListLongMap!16907)

(declare-fun -!1531 (ListLongMap!16907 (_ BitVec 64)) ListLongMap!16907)

(assert (=> b!1173746 (= lt!529126 (-!1531 lt!529129 k0!934))))

(assert (=> b!1173746 (= lt!529124 (getCurrentListMapNoExtraKeys!4931 lt!529122 lt!529128 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (=> b!1173746 (= lt!529129 (getCurrentListMapNoExtraKeys!4931 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun lt!529125 () Unit!38708)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!758 (array!75857 array!75859 (_ BitVec 32) (_ BitVec 32) V!44491 V!44491 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!38708)

(assert (=> b!1173746 (= lt!529125 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!758 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!99414 res!779413) b!1173727))

(assert (= (and b!1173727 res!779406) b!1173744))

(assert (= (and b!1173744 res!779402) b!1173745))

(assert (= (and b!1173745 res!779416) b!1173729))

(assert (= (and b!1173729 res!779414) b!1173741))

(assert (= (and b!1173741 res!779405) b!1173740))

(assert (= (and b!1173740 res!779408) b!1173734))

(assert (= (and b!1173734 res!779410) b!1173730))

(assert (= (and b!1173730 res!779415) b!1173743))

(assert (= (and b!1173743 res!779407) b!1173736))

(assert (= (and b!1173736 (not res!779404)) b!1173737))

(assert (= (and b!1173737 (not res!779409)) b!1173746))

(assert (= (and b!1173746 (not res!779412)) b!1173735))

(assert (= (and b!1173735 res!779403) b!1173742))

(assert (= (and b!1173742 (not res!779411)) b!1173732))

(assert (= (and b!1173735 c!116613) b!1173731))

(assert (= (and b!1173735 (not c!116613)) b!1173733))

(assert (= (and b!1173738 condMapEmpty!46112) mapIsEmpty!46112))

(assert (= (and b!1173738 (not condMapEmpty!46112)) mapNonEmpty!46112))

(get-info :version)

(assert (= (and mapNonEmpty!46112 ((_ is ValueCellFull!14052) mapValue!46112)) b!1173728))

(assert (= (and b!1173738 ((_ is ValueCellFull!14052) mapDefault!46112)) b!1173739))

(assert (= start!99414 b!1173738))

(declare-fun b_lambda!20137 () Bool)

(assert (=> (not b_lambda!20137) (not b!1173737)))

(declare-fun t!37659 () Bool)

(declare-fun tb!9805 () Bool)

(assert (=> (and start!99414 (= defaultEntry!1004 defaultEntry!1004) t!37659) tb!9805))

(declare-fun result!20177 () Bool)

(assert (=> tb!9805 (= result!20177 tp_is_empty!29523)))

(assert (=> b!1173737 t!37659))

(declare-fun b_and!40855 () Bool)

(assert (= b_and!40853 (and (=> t!37659 result!20177) b_and!40855)))

(declare-fun m!1081579 () Bool)

(assert (=> b!1173730 m!1081579))

(declare-fun m!1081581 () Bool)

(assert (=> b!1173730 m!1081581))

(declare-fun m!1081583 () Bool)

(assert (=> b!1173735 m!1081583))

(declare-fun m!1081585 () Bool)

(assert (=> b!1173735 m!1081585))

(assert (=> b!1173735 m!1081585))

(declare-fun m!1081587 () Bool)

(assert (=> b!1173735 m!1081587))

(declare-fun m!1081589 () Bool)

(assert (=> b!1173735 m!1081589))

(declare-fun m!1081591 () Bool)

(assert (=> b!1173729 m!1081591))

(declare-fun m!1081593 () Bool)

(assert (=> b!1173727 m!1081593))

(declare-fun m!1081595 () Bool)

(assert (=> b!1173746 m!1081595))

(declare-fun m!1081597 () Bool)

(assert (=> b!1173746 m!1081597))

(declare-fun m!1081599 () Bool)

(assert (=> b!1173746 m!1081599))

(declare-fun m!1081601 () Bool)

(assert (=> b!1173746 m!1081601))

(assert (=> b!1173746 m!1081583))

(declare-fun m!1081603 () Bool)

(assert (=> b!1173746 m!1081603))

(assert (=> b!1173746 m!1081583))

(declare-fun m!1081605 () Bool)

(assert (=> b!1173736 m!1081605))

(declare-fun m!1081607 () Bool)

(assert (=> b!1173736 m!1081607))

(declare-fun m!1081609 () Bool)

(assert (=> mapNonEmpty!46112 m!1081609))

(declare-fun m!1081611 () Bool)

(assert (=> b!1173731 m!1081611))

(declare-fun m!1081613 () Bool)

(assert (=> b!1173731 m!1081613))

(declare-fun m!1081615 () Bool)

(assert (=> b!1173731 m!1081615))

(declare-fun m!1081617 () Bool)

(assert (=> b!1173731 m!1081617))

(declare-fun m!1081619 () Bool)

(assert (=> b!1173731 m!1081619))

(declare-fun m!1081621 () Bool)

(assert (=> b!1173740 m!1081621))

(declare-fun m!1081623 () Bool)

(assert (=> b!1173734 m!1081623))

(declare-fun m!1081625 () Bool)

(assert (=> b!1173745 m!1081625))

(assert (=> b!1173742 m!1081583))

(declare-fun m!1081627 () Bool)

(assert (=> start!99414 m!1081627))

(declare-fun m!1081629 () Bool)

(assert (=> start!99414 m!1081629))

(declare-fun m!1081631 () Bool)

(assert (=> b!1173732 m!1081631))

(declare-fun m!1081633 () Bool)

(assert (=> b!1173737 m!1081633))

(declare-fun m!1081635 () Bool)

(assert (=> b!1173737 m!1081635))

(declare-fun m!1081637 () Bool)

(assert (=> b!1173737 m!1081637))

(declare-fun m!1081639 () Bool)

(assert (=> b!1173737 m!1081639))

(declare-fun m!1081641 () Bool)

(assert (=> b!1173743 m!1081641))

(check-sat (not b!1173727) (not b!1173735) (not b!1173736) (not b!1173737) tp_is_empty!29523 (not mapNonEmpty!46112) (not b!1173746) (not b!1173740) (not b!1173729) (not b!1173731) (not b!1173745) (not start!99414) b_and!40855 (not b!1173732) (not b_next!24993) (not b!1173743) (not b_lambda!20137) (not b!1173730))
(check-sat b_and!40855 (not b_next!24993))
