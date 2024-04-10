; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73134 () Bool)

(assert start!73134)

(declare-fun b_free!14049 () Bool)

(declare-fun b_next!14049 () Bool)

(assert (=> start!73134 (= b_free!14049 (not b_next!14049))))

(declare-fun tp!49651 () Bool)

(declare-fun b_and!23257 () Bool)

(assert (=> start!73134 (= tp!49651 b_and!23257)))

(declare-fun res!578258 () Bool)

(declare-fun e!474850 () Bool)

(assert (=> start!73134 (=> (not res!578258) (not e!474850))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((array!48572 0))(
  ( (array!48573 (arr!23317 (Array (_ BitVec 32) (_ BitVec 64))) (size!23757 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48572)

(assert (=> start!73134 (= res!578258 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23757 _keys!868))))))

(assert (=> start!73134 e!474850))

(declare-fun tp_is_empty!16185 () Bool)

(assert (=> start!73134 tp_is_empty!16185))

(assert (=> start!73134 true))

(assert (=> start!73134 tp!49651))

(declare-fun array_inv!18500 (array!48572) Bool)

(assert (=> start!73134 (array_inv!18500 _keys!868)))

(declare-datatypes ((V!26627 0))(
  ( (V!26628 (val!8140 Int)) )
))
(declare-datatypes ((ValueCell!7653 0))(
  ( (ValueCellFull!7653 (v!10565 V!26627)) (EmptyCell!7653) )
))
(declare-datatypes ((array!48574 0))(
  ( (array!48575 (arr!23318 (Array (_ BitVec 32) ValueCell!7653)) (size!23758 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48574)

(declare-fun e!474852 () Bool)

(declare-fun array_inv!18501 (array!48574) Bool)

(assert (=> start!73134 (and (array_inv!18501 _values!688) e!474852)))

(declare-fun b!851306 () Bool)

(declare-fun e!474851 () Bool)

(assert (=> b!851306 (= e!474851 true)))

(declare-fun lt!383382 () V!26627)

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((tuple2!10680 0))(
  ( (tuple2!10681 (_1!5351 (_ BitVec 64)) (_2!5351 V!26627)) )
))
(declare-fun lt!383376 () tuple2!10680)

(declare-datatypes ((List!16518 0))(
  ( (Nil!16515) (Cons!16514 (h!17645 tuple2!10680) (t!23013 List!16518)) )
))
(declare-datatypes ((ListLongMap!9449 0))(
  ( (ListLongMap!9450 (toList!4740 List!16518)) )
))
(declare-fun lt!383380 () ListLongMap!9449)

(declare-fun +!2140 (ListLongMap!9449 tuple2!10680) ListLongMap!9449)

(assert (=> b!851306 (= (+!2140 lt!383380 lt!383376) (+!2140 (+!2140 lt!383380 (tuple2!10681 k0!854 lt!383382)) lt!383376))))

(declare-fun lt!383374 () V!26627)

(assert (=> b!851306 (= lt!383376 (tuple2!10681 k0!854 lt!383374))))

(declare-datatypes ((Unit!29071 0))(
  ( (Unit!29072) )
))
(declare-fun lt!383378 () Unit!29071)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!273 (ListLongMap!9449 (_ BitVec 64) V!26627 V!26627) Unit!29071)

(assert (=> b!851306 (= lt!383378 (addSameAsAddTwiceSameKeyDiffValues!273 lt!383380 k0!854 lt!383382 lt!383374))))

(declare-fun lt!383375 () V!26627)

(declare-fun get!12287 (ValueCell!7653 V!26627) V!26627)

(assert (=> b!851306 (= lt!383382 (get!12287 (select (arr!23318 _values!688) from!1053) lt!383375))))

(declare-fun lt!383381 () ListLongMap!9449)

(assert (=> b!851306 (= lt!383381 (+!2140 lt!383380 (tuple2!10681 (select (arr!23317 _keys!868) from!1053) lt!383374)))))

(declare-fun v!557 () V!26627)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851306 (= lt!383374 (get!12287 (select (store (arr!23318 _values!688) i!612 (ValueCellFull!7653 v!557)) from!1053) lt!383375))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1027 (Int (_ BitVec 64)) V!26627)

(assert (=> b!851306 (= lt!383375 (dynLambda!1027 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun lt!383383 () array!48574)

(declare-fun minValue!654 () V!26627)

(declare-fun zeroValue!654 () V!26627)

(declare-fun getCurrentListMapNoExtraKeys!2722 (array!48572 array!48574 (_ BitVec 32) (_ BitVec 32) V!26627 V!26627 (_ BitVec 32) Int) ListLongMap!9449)

(assert (=> b!851306 (= lt!383380 (getCurrentListMapNoExtraKeys!2722 _keys!868 lt!383383 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851307 () Bool)

(declare-fun e!474854 () Bool)

(assert (=> b!851307 (= e!474854 tp_is_empty!16185)))

(declare-fun mapNonEmpty!25877 () Bool)

(declare-fun mapRes!25877 () Bool)

(declare-fun tp!49650 () Bool)

(declare-fun e!474856 () Bool)

(assert (=> mapNonEmpty!25877 (= mapRes!25877 (and tp!49650 e!474856))))

(declare-fun mapRest!25877 () (Array (_ BitVec 32) ValueCell!7653))

(declare-fun mapValue!25877 () ValueCell!7653)

(declare-fun mapKey!25877 () (_ BitVec 32))

(assert (=> mapNonEmpty!25877 (= (arr!23318 _values!688) (store mapRest!25877 mapKey!25877 mapValue!25877))))

(declare-fun bm!37999 () Bool)

(declare-fun call!38002 () ListLongMap!9449)

(declare-fun c!91744 () Bool)

(assert (=> bm!37999 (= call!38002 (getCurrentListMapNoExtraKeys!2722 _keys!868 (ite c!91744 _values!688 lt!383383) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851308 () Bool)

(assert (=> b!851308 (= e!474852 (and e!474854 mapRes!25877))))

(declare-fun condMapEmpty!25877 () Bool)

(declare-fun mapDefault!25877 () ValueCell!7653)

(assert (=> b!851308 (= condMapEmpty!25877 (= (arr!23318 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7653)) mapDefault!25877)))))

(declare-fun b!851309 () Bool)

(declare-fun e!474855 () Bool)

(assert (=> b!851309 (= e!474855 (not e!474851))))

(declare-fun res!578267 () Bool)

(assert (=> b!851309 (=> res!578267 e!474851)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851309 (= res!578267 (not (validKeyInArray!0 (select (arr!23317 _keys!868) from!1053))))))

(declare-fun e!474853 () Bool)

(assert (=> b!851309 e!474853))

(assert (=> b!851309 (= c!91744 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383377 () Unit!29071)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!377 (array!48572 array!48574 (_ BitVec 32) (_ BitVec 32) V!26627 V!26627 (_ BitVec 32) (_ BitVec 64) V!26627 (_ BitVec 32) Int) Unit!29071)

(assert (=> b!851309 (= lt!383377 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!377 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!38000 () Bool)

(declare-fun call!38003 () ListLongMap!9449)

(assert (=> bm!38000 (= call!38003 (getCurrentListMapNoExtraKeys!2722 _keys!868 (ite c!91744 lt!383383 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851310 () Bool)

(declare-fun res!578261 () Bool)

(assert (=> b!851310 (=> (not res!578261) (not e!474850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851310 (= res!578261 (validMask!0 mask!1196))))

(declare-fun b!851311 () Bool)

(declare-fun res!578262 () Bool)

(assert (=> b!851311 (=> (not res!578262) (not e!474850))))

(assert (=> b!851311 (= res!578262 (and (= (size!23758 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23757 _keys!868) (size!23758 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851312 () Bool)

(declare-fun res!578263 () Bool)

(assert (=> b!851312 (=> (not res!578263) (not e!474850))))

(assert (=> b!851312 (= res!578263 (validKeyInArray!0 k0!854))))

(declare-fun b!851313 () Bool)

(assert (=> b!851313 (= e!474853 (= call!38002 call!38003))))

(declare-fun b!851314 () Bool)

(declare-fun res!578259 () Bool)

(assert (=> b!851314 (=> (not res!578259) (not e!474850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48572 (_ BitVec 32)) Bool)

(assert (=> b!851314 (= res!578259 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851315 () Bool)

(assert (=> b!851315 (= e!474850 e!474855)))

(declare-fun res!578266 () Bool)

(assert (=> b!851315 (=> (not res!578266) (not e!474855))))

(assert (=> b!851315 (= res!578266 (= from!1053 i!612))))

(assert (=> b!851315 (= lt!383381 (getCurrentListMapNoExtraKeys!2722 _keys!868 lt!383383 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851315 (= lt!383383 (array!48575 (store (arr!23318 _values!688) i!612 (ValueCellFull!7653 v!557)) (size!23758 _values!688)))))

(declare-fun lt!383379 () ListLongMap!9449)

(assert (=> b!851315 (= lt!383379 (getCurrentListMapNoExtraKeys!2722 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851316 () Bool)

(declare-fun res!578265 () Bool)

(assert (=> b!851316 (=> (not res!578265) (not e!474850))))

(assert (=> b!851316 (= res!578265 (and (= (select (arr!23317 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapIsEmpty!25877 () Bool)

(assert (=> mapIsEmpty!25877 mapRes!25877))

(declare-fun b!851317 () Bool)

(declare-fun res!578260 () Bool)

(assert (=> b!851317 (=> (not res!578260) (not e!474850))))

(declare-datatypes ((List!16519 0))(
  ( (Nil!16516) (Cons!16515 (h!17646 (_ BitVec 64)) (t!23014 List!16519)) )
))
(declare-fun arrayNoDuplicates!0 (array!48572 (_ BitVec 32) List!16519) Bool)

(assert (=> b!851317 (= res!578260 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16516))))

(declare-fun b!851318 () Bool)

(assert (=> b!851318 (= e!474856 tp_is_empty!16185)))

(declare-fun b!851319 () Bool)

(declare-fun res!578264 () Bool)

(assert (=> b!851319 (=> (not res!578264) (not e!474850))))

(assert (=> b!851319 (= res!578264 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23757 _keys!868))))))

(declare-fun b!851320 () Bool)

(assert (=> b!851320 (= e!474853 (= call!38003 (+!2140 call!38002 (tuple2!10681 k0!854 v!557))))))

(assert (= (and start!73134 res!578258) b!851310))

(assert (= (and b!851310 res!578261) b!851311))

(assert (= (and b!851311 res!578262) b!851314))

(assert (= (and b!851314 res!578259) b!851317))

(assert (= (and b!851317 res!578260) b!851319))

(assert (= (and b!851319 res!578264) b!851312))

(assert (= (and b!851312 res!578263) b!851316))

(assert (= (and b!851316 res!578265) b!851315))

(assert (= (and b!851315 res!578266) b!851309))

(assert (= (and b!851309 c!91744) b!851320))

(assert (= (and b!851309 (not c!91744)) b!851313))

(assert (= (or b!851320 b!851313) bm!37999))

(assert (= (or b!851320 b!851313) bm!38000))

(assert (= (and b!851309 (not res!578267)) b!851306))

(assert (= (and b!851308 condMapEmpty!25877) mapIsEmpty!25877))

(assert (= (and b!851308 (not condMapEmpty!25877)) mapNonEmpty!25877))

(get-info :version)

(assert (= (and mapNonEmpty!25877 ((_ is ValueCellFull!7653) mapValue!25877)) b!851318))

(assert (= (and b!851308 ((_ is ValueCellFull!7653) mapDefault!25877)) b!851307))

(assert (= start!73134 b!851308))

(declare-fun b_lambda!11581 () Bool)

(assert (=> (not b_lambda!11581) (not b!851306)))

(declare-fun t!23012 () Bool)

(declare-fun tb!4351 () Bool)

(assert (=> (and start!73134 (= defaultEntry!696 defaultEntry!696) t!23012) tb!4351))

(declare-fun result!8313 () Bool)

(assert (=> tb!4351 (= result!8313 tp_is_empty!16185)))

(assert (=> b!851306 t!23012))

(declare-fun b_and!23259 () Bool)

(assert (= b_and!23257 (and (=> t!23012 result!8313) b_and!23259)))

(declare-fun m!792195 () Bool)

(assert (=> bm!37999 m!792195))

(declare-fun m!792197 () Bool)

(assert (=> b!851309 m!792197))

(assert (=> b!851309 m!792197))

(declare-fun m!792199 () Bool)

(assert (=> b!851309 m!792199))

(declare-fun m!792201 () Bool)

(assert (=> b!851309 m!792201))

(declare-fun m!792203 () Bool)

(assert (=> bm!38000 m!792203))

(declare-fun m!792205 () Bool)

(assert (=> mapNonEmpty!25877 m!792205))

(declare-fun m!792207 () Bool)

(assert (=> b!851317 m!792207))

(declare-fun m!792209 () Bool)

(assert (=> b!851320 m!792209))

(declare-fun m!792211 () Bool)

(assert (=> b!851316 m!792211))

(declare-fun m!792213 () Bool)

(assert (=> b!851315 m!792213))

(declare-fun m!792215 () Bool)

(assert (=> b!851315 m!792215))

(declare-fun m!792217 () Bool)

(assert (=> b!851315 m!792217))

(declare-fun m!792219 () Bool)

(assert (=> b!851306 m!792219))

(declare-fun m!792221 () Bool)

(assert (=> b!851306 m!792221))

(declare-fun m!792223 () Bool)

(assert (=> b!851306 m!792223))

(declare-fun m!792225 () Bool)

(assert (=> b!851306 m!792225))

(declare-fun m!792227 () Bool)

(assert (=> b!851306 m!792227))

(assert (=> b!851306 m!792225))

(declare-fun m!792229 () Bool)

(assert (=> b!851306 m!792229))

(declare-fun m!792231 () Bool)

(assert (=> b!851306 m!792231))

(assert (=> b!851306 m!792221))

(assert (=> b!851306 m!792229))

(declare-fun m!792233 () Bool)

(assert (=> b!851306 m!792233))

(assert (=> b!851306 m!792215))

(assert (=> b!851306 m!792197))

(declare-fun m!792235 () Bool)

(assert (=> b!851306 m!792235))

(declare-fun m!792237 () Bool)

(assert (=> b!851306 m!792237))

(declare-fun m!792239 () Bool)

(assert (=> b!851306 m!792239))

(declare-fun m!792241 () Bool)

(assert (=> start!73134 m!792241))

(declare-fun m!792243 () Bool)

(assert (=> start!73134 m!792243))

(declare-fun m!792245 () Bool)

(assert (=> b!851312 m!792245))

(declare-fun m!792247 () Bool)

(assert (=> b!851314 m!792247))

(declare-fun m!792249 () Bool)

(assert (=> b!851310 m!792249))

(check-sat (not b_lambda!11581) (not b!851314) (not bm!38000) (not bm!37999) (not b!851320) (not b!851310) (not b!851317) (not b!851315) (not b!851306) (not b_next!14049) (not b!851312) (not start!73134) b_and!23259 (not mapNonEmpty!25877) (not b!851309) tp_is_empty!16185)
(check-sat b_and!23259 (not b_next!14049))
