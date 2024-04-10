; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!98074 () Bool)

(assert start!98074)

(declare-fun b_free!23775 () Bool)

(declare-fun b_next!23775 () Bool)

(assert (=> start!98074 (= b_free!23775 (not b_next!23775))))

(declare-fun tp!84029 () Bool)

(declare-fun b_and!38333 () Bool)

(assert (=> start!98074 (= tp!84029 b_and!38333)))

(declare-fun b!1126290 () Bool)

(declare-fun e!641090 () Bool)

(declare-fun tp_is_empty!28305 () Bool)

(assert (=> b!1126290 (= e!641090 tp_is_empty!28305)))

(declare-fun b!1126291 () Bool)

(declare-fun e!641096 () Bool)

(declare-fun e!641089 () Bool)

(assert (=> b!1126291 (= e!641096 e!641089)))

(declare-fun res!752618 () Bool)

(assert (=> b!1126291 (=> (not res!752618) (not e!641089))))

(declare-datatypes ((array!73473 0))(
  ( (array!73474 (arr!35389 (Array (_ BitVec 32) (_ BitVec 64))) (size!35925 (_ BitVec 32))) )
))
(declare-fun lt!500172 () array!73473)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73473 (_ BitVec 32)) Bool)

(assert (=> b!1126291 (= res!752618 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!500172 mask!1564))))

(declare-fun _keys!1208 () array!73473)

(declare-fun i!673 () (_ BitVec 32))

(assert (=> b!1126291 (= lt!500172 (array!73474 (store (arr!35389 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35925 _keys!1208)))))

(declare-datatypes ((V!42867 0))(
  ( (V!42868 (val!14209 Int)) )
))
(declare-fun zeroValue!944 () V!42867)

(declare-datatypes ((ValueCell!13443 0))(
  ( (ValueCellFull!13443 (v!16842 V!42867)) (EmptyCell!13443) )
))
(declare-datatypes ((array!73475 0))(
  ( (array!73476 (arr!35390 (Array (_ BitVec 32) ValueCell!13443)) (size!35926 (_ BitVec 32))) )
))
(declare-fun lt!500170 () array!73475)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-fun from!1455 () (_ BitVec 32))

(declare-datatypes ((tuple2!17866 0))(
  ( (tuple2!17867 (_1!8944 (_ BitVec 64)) (_2!8944 V!42867)) )
))
(declare-datatypes ((List!24641 0))(
  ( (Nil!24638) (Cons!24637 (h!25846 tuple2!17866) (t!35408 List!24641)) )
))
(declare-datatypes ((ListLongMap!15835 0))(
  ( (ListLongMap!15836 (toList!7933 List!24641)) )
))
(declare-fun call!47608 () ListLongMap!15835)

(declare-fun bm!47604 () Bool)

(declare-fun minValue!944 () V!42867)

(declare-fun getCurrentListMapNoExtraKeys!4421 (array!73473 array!73475 (_ BitVec 32) (_ BitVec 32) V!42867 V!42867 (_ BitVec 32) Int) ListLongMap!15835)

(assert (=> bm!47604 (= call!47608 (getCurrentListMapNoExtraKeys!4421 lt!500172 lt!500170 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126292 () Bool)

(declare-fun res!752619 () Bool)

(assert (=> b!1126292 (=> (not res!752619) (not e!641096))))

(declare-fun k0!934 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1126292 (= res!752619 (validKeyInArray!0 k0!934))))

(declare-fun res!752621 () Bool)

(assert (=> start!98074 (=> (not res!752621) (not e!641096))))

(assert (=> start!98074 (= res!752621 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35925 _keys!1208))))))

(assert (=> start!98074 e!641096))

(assert (=> start!98074 tp_is_empty!28305))

(declare-fun array_inv!27164 (array!73473) Bool)

(assert (=> start!98074 (array_inv!27164 _keys!1208)))

(assert (=> start!98074 true))

(assert (=> start!98074 tp!84029))

