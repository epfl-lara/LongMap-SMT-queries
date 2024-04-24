; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98152 () Bool)

(assert start!98152)

(declare-fun b_free!23617 () Bool)

(declare-fun b_next!23617 () Bool)

(assert (=> start!98152 (= b_free!23617 (not b_next!23617))))

(declare-fun tp!83554 () Bool)

(declare-fun b_and!38027 () Bool)

(assert (=> start!98152 (= tp!83554 b_and!38027)))

(declare-fun b!1123020 () Bool)

(declare-fun res!749891 () Bool)

(declare-fun e!639501 () Bool)

(assert (=> b!1123020 (=> (not res!749891) (not e!639501))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1123020 (= res!749891 (validKeyInArray!0 k0!934))))

(declare-fun b!1123021 () Bool)

(declare-fun res!749888 () Bool)

(assert (=> b!1123021 (=> (not res!749888) (not e!639501))))

(declare-datatypes ((array!73217 0))(
  ( (array!73218 (arr!35255 (Array (_ BitVec 32) (_ BitVec 64))) (size!35792 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73217)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun mask!1564 () (_ BitVec 32))

(declare-datatypes ((V!42657 0))(
  ( (V!42658 (val!14130 Int)) )
))
(declare-datatypes ((ValueCell!13364 0))(
  ( (ValueCellFull!13364 (v!16759 V!42657)) (EmptyCell!13364) )
))
(declare-datatypes ((array!73219 0))(
  ( (array!73220 (arr!35256 (Array (_ BitVec 32) ValueCell!13364)) (size!35793 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73219)

(assert (=> b!1123021 (= res!749888 (and (= (size!35793 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35792 _keys!1208) (size!35793 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!44038 () Bool)

(declare-fun mapRes!44038 () Bool)

(declare-fun tp!83555 () Bool)

(declare-fun e!639499 () Bool)

(assert (=> mapNonEmpty!44038 (= mapRes!44038 (and tp!83555 e!639499))))

(declare-fun mapValue!44038 () ValueCell!13364)

(declare-fun mapRest!44038 () (Array (_ BitVec 32) ValueCell!13364))

(declare-fun mapKey!44038 () (_ BitVec 32))

(assert (=> mapNonEmpty!44038 (= (arr!35256 _values!996) (store mapRest!44038 mapKey!44038 mapValue!44038))))

(declare-fun b!1123022 () Bool)

(declare-fun e!639500 () Bool)

(assert (=> b!1123022 (= e!639501 e!639500)))

(declare-fun res!749890 () Bool)

(assert (=> b!1123022 (=> (not res!749890) (not e!639500))))

(declare-fun lt!498964 () array!73217)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73217 (_ BitVec 32)) Bool)

(assert (=> b!1123022 (= res!749890 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498964 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1123022 (= lt!498964 (array!73218 (store (arr!35255 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35792 _keys!1208)))))

(declare-fun b!1123023 () Bool)

(declare-fun res!749893 () Bool)

(assert (=> b!1123023 (=> (not res!749893) (not e!639501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1123023 (= res!749893 (validMask!0 mask!1564))))

(declare-fun b!1123024 () Bool)

(declare-fun res!749885 () Bool)

(assert (=> b!1123024 (=> (not res!749885) (not e!639501))))

(assert (=> b!1123024 (= res!749885 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1123025 () Bool)

(declare-fun tp_is_empty!28147 () Bool)

(assert (=> b!1123025 (= e!639499 tp_is_empty!28147)))

(declare-fun b!1123026 () Bool)

(declare-fun e!639506 () Bool)

(declare-fun e!639507 () Bool)

(assert (=> b!1123026 (= e!639506 e!639507)))

(declare-fun res!749884 () Bool)

(assert (=> b!1123026 (=> res!749884 e!639507)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1123026 (= res!749884 (not (= from!1455 i!673)))))

(declare-fun zeroValue!944 () V!42657)

(declare-datatypes ((tuple2!17744 0))(
  ( (tuple2!17745 (_1!8883 (_ BitVec 64)) (_2!8883 V!42657)) )
))
(declare-datatypes ((List!24542 0))(
  ( (Nil!24539) (Cons!24538 (h!25756 tuple2!17744) (t!35143 List!24542)) )
))
(declare-datatypes ((ListLongMap!15721 0))(
  ( (ListLongMap!15722 (toList!7876 List!24542)) )
))
(declare-fun lt!498963 () ListLongMap!15721)

(declare-fun defaultEntry!1004 () Int)

(declare-fun lt!498962 () array!73219)

(declare-fun minValue!944 () V!42657)

(declare-fun getCurrentListMapNoExtraKeys!4405 (array!73217 array!73219 (_ BitVec 32) (_ BitVec 32) V!42657 V!42657 (_ BitVec 32) Int) ListLongMap!15721)

(assert (=> b!1123026 (= lt!498963 (getCurrentListMapNoExtraKeys!4405 lt!498964 lt!498962 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2492 (Int (_ BitVec 64)) V!42657)

(assert (=> b!1123026 (= lt!498962 (array!73220 (store (arr!35256 _values!996) i!673 (ValueCellFull!13364 (dynLambda!2492 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35793 _values!996)))))

(declare-fun lt!498960 () ListLongMap!15721)

(assert (=> b!1123026 (= lt!498960 (getCurrentListMapNoExtraKeys!4405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1123027 () Bool)

(assert (=> b!1123027 (= e!639507 true)))

(declare-fun e!639503 () Bool)

(assert (=> b!1123027 e!639503))

(declare-fun c!109826 () Bool)

(assert (=> b!1123027 (= c!109826 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36783 0))(
  ( (Unit!36784) )
))
(declare-fun lt!498959 () Unit!36783)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!338 (array!73217 array!73219 (_ BitVec 32) (_ BitVec 32) V!42657 V!42657 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36783)

(assert (=> b!1123027 (= lt!498959 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!338 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123028 () Bool)

(declare-fun res!749889 () Bool)

(assert (=> b!1123028 (=> (not res!749889) (not e!639501))))

(declare-datatypes ((List!24543 0))(
  ( (Nil!24540) (Cons!24539 (h!25757 (_ BitVec 64)) (t!35144 List!24543)) )
))
(declare-fun arrayNoDuplicates!0 (array!73217 (_ BitVec 32) List!24543) Bool)

(assert (=> b!1123028 (= res!749889 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24540))))

(declare-fun mapIsEmpty!44038 () Bool)

(assert (=> mapIsEmpty!44038 mapRes!44038))

(declare-fun b!1123029 () Bool)

(declare-fun res!749887 () Bool)

(assert (=> b!1123029 (=> (not res!749887) (not e!639501))))

(assert (=> b!1123029 (= res!749887 (= (select (arr!35255 _keys!1208) i!673) k0!934))))

(declare-fun b!1123030 () Bool)

(assert (=> b!1123030 (= e!639500 (not e!639506))))

(declare-fun res!749892 () Bool)

(assert (=> b!1123030 (=> res!749892 e!639506)))

(assert (=> b!1123030 (= res!749892 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73217 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1123030 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498961 () Unit!36783)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73217 (_ BitVec 64) (_ BitVec 32)) Unit!36783)

(assert (=> b!1123030 (= lt!498961 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1123031 () Bool)

(declare-fun res!749882 () Bool)

(assert (=> b!1123031 (=> (not res!749882) (not e!639500))))

(assert (=> b!1123031 (= res!749882 (arrayNoDuplicates!0 lt!498964 #b00000000000000000000000000000000 Nil!24540))))

(declare-fun call!47201 () ListLongMap!15721)

(declare-fun b!1123032 () Bool)

(declare-fun call!47200 () ListLongMap!15721)

(declare-fun -!1075 (ListLongMap!15721 (_ BitVec 64)) ListLongMap!15721)

(assert (=> b!1123032 (= e!639503 (= call!47200 (-!1075 call!47201 k0!934)))))

(declare-fun b!1123033 () Bool)

(declare-fun e!639504 () Bool)

(declare-fun e!639502 () Bool)

(assert (=> b!1123033 (= e!639504 (and e!639502 mapRes!44038))))

(declare-fun condMapEmpty!44038 () Bool)

(declare-fun mapDefault!44038 () ValueCell!13364)

(assert (=> b!1123033 (= condMapEmpty!44038 (= (arr!35256 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13364)) mapDefault!44038)))))

(declare-fun b!1123034 () Bool)

(declare-fun res!749883 () Bool)

(assert (=> b!1123034 (=> (not res!749883) (not e!639501))))

(assert (=> b!1123034 (= res!749883 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35792 _keys!1208))))))

(declare-fun bm!47198 () Bool)

(assert (=> bm!47198 (= call!47201 (getCurrentListMapNoExtraKeys!4405 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1123035 () Bool)

(assert (=> b!1123035 (= e!639502 tp_is_empty!28147)))

(declare-fun b!1123036 () Bool)

(assert (=> b!1123036 (= e!639503 (= call!47200 call!47201))))

(declare-fun bm!47197 () Bool)

(assert (=> bm!47197 (= call!47200 (getCurrentListMapNoExtraKeys!4405 lt!498964 lt!498962 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun res!749886 () Bool)

(assert (=> start!98152 (=> (not res!749886) (not e!639501))))

(assert (=> start!98152 (= res!749886 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35792 _keys!1208))))))

(assert (=> start!98152 e!639501))

(assert (=> start!98152 tp_is_empty!28147))

(declare-fun array_inv!27140 (array!73217) Bool)

(assert (=> start!98152 (array_inv!27140 _keys!1208)))

(assert (=> start!98152 true))

(assert (=> start!98152 tp!83554))

(declare-fun array_inv!27141 (array!73219) Bool)

(assert (=> start!98152 (and (array_inv!27141 _values!996) e!639504)))

(assert (= (and start!98152 res!749886) b!1123023))

(assert (= (and b!1123023 res!749893) b!1123021))

(assert (= (and b!1123021 res!749888) b!1123024))

(assert (= (and b!1123024 res!749885) b!1123028))

(assert (= (and b!1123028 res!749889) b!1123034))

(assert (= (and b!1123034 res!749883) b!1123020))

(assert (= (and b!1123020 res!749891) b!1123029))

(assert (= (and b!1123029 res!749887) b!1123022))

(assert (= (and b!1123022 res!749890) b!1123031))

(assert (= (and b!1123031 res!749882) b!1123030))

(assert (= (and b!1123030 (not res!749892)) b!1123026))

(assert (= (and b!1123026 (not res!749884)) b!1123027))

(assert (= (and b!1123027 c!109826) b!1123032))

(assert (= (and b!1123027 (not c!109826)) b!1123036))

(assert (= (or b!1123032 b!1123036) bm!47197))

(assert (= (or b!1123032 b!1123036) bm!47198))

(assert (= (and b!1123033 condMapEmpty!44038) mapIsEmpty!44038))

(assert (= (and b!1123033 (not condMapEmpty!44038)) mapNonEmpty!44038))

(get-info :version)

(assert (= (and mapNonEmpty!44038 ((_ is ValueCellFull!13364) mapValue!44038)) b!1123025))

(assert (= (and b!1123033 ((_ is ValueCellFull!13364) mapDefault!44038)) b!1123035))

(assert (= start!98152 b!1123033))

(declare-fun b_lambda!18597 () Bool)

(assert (=> (not b_lambda!18597) (not b!1123026)))

(declare-fun t!35142 () Bool)

(declare-fun tb!8421 () Bool)

(assert (=> (and start!98152 (= defaultEntry!1004 defaultEntry!1004) t!35142) tb!8421))

(declare-fun result!17411 () Bool)

(assert (=> tb!8421 (= result!17411 tp_is_empty!28147)))

(assert (=> b!1123026 t!35142))

(declare-fun b_and!38029 () Bool)

(assert (= b_and!38027 (and (=> t!35142 result!17411) b_and!38029)))

(declare-fun m!1038153 () Bool)

(assert (=> b!1123020 m!1038153))

(declare-fun m!1038155 () Bool)

(assert (=> b!1123029 m!1038155))

(declare-fun m!1038157 () Bool)

(assert (=> b!1123032 m!1038157))

(declare-fun m!1038159 () Bool)

(assert (=> b!1123031 m!1038159))

(declare-fun m!1038161 () Bool)

(assert (=> b!1123028 m!1038161))

(declare-fun m!1038163 () Bool)

(assert (=> start!98152 m!1038163))

(declare-fun m!1038165 () Bool)

(assert (=> start!98152 m!1038165))

(declare-fun m!1038167 () Bool)

(assert (=> mapNonEmpty!44038 m!1038167))

(declare-fun m!1038169 () Bool)

(assert (=> bm!47198 m!1038169))

(declare-fun m!1038171 () Bool)

(assert (=> b!1123023 m!1038171))

(declare-fun m!1038173 () Bool)

(assert (=> b!1123030 m!1038173))

(declare-fun m!1038175 () Bool)

(assert (=> b!1123030 m!1038175))

(declare-fun m!1038177 () Bool)

(assert (=> b!1123027 m!1038177))

(declare-fun m!1038179 () Bool)

(assert (=> b!1123026 m!1038179))

(declare-fun m!1038181 () Bool)

(assert (=> b!1123026 m!1038181))

(declare-fun m!1038183 () Bool)

(assert (=> b!1123026 m!1038183))

(declare-fun m!1038185 () Bool)

(assert (=> b!1123026 m!1038185))

(declare-fun m!1038187 () Bool)

(assert (=> bm!47197 m!1038187))

(declare-fun m!1038189 () Bool)

(assert (=> b!1123024 m!1038189))

(declare-fun m!1038191 () Bool)

(assert (=> b!1123022 m!1038191))

(declare-fun m!1038193 () Bool)

(assert (=> b!1123022 m!1038193))

(check-sat (not b!1123030) b_and!38029 (not b!1123032) (not mapNonEmpty!44038) (not b!1123026) (not bm!47198) (not b!1123022) (not b_next!23617) (not start!98152) (not b_lambda!18597) (not b!1123028) (not b!1123031) (not b!1123024) (not b!1123027) (not bm!47197) (not b!1123023) (not b!1123020) tp_is_empty!28147)
(check-sat b_and!38029 (not b_next!23617))
