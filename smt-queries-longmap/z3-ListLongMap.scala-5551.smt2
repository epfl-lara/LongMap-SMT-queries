; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73072 () Bool)

(assert start!73072)

(declare-fun b_free!14005 () Bool)

(declare-fun b_next!14005 () Bool)

(assert (=> start!73072 (= b_free!14005 (not b_next!14005))))

(declare-fun tp!49520 () Bool)

(declare-fun b_and!23143 () Bool)

(assert (=> start!73072 (= tp!49520 b_and!23143)))

(declare-fun b!850033 () Bool)

(declare-fun res!577490 () Bool)

(declare-fun e!474175 () Bool)

(assert (=> b!850033 (=> (not res!577490) (not e!474175))))

(declare-datatypes ((array!48477 0))(
  ( (array!48478 (arr!23270 (Array (_ BitVec 32) (_ BitVec 64))) (size!23712 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48477)

(declare-datatypes ((List!16499 0))(
  ( (Nil!16496) (Cons!16495 (h!17626 (_ BitVec 64)) (t!22941 List!16499)) )
))
(declare-fun arrayNoDuplicates!0 (array!48477 (_ BitVec 32) List!16499) Bool)

(assert (=> b!850033 (= res!577490 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16496))))

(declare-fun bm!37841 () Bool)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((V!26569 0))(
  ( (V!26570 (val!8118 Int)) )
))
(declare-datatypes ((ValueCell!7631 0))(
  ( (ValueCellFull!7631 (v!10537 V!26569)) (EmptyCell!7631) )
))
(declare-datatypes ((array!48479 0))(
  ( (array!48480 (arr!23271 (Array (_ BitVec 32) ValueCell!7631)) (size!23713 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48479)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26569)

(declare-fun zeroValue!654 () V!26569)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10658 0))(
  ( (tuple2!10659 (_1!5340 (_ BitVec 64)) (_2!5340 V!26569)) )
))
(declare-datatypes ((List!16500 0))(
  ( (Nil!16497) (Cons!16496 (h!17627 tuple2!10658) (t!22942 List!16500)) )
))
(declare-datatypes ((ListLongMap!9417 0))(
  ( (ListLongMap!9418 (toList!4724 List!16500)) )
))
(declare-fun call!37845 () ListLongMap!9417)

(declare-fun getCurrentListMapNoExtraKeys!2732 (array!48477 array!48479 (_ BitVec 32) (_ BitVec 32) V!26569 V!26569 (_ BitVec 32) Int) ListLongMap!9417)

(assert (=> bm!37841 (= call!37845 (getCurrentListMapNoExtraKeys!2732 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!577494 () Bool)

(assert (=> start!73072 (=> (not res!577494) (not e!474175))))

(assert (=> start!73072 (= res!577494 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23712 _keys!868))))))

(assert (=> start!73072 e!474175))

(declare-fun tp_is_empty!16141 () Bool)

(assert (=> start!73072 tp_is_empty!16141))

(assert (=> start!73072 true))

(assert (=> start!73072 tp!49520))

(declare-fun array_inv!18548 (array!48477) Bool)

(assert (=> start!73072 (array_inv!18548 _keys!868)))

(declare-fun e!474178 () Bool)

(declare-fun array_inv!18549 (array!48479) Bool)

(assert (=> start!73072 (and (array_inv!18549 _values!688) e!474178)))

(declare-fun b!850034 () Bool)

(declare-fun res!577488 () Bool)

(assert (=> b!850034 (=> (not res!577488) (not e!474175))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850034 (= res!577488 (validKeyInArray!0 k0!854))))

(declare-fun b!850035 () Bool)

(declare-fun res!577497 () Bool)

(assert (=> b!850035 (=> (not res!577497) (not e!474175))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850035 (= res!577497 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23712 _keys!868))))))

(declare-fun b!850036 () Bool)

(declare-fun res!577495 () Bool)

