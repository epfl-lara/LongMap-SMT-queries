; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73602 () Bool)

(assert start!73602)

(declare-fun b_free!14517 () Bool)

(declare-fun b_next!14517 () Bool)

(assert (=> start!73602 (= b_free!14517 (not b_next!14517))))

(declare-fun tp!51054 () Bool)

(declare-fun b_and!24013 () Bool)

(assert (=> start!73602 (= tp!51054 b_and!24013)))

(declare-fun b!861233 () Bool)

(declare-fun res!585290 () Bool)

(declare-fun e!479865 () Bool)

(assert (=> b!861233 (=> (not res!585290) (not e!479865))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!861233 (= res!585290 (validKeyInArray!0 k0!854))))

(declare-fun b!861234 () Bool)

(declare-fun e!479864 () Bool)

(assert (=> b!861234 (= e!479865 e!479864)))

(declare-fun res!585293 () Bool)

(assert (=> b!861234 (=> (not res!585293) (not e!479864))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!861234 (= res!585293 (and (not (= from!1053 i!612)) (bvslt from!1053 i!612)))))

(declare-datatypes ((V!27251 0))(
  ( (V!27252 (val!8374 Int)) )
))
(declare-datatypes ((tuple2!11066 0))(
  ( (tuple2!11067 (_1!5544 (_ BitVec 64)) (_2!5544 V!27251)) )
))
(declare-datatypes ((List!16876 0))(
  ( (Nil!16873) (Cons!16872 (h!18003 tuple2!11066) (t!23659 List!16876)) )
))
(declare-datatypes ((ListLongMap!9835 0))(
  ( (ListLongMap!9836 (toList!4933 List!16876)) )
))
(declare-fun lt!388347 () ListLongMap!9835)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7887 0))(
  ( (ValueCellFull!7887 (v!10799 V!27251)) (EmptyCell!7887) )
))
(declare-datatypes ((array!49474 0))(
  ( (array!49475 (arr!23768 (Array (_ BitVec 32) ValueCell!7887)) (size!24208 (_ BitVec 32))) )
))
(declare-fun lt!388350 () array!49474)

