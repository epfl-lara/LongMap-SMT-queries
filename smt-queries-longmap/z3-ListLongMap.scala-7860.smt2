; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97906 () Bool)

(assert start!97906)

(declare-fun b_free!23607 () Bool)

(declare-fun b_next!23607 () Bool)

(assert (=> start!97906 (= b_free!23607 (not b_next!23607))))

(declare-fun tp!83524 () Bool)

(declare-fun b_and!37997 () Bool)

(assert (=> start!97906 (= tp!83524 b_and!37997)))

(declare-fun b!1121428 () Bool)

(declare-fun res!749181 () Bool)

(declare-fun e!638512 () Bool)

(assert (=> b!1121428 (=> (not res!749181) (not e!638512))))

(declare-datatypes ((array!73155 0))(
  ( (array!73156 (arr!35230 (Array (_ BitVec 32) (_ BitVec 64))) (size!35766 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73155)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73155 (_ BitVec 32)) Bool)

(assert (=> b!1121428 (= res!749181 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121429 () Bool)

(declare-fun res!749189 () Bool)

(assert (=> b!1121429 (=> (not res!749189) (not e!638512))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121429 (= res!749189 (= (select (arr!35230 _keys!1208) i!673) k0!934))))

(declare-fun b!1121430 () Bool)

(declare-fun e!638514 () Bool)

(assert (=> b!1121430 (= e!638514 true)))

(declare-fun e!638517 () Bool)

(assert (=> b!1121430 e!638517))

(declare-fun c!109401 () Bool)

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121430 (= c!109401 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-datatypes ((V!42643 0))(
  ( (V!42644 (val!14125 Int)) )
))
(declare-fun zeroValue!944 () V!42643)

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-datatypes ((Unit!36788 0))(
  ( (Unit!36789) )
))
(declare-fun lt!498355 () Unit!36788)

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13359 0))(
  ( (ValueCellFull!13359 (v!16758 V!42643)) (EmptyCell!13359) )
))
(declare-datatypes ((array!73157 0))(
  ( (array!73158 (arr!35231 (Array (_ BitVec 32) ValueCell!13359)) (size!35767 (_ BitVec 32))) )
))
(declare-fun _values!996 () array!73157)

(declare-fun minValue!944 () V!42643)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!323 (array!73155 array!73157 (_ BitVec 32) (_ BitVec 32) V!42643 V!42643 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36788)

