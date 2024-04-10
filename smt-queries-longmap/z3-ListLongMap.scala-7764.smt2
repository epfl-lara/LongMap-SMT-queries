; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97330 () Bool)

(assert start!97330)

(declare-fun b_free!23301 () Bool)

(declare-fun b_next!23301 () Bool)

(assert (=> start!97330 (= b_free!23301 (not b_next!23301))))

(declare-fun tp!82201 () Bool)

(declare-fun b_and!37437 () Bool)

(assert (=> start!97330 (= tp!82201 b_and!37437)))

(declare-fun b!1108919 () Bool)

(declare-fun res!740033 () Bool)

(declare-fun e!632559 () Bool)

(assert (=> b!1108919 (=> (not res!740033) (not e!632559))))

(declare-datatypes ((array!72039 0))(
  ( (array!72040 (arr!34672 (Array (_ BitVec 32) (_ BitVec 64))) (size!35208 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!72039)

(declare-datatypes ((List!24171 0))(
  ( (Nil!24168) (Cons!24167 (h!25376 (_ BitVec 64)) (t!34518 List!24171)) )
))
(declare-fun arrayNoDuplicates!0 (array!72039 (_ BitVec 32) List!24171) Bool)

(assert (=> b!1108919 (= res!740033 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24168))))

(declare-fun b!1108920 () Bool)

(declare-fun e!632561 () Bool)

(declare-datatypes ((V!41875 0))(
  ( (V!41876 (val!13837 Int)) )
))
(declare-datatypes ((tuple2!17488 0))(
  ( (tuple2!17489 (_1!8755 (_ BitVec 64)) (_2!8755 V!41875)) )
))
(declare-datatypes ((List!24172 0))(
  ( (Nil!24169) (Cons!24168 (h!25377 tuple2!17488) (t!34519 List!24172)) )
))
(declare-datatypes ((ListLongMap!15457 0))(
  ( (ListLongMap!15458 (toList!7744 List!24172)) )
))
(declare-fun call!46600 () ListLongMap!15457)

(declare-fun call!46599 () ListLongMap!15457)

(assert (=> b!1108920 (= e!632561 (= call!46600 call!46599))))

(declare-fun b!1108921 () Bool)

(declare-fun e!632562 () Bool)

(assert (=> b!1108921 (= e!632559 e!632562)))

(declare-fun res!740041 () Bool)

(assert (=> b!1108921 (=> (not res!740041) (not e!632562))))

(declare-fun lt!495892 () array!72039)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!72039 (_ BitVec 32)) Bool)

(assert (=> b!1108921 (= res!740041 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!495892 mask!1564))))

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1108921 (= lt!495892 (array!72040 (store (arr!34672 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35208 _keys!1208)))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun b!1108922 () Bool)

(declare-fun -!1022 (ListLongMap!15457 (_ BitVec 64)) ListLongMap!15457)

(assert (=> b!1108922 (= e!632561 (= call!46600 (-!1022 call!46599 k0!934)))))

(declare-fun res!740032 () Bool)

(assert (=> start!97330 (=> (not res!740032) (not e!632559))))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> start!97330 (= res!740032 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35208 _keys!1208))))))

(assert (=> start!97330 e!632559))

(declare-fun tp_is_empty!27561 () Bool)

(assert (=> start!97330 tp_is_empty!27561))

(declare-fun array_inv!26682 (array!72039) Bool)

(assert (=> start!97330 (array_inv!26682 _keys!1208)))

(assert (=> start!97330 true))

(assert (=> start!97330 tp!82201))

