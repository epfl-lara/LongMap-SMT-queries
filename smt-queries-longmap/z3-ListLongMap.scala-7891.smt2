; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98084 () Bool)

(assert start!98084)

(declare-fun b_free!23791 () Bool)

(declare-fun b_next!23791 () Bool)

(assert (=> start!98084 (= b_free!23791 (not b_next!23791))))

(declare-fun tp!84077 () Bool)

(declare-fun b_and!38343 () Bool)

(assert (=> start!98084 (= tp!84077 b_and!38343)))

(declare-fun b!1126609 () Bool)

(declare-fun e!641248 () Bool)

(declare-fun e!641250 () Bool)

(assert (=> b!1126609 (= e!641248 e!641250)))

(declare-fun res!752866 () Bool)

(assert (=> b!1126609 (=> res!752866 e!641250)))

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126609 (= res!752866 (not (= from!1455 i!673)))))

(declare-datatypes ((V!42889 0))(
  ( (V!42890 (val!14217 Int)) )
))
(declare-fun zeroValue!944 () V!42889)

(declare-datatypes ((ValueCell!13451 0))(
  ( (ValueCellFull!13451 (v!16849 V!42889)) (EmptyCell!13451) )
))
(declare-datatypes ((array!73430 0))(
  ( (array!73431 (arr!35368 (Array (_ BitVec 32) ValueCell!13451)) (size!35906 (_ BitVec 32))) )
))
(declare-fun lt!500139 () array!73430)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17972 0))(
  ( (tuple2!17973 (_1!8997 (_ BitVec 64)) (_2!8997 V!42889)) )
))
(declare-datatypes ((List!24729 0))(
  ( (Nil!24726) (Cons!24725 (h!25934 tuple2!17972) (t!35503 List!24729)) )
))
(declare-datatypes ((ListLongMap!15941 0))(
  ( (ListLongMap!15942 (toList!7986 List!24729)) )
))
(declare-fun lt!500137 () ListLongMap!15941)

(declare-fun minValue!944 () V!42889)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((array!73432 0))(
  ( (array!73433 (arr!35369 (Array (_ BitVec 32) (_ BitVec 64))) (size!35907 (_ BitVec 32))) )
))
(declare-fun lt!500140 () array!73432)

(declare-fun getCurrentListMapNoExtraKeys!4487 (array!73432 array!73430 (_ BitVec 32) (_ BitVec 32) V!42889 V!42889 (_ BitVec 32) Int) ListLongMap!15941)

