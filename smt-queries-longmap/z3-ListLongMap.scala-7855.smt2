; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98110 () Bool)

(assert start!98110)

(declare-fun b_free!23575 () Bool)

(declare-fun b_next!23575 () Bool)

(assert (=> start!98110 (= b_free!23575 (not b_next!23575))))

(declare-fun tp!83429 () Bool)

(declare-fun b_and!37943 () Bool)

(assert (=> start!98110 (= tp!83429 b_and!37943)))

(declare-fun b!1121908 () Bool)

(declare-fun res!749126 () Bool)

(declare-fun e!638935 () Bool)

(assert (=> b!1121908 (=> (not res!749126) (not e!638935))))

(declare-datatypes ((array!73139 0))(
  ( (array!73140 (arr!35216 (Array (_ BitVec 32) (_ BitVec 64))) (size!35753 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73139)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73139 (_ BitVec 32)) Bool)

(assert (=> b!1121908 (= res!749126 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-datatypes ((V!42601 0))(
  ( (V!42602 (val!14109 Int)) )
))
(declare-fun zeroValue!944 () V!42601)

(declare-datatypes ((tuple2!17714 0))(
  ( (tuple2!17715 (_1!8868 (_ BitVec 64)) (_2!8868 V!42601)) )
))
(declare-datatypes ((List!24511 0))(
  ( (Nil!24508) (Cons!24507 (h!25725 tuple2!17714) (t!35070 List!24511)) )
))
(declare-datatypes ((ListLongMap!15691 0))(
  ( (ListLongMap!15692 (toList!7861 List!24511)) )
))
(declare-fun call!47074 () ListLongMap!15691)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((ValueCell!13343 0))(
  ( (ValueCellFull!13343 (v!16738 V!42601)) (EmptyCell!13343) )
))
(declare-datatypes ((array!73141 0))(
  ( (array!73142 (arr!35217 (Array (_ BitVec 32) ValueCell!13343)) (size!35754 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73141)

(declare-fun minValue!944 () V!42601)

(declare-fun bm!47071 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!4391 (array!73139 array!73141 (_ BitVec 32) (_ BitVec 32) V!42601 V!42601 (_ BitVec 32) Int) ListLongMap!15691)

(assert (=> bm!47071 (= call!47074 (getCurrentListMapNoExtraKeys!4391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121909 () Bool)

(declare-fun e!638932 () Bool)

(declare-fun tp_is_empty!28105 () Bool)

(assert (=> b!1121909 (= e!638932 tp_is_empty!28105)))

(declare-fun b!1121910 () Bool)

(declare-fun e!638933 () Bool)

(declare-fun e!638938 () Bool)

(declare-fun mapRes!43975 () Bool)

(assert (=> b!1121910 (= e!638933 (and e!638938 mapRes!43975))))

(declare-fun condMapEmpty!43975 () Bool)

(declare-fun mapDefault!43975 () ValueCell!13343)

(assert (=> b!1121910 (= condMapEmpty!43975 (= (arr!35217 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13343)) mapDefault!43975)))))

(declare-fun b!1121911 () Bool)

(declare-fun res!749132 () Bool)

(assert (=> b!1121911 (=> (not res!749132) (not e!638935))))

(declare-datatypes ((List!24512 0))(
  ( (Nil!24509) (Cons!24508 (h!25726 (_ BitVec 64)) (t!35071 List!24512)) )
))
(declare-fun arrayNoDuplicates!0 (array!73139 (_ BitVec 32) List!24512) Bool)

(assert (=> b!1121911 (= res!749132 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24509))))

(declare-fun b!1121912 () Bool)

(declare-fun res!749137 () Bool)

(assert (=> b!1121912 (=> (not res!749137) (not e!638935))))

(assert (=> b!1121912 (= res!749137 (and (= (size!35754 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35753 _keys!1208) (size!35754 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1121913 () Bool)

(declare-fun res!749130 () Bool)

(assert (=> b!1121913 (=> (not res!749130) (not e!638935))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1121913 (= res!749130 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35753 _keys!1208))))))

(declare-fun e!638939 () Bool)

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1121914 () Bool)

(declare-fun call!47075 () ListLongMap!15691)

(declare-fun -!1064 (ListLongMap!15691 (_ BitVec 64)) ListLongMap!15691)

(assert (=> b!1121914 (= e!638939 (= call!47075 (-!1064 call!47074 k0!934)))))

(declare-fun b!1121915 () Bool)

(assert (=> b!1121915 (= e!638939 (= call!47075 call!47074))))

(declare-fun b!1121916 () Bool)

(declare-fun res!749134 () Bool)

(assert (=> b!1121916 (=> (not res!749134) (not e!638935))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121916 (= res!749134 (validMask!0 mask!1564))))

(declare-fun b!1121917 () Bool)

(declare-fun e!638937 () Bool)

(assert (=> b!1121917 (= e!638937 true)))

(assert (=> b!1121917 e!638939))

(declare-fun c!109763 () Bool)

(assert (=> b!1121917 (= c!109763 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((Unit!36757 0))(
  ( (Unit!36758) )
))
(declare-fun lt!498581 () Unit!36757)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!327 (array!73139 array!73141 (_ BitVec 32) (_ BitVec 32) V!42601 V!42601 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36757)

(assert (=> b!1121917 (= lt!498581 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!327 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121918 () Bool)

(declare-fun e!638936 () Bool)

(assert (=> b!1121918 (= e!638936 e!638937)))

(declare-fun res!749135 () Bool)

(assert (=> b!1121918 (=> res!749135 e!638937)))

(assert (=> b!1121918 (= res!749135 (not (= from!1455 i!673)))))

(declare-fun lt!498586 () ListLongMap!15691)

(declare-fun lt!498582 () array!73139)

(declare-fun lt!498584 () array!73141)

(assert (=> b!1121918 (= lt!498586 (getCurrentListMapNoExtraKeys!4391 lt!498582 lt!498584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2480 (Int (_ BitVec 64)) V!42601)

(assert (=> b!1121918 (= lt!498584 (array!73142 (store (arr!35217 _values!996) i!673 (ValueCellFull!13343 (dynLambda!2480 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35754 _values!996)))))

(declare-fun lt!498583 () ListLongMap!15691)

(assert (=> b!1121918 (= lt!498583 (getCurrentListMapNoExtraKeys!4391 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121919 () Bool)

(declare-fun res!749133 () Bool)

(assert (=> b!1121919 (=> (not res!749133) (not e!638935))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121919 (= res!749133 (validKeyInArray!0 k0!934))))

(declare-fun res!749127 () Bool)

(assert (=> start!98110 (=> (not res!749127) (not e!638935))))

(assert (=> start!98110 (= res!749127 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35753 _keys!1208))))))

(assert (=> start!98110 e!638935))

(assert (=> start!98110 tp_is_empty!28105))

(declare-fun array_inv!27112 (array!73139) Bool)

(assert (=> start!98110 (array_inv!27112 _keys!1208)))

(assert (=> start!98110 true))

(assert (=> start!98110 tp!83429))

(declare-fun array_inv!27113 (array!73141) Bool)

(assert (=> start!98110 (and (array_inv!27113 _values!996) e!638933)))

(declare-fun b!1121907 () Bool)

(declare-fun res!749136 () Bool)

(declare-fun e!638934 () Bool)

(assert (=> b!1121907 (=> (not res!749136) (not e!638934))))

(assert (=> b!1121907 (= res!749136 (arrayNoDuplicates!0 lt!498582 #b00000000000000000000000000000000 Nil!24509))))

(declare-fun b!1121920 () Bool)

(assert (=> b!1121920 (= e!638934 (not e!638936))))

(declare-fun res!749131 () Bool)

(assert (=> b!1121920 (=> res!749131 e!638936)))

(assert (=> b!1121920 (= res!749131 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73139 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121920 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498585 () Unit!36757)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73139 (_ BitVec 64) (_ BitVec 32)) Unit!36757)

(assert (=> b!1121920 (= lt!498585 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121921 () Bool)

(assert (=> b!1121921 (= e!638938 tp_is_empty!28105)))

(declare-fun bm!47072 () Bool)

(assert (=> bm!47072 (= call!47075 (getCurrentListMapNoExtraKeys!4391 lt!498582 lt!498584 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun mapIsEmpty!43975 () Bool)

(assert (=> mapIsEmpty!43975 mapRes!43975))

(declare-fun b!1121922 () Bool)

(declare-fun res!749129 () Bool)

(assert (=> b!1121922 (=> (not res!749129) (not e!638935))))

(assert (=> b!1121922 (= res!749129 (= (select (arr!35216 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43975 () Bool)

(declare-fun tp!83428 () Bool)

(assert (=> mapNonEmpty!43975 (= mapRes!43975 (and tp!83428 e!638932))))

(declare-fun mapRest!43975 () (Array (_ BitVec 32) ValueCell!13343))

(declare-fun mapValue!43975 () ValueCell!13343)

(declare-fun mapKey!43975 () (_ BitVec 32))

(assert (=> mapNonEmpty!43975 (= (arr!35217 _values!996) (store mapRest!43975 mapKey!43975 mapValue!43975))))

(declare-fun b!1121923 () Bool)

(assert (=> b!1121923 (= e!638935 e!638934)))

(declare-fun res!749128 () Bool)

(assert (=> b!1121923 (=> (not res!749128) (not e!638934))))

(assert (=> b!1121923 (= res!749128 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498582 mask!1564))))

(assert (=> b!1121923 (= lt!498582 (array!73140 (store (arr!35216 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35753 _keys!1208)))))

(assert (= (and start!98110 res!749127) b!1121916))

(assert (= (and b!1121916 res!749134) b!1121912))

(assert (= (and b!1121912 res!749137) b!1121908))

(assert (= (and b!1121908 res!749126) b!1121911))

(assert (= (and b!1121911 res!749132) b!1121913))

(assert (= (and b!1121913 res!749130) b!1121919))

(assert (= (and b!1121919 res!749133) b!1121922))

(assert (= (and b!1121922 res!749129) b!1121923))

(assert (= (and b!1121923 res!749128) b!1121907))

(assert (= (and b!1121907 res!749136) b!1121920))

(assert (= (and b!1121920 (not res!749131)) b!1121918))

(assert (= (and b!1121918 (not res!749135)) b!1121917))

(assert (= (and b!1121917 c!109763) b!1121914))

(assert (= (and b!1121917 (not c!109763)) b!1121915))

(assert (= (or b!1121914 b!1121915) bm!47072))

(assert (= (or b!1121914 b!1121915) bm!47071))

(assert (= (and b!1121910 condMapEmpty!43975) mapIsEmpty!43975))

(assert (= (and b!1121910 (not condMapEmpty!43975)) mapNonEmpty!43975))

(get-info :version)

(assert (= (and mapNonEmpty!43975 ((_ is ValueCellFull!13343) mapValue!43975)) b!1121909))

(assert (= (and b!1121910 ((_ is ValueCellFull!13343) mapDefault!43975)) b!1121921))

(assert (= start!98110 b!1121910))

(declare-fun b_lambda!18555 () Bool)

(assert (=> (not b_lambda!18555) (not b!1121918)))

(declare-fun t!35069 () Bool)

(declare-fun tb!8379 () Bool)

(assert (=> (and start!98110 (= defaultEntry!1004 defaultEntry!1004) t!35069) tb!8379))

(declare-fun result!17327 () Bool)

(assert (=> tb!8379 (= result!17327 tp_is_empty!28105)))

(assert (=> b!1121918 t!35069))

(declare-fun b_and!37945 () Bool)

(assert (= b_and!37943 (and (=> t!35069 result!17327) b_and!37945)))

(declare-fun m!1037271 () Bool)

(assert (=> bm!47072 m!1037271))

(declare-fun m!1037273 () Bool)

(assert (=> b!1121914 m!1037273))

(declare-fun m!1037275 () Bool)

(assert (=> b!1121922 m!1037275))

(declare-fun m!1037277 () Bool)

(assert (=> b!1121907 m!1037277))

(declare-fun m!1037279 () Bool)

(assert (=> b!1121908 m!1037279))

(declare-fun m!1037281 () Bool)

(assert (=> start!98110 m!1037281))

(declare-fun m!1037283 () Bool)

(assert (=> start!98110 m!1037283))

(declare-fun m!1037285 () Bool)

(assert (=> b!1121916 m!1037285))

(declare-fun m!1037287 () Bool)

(assert (=> b!1121917 m!1037287))

(declare-fun m!1037289 () Bool)

(assert (=> b!1121920 m!1037289))

(declare-fun m!1037291 () Bool)

(assert (=> b!1121920 m!1037291))

(declare-fun m!1037293 () Bool)

(assert (=> b!1121911 m!1037293))

(declare-fun m!1037295 () Bool)

(assert (=> b!1121923 m!1037295))

(declare-fun m!1037297 () Bool)

(assert (=> b!1121923 m!1037297))

(declare-fun m!1037299 () Bool)

(assert (=> b!1121919 m!1037299))

(declare-fun m!1037301 () Bool)

(assert (=> b!1121918 m!1037301))

(declare-fun m!1037303 () Bool)

(assert (=> b!1121918 m!1037303))

(declare-fun m!1037305 () Bool)

(assert (=> b!1121918 m!1037305))

(declare-fun m!1037307 () Bool)

(assert (=> b!1121918 m!1037307))

(declare-fun m!1037309 () Bool)

(assert (=> mapNonEmpty!43975 m!1037309))

(declare-fun m!1037311 () Bool)

(assert (=> bm!47071 m!1037311))

(check-sat (not b!1121923) (not b!1121920) (not b!1121908) tp_is_empty!28105 (not start!98110) (not b!1121907) (not b!1121917) b_and!37945 (not b!1121916) (not b!1121918) (not b!1121914) (not mapNonEmpty!43975) (not b_next!23575) (not b!1121919) (not bm!47071) (not b!1121911) (not b_lambda!18555) (not bm!47072))
(check-sat b_and!37945 (not b_next!23575))
