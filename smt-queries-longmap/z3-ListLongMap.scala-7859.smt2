; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!97900 () Bool)

(assert start!97900)

(declare-fun b_free!23601 () Bool)

(declare-fun b_next!23601 () Bool)

(assert (=> start!97900 (= b_free!23601 (not b_next!23601))))

(declare-fun tp!83506 () Bool)

(declare-fun b_and!37985 () Bool)

(assert (=> start!97900 (= tp!83506 b_and!37985)))

(declare-fun b!1121269 () Bool)

(declare-fun res!749081 () Bool)

(declare-fun e!638428 () Bool)

(assert (=> b!1121269 (=> (not res!749081) (not e!638428))))

(declare-datatypes ((array!73143 0))(
  ( (array!73144 (arr!35224 (Array (_ BitVec 32) (_ BitVec 64))) (size!35760 (_ BitVec 32))) )
))
(declare-fun _keys!1208 () array!73143)

(declare-fun mask!1564 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!73143 (_ BitVec 32)) Bool)

(assert (=> b!1121269 (= res!749081 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1208 mask!1564))))

(declare-fun b!1121271 () Bool)

(declare-fun e!638433 () Bool)

(declare-fun tp_is_empty!28131 () Bool)

(assert (=> b!1121271 (= e!638433 tp_is_empty!28131)))

(declare-fun b!1121272 () Bool)

(declare-fun e!638432 () Bool)

(declare-datatypes ((V!42635 0))(
  ( (V!42636 (val!14122 Int)) )
))
(declare-datatypes ((tuple2!17724 0))(
  ( (tuple2!17725 (_1!8873 (_ BitVec 64)) (_2!8873 V!42635)) )
))
(declare-datatypes ((List!24509 0))(
  ( (Nil!24506) (Cons!24505 (h!25714 tuple2!17724) (t!35102 List!24509)) )
))
(declare-datatypes ((ListLongMap!15693 0))(
  ( (ListLongMap!15694 (toList!7862 List!24509)) )
))
(declare-fun call!47085 () ListLongMap!15693)

(declare-fun call!47086 () ListLongMap!15693)

(assert (=> b!1121272 (= e!638432 (= call!47085 call!47086))))

(declare-fun mapIsEmpty!44014 () Bool)

(declare-fun mapRes!44014 () Bool)

(assert (=> mapIsEmpty!44014 mapRes!44014))

(declare-fun b!1121273 () Bool)

(declare-fun res!749080 () Bool)

(assert (=> b!1121273 (=> (not res!749080) (not e!638428))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!1121273 (= res!749080 (validMask!0 mask!1564))))

(declare-fun b!1121274 () Bool)

(declare-fun res!749079 () Bool)

(declare-fun e!638434 () Bool)

(assert (=> b!1121274 (=> (not res!749079) (not e!638434))))

(declare-fun lt!498304 () array!73143)

(declare-datatypes ((List!24510 0))(
  ( (Nil!24507) (Cons!24506 (h!25715 (_ BitVec 64)) (t!35103 List!24510)) )
))
(declare-fun arrayNoDuplicates!0 (array!73143 (_ BitVec 32) List!24510) Bool)