(declare-fun _values!996 () array!73475)

(declare-fun e!641091 () Bool)

(declare-fun array_inv!27165 (array!73475) Bool)

(assert (=> start!98074 (and (array_inv!27165 _values!996) e!641091)))

(declare-fun b!1126293 () Bool)

(declare-fun res!752623 () Bool)

(assert (=> b!1126293 (=> (not res!752623) (not e!641096))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1126293 (= res!752623 (validMask!0 mask!1564))))

(declare-fun mapIsEmpty!44275 () Bool)

(declare-fun mapRes!44275 () Bool)

(assert (=> mapIsEmpty!44275 mapRes!44275))

(declare-fun b!1126294 () Bool)

(declare-fun res!752614 () Bool)

(assert (=> b!1126294 (=> (not res!752614) (not e!641096))))

(assert (=> b!1126294 (= res!752614 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35925 _keys!1208))))))

(declare-fun b!1126295 () Bool)

(declare-fun res!752625 () Bool)

(assert (=> b!1126295 (=> (not res!752625) (not e!641096))))

(declare-datatypes ((List!24642 0))(
  ( (Nil!24639) (Cons!24638 (h!25847 (_ BitVec 64)) (t!35409 List!24642)) )
))
(declare-fun arrayNoDuplicates!0 (array!73473 (_ BitVec 32) List!24642) Bool)

(assert (=> b!1126295 (= res!752625 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24639))))

(declare-fun b!1126296 () Bool)

(declare-fun e!641097 () Bool)

(declare-fun e!641094 () Bool)

(assert (=> b!1126296 (= e!641097 e!641094)))

(declare-fun res!752626 () Bool)

(assert (=> b!1126296 (=> res!752626 e!641094)))

(assert (=> b!1126296 (= res!752626 (not (= from!1455 i!673)))))

(declare-fun lt!500171 () ListLongMap!15835)