(declare-datatypes ((ValueCell!13071 0))(
  ( (ValueCellFull!13071 (v!16470 V!41875)) (EmptyCell!13071) )
))
(declare-datatypes ((array!72041 0))(
  ( (array!72042 (arr!34673 (Array (_ BitVec 32) ValueCell!13071)) (size!35209 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!72041)

(declare-fun e!632564 () Bool)

(declare-fun array_inv!26683 (array!72041) Bool)

(assert (=> start!97330 (and (array_inv!26683 _values!996) e!632564)))

(declare-fun b!1108923 () Bool)

(declare-fun res!740038 () Bool)

(assert (=> b!1108923 (=> (not res!740038) (not e!632559))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(assert (=> b!1108923 (= res!740038 (and (= (size!35209 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35208 _keys!1208) (size!35209 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!43159 () Bool)

(declare-fun mapRes!43159 () Bool)

(assert (=> mapIsEmpty!43159 mapRes!43159))

(declare-fun b!1108924 () Bool)

(declare-fun res!740031 () Bool)

(assert (=> b!1108924 (=> (not res!740031) (not e!632559))))

(assert (=> b!1108924 (= res!740031 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35208 _keys!1208))))))

(declare-fun b!1108925 () Bool)

(declare-fun res!740036 () Bool)

(assert (=> b!1108925 (=> (not res!740036) (not e!632562))))

(assert (=> b!1108925 (= res!740036 (arrayNoDuplicates!0 lt!495892 #b00000000000000000000000000000000 Nil!24168))))

(declare-fun b!1108926 () Bool)

(declare-fun e!632565 () Bool)

(assert (=> b!1108926 (= e!632565 tp_is_empty!27561)))

(declare-fun b!1108927 () Bool)

(declare-fun res!740034 () Bool)

(assert (=> b!1108927 (=> (not res!740034) (not e!632559))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1108927 (= res!740034 (validMask!0 mask!1564))))

(declare-fun b!1108928 () Bool)

(declare-fun e!632560 () Bool)

(assert (=> b!1108928 (= e!632564 (and e!632560 mapRes!43159))))

(declare-fun condMapEmpty!43159 () Bool)

(declare-fun mapDefault!43159 () ValueCell!13071)

(assert (=> b!1108928 (= condMapEmpty!43159 (= (arr!34673 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13071)) mapDefault!43159)))))

(declare-fun b!1108929 () Bool)

(declare-fun res!740040 () Bool)

(assert (=> b!1108929 (=> (not res!740040) (not e!632559))))

(assert (=> b!1108929 (= res!740040 (= (select (arr!34672 _keys!1208) i!673) k0!934))))

(declare-fun mapNonEmpty!43159 () Bool)

(declare-fun tp!82202 () Bool)

(assert (=> mapNonEmpty!43159 (= mapRes!43159 (and tp!82202 e!632565))))

(declare-fun mapRest!43159 () (Array (_ BitVec 32) ValueCell!13071))

(declare-fun mapValue!43159 () ValueCell!13071)

(declare-fun mapKey!43159 () (_ BitVec 32))

(assert (=> mapNonEmpty!43159 (= (arr!34673 _values!996) (store mapRest!43159 mapKey!43159 mapValue!43159))))

(declare-fun b!1108930 () Bool)

(declare-fun res!740037 () Bool)

(assert (=> b!1108930 (=> (not res!740037) (not e!632559))))

(assert (=> b!1108930 (= res!740037 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun defaultEntry!1004 () Int)

(declare-fun bm!46596 () Bool)

(declare-fun minValue!944 () V!41875)

(declare-fun zeroValue!944 () V!41875)

(declare-fun getCurrentListMapNoExtraKeys!4238 (array!72039 array!72041 (_ BitVec 32) (_ BitVec 32) V!41875 V!41875 (_ BitVec 32) Int) ListLongMap!15457)

(declare-fun dynLambda!2369 (Int (_ BitVec 64)) V!41875)

(assert (=> bm!46596 (= call!46600 (getCurrentListMapNoExtraKeys!4238 lt!495892 (array!72042 (store (arr!34673 _values!996) i!673 (ValueCellFull!13071 (dynLambda!2369 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35209 _values!996)) mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108931 () Bool)

(declare-fun e!632558 () Bool)

(assert (=> b!1108931 (= e!632562 (not e!632558))))

(declare-fun res!740039 () Bool)

(assert (=> b!1108931 (=> res!740039 e!632558)))

(assert (=> b!1108931 (= res!740039 (or (bvsle from!1455 i!673) (bvsgt (bvadd #b00000000000000000000000000000001 from!1455) (size!35208 _keys!1208)) (bvslt (bvadd #b00000000000000000000000000000001 from!1455) #b00000000000000000000000000000000)))))

(declare-fun arrayContainsKey!0 (array!72039 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1108931 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36392 0))(
  ( (Unit!36393) )
))
(declare-fun lt!495893 () Unit!36392)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!72039 (_ BitVec 64) (_ BitVec 32)) Unit!36392)

(assert (=> b!1108931 (= lt!495893 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1108932 () Bool)

(assert (=> b!1108932 (= e!632558 true)))

(assert (=> b!1108932 e!632561))

(declare-fun c!109143 () Bool)

(assert (=> b!1108932 (= c!109143 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!495891 () Unit!36392)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!268 (array!72039 array!72041 (_ BitVec 32) (_ BitVec 32) V!41875 V!41875 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36392)

(assert (=> b!1108932 (= lt!495891 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!268 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1108933 () Bool)

(declare-fun res!740035 () Bool)

(assert (=> b!1108933 (=> (not res!740035) (not e!632559))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1108933 (= res!740035 (validKeyInArray!0 k0!934))))

(declare-fun b!1108934 () Bool)

(assert (=> b!1108934 (= e!632560 tp_is_empty!27561)))

(declare-fun bm!46597 () Bool)

(assert (=> bm!46597 (= call!46599 (getCurrentListMapNoExtraKeys!4238 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(assert (= (and start!97330 res!740032) b!1108927))

(assert (= (and b!1108927 res!740034) b!1108923))

(assert (= (and b!1108923 res!740038) b!1108930))

(assert (= (and b!1108930 res!740037) b!1108919))

(assert (= (and b!1108919 res!740033) b!1108924))

(assert (= (and b!1108924 res!740031) b!1108933))

(assert (= (and b!1108933 res!740035) b!1108929))

(assert (= (and b!1108929 res!740040) b!1108921))

(assert (= (and b!1108921 res!740041) b!1108925))

(assert (= (and b!1108925 res!740036) b!1108931))

(assert (= (and b!1108931 (not res!740039)) b!1108932))

(assert (= (and b!1108932 c!109143) b!1108922))

(assert (= (and b!1108932 (not c!109143)) b!1108920))

(assert (= (or b!1108922 b!1108920) bm!46596))

(assert (= (or b!1108922 b!1108920) bm!46597))

(assert (= (and b!1108928 condMapEmpty!43159) mapIsEmpty!43159))

(assert (= (and b!1108928 (not condMapEmpty!43159)) mapNonEmpty!43159))

(get-info :version)

(assert (= (and mapNonEmpty!43159 ((_ is ValueCellFull!13071) mapValue!43159)) b!1108926))

(assert (= (and b!1108928 ((_ is ValueCellFull!13071) mapDefault!43159)) b!1108934))

(assert (= start!97330 b!1108928))

(declare-fun b_lambda!18323 () Bool)

(assert (=> (not b_lambda!18323) (not bm!46596)))

(declare-fun t!34517 () Bool)

(declare-fun tb!8167 () Bool)

(assert (=> (and start!97330 (= defaultEntry!1004 defaultEntry!1004) t!34517) tb!8167))

(declare-fun result!16895 () Bool)

(assert (=> tb!8167 (= result!16895 tp_is_empty!27561)))

(assert (=> bm!46596 t!34517))

(declare-fun b_and!37439 () Bool)

(assert (= b_and!37437 (and (=> t!34517 result!16895) b_and!37439)))

(declare-fun m!1027321 () Bool)

(assert (=> b!1108927 m!1027321))

(declare-fun m!1027323 () Bool)

(assert (=> bm!46596 m!1027323))

(declare-fun m!1027325 () Bool)

(assert (=> bm!46596 m!1027325))

(declare-fun m!1027327 () Bool)

(assert (=> bm!46596 m!1027327))

(declare-fun m!1027329 () Bool)

(assert (=> b!1108919 m!1027329))

(declare-fun m!1027331 () Bool)

(assert (=> b!1108930 m!1027331))

(declare-fun m!1027333 () Bool)

(assert (=> b!1108925 m!1027333))

(declare-fun m!1027335 () Bool)

(assert (=> b!1108933 m!1027335))

(declare-fun m!1027337 () Bool)

(assert (=> b!1108922 m!1027337))

(declare-fun m!1027339 () Bool)

(assert (=> b!1108931 m!1027339))

(declare-fun m!1027341 () Bool)

(assert (=> b!1108931 m!1027341))

(declare-fun m!1027343 () Bool)

(assert (=> b!1108932 m!1027343))

(declare-fun m!1027345 () Bool)

(assert (=> start!97330 m!1027345))

(declare-fun m!1027347 () Bool)

(assert (=> start!97330 m!1027347))

(declare-fun m!1027349 () Bool)

(assert (=> b!1108929 m!1027349))

(declare-fun m!1027351 () Bool)

(assert (=> mapNonEmpty!43159 m!1027351))

(declare-fun m!1027353 () Bool)

(assert (=> bm!46597 m!1027353))

(declare-fun m!1027355 () Bool)

(assert (=> b!1108921 m!1027355))

(declare-fun m!1027357 () Bool)

(assert (=> b!1108921 m!1027357))

(check-sat tp_is_empty!27561 (not start!97330) (not b!1108927) (not b_next!23301) b_and!37439 (not b!1108933) (not b!1108930) (not b!1108919) (not bm!46597) (not b!1108922) (not bm!46596) (not b!1108925) (not b!1108932) (not b!1108931) (not b!1108921) (not b_lambda!18323) (not mapNonEmpty!43159))
(check-sat b_and!37439 (not b_next!23301))