(assert (=> b!1126609 (= lt!500137 (getCurrentListMapNoExtraKeys!4487 lt!500140 lt!500139 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73430)

(declare-fun dynLambda!2502 (Int (_ BitVec 64)) V!42889)

(assert (=> b!1126609 (= lt!500139 (array!73431 (store (arr!35368 _values!996) i!673 (ValueCellFull!13451 (dynLambda!2502 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35906 _values!996)))))

(declare-fun _keys!1208 () array!73432)

(declare-fun lt!500141 () ListLongMap!15941)

(assert (=> b!1126609 (= lt!500141 (getCurrentListMapNoExtraKeys!4487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126610 () Bool)

(declare-fun e!641247 () Bool)

(declare-fun tp_is_empty!28321 () Bool)

(assert (=> b!1126610 (= e!641247 tp_is_empty!28321)))

(declare-fun b!1126611 () Bool)

(declare-fun e!641254 () Bool)

(declare-fun call!47632 () ListLongMap!15941)

(declare-fun call!47633 () ListLongMap!15941)

(assert (=> b!1126611 (= e!641254 (= call!47632 call!47633))))

(declare-fun b!1126612 () Bool)

(declare-fun res!752869 () Bool)

(declare-fun e!641252 () Bool)

(assert (=> b!1126612 (=> (not res!752869) (not e!641252))))

(declare-datatypes ((List!24730 0))(
  ( (Nil!24727) (Cons!24726 (h!25935 (_ BitVec 64)) (t!35504 List!24730)) )
))
(declare-fun arrayNoDuplicates!0 (array!73432 (_ BitVec 32) List!24730) Bool)

(assert (=> b!1126612 (= res!752869 (arrayNoDuplicates!0 lt!500140 #b00000000000000000000000000000000 Nil!24727))))

(declare-fun b!1126613 () Bool)

(declare-fun res!752861 () Bool)

(declare-fun e!641251 () Bool)

(assert (=> b!1126613 (=> (not res!752861) (not e!641251))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126613 (= res!752861 (validMask!0 mask!1564))))

(declare-fun b!1126614 () Bool)

(assert (=> b!1126614 (= e!641251 e!641252)))

(declare-fun res!752860 () Bool)

(assert (=> b!1126614 (=> (not res!752860) (not e!641252))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73432 (_ BitVec 32)) Bool)

(assert (=> b!1126614 (= res!752860 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500140 mask!1564))))

(assert (=> b!1126614 (= lt!500140 (array!73433 (store (arr!35369 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35907 _keys!1208)))))

(declare-fun b!1126615 () Bool)

(declare-fun e!641255 () Bool)

(declare-fun e!641256 () Bool)

(declare-fun mapRes!44299 () Bool)

(assert (=> b!1126615 (= e!641255 (and e!641256 mapRes!44299))))

(declare-fun condMapEmpty!44299 () Bool)

(declare-fun mapDefault!44299 () ValueCell!13451)

(assert (=> b!1126615 (= condMapEmpty!44299 (= (arr!35368 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13451)) mapDefault!44299)))))

(declare-fun b!1126616 () Bool)

(declare-fun res!752857 () Bool)

(assert (=> b!1126616 (=> (not res!752857) (not e!641251))))

(assert (=> b!1126616 (= res!752857 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1126617 () Bool)

(declare-fun e!641249 () Bool)

(assert (=> b!1126617 (= e!641250 e!641249)))

(declare-fun res!752859 () Bool)

(assert (=> b!1126617 (=> res!752859 e!641249)))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1126617 (= res!752859 (not (= (select (arr!35369 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126617 e!641254))

(declare-fun c!109650 () Bool)

(assert (=> b!1126617 (= c!109650 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36775 0))(
  ( (Unit!36776) )
))
(declare-fun lt!500138 () Unit!36775)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!392 (array!73432 array!73430 (_ BitVec 32) (_ BitVec 32) V!42889 V!42889 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36775)

(assert (=> b!1126617 (= lt!500138 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!392 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126618 () Bool)

(assert (=> b!1126618 (= e!641256 tp_is_empty!28321)))

(declare-fun b!1126619 () Bool)

(declare-fun res!752858 () Bool)

(assert (=> b!1126619 (=> (not res!752858) (not e!641251))))

(assert (=> b!1126619 (= res!752858 (and (= (size!35906 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35907 _keys!1208) (size!35906 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126620 () Bool)

(declare-fun res!752867 () Bool)

(assert (=> b!1126620 (=> (not res!752867) (not e!641251))))

(assert (=> b!1126620 (= res!752867 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35907 _keys!1208))))))

(declare-fun mapNonEmpty!44299 () Bool)

(declare-fun tp!84076 () Bool)

(assert (=> mapNonEmpty!44299 (= mapRes!44299 (and tp!84076 e!641247))))

(declare-fun mapKey!44299 () (_ BitVec 32))

(declare-fun mapRest!44299 () (Array (_ BitVec 32) ValueCell!13451))

(declare-fun mapValue!44299 () ValueCell!13451)

(assert (=> mapNonEmpty!44299 (= (arr!35368 _values!996) (store mapRest!44299 mapKey!44299 mapValue!44299))))

(declare-fun b!1126622 () Bool)

(declare-fun res!752864 () Bool)

(assert (=> b!1126622 (=> (not res!752864) (not e!641251))))

(assert (=> b!1126622 (= res!752864 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24727))))

(declare-fun b!1126623 () Bool)

(declare-fun res!752868 () Bool)

(assert (=> b!1126623 (=> (not res!752868) (not e!641251))))

(assert (=> b!1126623 (= res!752868 (= (select (arr!35369 _keys!1208) i!673) k0!934))))

(declare-fun bm!47629 () Bool)

(assert (=> bm!47629 (= call!47633 (getCurrentListMapNoExtraKeys!4487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126624 () Bool)

(declare-fun res!752865 () Bool)

(assert (=> b!1126624 (=> (not res!752865) (not e!641251))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126624 (= res!752865 (validKeyInArray!0 k0!934))))

(declare-fun b!1126621 () Bool)

(assert (=> b!1126621 (= e!641249 true)))

(declare-fun lt!500142 () Bool)

(declare-fun contains!6448 (ListLongMap!15941 (_ BitVec 64)) Bool)

(assert (=> b!1126621 (= lt!500142 (contains!6448 (getCurrentListMapNoExtraKeys!4487 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun res!752863 () Bool)

(assert (=> start!98084 (=> (not res!752863) (not e!641251))))

(assert (=> start!98084 (= res!752863 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35907 _keys!1208))))))

(assert (=> start!98084 e!641251))

(assert (=> start!98084 tp_is_empty!28321))

(declare-fun array_inv!27220 (array!73432) Bool)

(assert (=> start!98084 (array_inv!27220 _keys!1208)))

(assert (=> start!98084 true))

(assert (=> start!98084 tp!84077))

(declare-fun array_inv!27221 (array!73430) Bool)

(assert (=> start!98084 (and (array_inv!27221 _values!996) e!641255)))

(declare-fun b!1126625 () Bool)

(assert (=> b!1126625 (= e!641252 (not e!641248))))

(declare-fun res!752862 () Bool)

(assert (=> b!1126625 (=> res!752862 e!641248)))

(assert (=> b!1126625 (= res!752862 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73432 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126625 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!500136 () Unit!36775)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73432 (_ BitVec 64) (_ BitVec 32)) Unit!36775)

(assert (=> b!1126625 (= lt!500136 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapIsEmpty!44299 () Bool)

(assert (=> mapIsEmpty!44299 mapRes!44299))

(declare-fun b!1126626 () Bool)

(declare-fun -!1112 (ListLongMap!15941 (_ BitVec 64)) ListLongMap!15941)

(assert (=> b!1126626 (= e!641254 (= call!47632 (-!1112 call!47633 k0!934)))))

(declare-fun bm!47630 () Bool)

(assert (=> bm!47630 (= call!47632 (getCurrentListMapNoExtraKeys!4487 lt!500140 lt!500139 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!98084 res!752863) b!1126613))

(assert (= (and b!1126613 res!752861) b!1126619))

(assert (= (and b!1126619 res!752858) b!1126616))

(assert (= (and b!1126616 res!752857) b!1126622))

(assert (= (and b!1126622 res!752864) b!1126620))

(assert (= (and b!1126620 res!752867) b!1126624))

(assert (= (and b!1126624 res!752865) b!1126623))

(assert (= (and b!1126623 res!752868) b!1126614))

(assert (= (and b!1126614 res!752860) b!1126612))

(assert (= (and b!1126612 res!752869) b!1126625))

(assert (= (and b!1126625 (not res!752862)) b!1126609))

(assert (= (and b!1126609 (not res!752866)) b!1126617))

(assert (= (and b!1126617 c!109650) b!1126626))

(assert (= (and b!1126617 (not c!109650)) b!1126611))

(assert (= (or b!1126626 b!1126611) bm!47630))

(assert (= (or b!1126626 b!1126611) bm!47629))

(assert (= (and b!1126617 (not res!752859)) b!1126621))

(assert (= (and b!1126615 condMapEmpty!44299) mapIsEmpty!44299))

(assert (= (and b!1126615 (not condMapEmpty!44299)) mapNonEmpty!44299))

(get-info :version)

(assert (= (and mapNonEmpty!44299 ((_ is ValueCellFull!13451) mapValue!44299)) b!1126610))

(assert (= (and b!1126615 ((_ is ValueCellFull!13451) mapDefault!44299)) b!1126618))

(assert (= start!98084 b!1126615))

(declare-fun b_lambda!18743 () Bool)

(assert (=> (not b_lambda!18743) (not b!1126609)))

(declare-fun t!35502 () Bool)

(declare-fun tb!8595 () Bool)

(assert (=> (and start!98084 (= defaultEntry!1004 defaultEntry!1004) t!35502) tb!8595))

(declare-fun result!17759 () Bool)

(assert (=> tb!8595 (= result!17759 tp_is_empty!28321)))

(assert (=> b!1126609 t!35502))

(declare-fun b_and!38345 () Bool)

(assert (= b_and!38343 (and (=> t!35502 result!17759) b_and!38345)))

(declare-fun m!1040019 () Bool)

(assert (=> bm!47630 m!1040019))

(declare-fun m!1040021 () Bool)

(assert (=> b!1126613 m!1040021))

(declare-fun m!1040023 () Bool)

(assert (=> start!98084 m!1040023))

(declare-fun m!1040025 () Bool)

(assert (=> start!98084 m!1040025))

(declare-fun m!1040027 () Bool)

(assert (=> b!1126625 m!1040027))

(declare-fun m!1040029 () Bool)

(assert (=> b!1126625 m!1040029))

(declare-fun m!1040031 () Bool)

(assert (=> b!1126624 m!1040031))

(declare-fun m!1040033 () Bool)

(assert (=> bm!47629 m!1040033))

(declare-fun m!1040035 () Bool)

(assert (=> mapNonEmpty!44299 m!1040035))

(declare-fun m!1040037 () Bool)

(assert (=> b!1126614 m!1040037))

(declare-fun m!1040039 () Bool)

(assert (=> b!1126614 m!1040039))

(declare-fun m!1040041 () Bool)

(assert (=> b!1126612 m!1040041))

(declare-fun m!1040043 () Bool)

(assert (=> b!1126623 m!1040043))

(declare-fun m!1040045 () Bool)

(assert (=> b!1126616 m!1040045))

(declare-fun m!1040047 () Bool)

(assert (=> b!1126626 m!1040047))

(declare-fun m!1040049 () Bool)

(assert (=> b!1126617 m!1040049))

(declare-fun m!1040051 () Bool)

(assert (=> b!1126617 m!1040051))

(assert (=> b!1126621 m!1040033))

(assert (=> b!1126621 m!1040033))

(declare-fun m!1040053 () Bool)

(assert (=> b!1126621 m!1040053))

(declare-fun m!1040055 () Bool)

(assert (=> b!1126622 m!1040055))

(declare-fun m!1040057 () Bool)

(assert (=> b!1126609 m!1040057))

(declare-fun m!1040059 () Bool)

(assert (=> b!1126609 m!1040059))

(declare-fun m!1040061 () Bool)

(assert (=> b!1126609 m!1040061))

(declare-fun m!1040063 () Bool)

(assert (=> b!1126609 m!1040063))

(check-sat (not b!1126613) (not b_lambda!18743) b_and!38345 (not b!1126614) (not b!1126616) tp_is_empty!28321 (not start!98084) (not b!1126624) (not b!1126626) (not b!1126622) (not b!1126621) (not b!1126617) (not b!1126625) (not bm!47629) (not b_next!23791) (not mapNonEmpty!44299) (not bm!47630) (not b!1126609) (not b!1126612))
(check-sat b_and!38345 (not b_next!23791))