(assert (=> b!1121274 (= res!749079 (arrayNoDuplicates!0 lt!498304 #b00000000000000000000000000000000 Nil!24507))))

(declare-fun b!1121275 () Bool)

(declare-fun res!749078 () Bool)

(assert (=> b!1121275 (=> (not res!749078) (not e!638428))))

(declare-fun i!673 () (_ BitVec 32))

(declare-fun k0!934 () (_ BitVec 64))

(assert (=> b!1121275 (= res!749078 (= (select (arr!35224 _keys!1208) i!673) k0!934))))

(declare-fun b!1121276 () Bool)

(declare-fun e!638436 () Bool)

(declare-fun e!638429 () Bool)

(assert (=> b!1121276 (= e!638436 e!638429)))

(declare-fun res!749076 () Bool)

(assert (=> b!1121276 (=> res!749076 e!638429)))

(declare-fun from!1455 () (_ BitVec 32))

(assert (=> b!1121276 (= res!749076 (not (= from!1455 i!673)))))

(declare-fun extraKeys!923 () (_ BitVec 32))

(declare-fun defaultEntry!1004 () Int)

(declare-datatypes ((ValueCell!13356 0))(
  ( (ValueCellFull!13356 (v!16755 V!42635)) (EmptyCell!13356) )
))
(declare-datatypes ((array!73145 0))(
  ( (array!73146 (arr!35225 (Array (_ BitVec 32) ValueCell!13356)) (size!35761 (_ BitVec 32))) )
))
(declare-fun lt!498303 () array!73145)

(declare-fun minValue!944 () V!42635)

(declare-fun lt!498300 () ListLongMap!15693)

(declare-fun zeroValue!944 () V!42635)

(declare-fun getCurrentListMapNoExtraKeys!4351 (array!73143 array!73145 (_ BitVec 32) (_ BitVec 32) V!42635 V!42635 (_ BitVec 32) Int) ListLongMap!15693)

(assert (=> b!1121276 (= lt!498300 (getCurrentListMapNoExtraKeys!4351 lt!498304 lt!498303 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun _values!996 () array!73145)

(declare-fun dynLambda!2453 (Int (_ BitVec 64)) V!42635)

(assert (=> b!1121276 (= lt!498303 (array!73146 (store (arr!35225 _values!996) i!673 (ValueCellFull!13356 (dynLambda!2453 defaultEntry!1004 #b0000000000000000000000000000000000000000000000000000000000000000))) (size!35761 _values!996)))))

(declare-fun lt!498301 () ListLongMap!15693)

(assert (=> b!1121276 (= lt!498301 (getCurrentListMapNoExtraKeys!4351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 from!1455 defaultEntry!1004))))

(declare-fun b!1121277 () Bool)

(assert (=> b!1121277 (= e!638434 (not e!638436))))

(declare-fun res!749075 () Bool)

(assert (=> b!1121277 (=> res!749075 e!638436)))

(assert (=> b!1121277 (= res!749075 (bvsgt from!1455 i!673))))

(declare-fun arrayContainsKey!0 (array!73143 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1121277 (arrayContainsKey!0 _keys!1208 k0!934 #b00000000000000000000000000000000)))

(declare-datatypes ((Unit!36786 0))(
  ( (Unit!36787) )
))
(declare-fun lt!498305 () Unit!36786)

(declare-fun lemmaArrayContainsFromImpliesContainsFromZero!0 (array!73143 (_ BitVec 64) (_ BitVec 32)) Unit!36786)

(assert (=> b!1121277 (= lt!498305 (lemmaArrayContainsFromImpliesContainsFromZero!0 _keys!1208 k0!934 i!673))))

(declare-fun b!1121278 () Bool)

(assert (=> b!1121278 (= e!638428 e!638434)))

(declare-fun res!749083 () Bool)

(assert (=> b!1121278 (=> (not res!749083) (not e!638434))))

(assert (=> b!1121278 (= res!749083 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!498304 mask!1564))))

(assert (=> b!1121278 (= lt!498304 (array!73144 (store (arr!35224 _keys!1208) i!673 #b1000000000000000000000000000000000000000000000000000000000000000) (size!35760 _keys!1208)))))

(declare-fun bm!47082 () Bool)

(assert (=> bm!47082 (= call!47085 (getCurrentListMapNoExtraKeys!4351 lt!498304 lt!498303 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121279 () Bool)

(declare-fun -!1073 (ListLongMap!15693 (_ BitVec 64)) ListLongMap!15693)

(assert (=> b!1121279 (= e!638432 (= call!47085 (-!1073 call!47086 k0!934)))))

(declare-fun b!1121280 () Bool)

(declare-fun res!749073 () Bool)

(assert (=> b!1121280 (=> (not res!749073) (not e!638428))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1121280 (= res!749073 (validKeyInArray!0 k0!934))))

(declare-fun b!1121281 () Bool)

(declare-fun e!638435 () Bool)

(assert (=> b!1121281 (= e!638435 tp_is_empty!28131)))

(declare-fun mapNonEmpty!44014 () Bool)

(declare-fun tp!83507 () Bool)

(assert (=> mapNonEmpty!44014 (= mapRes!44014 (and tp!83507 e!638435))))

(declare-fun mapValue!44014 () ValueCell!13356)

(declare-fun mapRest!44014 () (Array (_ BitVec 32) ValueCell!13356))

(declare-fun mapKey!44014 () (_ BitVec 32))

(assert (=> mapNonEmpty!44014 (= (arr!35225 _values!996) (store mapRest!44014 mapKey!44014 mapValue!44014))))

(declare-fun b!1121282 () Bool)

(declare-fun res!749077 () Bool)

(assert (=> b!1121282 (=> (not res!749077) (not e!638428))))

(assert (=> b!1121282 (= res!749077 (and (bvsge i!673 #b00000000000000000000000000000000) (bvslt i!673 (size!35760 _keys!1208))))))

(declare-fun b!1121270 () Bool)

(declare-fun res!749082 () Bool)

(assert (=> b!1121270 (=> (not res!749082) (not e!638428))))

(assert (=> b!1121270 (= res!749082 (arrayNoDuplicates!0 _keys!1208 #b00000000000000000000000000000000 Nil!24507))))

(declare-fun res!749072 () Bool)

(assert (=> start!97900 (=> (not res!749072) (not e!638428))))

(assert (=> start!97900 (= res!749072 (and (bvsge from!1455 #b00000000000000000000000000000000) (bvsle from!1455 (size!35760 _keys!1208))))))

(assert (=> start!97900 e!638428))

(assert (=> start!97900 tp_is_empty!28131))

(declare-fun array_inv!27052 (array!73143) Bool)

(assert (=> start!97900 (array_inv!27052 _keys!1208)))

(assert (=> start!97900 true))

(assert (=> start!97900 tp!83506))

(declare-fun e!638430 () Bool)

(declare-fun array_inv!27053 (array!73145) Bool)

(assert (=> start!97900 (and (array_inv!27053 _values!996) e!638430)))

(declare-fun bm!47083 () Bool)

(assert (=> bm!47083 (= call!47086 (getCurrentListMapNoExtraKeys!4351 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121283 () Bool)

(assert (=> b!1121283 (= e!638430 (and e!638433 mapRes!44014))))

(declare-fun condMapEmpty!44014 () Bool)

(declare-fun mapDefault!44014 () ValueCell!13356)

(assert (=> b!1121283 (= condMapEmpty!44014 (= (arr!35225 _values!996) ((as const (Array (_ BitVec 32) ValueCell!13356)) mapDefault!44014)))))

(declare-fun b!1121284 () Bool)

(assert (=> b!1121284 (= e!638429 true)))

(assert (=> b!1121284 e!638432))

(declare-fun c!109392 () Bool)

(assert (=> b!1121284 (= c!109392 (bvsle (bvadd #b00000000000000000000000000000001 from!1455) i!673))))

(declare-fun lt!498302 () Unit!36786)

(declare-fun lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!322 (array!73143 array!73145 (_ BitVec 32) (_ BitVec 32) V!42635 V!42635 (_ BitVec 32) (_ BitVec 64) (_ BitVec 32) Int) Unit!36786)

(assert (=> b!1121284 (= lt!498302 (lemmaRemoveValidKeyFromArrayThenMapNoExtrasRemoveKey!322 _keys!1208 _values!996 mask!1564 extraKeys!923 zeroValue!944 minValue!944 i!673 k0!934 (bvadd #b00000000000000000000000000000001 from!1455) defaultEntry!1004))))

(declare-fun b!1121285 () Bool)

(declare-fun res!749074 () Bool)

(assert (=> b!1121285 (=> (not res!749074) (not e!638428))))

(assert (=> b!1121285 (= res!749074 (and (= (size!35761 _values!996) (bvadd #b00000000000000000000000000000001 mask!1564)) (= (size!35760 _keys!1208) (size!35761 _values!996)) (bvsge mask!1564 #b00000000000000000000000000000000) (bvsge extraKeys!923 #b00000000000000000000000000000000) (bvsle extraKeys!923 #b00000000000000000000000000000011)))))

(assert (= (and start!97900 res!749072) b!1121273))

(assert (= (and b!1121273 res!749080) b!1121285))

(assert (= (and b!1121285 res!749074) b!1121269))

(assert (= (and b!1121269 res!749081) b!1121270))

(assert (= (and b!1121270 res!749082) b!1121282))

(assert (= (and b!1121282 res!749077) b!1121280))

(assert (= (and b!1121280 res!749073) b!1121275))

(assert (= (and b!1121275 res!749078) b!1121278))

(assert (= (and b!1121278 res!749083) b!1121274))

(assert (= (and b!1121274 res!749079) b!1121277))

(assert (= (and b!1121277 (not res!749075)) b!1121276))

(assert (= (and b!1121276 (not res!749076)) b!1121284))

(assert (= (and b!1121284 c!109392) b!1121279))

(assert (= (and b!1121284 (not c!109392)) b!1121272))

(assert (= (or b!1121279 b!1121272) bm!47082))

(assert (= (or b!1121279 b!1121272) bm!47083))

(assert (= (and b!1121283 condMapEmpty!44014) mapIsEmpty!44014))

(assert (= (and b!1121283 (not condMapEmpty!44014)) mapNonEmpty!44014))

(get-info :version)

(assert (= (and mapNonEmpty!44014 ((_ is ValueCellFull!13356) mapValue!44014)) b!1121281))

(assert (= (and b!1121283 ((_ is ValueCellFull!13356) mapDefault!44014)) b!1121271))

(assert (= start!97900 b!1121283))

(declare-fun b_lambda!18571 () Bool)

(assert (=> (not b_lambda!18571) (not b!1121276)))

(declare-fun t!35101 () Bool)

(declare-fun tb!8413 () Bool)

(assert (=> (and start!97900 (= defaultEntry!1004 defaultEntry!1004) t!35101) tb!8413))

(declare-fun result!17387 () Bool)

(assert (=> tb!8413 (= result!17387 tp_is_empty!28131)))

(assert (=> b!1121276 t!35101))

(declare-fun b_and!37987 () Bool)

(assert (= b_and!37985 (and (=> t!35101 result!17387) b_and!37987)))

(declare-fun m!1036145 () Bool)

(assert (=> b!1121279 m!1036145))

(declare-fun m!1036147 () Bool)

(assert (=> b!1121278 m!1036147))

(declare-fun m!1036149 () Bool)

(assert (=> b!1121278 m!1036149))

(declare-fun m!1036151 () Bool)

(assert (=> b!1121275 m!1036151))

(declare-fun m!1036153 () Bool)

(assert (=> mapNonEmpty!44014 m!1036153))

(declare-fun m!1036155 () Bool)

(assert (=> bm!47083 m!1036155))

(declare-fun m!1036157 () Bool)

(assert (=> b!1121277 m!1036157))

(declare-fun m!1036159 () Bool)

(assert (=> b!1121277 m!1036159))

(declare-fun m!1036161 () Bool)

(assert (=> b!1121270 m!1036161))

(declare-fun m!1036163 () Bool)

(assert (=> b!1121276 m!1036163))

(declare-fun m!1036165 () Bool)

(assert (=> b!1121276 m!1036165))

(declare-fun m!1036167 () Bool)

(assert (=> b!1121276 m!1036167))

(declare-fun m!1036169 () Bool)

(assert (=> b!1121276 m!1036169))

(declare-fun m!1036171 () Bool)

(assert (=> b!1121269 m!1036171))

(declare-fun m!1036173 () Bool)

(assert (=> bm!47082 m!1036173))

(declare-fun m!1036175 () Bool)

(assert (=> b!1121280 m!1036175))

(declare-fun m!1036177 () Bool)

(assert (=> b!1121274 m!1036177))

(declare-fun m!1036179 () Bool)

(assert (=> b!1121273 m!1036179))

(declare-fun m!1036181 () Bool)

(assert (=> start!97900 m!1036181))

(declare-fun m!1036183 () Bool)

(assert (=> start!97900 m!1036183))

(declare-fun m!1036185 () Bool)

(assert (=> b!1121284 m!1036185))

(check-sat (not b!1121279) (not b!1121274) (not b!1121280) (not b!1121273) (not b!1121278) (not b!1121284) (not b_next!23601) (not b!1121276) b_and!37987 (not mapNonEmpty!44014) (not b!1121270) (not b!1121277) (not b!1121269) (not bm!47082) (not b_lambda!18571) tp_is_empty!28131 (not start!97900) (not bm!47083))
(check-sat b_and!37987 (not b_next!23601))