(assert (=> b!1126296 (= lt!500171 (getCurrentListMapNoExtraKeys!4421 lt!500172 lt!500170 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2511 (Int (_ BitVec 64)) V!42867)

(assert (=> b!1126296 (= lt!500170 (array!73476 (store (arr!35390 _values!996) i!673 (ValueCellFull!13443 (dynLambda!2511 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35926 _values!996)))))

(declare-fun lt!500168 () ListLongMap!15835)

(assert (=> b!1126296 (= lt!500168 (getCurrentListMapNoExtraKeys!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1126297 () Bool)

(declare-fun res!752615 () Bool)

(assert (=> b!1126297 (=> (not res!752615) (not e!641096))))

(assert (=> b!1126297 (= res!752615 (and (= (size!35926 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35925 _keys!1208) (size!35926 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun b!1126298 () Bool)

(assert (=> b!1126298 (= e!641091 (and e!641090 mapRes!44275))))

(declare-fun condMapEmpty!44275 () Bool)

(declare-fun mapDefault!44275 () ValueCell!13443)

(assert (=> b!1126298 (= condMapEmpty!44275 (= (arr!35390 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13443)) mapDefault!44275)))))

(declare-fun b!1126299 () Bool)

(assert (=> b!1126299 (= e!641089 (not e!641097))))

(declare-fun res!752624 () Bool)

(assert (=> b!1126299 (=> res!752624 e!641097)))

(assert (=> b!1126299 (= res!752624 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73473 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1126299 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36914 0))(
  ( (Unit!36915) )
))
(declare-fun lt!500174 () Unit!36914)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73473 (_ BitVec 64) (_ BitVec 32)) Unit!36914)

(assert (=> b!1126299 (= lt!500174 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44275 () Bool)

(declare-fun tp!84028 () Bool)

(declare-fun e!641088 () Bool)

(assert (=> mapNonEmpty!44275 (= mapRes!44275 (and tp!84028 e!641088))))

(declare-fun mapRest!44275 () (Array (_ BitVec 32) ValueCell!13443))

(declare-fun mapValue!44275 () ValueCell!13443)

(declare-fun mapKey!44275 () (_ BitVec 32))

(assert (=> mapNonEmpty!44275 (= (arr!35390 _values!996) (store mapRest!44275 mapKey!44275 mapValue!44275))))

(declare-fun b!1126300 () Bool)

(declare-fun res!752622 () Bool)

(assert (=> b!1126300 (=> (not res!752622) (not e!641089))))

(assert (=> b!1126300 (= res!752622 (arrayNoDuplicates!0 lt!500172 #b00000000000000000000000000000000 Nil!24639))))

(declare-fun b!1126301 () Bool)

(declare-fun res!752620 () Bool)

(assert (=> b!1126301 (=> (not res!752620) (not e!641096))))

(assert (=> b!1126301 (= res!752620 (= (select (arr!35389 _keys!1208) i!673) k0!934))))

(declare-fun call!47607 () ListLongMap!15835)

(declare-fun bm!47605 () Bool)

(assert (=> bm!47605 (= call!47607 (getCurrentListMapNoExtraKeys!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun e!641092 () Bool)

(declare-fun b!1126302 () Bool)

(declare-fun -!1127 (ListLongMap!15835 (_ BitVec 64)) ListLongMap!15835)

(assert (=> b!1126302 (= e!641092 (= call!47608 (-!1127 call!47607 k0!934)))))

(declare-fun b!1126303 () Bool)

(assert (=> b!1126303 (= e!641088 tp_is_empty!28305)))

(declare-fun b!1126304 () Bool)

(declare-fun e!641093 () Bool)

(assert (=> b!1126304 (= e!641094 e!641093)))

(declare-fun res!752616 () Bool)

(assert (=> b!1126304 (=> res!752616 e!641093)))

(assert (=> b!1126304 (= res!752616 (not (= (select (arr!35389 _keys!1208) from!1455) k0!934)))))

(assert (=> b!1126304 e!641092))

(declare-fun c!109653 () Bool)

(assert (=> b!1126304 (= c!109653 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!500173 () Unit!36914)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!378 (array!73473 array!73475 (_ BitVec 32) (_ BitVec 32) V!42867 V!42867 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36914)

(assert (=> b!1126304 (= lt!500173 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!378 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1126305 () Bool)

(assert (=> b!1126305 (= e!641092 (= call!47608 call!47607))))

(declare-fun b!1126306 () Bool)

(assert (=> b!1126306 (= e!641093 true)))

(declare-fun lt!500169 () Bool)

(declare-fun contains!6466 (ListLongMap!15835 (_ BitVec 64)) Bool)

(assert (=> b!1126306 (= lt!500169 (contains!6466 (getCurrentListMapNoExtraKeys!4421 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004) k0!934))))

(declare-fun b!1126307 () Bool)

(declare-fun res!752617 () Bool)

(assert (=> b!1126307 (=> (not res!752617) (not e!641096))))

(assert (=> b!1126307 (= res!752617 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(assert (= (and start!98074 res!752621) b!1126293))

(assert (= (and b!1126293 res!752623) b!1126297))

(assert (= (and b!1126297 res!752615) b!1126307))

(assert (= (and b!1126307 res!752617) b!1126295))

(assert (= (and b!1126295 res!752625) b!1126294))

(assert (= (and b!1126294 res!752614) b!1126292))

(assert (= (and b!1126292 res!752619) b!1126301))

(assert (= (and b!1126301 res!752620) b!1126291))

(assert (= (and b!1126291 res!752618) b!1126300))

(assert (= (and b!1126300 res!752622) b!1126299))

(assert (= (and b!1126299 (not res!752624)) b!1126296))

(assert (= (and b!1126296 (not res!752626)) b!1126304))

(assert (= (and b!1126304 c!109653) b!1126302))

(assert (= (and b!1126304 (not c!109653)) b!1126305))

(assert (= (or b!1126302 b!1126305) bm!47604))

(assert (= (or b!1126302 b!1126305) bm!47605))

(assert (= (and b!1126304 (not res!752616)) b!1126306))

(assert (= (and b!1126298 condMapEmpty!44275) mapIsEmpty!44275))

(assert (= (and b!1126298 (not condMapEmpty!44275)) mapNonEmpty!44275))

(get-info :version)

(assert (= (and mapNonEmpty!44275 ((_ is ValueCellFull!13443) mapValue!44275)) b!1126303))

(assert (= (and b!1126298 ((_ is ValueCellFull!13443) mapDefault!44275)) b!1126290))

(assert (= start!98074 b!1126298))

(declare-fun b_lambda!18745 () Bool)

(assert (=> (not b_lambda!18745) (not b!1126296)))

(declare-fun t!35407 () Bool)

(declare-fun tb!8587 () Bool)

(assert (=> (and start!98074 (= defaultEntry!1004 defaultEntry!1004) t!35407) tb!8587))

(declare-fun result!17735 () Bool)

(assert (=> tb!8587 (= result!17735 tp_is_empty!28305)))

(assert (=> b!1126296 t!35407))

(declare-fun b_and!38335 () Bool)

(assert (= b_and!38333 (and (=> t!35407 result!17735) b_and!38335)))

(declare-fun m!1040281 () Bool)

(assert (=> bm!47605 m!1040281))

(declare-fun m!1040283 () Bool)

(assert (=> b!1126292 m!1040283))

(declare-fun m!1040285 () Bool)

(assert (=> b!1126295 m!1040285))

(declare-fun m!1040287 () Bool)

(assert (=> b!1126304 m!1040287))

(declare-fun m!1040289 () Bool)

(assert (=> b!1126304 m!1040289))

(declare-fun m!1040291 () Bool)

(assert (=> start!98074 m!1040291))

(declare-fun m!1040293 () Bool)

(assert (=> start!98074 m!1040293))

(declare-fun m!1040295 () Bool)

(assert (=> b!1126296 m!1040295))

(declare-fun m!1040297 () Bool)

(assert (=> b!1126296 m!1040297))

(declare-fun m!1040299 () Bool)

(assert (=> b!1126296 m!1040299))

(declare-fun m!1040301 () Bool)

(assert (=> b!1126296 m!1040301))

(declare-fun m!1040303 () Bool)

(assert (=> b!1126299 m!1040303))

(declare-fun m!1040305 () Bool)

(assert (=> b!1126299 m!1040305))

(assert (=> b!1126306 m!1040281))

(assert (=> b!1126306 m!1040281))

(declare-fun m!1040307 () Bool)

(assert (=> b!1126306 m!1040307))

(declare-fun m!1040309 () Bool)

(assert (=> b!1126291 m!1040309))

(declare-fun m!1040311 () Bool)

(assert (=> b!1126291 m!1040311))

(declare-fun m!1040313 () Bool)

(assert (=> b!1126302 m!1040313))

(declare-fun m!1040315 () Bool)

(assert (=> b!1126293 m!1040315))

(declare-fun m!1040317 () Bool)

(assert (=> bm!47604 m!1040317))

(declare-fun m!1040319 () Bool)

(assert (=> b!1126307 m!1040319))

(declare-fun m!1040321 () Bool)

(assert (=> b!1126300 m!1040321))

(declare-fun m!1040323 () Bool)

(assert (=> mapNonEmpty!44275 m!1040323))

(declare-fun m!1040325 () Bool)

(assert (=> b!1126301 m!1040325))

(check-sat (not b_next!23775) (not b!1126306) (not b!1126307) (not mapNonEmpty!44275) tp_is_empty!28305 (not b!1126291) b_and!38335 (not b!1126296) (not b!1126304) (not b!1126300) (not start!98074) (not b!1126302) (not b!1126292) (not bm!47604) (not b!1126295) (not bm!47605) (not b_lambda!18745) (not b!1126299) (not b!1126293))
(check-sat b_and!38335 (not b_next!23775))