(assert (=> b!850036 (=> (not res!577495) (not e!474175))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850036 (= res!577495 (validMask!0 mask!1196))))

(declare-fun b!850037 () Bool)

(declare-fun res!577496 () Bool)

(assert (=> b!850037 (=> (not res!577496) (not e!474175))))

(assert (=> b!850037 (= res!577496 (and (= (select (arr!23270 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!850038 () Bool)

(declare-fun e!474174 () Bool)

(assert (=> b!850038 (= e!474174 tp_is_empty!16141)))

(declare-fun b!850039 () Bool)

(declare-fun e!474180 () Bool)

(declare-fun e!474179 () Bool)

(assert (=> b!850039 (= e!474180 (not e!474179))))

(declare-fun res!577491 () Bool)

(assert (=> b!850039 (=> res!577491 e!474179)))

(assert (=> b!850039 (= res!577491 (not (validKeyInArray!0 (select (arr!23270 _keys!868) from!1053))))))

(declare-fun e!474177 () Bool)

(assert (=> b!850039 e!474177))

(declare-fun c!91613 () Bool)

(assert (=> b!850039 (= c!91613 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26569)

(declare-datatypes ((Unit!28967 0))(
  ( (Unit!28968) )
))
(declare-fun lt!382483 () Unit!28967)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!358 (array!48477 array!48479 (_ BitVec 32) (_ BitVec 32) V!26569 V!26569 (_ BitVec 32) (_ BitVec 64) V!26569 (_ BitVec 32) Int) Unit!28967)

(assert (=> b!850039 (= lt!382483 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!358 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850040 () Bool)

(declare-fun e!474173 () Bool)

(assert (=> b!850040 (= e!474173 tp_is_empty!16141)))

(declare-fun mapIsEmpty!25811 () Bool)

(declare-fun mapRes!25811 () Bool)

(assert (=> mapIsEmpty!25811 mapRes!25811))

(declare-fun b!850041 () Bool)

(declare-fun res!577489 () Bool)

(assert (=> b!850041 (=> (not res!577489) (not e!474175))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48477 (_ BitVec 32)) Bool)

(assert (=> b!850041 (= res!577489 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850042 () Bool)

(assert (=> b!850042 (= e!474179 true)))

(declare-fun lt!382485 () V!26569)

(declare-fun lt!382479 () tuple2!10658)

(declare-fun lt!382484 () ListLongMap!9417)

(declare-fun +!2148 (ListLongMap!9417 tuple2!10658) ListLongMap!9417)

(assert (=> b!850042 (= (+!2148 lt!382484 lt!382479) (+!2148 (+!2148 lt!382484 (tuple2!10659 k0!854 lt!382485)) lt!382479))))

(declare-fun lt!382482 () V!26569)

(assert (=> b!850042 (= lt!382479 (tuple2!10659 k0!854 lt!382482))))

(declare-fun lt!382487 () Unit!28967)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!262 (ListLongMap!9417 (_ BitVec 64) V!26569 V!26569) Unit!28967)

(assert (=> b!850042 (= lt!382487 (addSameAsAddTwiceSameKeyDiffValues!262 lt!382484 k0!854 lt!382485 lt!382482))))

(declare-fun lt!382481 () V!26569)

(declare-fun get!12261 (ValueCell!7631 V!26569) V!26569)

(assert (=> b!850042 (= lt!382485 (get!12261 (select (arr!23271 _values!688) from!1053) lt!382481))))

(declare-fun lt!382478 () ListLongMap!9417)

(assert (=> b!850042 (= lt!382478 (+!2148 lt!382484 (tuple2!10659 (select (arr!23270 _keys!868) from!1053) lt!382482)))))

(assert (=> b!850042 (= lt!382482 (get!12261 (select (store (arr!23271 _values!688) i!612 (ValueCellFull!7631 v!557)) from!1053) lt!382481))))

(declare-fun dynLambda!1012 (Int (_ BitVec 64)) V!26569)

(assert (=> b!850042 (= lt!382481 (dynLambda!1012 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382480 () array!48479)

(assert (=> b!850042 (= lt!382484 (getCurrentListMapNoExtraKeys!2732 _keys!868 lt!382480 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun call!37844 () ListLongMap!9417)

(declare-fun b!850043 () Bool)

(assert (=> b!850043 (= e!474177 (= call!37844 (+!2148 call!37845 (tuple2!10659 k0!854 v!557))))))

(declare-fun bm!37842 () Bool)

(assert (=> bm!37842 (= call!37844 (getCurrentListMapNoExtraKeys!2732 _keys!868 lt!382480 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850044 () Bool)

(assert (=> b!850044 (= e!474178 (and e!474174 mapRes!25811))))

(declare-fun condMapEmpty!25811 () Bool)

(declare-fun mapDefault!25811 () ValueCell!7631)

(assert (=> b!850044 (= condMapEmpty!25811 (= (arr!23271 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7631)) mapDefault!25811)))))

(declare-fun b!850045 () Bool)

(assert (=> b!850045 (= e!474177 (= call!37844 call!37845))))

(declare-fun mapNonEmpty!25811 () Bool)

(declare-fun tp!49519 () Bool)

(assert (=> mapNonEmpty!25811 (= mapRes!25811 (and tp!49519 e!474173))))

(declare-fun mapRest!25811 () (Array (_ BitVec 32) ValueCell!7631))

(declare-fun mapKey!25811 () (_ BitVec 32))

(declare-fun mapValue!25811 () ValueCell!7631)

(assert (=> mapNonEmpty!25811 (= (arr!23271 _values!688) (store mapRest!25811 mapKey!25811 mapValue!25811))))

(declare-fun b!850046 () Bool)

(assert (=> b!850046 (= e!474175 e!474180)))

(declare-fun res!577492 () Bool)

(assert (=> b!850046 (=> (not res!577492) (not e!474180))))

(assert (=> b!850046 (= res!577492 (= from!1053 i!612))))

(assert (=> b!850046 (= lt!382478 (getCurrentListMapNoExtraKeys!2732 _keys!868 lt!382480 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850046 (= lt!382480 (array!48480 (store (arr!23271 _values!688) i!612 (ValueCellFull!7631 v!557)) (size!23713 _values!688)))))

(declare-fun lt!382486 () ListLongMap!9417)

(assert (=> b!850046 (= lt!382486 (getCurrentListMapNoExtraKeys!2732 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850047 () Bool)

(declare-fun res!577493 () Bool)

(assert (=> b!850047 (=> (not res!577493) (not e!474175))))

(assert (=> b!850047 (= res!577493 (and (= (size!23713 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23712 _keys!868) (size!23713 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73072 res!577494) b!850036))

(assert (= (and b!850036 res!577495) b!850047))

(assert (= (and b!850047 res!577493) b!850041))

(assert (= (and b!850041 res!577489) b!850033))

(assert (= (and b!850033 res!577490) b!850035))

(assert (= (and b!850035 res!577497) b!850034))

(assert (= (and b!850034 res!577488) b!850037))

(assert (= (and b!850037 res!577496) b!850046))

(assert (= (and b!850046 res!577492) b!850039))

(assert (= (and b!850039 c!91613) b!850043))

(assert (= (and b!850039 (not c!91613)) b!850045))

(assert (= (or b!850043 b!850045) bm!37842))

(assert (= (or b!850043 b!850045) bm!37841))

(assert (= (and b!850039 (not res!577491)) b!850042))

(assert (= (and b!850044 condMapEmpty!25811) mapIsEmpty!25811))

(assert (= (and b!850044 (not condMapEmpty!25811)) mapNonEmpty!25811))

(get-info :version)

(assert (= (and mapNonEmpty!25811 ((_ is ValueCellFull!7631) mapValue!25811)) b!850040))

(assert (= (and b!850044 ((_ is ValueCellFull!7631) mapDefault!25811)) b!850038))

(assert (= start!73072 b!850044))

(declare-fun b_lambda!11519 () Bool)

(assert (=> (not b_lambda!11519) (not b!850042)))

(declare-fun t!22940 () Bool)

(declare-fun tb!4299 () Bool)

(assert (=> (and start!73072 (= defaultEntry!696 defaultEntry!696) t!22940) tb!4299))

(declare-fun result!8217 () Bool)

(assert (=> tb!4299 (= result!8217 tp_is_empty!16141)))

(assert (=> b!850042 t!22940))

(declare-fun b_and!23145 () Bool)

(assert (= b_and!23143 (and (=> t!22940 result!8217) b_and!23145)))

(declare-fun m!790255 () Bool)

(assert (=> b!850042 m!790255))

(declare-fun m!790257 () Bool)

(assert (=> b!850042 m!790257))

(declare-fun m!790259 () Bool)

(assert (=> b!850042 m!790259))

(declare-fun m!790261 () Bool)

(assert (=> b!850042 m!790261))

(assert (=> b!850042 m!790257))

(declare-fun m!790263 () Bool)

(assert (=> b!850042 m!790263))

(declare-fun m!790265 () Bool)

(assert (=> b!850042 m!790265))

(declare-fun m!790267 () Bool)

(assert (=> b!850042 m!790267))

(assert (=> b!850042 m!790255))

(declare-fun m!790269 () Bool)

(assert (=> b!850042 m!790269))

(declare-fun m!790271 () Bool)

(assert (=> b!850042 m!790271))

(declare-fun m!790273 () Bool)

(assert (=> b!850042 m!790273))

(assert (=> b!850042 m!790265))

(declare-fun m!790275 () Bool)

(assert (=> b!850042 m!790275))

(declare-fun m!790277 () Bool)

(assert (=> b!850042 m!790277))

(declare-fun m!790279 () Bool)

(assert (=> b!850042 m!790279))

(assert (=> b!850039 m!790277))

(assert (=> b!850039 m!790277))

(declare-fun m!790281 () Bool)

(assert (=> b!850039 m!790281))

(declare-fun m!790283 () Bool)

(assert (=> b!850039 m!790283))

(assert (=> bm!37842 m!790263))

(declare-fun m!790285 () Bool)

(assert (=> start!73072 m!790285))

(declare-fun m!790287 () Bool)

(assert (=> start!73072 m!790287))

(declare-fun m!790289 () Bool)

(assert (=> b!850046 m!790289))

(assert (=> b!850046 m!790275))

(declare-fun m!790291 () Bool)

(assert (=> b!850046 m!790291))

(declare-fun m!790293 () Bool)

(assert (=> b!850037 m!790293))

(declare-fun m!790295 () Bool)

(assert (=> mapNonEmpty!25811 m!790295))

(declare-fun m!790297 () Bool)

(assert (=> b!850041 m!790297))

(declare-fun m!790299 () Bool)

(assert (=> b!850036 m!790299))

(declare-fun m!790301 () Bool)

(assert (=> bm!37841 m!790301))

(declare-fun m!790303 () Bool)

(assert (=> b!850034 m!790303))

(declare-fun m!790305 () Bool)

(assert (=> b!850033 m!790305))

(declare-fun m!790307 () Bool)

(assert (=> b!850043 m!790307))

(check-sat (not b_lambda!11519) (not bm!37842) (not b!850034) (not b_next!14005) (not b!850041) (not b!850043) (not bm!37841) b_and!23145 (not start!73072) (not mapNonEmpty!25811) (not b!850039) (not b!850046) (not b!850036) tp_is_empty!16141 (not b!850042) (not b!850033))
(check-sat b_and!23145 (not b_next!14005))