(declare-datatypes ((array!49476 0))(
  ( (array!49477 (arr!23769 (Array (_ BitVec 32) (_ BitVec 64))) (size!24209 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!49476)

(declare-fun minValue!654 () V!27251)

(declare-fun zeroValue!654 () V!27251)

(declare-fun getCurrentListMapNoExtraKeys!2910 (array!49476 array!49474 (_ BitVec 32) (_ BitVec 32) V!27251 V!27251 (_ BitVec 32) Int) ListLongMap!9835)

(assert (=> b!861234 (= lt!388347 (getCurrentListMapNoExtraKeys!2910 _keys!868 lt!388350 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!27251)

(declare-fun _values!688 () array!49474)

(assert (=> b!861234 (= lt!388350 (array!49475 (store (arr!23768 _values!688) i!612 (ValueCellFull!7887 v!557)) (size!24208 _values!688)))))

(declare-fun lt!388353 () ListLongMap!9835)

(assert (=> b!861234 (= lt!388353 (getCurrentListMapNoExtraKeys!2910 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!585292 () Bool)

(assert (=> start!73602 (=> (not res!585292) (not e!479865))))

(assert (=> start!73602 (= res!585292 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!24209 _keys!868))))))

(assert (=> start!73602 e!479865))

(declare-fun tp_is_empty!16653 () Bool)

(assert (=> start!73602 tp_is_empty!16653))

(assert (=> start!73602 true))

(assert (=> start!73602 tp!51054))

(declare-fun array_inv!18812 (array!49476) Bool)

(assert (=> start!73602 (array_inv!18812 _keys!868)))

(declare-fun e!479866 () Bool)

(declare-fun array_inv!18813 (array!49474) Bool)

(assert (=> start!73602 (and (array_inv!18813 _values!688) e!479866)))

(declare-fun b!861235 () Bool)

(declare-fun res!585289 () Bool)

(assert (=> b!861235 (=> (not res!585289) (not e!479865))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!49476 (_ BitVec 32)) Bool)

(assert (=> b!861235 (= res!585289 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!861236 () Bool)

(declare-fun e!479863 () Bool)

(assert (=> b!861236 (= e!479864 (not e!479863))))

(declare-fun res!585295 () Bool)

(assert (=> b!861236 (=> res!585295 e!479863)))

(assert (=> b!861236 (= res!585295 (not (validKeyInArray!0 (select (arr!23769 _keys!868) from!1053))))))

(declare-fun lt!388357 () ListLongMap!9835)

(declare-fun lt!388349 () ListLongMap!9835)

(assert (=> b!861236 (= lt!388357 lt!388349)))

(declare-fun lt!388351 () ListLongMap!9835)

(declare-fun +!2284 (ListLongMap!9835 tuple2!11066) ListLongMap!9835)

(assert (=> b!861236 (= lt!388349 (+!2284 lt!388351 (tuple2!11067 k0!854 v!557)))))

(assert (=> b!861236 (= lt!388357 (getCurrentListMapNoExtraKeys!2910 _keys!868 lt!388350 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (=> b!861236 (= lt!388351 (getCurrentListMapNoExtraKeys!2910 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-datatypes ((Unit!29370 0))(
  ( (Unit!29371) )
))
(declare-fun lt!388348 () Unit!29370)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!496 (array!49476 array!49474 (_ BitVec 32) (_ BitVec 32) V!27251 V!27251 (_ BitVec 32) (_ BitVec 64) V!27251 (_ BitVec 32) Int) Unit!29370)

(assert (=> b!861236 (= lt!388348 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!496 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!861237 () Bool)

(assert (=> b!861237 (= e!479863 true)))

(assert (=> b!861237 (not (= (select (arr!23769 _keys!868) from!1053) k0!854))))

(declare-fun lt!388355 () Unit!29370)

(declare-fun e!479862 () Unit!29370)

(assert (=> b!861237 (= lt!388355 e!479862)))

(declare-fun c!91996 () Bool)

(assert (=> b!861237 (= c!91996 (= (select (arr!23769 _keys!868) from!1053) k0!854))))

(declare-fun get!12536 (ValueCell!7887 V!27251) V!27251)

(declare-fun dynLambda!1120 (Int (_ BitVec 64)) V!27251)

(assert (=> b!861237 (= lt!388347 (+!2284 lt!388349 (tuple2!11067 (select (arr!23769 _keys!868) from!1053) (get!12536 (select (arr!23768 _values!688) from!1053) (dynLambda!1120 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!861238 () Bool)

(declare-fun e!479867 () Bool)

(assert (=> b!861238 (= e!479867 tp_is_empty!16653)))

(declare-fun b!861239 () Bool)

(declare-fun res!585291 () Bool)

(assert (=> b!861239 (=> (not res!585291) (not e!479865))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!861239 (= res!585291 (validMask!0 mask!1196))))

(declare-fun b!861240 () Bool)

(declare-fun res!585296 () Bool)

(assert (=> b!861240 (=> (not res!585296) (not e!479865))))

(assert (=> b!861240 (= res!585296 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!24209 _keys!868))))))

(declare-fun b!861241 () Bool)

(declare-fun Unit!29372 () Unit!29370)

(assert (=> b!861241 (= e!479862 Unit!29372)))

(declare-fun b!861242 () Bool)

(declare-fun res!585288 () Bool)

(assert (=> b!861242 (=> (not res!585288) (not e!479865))))

(declare-datatypes ((List!16877 0))(
  ( (Nil!16874) (Cons!16873 (h!18004 (_ BitVec 64)) (t!23660 List!16877)) )
))
(declare-fun arrayNoDuplicates!0 (array!49476 (_ BitVec 32) List!16877) Bool)

(assert (=> b!861242 (= res!585288 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16874))))

(declare-fun b!861243 () Bool)

(declare-fun e!479868 () Bool)

(assert (=> b!861243 (= e!479868 tp_is_empty!16653)))

(declare-fun b!861244 () Bool)

(declare-fun res!585287 () Bool)

(assert (=> b!861244 (=> (not res!585287) (not e!479865))))

(assert (=> b!861244 (= res!585287 (and (= (select (arr!23769 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!26579 () Bool)

(declare-fun mapRes!26579 () Bool)

(declare-fun tp!51055 () Bool)

(assert (=> mapNonEmpty!26579 (= mapRes!26579 (and tp!51055 e!479867))))

(declare-fun mapRest!26579 () (Array (_ BitVec 32) ValueCell!7887))

(declare-fun mapValue!26579 () ValueCell!7887)

(declare-fun mapKey!26579 () (_ BitVec 32))

(assert (=> mapNonEmpty!26579 (= (arr!23768 _values!688) (store mapRest!26579 mapKey!26579 mapValue!26579))))

(declare-fun b!861245 () Bool)

(declare-fun res!585294 () Bool)

(assert (=> b!861245 (=> (not res!585294) (not e!479865))))

(assert (=> b!861245 (= res!585294 (and (= (size!24208 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!24209 _keys!868) (size!24208 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!861246 () Bool)

(assert (=> b!861246 (= e!479866 (and e!479868 mapRes!26579))))

(declare-fun condMapEmpty!26579 () Bool)

(declare-fun mapDefault!26579 () ValueCell!7887)

(assert (=> b!861246 (= condMapEmpty!26579 (= (arr!23768 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7887)) mapDefault!26579)))))

(declare-fun mapIsEmpty!26579 () Bool)

(assert (=> mapIsEmpty!26579 mapRes!26579))

(declare-fun b!861247 () Bool)

(declare-fun Unit!29373 () Unit!29370)

(assert (=> b!861247 (= e!479862 Unit!29373)))

(declare-fun lt!388352 () Unit!29370)

(declare-fun lemmaNoDuplicateFromThenFromBigger!0 (array!49476 (_ BitVec 32) (_ BitVec 32)) Unit!29370)

(assert (=> b!861247 (= lt!388352 (lemmaNoDuplicateFromThenFromBigger!0 _keys!868 #b00000000000000000000000000000000 from!1053))))

(assert (=> b!861247 (arrayNoDuplicates!0 _keys!868 from!1053 Nil!16874)))

(declare-fun lt!388356 () Unit!29370)

(declare-fun lemmaArrayContainsFromImpliesContainsFromSmaller!0 (array!49476 (_ BitVec 64) (_ BitVec 32) (_ BitVec 32)) Unit!29370)

(assert (=> b!861247 (= lt!388356 (lemmaArrayContainsFromImpliesContainsFromSmaller!0 _keys!868 k0!854 i!612 (bvadd #b00000000000000000000000000000001 from!1053)))))

(declare-fun arrayContainsKey!0 (array!49476 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!861247 (arrayContainsKey!0 _keys!868 k0!854 (bvadd #b00000000000000000000000000000001 from!1053))))

(declare-fun lt!388354 () Unit!29370)

(declare-fun lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 (array!49476 (_ BitVec 64) (_ BitVec 32) List!16877) Unit!29370)

(assert (=> b!861247 (= lt!388354 (lemmaArrayNoDuplicateThenKeysContainedNotEqual!0 _keys!868 k0!854 from!1053 Nil!16874))))

(assert (=> b!861247 false))

(assert (= (and start!73602 res!585292) b!861239))

(assert (= (and b!861239 res!585291) b!861245))

(assert (= (and b!861245 res!585294) b!861235))

(assert (= (and b!861235 res!585289) b!861242))

(assert (= (and b!861242 res!585288) b!861240))

(assert (= (and b!861240 res!585296) b!861233))

(assert (= (and b!861233 res!585290) b!861244))

(assert (= (and b!861244 res!585287) b!861234))

(assert (= (and b!861234 res!585293) b!861236))

(assert (= (and b!861236 (not res!585295)) b!861237))

(assert (= (and b!861237 c!91996) b!861247))

(assert (= (and b!861237 (not c!91996)) b!861241))

(assert (= (and b!861246 condMapEmpty!26579) mapIsEmpty!26579))

(assert (= (and b!861246 (not condMapEmpty!26579)) mapNonEmpty!26579))

(get-info :version)

(assert (= (and mapNonEmpty!26579 ((_ is ValueCellFull!7887) mapValue!26579)) b!861238))

(assert (= (and b!861246 ((_ is ValueCellFull!7887) mapDefault!26579)) b!861243))

(assert (= start!73602 b!861246))

(declare-fun b_lambda!11869 () Bool)

(assert (=> (not b_lambda!11869) (not b!861237)))

(declare-fun t!23658 () Bool)

(declare-fun tb!4639 () Bool)

(assert (=> (and start!73602 (= defaultEntry!696 defaultEntry!696) t!23658) tb!4639))

(declare-fun result!8889 () Bool)

(assert (=> tb!4639 (= result!8889 tp_is_empty!16653)))

(assert (=> b!861237 t!23658))

(declare-fun b_and!24015 () Bool)

(assert (= b_and!24013 (and (=> t!23658 result!8889) b_and!24015)))

(declare-fun m!802113 () Bool)

(assert (=> mapNonEmpty!26579 m!802113))

(declare-fun m!802115 () Bool)

(assert (=> b!861237 m!802115))

(declare-fun m!802117 () Bool)

(assert (=> b!861237 m!802117))

(declare-fun m!802119 () Bool)

(assert (=> b!861237 m!802119))

(declare-fun m!802121 () Bool)

(assert (=> b!861237 m!802121))

(assert (=> b!861237 m!802117))

(declare-fun m!802123 () Bool)

(assert (=> b!861237 m!802123))

(assert (=> b!861237 m!802119))

(declare-fun m!802125 () Bool)

(assert (=> b!861233 m!802125))

(declare-fun m!802127 () Bool)

(assert (=> start!73602 m!802127))

(declare-fun m!802129 () Bool)

(assert (=> start!73602 m!802129))

(declare-fun m!802131 () Bool)

(assert (=> b!861239 m!802131))

(declare-fun m!802133 () Bool)

(assert (=> b!861235 m!802133))

(declare-fun m!802135 () Bool)

(assert (=> b!861234 m!802135))

(declare-fun m!802137 () Bool)

(assert (=> b!861234 m!802137))

(declare-fun m!802139 () Bool)

(assert (=> b!861234 m!802139))

(declare-fun m!802141 () Bool)

(assert (=> b!861236 m!802141))

(assert (=> b!861236 m!802123))

(assert (=> b!861236 m!802123))

(declare-fun m!802143 () Bool)

(assert (=> b!861236 m!802143))

(declare-fun m!802145 () Bool)

(assert (=> b!861236 m!802145))

(declare-fun m!802147 () Bool)

(assert (=> b!861236 m!802147))

(declare-fun m!802149 () Bool)

(assert (=> b!861236 m!802149))

(declare-fun m!802151 () Bool)

(assert (=> b!861242 m!802151))

(declare-fun m!802153 () Bool)

(assert (=> b!861247 m!802153))

(declare-fun m!802155 () Bool)

(assert (=> b!861247 m!802155))

(declare-fun m!802157 () Bool)

(assert (=> b!861247 m!802157))

(declare-fun m!802159 () Bool)

(assert (=> b!861247 m!802159))

(declare-fun m!802161 () Bool)

(assert (=> b!861247 m!802161))

(declare-fun m!802163 () Bool)

(assert (=> b!861244 m!802163))

(check-sat (not b!861237) (not b!861236) (not b_next!14517) (not b!861247) (not start!73602) (not mapNonEmpty!26579) (not b!861242) tp_is_empty!16653 (not b!861235) (not b!861239) b_and!24015 (not b!861233) (not b!861234) (not b_lambda!11869))
(check-sat b_and!24015 (not b_next!14517))
