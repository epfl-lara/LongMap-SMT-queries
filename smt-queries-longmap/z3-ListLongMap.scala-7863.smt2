; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97924 () Bool)

(assert start!97924)

(declare-fun b_free!23625 () Bool)

(declare-fun b_next!23625 () Bool)

(assert (=> start!97924 (= b_free!23625 (not b_next!23625))))

(declare-fun tp!83578 () Bool)

(declare-fun b_and!38033 () Bool)

(assert (=> start!97924 (= tp!83578 b_and!38033)))

(declare-fun b!1121905 () Bool)

(declare-fun res!749514 () Bool)

(declare-fun e!638752 () Bool)

(assert (=> b!1121905 (=> (not res!749514) (not e!638752))))

(declare-datatypes ((array!73191 0))(
  ( (array!73192 (arr!35248 (Array (_ BitVec 32) (_ BitVec 64))) (size!35784 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73191)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42667 0))(
  ( (V!42668 (val!14134 Int)) )
))
(declare-datatypes ((ValueCell!13368 0))(
  ( (ValueCellFull!13368 (v!16767 V!42667)) (EmptyCell!13368) )
))
(declare-datatypes ((array!73193 0))(
  ( (array!73194 (arr!35249 (Array (_ BitVec 32) ValueCell!13368)) (size!35785 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73193)

(assert (=> b!1121905 (= res!749514 (and (= (size!35785 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35784 _keys!1208) (size!35785 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun zeroValue!944 () V!42667)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((tuple2!17744 0))(
  ( (tuple2!17745 (_1!8883 (_ BitVec 64)) (_2!8883 V!42667)) )
))
(declare-datatypes ((List!24525 0))(
  ( (Nil!24522) (Cons!24521 (h!25730 tuple2!17744) (t!35142 List!24525)) )
))
(declare-datatypes ((ListLongMap!15713 0))(
  ( (ListLongMap!15714 (toList!7872 List!24525)) )
))
(declare-fun call!47157 () ListLongMap!15713)

(declare-fun lt!498516 () array!73191)

(declare-fun minValue!944 () V!42667)

(declare-fun bm!47154 () Bool)

(declare-fun lt!498521 () array!73193)

(declare-fun from!1455 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!4361 (array!73191 array!73193 (_ BitVec 32) (_ BitVec 32) V!42667 V!42667 (_ BitVec 32) Int) ListLongMap!15713)

(assert (=> bm!47154 (= call!47157 (getCurrentListMapNoExtraKeys!4361 lt!498516 lt!498521 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121906 () Bool)

(declare-fun e!638753 () Bool)

(declare-fun e!638754 () Bool)

(assert (=> b!1121906 (= e!638753 e!638754)))

(declare-fun res!749515 () Bool)

(assert (=> b!1121906 (=> res!749515 e!638754)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121906 (= res!749515 (not (= from!1455 i!673)))))

(declare-fun lt!498520 () ListLongMap!15713)

(assert (=> b!1121906 (= lt!498520 (getCurrentListMapNoExtraKeys!4361 lt!498516 lt!498521 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2460 (Int (_ BitVec 64)) V!42667)

(assert (=> b!1121906 (= lt!498521 (array!73194 (store (arr!35249 _values!996) i!673 (ValueCellFull!13368 (dynLambda!2460 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35785 _values!996)))))

(declare-fun lt!498517 () ListLongMap!15713)

(assert (=> b!1121906 (= lt!498517 (getCurrentListMapNoExtraKeys!4361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121907 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121907 (= e!638754 (or (not (= (select (arr!35248 _keys!1208) from!1455) k0!934)) (and (bvsge (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1455) (size!35784 _keys!1208)))))))

(declare-fun e!638760 () Bool)

(assert (=> b!1121907 e!638760))

(declare-fun c!109428 () Bool)

(assert (=> b!1121907 (= c!109428 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36802 0))(
  ( (Unit!36803) )
))
(declare-fun lt!498518 () Unit!36802)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!329 (array!73191 array!73193 (_ BitVec 32) (_ BitVec 32) V!42667 V!42667 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36802)

(assert (=> b!1121907 (= lt!498518 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!329 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121908 () Bool)

(declare-fun e!638758 () Bool)

(assert (=> b!1121908 (= e!638758 (not e!638753))))

(declare-fun res!749510 () Bool)

(assert (=> b!1121908 (=> res!749510 e!638753)))

(assert (=> b!1121908 (= res!749510 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73191 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121908 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498519 () Unit!36802)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73191 (_ BitVec 64) (_ BitVec 32)) Unit!36802)

(assert (=> b!1121908 (= lt!498519 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121909 () Bool)

(declare-fun e!638757 () Bool)

(declare-fun tp_is_empty!28155 () Bool)

(assert (=> b!1121909 (= e!638757 tp_is_empty!28155)))

(declare-fun b!1121910 () Bool)

(declare-fun res!749507 () Bool)

(assert (=> b!1121910 (=> (not res!749507) (not e!638752))))

(assert (=> b!1121910 (= res!749507 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35784 _keys!1208))))))

(declare-fun bm!47155 () Bool)

(declare-fun call!47158 () ListLongMap!15713)

(assert (=> bm!47155 (= call!47158 (getCurrentListMapNoExtraKeys!4361 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!749509 () Bool)

(assert (=> start!97924 (=> (not res!749509) (not e!638752))))

(assert (=> start!97924 (= res!749509 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35784 _keys!1208))))))

(assert (=> start!97924 e!638752))

(assert (=> start!97924 tp_is_empty!28155))

(declare-fun array_inv!27062 (array!73191) Bool)

(assert (=> start!97924 (array_inv!27062 _keys!1208)))

(assert (=> start!97924 true))

(assert (=> start!97924 tp!83578))

(declare-fun e!638759 () Bool)

(declare-fun array_inv!27063 (array!73193) Bool)

(assert (=> start!97924 (and (array_inv!27063 _values!996) e!638759)))

(declare-fun b!1121911 () Bool)

(declare-fun res!749513 () Bool)

(assert (=> b!1121911 (=> (not res!749513) (not e!638752))))

(assert (=> b!1121911 (= res!749513 (= (select (arr!35248 _keys!1208) i!673) k0!934))))

(declare-fun b!1121912 () Bool)

(declare-fun -!1081 (ListLongMap!15713 (_ BitVec 64)) ListLongMap!15713)

(assert (=> b!1121912 (= e!638760 (= call!47157 (-!1081 call!47158 k0!934)))))

(declare-fun b!1121913 () Bool)

(assert (=> b!1121913 (= e!638760 (= call!47157 call!47158))))

(declare-fun b!1121914 () Bool)

(declare-fun res!749505 () Bool)

(assert (=> b!1121914 (=> (not res!749505) (not e!638758))))

(declare-datatypes ((List!24526 0))(
  ( (Nil!24523) (Cons!24522 (h!25731 (_ BitVec 64)) (t!35143 List!24526)) )
))
(declare-fun arrayNoDuplicates!0 (array!73191 (_ BitVec 32) List!24526) Bool)

(assert (=> b!1121914 (= res!749505 (arrayNoDuplicates!0 lt!498516 #b00000000000000000000000000000000 Nil!24523))))

(declare-fun mapIsEmpty!44050 () Bool)

(declare-fun mapRes!44050 () Bool)

(assert (=> mapIsEmpty!44050 mapRes!44050))

(declare-fun mapNonEmpty!44050 () Bool)

(declare-fun tp!83579 () Bool)

(assert (=> mapNonEmpty!44050 (= mapRes!44050 (and tp!83579 e!638757))))

(declare-fun mapRest!44050 () (Array (_ BitVec 32) ValueCell!13368))

(declare-fun mapKey!44050 () (_ BitVec 32))

(declare-fun mapValue!44050 () ValueCell!13368)

(assert (=> mapNonEmpty!44050 (= (arr!35249 _values!996) (store mapRest!44050 mapKey!44050 mapValue!44050))))

(declare-fun b!1121915 () Bool)

(declare-fun res!749512 () Bool)

(assert (=> b!1121915 (=> (not res!749512) (not e!638752))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73191 (_ BitVec 32)) Bool)

(assert (=> b!1121915 (= res!749512 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121916 () Bool)

(declare-fun e!638755 () Bool)

(assert (=> b!1121916 (= e!638759 (and e!638755 mapRes!44050))))

(declare-fun condMapEmpty!44050 () Bool)

(declare-fun mapDefault!44050 () ValueCell!13368)

(assert (=> b!1121916 (= condMapEmpty!44050 (= (arr!35249 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13368)) mapDefault!44050)))))

(declare-fun b!1121917 () Bool)

(declare-fun res!749504 () Bool)

(assert (=> b!1121917 (=> (not res!749504) (not e!638752))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121917 (= res!749504 (validKeyInArray!0 k0!934))))

(declare-fun b!1121918 () Bool)

(declare-fun res!749508 () Bool)

(assert (=> b!1121918 (=> (not res!749508) (not e!638752))))

(assert (=> b!1121918 (= res!749508 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24523))))

(declare-fun b!1121919 () Bool)

(assert (=> b!1121919 (= e!638752 e!638758)))

(declare-fun res!749511 () Bool)

(assert (=> b!1121919 (=> (not res!749511) (not e!638758))))

(assert (=> b!1121919 (= res!749511 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498516 mask!1564))))

(assert (=> b!1121919 (= lt!498516 (array!73192 (store (arr!35248 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35784 _keys!1208)))))

(declare-fun b!1121920 () Bool)

(declare-fun res!749506 () Bool)

(assert (=> b!1121920 (=> (not res!749506) (not e!638752))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121920 (= res!749506 (validMask!0 mask!1564))))

(declare-fun b!1121921 () Bool)

(assert (=> b!1121921 (= e!638755 tp_is_empty!28155)))

(assert (= (and start!97924 res!749509) b!1121920))

(assert (= (and b!1121920 res!749506) b!1121905))

(assert (= (and b!1121905 res!749514) b!1121915))

(assert (= (and b!1121915 res!749512) b!1121918))

(assert (= (and b!1121918 res!749508) b!1121910))

(assert (= (and b!1121910 res!749507) b!1121917))

(assert (= (and b!1121917 res!749504) b!1121911))

(assert (= (and b!1121911 res!749513) b!1121919))

(assert (= (and b!1121919 res!749511) b!1121914))

(assert (= (and b!1121914 res!749505) b!1121908))

(assert (= (and b!1121908 (not res!749510)) b!1121906))

(assert (= (and b!1121906 (not res!749515)) b!1121907))

(assert (= (and b!1121907 c!109428) b!1121912))

(assert (= (and b!1121907 (not c!109428)) b!1121913))

(assert (= (or b!1121912 b!1121913) bm!47154))

(assert (= (or b!1121912 b!1121913) bm!47155))

(assert (= (and b!1121916 condMapEmpty!44050) mapIsEmpty!44050))

(assert (= (and b!1121916 (not condMapEmpty!44050)) mapNonEmpty!44050))

(get-info :version)

(assert (= (and mapNonEmpty!44050 ((_ is ValueCellFull!13368) mapValue!44050)) b!1121909))

(assert (= (and b!1121916 ((_ is ValueCellFull!13368) mapDefault!44050)) b!1121921))

(assert (= start!97924 b!1121916))

(declare-fun b_lambda!18595 () Bool)

(assert (=> (not b_lambda!18595) (not b!1121906)))

(declare-fun t!35141 () Bool)

(declare-fun tb!8437 () Bool)

(assert (=> (and start!97924 (= defaultEntry!1004 defaultEntry!1004) t!35141) tb!8437))

(declare-fun result!17435 () Bool)

(assert (=> tb!8437 (= result!17435 tp_is_empty!28155)))

(assert (=> b!1121906 t!35141))

(declare-fun b_and!38035 () Bool)

(assert (= b_and!38033 (and (=> t!35141 result!17435) b_and!38035)))

(declare-fun m!1036651 () Bool)

(assert (=> b!1121919 m!1036651))

(declare-fun m!1036653 () Bool)

(assert (=> b!1121919 m!1036653))

(declare-fun m!1036655 () Bool)

(assert (=> bm!47155 m!1036655))

(declare-fun m!1036657 () Bool)

(assert (=> bm!47154 m!1036657))

(declare-fun m!1036659 () Bool)

(assert (=> b!1121917 m!1036659))

(declare-fun m!1036661 () Bool)

(assert (=> b!1121920 m!1036661))

(declare-fun m!1036663 () Bool)

(assert (=> b!1121912 m!1036663))

(declare-fun m!1036665 () Bool)

(assert (=> b!1121915 m!1036665))

(declare-fun m!1036667 () Bool)

(assert (=> b!1121918 m!1036667))

(declare-fun m!1036669 () Bool)

(assert (=> b!1121911 m!1036669))

(declare-fun m!1036671 () Bool)

(assert (=> b!1121908 m!1036671))

(declare-fun m!1036673 () Bool)

(assert (=> b!1121908 m!1036673))

(declare-fun m!1036675 () Bool)

(assert (=> mapNonEmpty!44050 m!1036675))

(declare-fun m!1036677 () Bool)

(assert (=> b!1121907 m!1036677))

(declare-fun m!1036679 () Bool)

(assert (=> b!1121907 m!1036679))

(declare-fun m!1036681 () Bool)

(assert (=> start!97924 m!1036681))

(declare-fun m!1036683 () Bool)

(assert (=> start!97924 m!1036683))

(declare-fun m!1036685 () Bool)

(assert (=> b!1121906 m!1036685))

(declare-fun m!1036687 () Bool)

(assert (=> b!1121906 m!1036687))

(declare-fun m!1036689 () Bool)

(assert (=> b!1121906 m!1036689))

(declare-fun m!1036691 () Bool)

(assert (=> b!1121906 m!1036691))

(declare-fun m!1036693 () Bool)

(assert (=> b!1121914 m!1036693))

(check-sat (not b!1121912) b_and!38035 (not b!1121919) (not bm!47154) (not b_next!23625) (not b!1121917) (not b!1121914) tp_is_empty!28155 (not b!1121915) (not b!1121906) (not b!1121907) (not b!1121920) (not b_lambda!18595) (not b!1121918) (not mapNonEmpty!44050) (not b!1121908) (not start!97924) (not bm!47155))
(check-sat b_and!38035 (not b_next!23625))