(assert (=> b!1121430 (= lt!498355 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!323 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121431 () Bool)

(declare-fun e!638513 () Bool)

(declare-fun tp_is_empty!28137 () Bool)

(assert (=> b!1121431 (= e!638513 tp_is_empty!28137)))

(declare-fun b!1121432 () Bool)

(declare-fun res!749184 () Bool)

(declare-fun e!638509 () Bool)

(assert (=> b!1121432 (=> (not res!749184) (not e!638509))))

(declare-fun lt!498357 () array!73155)

(declare-datatypes ((List!24512 0))(
  ( (Nil!24509) (Cons!24508 (h!25717 (_ BitVec 64)) (t!35111 List!24512)) )
))
(declare-fun arrayNoDuplicates!0 (array!73155 (_ BitVec 32) List!24512) Bool)

(assert (=> b!1121432 (= res!749184 (arrayNoDuplicates!0 lt!498357 #b00000000000000000000000000000000 Nil!24509))))

(declare-fun b!1121433 () Bool)

(declare-fun e!638510 () Bool)

(assert (=> b!1121433 (= e!638510 tp_is_empty!28137)))

(declare-fun bm!47100 () Bool)

(declare-datatypes ((tuple2!17728 0))(
  ( (tuple2!17729 (_1!8875 (_ BitVec 64)) (_2!8875 V!42643)) )
))
(declare-datatypes ((List!24513 0))(
  ( (Nil!24510) (Cons!24509 (h!25718 tuple2!17728) (t!35112 List!24513)) )
))
(declare-datatypes ((ListLongMap!15697 0))(
  ( (ListLongMap!15698 (toList!7864 List!24513)) )
))
(declare-fun call!47103 () ListLongMap!15697)

(declare-fun getCurrentListMapNoExtraKeys!4353 (array!73155 array!73157 (_ BitVec 32) (_ BitVec 32) V!42643 V!42643 (_ BitVec 32) Int) ListLongMap!15697)

(assert (=> bm!47100 (= call!47103 (getCurrentListMapNoExtraKeys!4353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun call!47104 () ListLongMap!15697)

(declare-fun bm!47101 () Bool)

(declare-fun lt!498354 () array!73157)

(assert (=> bm!47101 (= call!47104 (getCurrentListMapNoExtraKeys!4353 lt!498357 lt!498354 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121434 () Bool)

(declare-fun res!749183 () Bool)

(assert (=> b!1121434 (=> (not res!749183) (not e!638512))))

(assert (=> b!1121434 (= res!749183 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24509))))

(declare-fun b!1121435 () Bool)

(assert (=> b!1121435 (= e!638517 (= call!47104 call!47103))))

(declare-fun b!1121436 () Bool)

(declare-fun res!749190 () Bool)

(assert (=> b!1121436 (=> (not res!749190) (not e!638512))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121436 (= res!749190 (validMask!0 mask!1564))))

(declare-fun b!1121438 () Bool)

(declare-fun e!638516 () Bool)

(assert (=> b!1121438 (= e!638509 (not e!638516))))

(declare-fun res!749185 () Bool)

(assert (=> b!1121438 (=> res!749185 e!638516)))

(assert (=> b!1121438 (= res!749185 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73155 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121438 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-fun lt!498356 () Unit!36788)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73155 (_ BitVec 64) (_ BitVec 32)) Unit!36788)

(assert (=> b!1121438 (= lt!498356 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun mapNonEmpty!44023 () Bool)

(declare-fun mapRes!44023 () Bool)

(declare-fun tp!83525 () Bool)

(assert (=> mapNonEmpty!44023 (= mapRes!44023 (and tp!83525 e!638510))))

(declare-fun mapValue!44023 () ValueCell!13359)

(declare-fun mapRest!44023 () (Array (_ BitVec 32) ValueCell!13359))

(declare-fun mapKey!44023 () (_ BitVec 32))

(assert (=> mapNonEmpty!44023 (= (arr!35231 _values!996) (store mapRest!44023 mapKey!44023 mapValue!44023))))

(declare-fun b!1121439 () Bool)

(declare-fun -!1074 (ListLongMap!15697 (_ BitVec 64)) ListLongMap!15697)

(assert (=> b!1121439 (= e!638517 (= call!47104 (-!1074 call!47103 k0!934)))))

(declare-fun b!1121440 () Bool)

(declare-fun e!638511 () Bool)

(assert (=> b!1121440 (= e!638511 (and e!638513 mapRes!44023))))

(declare-fun condMapEmpty!44023 () Bool)

(declare-fun mapDefault!44023 () ValueCell!13359)

(assert (=> b!1121440 (= condMapEmpty!44023 (= (arr!35231 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13359)) mapDefault!44023)))))

(declare-fun b!1121441 () Bool)

(declare-fun res!749186 () Bool)

(assert (=> b!1121441 (=> (not res!749186) (not e!638512))))

(assert (=> b!1121441 (= res!749186 (and (= (size!35767 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35766 _keys!1208) (size!35767 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!44023 () Bool)

(assert (=> mapIsEmpty!44023 mapRes!44023))

(declare-fun b!1121442 () Bool)

(assert (=> b!1121442 (= e!638516 e!638514)))

(declare-fun res!749187 () Bool)

(assert (=> b!1121442 (=> res!749187 e!638514)))

(assert (=> b!1121442 (= res!749187 (not (= from!1455 i!673)))))

(declare-fun lt!498359 () ListLongMap!15697)

(assert (=> b!1121442 (= lt!498359 (getCurrentListMapNoExtraKeys!4353 lt!498357 lt!498354 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun dynLambda!2455 (Int (_ BitVec 64)) V!42643)

(assert (=> b!1121442 (= lt!498354 (array!73158 (store (arr!35231 _values!996) i!673 (ValueCellFull!13359 (dynLambda!2455 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35767 _values!996)))))

(declare-fun lt!498358 () ListLongMap!15697)

(assert (=> b!1121442 (= lt!498358 (getCurrentListMapNoExtraKeys!4353 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121437 () Bool)

(declare-fun res!749180 () Bool)

(assert (=> b!1121437 (=> (not res!749180) (not e!638512))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121437 (= res!749180 (validKeyInArray!0 k0!934))))

(declare-fun res!749182 () Bool)

(assert (=> start!97906 (=> (not res!749182) (not e!638512))))

(assert (=> start!97906 (= res!749182 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35766 _keys!1208))))))

(assert (=> start!97906 e!638512))

(assert (=> start!97906 tp_is_empty!28137))

(declare-fun array_inv!27054 (array!73155) Bool)

(assert (=> start!97906 (array_inv!27054 _keys!1208)))

(assert (=> start!97906 true))

(assert (=> start!97906 tp!83524))

(declare-fun array_inv!27055 (array!73157) Bool)

(assert (=> start!97906 (and (array_inv!27055 _values!996) e!638511)))

(declare-fun b!1121443 () Bool)

(declare-fun res!749188 () Bool)

(assert (=> b!1121443 (=> (not res!749188) (not e!638512))))

(assert (=> b!1121443 (= res!749188 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35766 _keys!1208))))))

(declare-fun b!1121444 () Bool)

(assert (=> b!1121444 (= e!638512 e!638509)))

(declare-fun res!749191 () Bool)

(assert (=> b!1121444 (=> (not res!749191) (not e!638509))))

(assert (=> b!1121444 (= res!749191 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498357 mask!1564))))

(assert (=> b!1121444 (= lt!498357 (array!73156 (store (arr!35230 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35766 _keys!1208)))))

(assert (= (and start!97906 res!749182) b!1121436))

(assert (= (and b!1121436 res!749190) b!1121441))

(assert (= (and b!1121441 res!749186) b!1121428))

(assert (= (and b!1121428 res!749181) b!1121434))

(assert (= (and b!1121434 res!749183) b!1121443))

(assert (= (and b!1121443 res!749188) b!1121437))

(assert (= (and b!1121437 res!749180) b!1121429))

(assert (= (and b!1121429 res!749189) b!1121444))

(assert (= (and b!1121444 res!749191) b!1121432))

(assert (= (and b!1121432 res!749184) b!1121438))

(assert (= (and b!1121438 (not res!749185)) b!1121442))

(assert (= (and b!1121442 (not res!749187)) b!1121430))

(assert (= (and b!1121430 c!109401) b!1121439))

(assert (= (and b!1121430 (not c!109401)) b!1121435))

(assert (= (or b!1121439 b!1121435) bm!47101))

(assert (= (or b!1121439 b!1121435) bm!47100))

(assert (= (and b!1121440 condMapEmpty!44023) mapIsEmpty!44023))

(assert (= (and b!1121440 (not condMapEmpty!44023)) mapNonEmpty!44023))

(get-info :version)

(assert (= (and mapNonEmpty!44023 ((_ is ValueCellFull!13359) mapValue!44023)) b!1121433))

(assert (= (and b!1121440 ((_ is ValueCellFull!13359) mapDefault!44023)) b!1121431))

(assert (= start!97906 b!1121440))

(declare-fun b_lambda!18577 () Bool)

(assert (=> (not b_lambda!18577) (not b!1121442)))

(declare-fun t!35110 () Bool)

(declare-fun tb!8419 () Bool)

(assert (=> (and start!97906 (= defaultEntry!1004 defaultEntry!1004) t!35110) tb!8419))

(declare-fun result!17399 () Bool)

(assert (=> tb!8419 (= result!17399 tp_is_empty!28137)))

(assert (=> b!1121442 t!35110))

(declare-fun b_and!37999 () Bool)

(assert (= b_and!37997 (and (=> t!35110 result!17399) b_and!37999)))

(declare-fun m!1036271 () Bool)

(assert (=> b!1121428 m!1036271))

(declare-fun m!1036273 () Bool)

(assert (=> b!1121430 m!1036273))

(declare-fun m!1036275 () Bool)

(assert (=> b!1121437 m!1036275))

(declare-fun m!1036277 () Bool)

(assert (=> b!1121442 m!1036277))

(declare-fun m!1036279 () Bool)

(assert (=> b!1121442 m!1036279))

(declare-fun m!1036281 () Bool)

(assert (=> b!1121442 m!1036281))

(declare-fun m!1036283 () Bool)

(assert (=> b!1121442 m!1036283))

(declare-fun m!1036285 () Bool)

(assert (=> b!1121444 m!1036285))

(declare-fun m!1036287 () Bool)

(assert (=> b!1121444 m!1036287))

(declare-fun m!1036289 () Bool)

(assert (=> bm!47100 m!1036289))

(declare-fun m!1036291 () Bool)

(assert (=> b!1121429 m!1036291))

(declare-fun m!1036293 () Bool)

(assert (=> bm!47101 m!1036293))

(declare-fun m!1036295 () Bool)

(assert (=> b!1121438 m!1036295))

(declare-fun m!1036297 () Bool)

(assert (=> b!1121438 m!1036297))

(declare-fun m!1036299 () Bool)

(assert (=> b!1121432 m!1036299))

(declare-fun m!1036301 () Bool)

(assert (=> b!1121439 m!1036301))

(declare-fun m!1036303 () Bool)

(assert (=> mapNonEmpty!44023 m!1036303))

(declare-fun m!1036305 () Bool)

(assert (=> b!1121434 m!1036305))

(declare-fun m!1036307 () Bool)

(assert (=> start!97906 m!1036307))

(declare-fun m!1036309 () Bool)

(assert (=> start!97906 m!1036309))

(declare-fun m!1036311 () Bool)

(assert (=> b!1121436 m!1036311))

(check-sat (not start!97906) (not b!1121432) (not mapNonEmpty!44023) (not b!1121434) (not b!1121437) (not bm!47100) (not b!1121438) (not b!1121439) (not b_lambda!18577) (not b!1121436) (not b!1121430) b_and!37999 (not b!1121442) (not b!1121444) (not b!1121428) (not bm!47101) tp_is_empty!28137 (not b_next!23607))
(check-sat b_and!37999 (not b_next!23607))
