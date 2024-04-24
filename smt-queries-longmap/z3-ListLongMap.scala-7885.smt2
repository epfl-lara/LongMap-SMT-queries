; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98290 () Bool)

(assert start!98290)

(declare-fun b_free!23755 () Bool)

(declare-fun b_next!23755 () Bool)

(assert (=> start!98290 (= b_free!23755 (not b_next!23755))))

(declare-fun tp!83968 () Bool)

(declare-fun b_and!38303 () Bool)

(assert (=> start!98290 (= tp!83968 b_and!38303)))

(declare-fun b!1127057 () Bool)

(declare-fun e!641651 () Bool)

(assert (=> b!1127057 (= e!641651 true)))

(declare-datatypes ((V!42841 0))(
  ( (V!42842 (val!14199 Int)) )
))
(declare-fun zeroValue!944 () V!42841)

(declare-datatypes ((array!73481 0))(
  ( (array!73482 (arr!35387 (Array (_ BitVec 32) (_ BitVec 64))) (size!35924 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73481)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun lt!500477 () Bool)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13433 0))(
  ( (ValueCellFull!13433 (v!16828 V!42841)) (EmptyCell!13433) )
))
(declare-datatypes ((array!73483 0))(
  ( (array!73484 (arr!35388 (Array (_ BitVec 32) ValueCell!13433)) (size!35925 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73483)

(declare-fun minValue!944 () V!42841)

(declare-datatypes ((tuple2!17858 0))(
  ( (tuple2!17859 (_1!8940 (_ BitVec 64)) (_2!8940 V!42841)) )
))
(declare-datatypes ((List!24648 0))(
  ( (Nil!24645) (Cons!24644 (h!25862 tuple2!17858) (t!35387 List!24648)) )
))
(declare-datatypes ((ListLongMap!15835 0))(
  ( (ListLongMap!15836 (toList!7933 List!24648)) )
))
(declare-fun contains!6483 (ListLongMap!15835 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!4458 (array!73481 array!73483 (_ BitVec 32) (_ BitVec 32) V!42841 V!42841 (_ BitVec 32) Int) ListLongMap!15835)

(assert (=> b!1127057 (= lt!500477 (contains!6483 (getCurrentListMapNoExtraKeys!4458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1127058 () Bool)

(declare-fun res!752757 () Bool)

(declare-fun e!641644 () Bool)

(assert (=> b!1127058 (=> (not res!752757) (not e!641644))))

(declare-datatypes ((List!24649 0))(
  ( (Nil!24646) (Cons!24645 (h!25863 (_ BitVec 64)) (t!35388 List!24649)) )
))
(declare-fun arrayNoDuplicates!0 (array!73481 (_ BitVec 32) List!24649) Bool)

(assert (=> b!1127058 (= res!752757 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24646))))

(declare-fun b!1127059 () Bool)

(declare-fun e!641645 () Bool)

(declare-fun e!641649 () Bool)

(declare-fun mapRes!44245 () Bool)

(assert (=> b!1127059 (= e!641645 (and e!641649 mapRes!44245))))

(declare-fun condMapEmpty!44245 () Bool)

(declare-fun mapDefault!44245 () ValueCell!13433)

(assert (=> b!1127059 (= condMapEmpty!44245 (= (arr!35388 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13433)) mapDefault!44245)))))

(declare-fun b!1127060 () Bool)

(declare-fun res!752756 () Bool)

(assert (=> b!1127060 (=> (not res!752756) (not e!641644))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1127060 (= res!752756 (validKeyInArray!0 k0!934))))

(declare-fun mapIsEmpty!44245 () Bool)

(assert (=> mapIsEmpty!44245 mapRes!44245))

(declare-fun b!1127061 () Bool)

(declare-fun res!752748 () Bool)

(assert (=> b!1127061 (=> (not res!752748) (not e!641644))))

(assert (=> b!1127061 (= res!752748 (and (= (size!35925 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35924 _keys!1208) (size!35925 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1127062 () Bool)

(declare-fun e!641650 () Bool)

(declare-fun e!641648 () Bool)

(assert (=> b!1127062 (= e!641650 (not e!641648))))

(declare-fun res!752753 () Bool)

(assert (=> b!1127062 (=> res!752753 e!641648)))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1127062 (= res!752753 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73481 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1127062 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36887 0))(
  ( (Unit!36888) )
))
(declare-fun lt!500476 () Unit!36887)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73481 (_ BitVec 64) (_ BitVec 32)) Unit!36887)

(assert (=> b!1127062 (= lt!500476 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1127063 () Bool)

(declare-fun e!641646 () Bool)

(assert (=> b!1127063 (= e!641648 e!641646)))

(declare-fun res!752746 () Bool)

(assert (=> b!1127063 (=> res!752746 e!641646)))

(assert (=> b!1127063 (= res!752746 (not (= from!1455 i!673)))))

(declare-fun lt!500474 () ListLongMap!15835)

(declare-fun lt!500475 () array!73483)

(declare-fun lt!500473 () array!73481)

(assert (=> b!1127063 (= lt!500474 (getCurrentListMapNoExtraKeys!4458 lt!500473 lt!500475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2532 (Int (_ BitVec 64)) V!42841)

(assert (=> b!1127063 (= lt!500475 (array!73484 (store (arr!35388 _values!996) i!673 (ValueCellFull!13433 (dynLambda!2532 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35925 _values!996)))))

(declare-fun lt!500479 () ListLongMap!15835)

(assert (=> b!1127063 (= lt!500479 (getCurrentListMapNoExtraKeys!4458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun mapNonEmpty!44245 () Bool)

(declare-fun tp!83969 () Bool)

(declare-fun e!641652 () Bool)

(assert (=> mapNonEmpty!44245 (= mapRes!44245 (and tp!83969 e!641652))))

(declare-fun mapKey!44245 () (_ BitVec 32))

(declare-fun mapValue!44245 () ValueCell!13433)

(declare-fun mapRest!44245 () (Array (_ BitVec 32) ValueCell!13433))

(assert (=> mapNonEmpty!44245 (= (arr!35388 _values!996) (store mapRest!44245 mapKey!44245 mapValue!44245))))

(declare-fun call!47614 () ListLongMap!15835)

(declare-fun bm!47611 () Bool)

(assert (=> bm!47611 (= call!47614 (getCurrentListMapNoExtraKeys!4458 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127064 () Bool)

(declare-fun res!752758 () Bool)

(assert (=> b!1127064 (=> (not res!752758) (not e!641644))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1127064 (= res!752758 (validMask!0 mask!1564))))

(declare-fun b!1127066 () Bool)

(declare-fun tp_is_empty!28285 () Bool)

(assert (=> b!1127066 (= e!641652 tp_is_empty!28285)))

(declare-fun b!1127067 () Bool)

(assert (=> b!1127067 (= e!641644 e!641650)))

(declare-fun res!752749 () Bool)

(assert (=> b!1127067 (=> (not res!752749) (not e!641650))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73481 (_ BitVec 32)) Bool)

(assert (=> b!1127067 (= res!752749 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500473 mask!1564))))

(assert (=> b!1127067 (= lt!500473 (array!73482 (store (arr!35387 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35924 _keys!1208)))))

(declare-fun call!47615 () ListLongMap!15835)

(declare-fun bm!47612 () Bool)

(assert (=> bm!47612 (= call!47615 (getCurrentListMapNoExtraKeys!4458 lt!500473 lt!500475 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127068 () Bool)

(declare-fun res!752752 () Bool)

(assert (=> b!1127068 (=> (not res!752752) (not e!641644))))

(assert (=> b!1127068 (= res!752752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1127069 () Bool)

(declare-fun e!641647 () Bool)

(assert (=> b!1127069 (= e!641647 (= call!47615 call!47614))))

(declare-fun b!1127070 () Bool)

(assert (=> b!1127070 (= e!641646 e!641651)))

(declare-fun res!752755 () Bool)

(assert (=> b!1127070 (=> res!752755 e!641651)))

(assert (=> b!1127070 (= res!752755 (not (= (select (arr!35387 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1127070 e!641647))

(declare-fun c!110033 () Bool)

(assert (=> b!1127070 (= c!110033 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500478 () Unit!36887)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!377 (array!73481 array!73483 (_ BitVec 32) (_ BitVec 32) V!42841 V!42841 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36887)

(assert (=> b!1127070 (= lt!500478 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!377 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1127071 () Bool)

(assert (=> b!1127071 (= e!641649 tp_is_empty!28285)))

(declare-fun b!1127072 () Bool)

(declare-fun -!1115 (ListLongMap!15835 (_ BitVec 64)) ListLongMap!15835)

(assert (=> b!1127072 (= e!641647 (= call!47615 (-!1115 call!47614 k0!934)))))

(declare-fun b!1127065 () Bool)

(declare-fun res!752747 () Bool)

(assert (=> b!1127065 (=> (not res!752747) (not e!641644))))

(assert (=> b!1127065 (= res!752747 (= (select (arr!35387 _keys!1208) i!673) k0!934))))

(declare-fun res!752750 () Bool)

(assert (=> start!98290 (=> (not res!752750) (not e!641644))))

(assert (=> start!98290 (= res!752750 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35924 _keys!1208))))))

(assert (=> start!98290 e!641644))

(assert (=> start!98290 tp_is_empty!28285))

(declare-fun array_inv!27216 (array!73481) Bool)

(assert (=> start!98290 (array_inv!27216 _keys!1208)))

(assert (=> start!98290 true))

(assert (=> start!98290 tp!83968))

(declare-fun array_inv!27217 (array!73483) Bool)

(assert (=> start!98290 (and (array_inv!27217 _values!996) e!641645)))

(declare-fun b!1127073 () Bool)

(declare-fun res!752754 () Bool)

(assert (=> b!1127073 (=> (not res!752754) (not e!641644))))

(assert (=> b!1127073 (= res!752754 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35924 _keys!1208))))))

(declare-fun b!1127074 () Bool)

(declare-fun res!752751 () Bool)

(assert (=> b!1127074 (=> (not res!752751) (not e!641650))))

(assert (=> b!1127074 (= res!752751 (arrayNoDuplicates!0 lt!500473 #b00000000000000000000000000000000 Nil!24646))))

(assert (= (and start!98290 res!752750) b!1127064))

(assert (= (and b!1127064 res!752758) b!1127061))

(assert (= (and b!1127061 res!752748) b!1127068))

(assert (= (and b!1127068 res!752752) b!1127058))

(assert (= (and b!1127058 res!752757) b!1127073))

(assert (= (and b!1127073 res!752754) b!1127060))

(assert (= (and b!1127060 res!752756) b!1127065))

(assert (= (and b!1127065 res!752747) b!1127067))

(assert (= (and b!1127067 res!752749) b!1127074))

(assert (= (and b!1127074 res!752751) b!1127062))

(assert (= (and b!1127062 (not res!752753)) b!1127063))

(assert (= (and b!1127063 (not res!752746)) b!1127070))

(assert (= (and b!1127070 c!110033) b!1127072))

(assert (= (and b!1127070 (not c!110033)) b!1127069))

(assert (= (or b!1127072 b!1127069) bm!47612))

(assert (= (or b!1127072 b!1127069) bm!47611))

(assert (= (and b!1127070 (not res!752755)) b!1127057))

(assert (= (and b!1127059 condMapEmpty!44245) mapIsEmpty!44245))

(assert (= (and b!1127059 (not condMapEmpty!44245)) mapNonEmpty!44245))

(get-info :version)

(assert (= (and mapNonEmpty!44245 ((_ is ValueCellFull!13433) mapValue!44245)) b!1127066))

(assert (= (and b!1127059 ((_ is ValueCellFull!13433) mapDefault!44245)) b!1127071))

(assert (= start!98290 b!1127059))

(declare-fun b_lambda!18735 () Bool)

(assert (=> (not b_lambda!18735) (not b!1127063)))

(declare-fun t!35386 () Bool)

(declare-fun tb!8559 () Bool)

(assert (=> (and start!98290 (= defaultEntry!1004 defaultEntry!1004) t!35386) tb!8559))

(declare-fun result!17687 () Bool)

(assert (=> tb!8559 (= result!17687 tp_is_empty!28285)))

(assert (=> b!1127063 t!35386))

(declare-fun b_and!38305 () Bool)

(assert (= b_and!38303 (and (=> t!35386 result!17687) b_and!38305)))

(declare-fun m!1041491 () Bool)

(assert (=> b!1127058 m!1041491))

(declare-fun m!1041493 () Bool)

(assert (=> b!1127068 m!1041493))

(declare-fun m!1041495 () Bool)

(assert (=> start!98290 m!1041495))

(declare-fun m!1041497 () Bool)

(assert (=> start!98290 m!1041497))

(declare-fun m!1041499 () Bool)

(assert (=> b!1127072 m!1041499))

(declare-fun m!1041501 () Bool)

(assert (=> b!1127060 m!1041501))

(declare-fun m!1041503 () Bool)

(assert (=> b!1127057 m!1041503))

(assert (=> b!1127057 m!1041503))

(declare-fun m!1041505 () Bool)

(assert (=> b!1127057 m!1041505))

(declare-fun m!1041507 () Bool)

(assert (=> b!1127070 m!1041507))

(declare-fun m!1041509 () Bool)

(assert (=> b!1127070 m!1041509))

(declare-fun m!1041511 () Bool)

(assert (=> b!1127064 m!1041511))

(declare-fun m!1041513 () Bool)

(assert (=> b!1127074 m!1041513))

(declare-fun m!1041515 () Bool)

(assert (=> b!1127067 m!1041515))

(declare-fun m!1041517 () Bool)

(assert (=> b!1127067 m!1041517))

(declare-fun m!1041519 () Bool)

(assert (=> bm!47612 m!1041519))

(declare-fun m!1041521 () Bool)

(assert (=> b!1127065 m!1041521))

(declare-fun m!1041523 () Bool)

(assert (=> mapNonEmpty!44245 m!1041523))

(assert (=> bm!47611 m!1041503))

(declare-fun m!1041525 () Bool)

(assert (=> b!1127063 m!1041525))

(declare-fun m!1041527 () Bool)

(assert (=> b!1127063 m!1041527))

(declare-fun m!1041529 () Bool)

(assert (=> b!1127063 m!1041529))

(declare-fun m!1041531 () Bool)

(assert (=> b!1127063 m!1041531))

(declare-fun m!1041533 () Bool)

(assert (=> b!1127062 m!1041533))

(declare-fun m!1041535 () Bool)

(assert (=> b!1127062 m!1041535))

(check-sat (not mapNonEmpty!44245) (not b!1127062) (not b!1127057) (not b!1127064) (not start!98290) (not b!1127074) (not bm!47612) (not b!1127072) (not bm!47611) (not b_lambda!18735) (not b!1127060) (not b!1127058) b_and!38305 (not b!1127068) (not b!1127067) (not b_next!23755) (not b!1127070) (not b!1127063) tp_is_empty!28285)
(check-sat b_and!38305 (not b_next!23755))
