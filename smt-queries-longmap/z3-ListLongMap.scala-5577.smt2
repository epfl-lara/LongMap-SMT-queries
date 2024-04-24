; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73414 () Bool)

(assert start!73414)

(declare-fun b_free!14161 () Bool)

(declare-fun b_next!14161 () Bool)

(assert (=> start!73414 (= b_free!14161 (not b_next!14161))))

(declare-fun tp!49988 () Bool)

(declare-fun b_and!23491 () Bool)

(assert (=> start!73414 (= tp!49988 b_and!23491)))

(declare-fun b!854841 () Bool)

(declare-fun e!476780 () Bool)

(declare-fun e!476778 () Bool)

(assert (=> b!854841 (= e!476780 e!476778)))

(declare-fun res!580288 () Bool)

(assert (=> b!854841 (=> (not res!580288) (not e!476778))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!854841 (= res!580288 (= from!1053 i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26777 0))(
  ( (V!26778 (val!8196 Int)) )
))
(declare-datatypes ((ValueCell!7709 0))(
  ( (ValueCellFull!7709 (v!10621 V!26777)) (EmptyCell!7709) )
))
(declare-datatypes ((array!48839 0))(
  ( (array!48840 (arr!23446 (Array (_ BitVec 32) ValueCell!7709)) (size!23887 (_ BitVec 32))) )
))
(declare-fun lt!385423 () array!48839)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48841 0))(
  ( (array!48842 (arr!23447 (Array (_ BitVec 32) (_ BitVec 64))) (size!23888 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48841)

(declare-datatypes ((tuple2!10706 0))(
  ( (tuple2!10707 (_1!5364 (_ BitVec 64)) (_2!5364 V!26777)) )
))
(declare-datatypes ((List!16555 0))(
  ( (Nil!16552) (Cons!16551 (h!17688 tuple2!10706) (t!23154 List!16555)) )
))
(declare-datatypes ((ListLongMap!9477 0))(
  ( (ListLongMap!9478 (toList!4754 List!16555)) )
))
(declare-fun lt!385424 () ListLongMap!9477)

(declare-fun minValue!654 () V!26777)

(declare-fun zeroValue!654 () V!26777)

(declare-fun getCurrentListMapNoExtraKeys!2811 (array!48841 array!48839 (_ BitVec 32) (_ BitVec 32) V!26777 V!26777 (_ BitVec 32) Int) ListLongMap!9477)

(assert (=> b!854841 (= lt!385424 (getCurrentListMapNoExtraKeys!2811 _keys!868 lt!385423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26777)

(declare-fun _values!688 () array!48839)

(assert (=> b!854841 (= lt!385423 (array!48840 (store (arr!23446 _values!688) i!612 (ValueCellFull!7709 v!557)) (size!23887 _values!688)))))

(declare-fun lt!385421 () ListLongMap!9477)

(assert (=> b!854841 (= lt!385421 (getCurrentListMapNoExtraKeys!2811 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!854842 () Bool)

(declare-fun e!476775 () Bool)

(declare-fun call!38384 () ListLongMap!9477)

(declare-fun call!38383 () ListLongMap!9477)

(assert (=> b!854842 (= e!476775 (= call!38384 call!38383))))

(declare-fun b!854843 () Bool)

(declare-fun res!580291 () Bool)

(assert (=> b!854843 (=> (not res!580291) (not e!476780))))

(assert (=> b!854843 (= res!580291 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23888 _keys!868))))))

(declare-fun b!854844 () Bool)

(declare-fun e!476777 () Bool)

(declare-fun e!476776 () Bool)

(declare-fun mapRes!26045 () Bool)

(assert (=> b!854844 (= e!476777 (and e!476776 mapRes!26045))))

(declare-fun condMapEmpty!26045 () Bool)

(declare-fun mapDefault!26045 () ValueCell!7709)

(assert (=> b!854844 (= condMapEmpty!26045 (= (arr!23446 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7709)) mapDefault!26045)))))

(declare-fun mapIsEmpty!26045 () Bool)

(assert (=> mapIsEmpty!26045 mapRes!26045))

(declare-fun res!580289 () Bool)

(assert (=> start!73414 (=> (not res!580289) (not e!476780))))

(assert (=> start!73414 (= res!580289 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23888 _keys!868))))))

(assert (=> start!73414 e!476780))

(declare-fun tp_is_empty!16297 () Bool)

(assert (=> start!73414 tp_is_empty!16297))

(assert (=> start!73414 true))

(assert (=> start!73414 tp!49988))

(declare-fun array_inv!18636 (array!48841) Bool)

(assert (=> start!73414 (array_inv!18636 _keys!868)))

(declare-fun array_inv!18637 (array!48839) Bool)

(assert (=> start!73414 (and (array_inv!18637 _values!688) e!476777)))

(declare-fun b!854845 () Bool)

(declare-fun res!580287 () Bool)

(assert (=> b!854845 (=> (not res!580287) (not e!476780))))

(declare-datatypes ((List!16556 0))(
  ( (Nil!16553) (Cons!16552 (h!17689 (_ BitVec 64)) (t!23155 List!16556)) )
))
(declare-fun arrayNoDuplicates!0 (array!48841 (_ BitVec 32) List!16556) Bool)

(assert (=> b!854845 (= res!580287 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16553))))

(declare-fun mapNonEmpty!26045 () Bool)

(declare-fun tp!49987 () Bool)

(declare-fun e!476782 () Bool)

(assert (=> mapNonEmpty!26045 (= mapRes!26045 (and tp!49987 e!476782))))

(declare-fun mapValue!26045 () ValueCell!7709)

(declare-fun mapRest!26045 () (Array (_ BitVec 32) ValueCell!7709))

(declare-fun mapKey!26045 () (_ BitVec 32))

(assert (=> mapNonEmpty!26045 (= (arr!23446 _values!688) (store mapRest!26045 mapKey!26045 mapValue!26045))))

(declare-fun b!854846 () Bool)

(declare-fun res!580285 () Bool)

(assert (=> b!854846 (=> (not res!580285) (not e!476780))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!854846 (= res!580285 (validMask!0 mask!1196))))

(declare-fun b!854847 () Bool)

(declare-fun res!580283 () Bool)

(assert (=> b!854847 (=> (not res!580283) (not e!476780))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!854847 (= res!580283 (validKeyInArray!0 k0!854))))

(declare-fun bm!38380 () Bool)

(assert (=> bm!38380 (= call!38384 (getCurrentListMapNoExtraKeys!2811 _keys!868 lt!385423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854848 () Bool)

(declare-fun +!2196 (ListLongMap!9477 tuple2!10706) ListLongMap!9477)

(assert (=> b!854848 (= e!476775 (= call!38384 (+!2196 call!38383 (tuple2!10707 k0!854 v!557))))))

(declare-fun bm!38381 () Bool)

(assert (=> bm!38381 (= call!38383 (getCurrentListMapNoExtraKeys!2811 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854849 () Bool)

(declare-fun res!580286 () Bool)

(assert (=> b!854849 (=> (not res!580286) (not e!476780))))

(assert (=> b!854849 (= res!580286 (and (= (select (arr!23447 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!854850 () Bool)

(assert (=> b!854850 (= e!476782 tp_is_empty!16297)))

(declare-fun b!854851 () Bool)

(declare-fun e!476779 () Bool)

(assert (=> b!854851 (= e!476779 true)))

(declare-fun lt!385416 () tuple2!10706)

(declare-fun lt!385419 () ListLongMap!9477)

(declare-fun lt!385418 () V!26777)

(assert (=> b!854851 (= (+!2196 lt!385419 lt!385416) (+!2196 (+!2196 lt!385419 (tuple2!10707 k0!854 lt!385418)) lt!385416))))

(declare-fun lt!385422 () V!26777)

(assert (=> b!854851 (= lt!385416 (tuple2!10707 k0!854 lt!385422))))

(declare-datatypes ((Unit!29152 0))(
  ( (Unit!29153) )
))
(declare-fun lt!385417 () Unit!29152)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!320 (ListLongMap!9477 (_ BitVec 64) V!26777 V!26777) Unit!29152)

(assert (=> b!854851 (= lt!385417 (addSameAsAddTwiceSameKeyDiffValues!320 lt!385419 k0!854 lt!385418 lt!385422))))

(declare-fun lt!385420 () V!26777)

(declare-fun get!12371 (ValueCell!7709 V!26777) V!26777)

(assert (=> b!854851 (= lt!385418 (get!12371 (select (arr!23446 _values!688) from!1053) lt!385420))))

(assert (=> b!854851 (= lt!385424 (+!2196 lt!385419 (tuple2!10707 (select (arr!23447 _keys!868) from!1053) lt!385422)))))

(assert (=> b!854851 (= lt!385422 (get!12371 (select (store (arr!23446 _values!688) i!612 (ValueCellFull!7709 v!557)) from!1053) lt!385420))))

(declare-fun dynLambda!1067 (Int (_ BitVec 64)) V!26777)

(assert (=> b!854851 (= lt!385420 (dynLambda!1067 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!854851 (= lt!385419 (getCurrentListMapNoExtraKeys!2811 _keys!868 lt!385423 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854852 () Bool)

(declare-fun res!580282 () Bool)

(assert (=> b!854852 (=> (not res!580282) (not e!476780))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48841 (_ BitVec 32)) Bool)

(assert (=> b!854852 (= res!580282 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!854853 () Bool)

(assert (=> b!854853 (= e!476778 (not e!476779))))

(declare-fun res!580290 () Bool)

(assert (=> b!854853 (=> res!580290 e!476779)))

(assert (=> b!854853 (= res!580290 (not (validKeyInArray!0 (select (arr!23447 _keys!868) from!1053))))))

(assert (=> b!854853 e!476775))

(declare-fun c!92194 () Bool)

(assert (=> b!854853 (= c!92194 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!385415 () Unit!29152)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!399 (array!48841 array!48839 (_ BitVec 32) (_ BitVec 32) V!26777 V!26777 (_ BitVec 32) (_ BitVec 64) V!26777 (_ BitVec 32) Int) Unit!29152)

(assert (=> b!854853 (= lt!385415 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!399 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!854854 () Bool)

(assert (=> b!854854 (= e!476776 tp_is_empty!16297)))

(declare-fun b!854855 () Bool)

(declare-fun res!580284 () Bool)

(assert (=> b!854855 (=> (not res!580284) (not e!476780))))

(assert (=> b!854855 (= res!580284 (and (= (size!23887 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23888 _keys!868) (size!23887 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73414 res!580289) b!854846))

(assert (= (and b!854846 res!580285) b!854855))

(assert (= (and b!854855 res!580284) b!854852))

(assert (= (and b!854852 res!580282) b!854845))

(assert (= (and b!854845 res!580287) b!854843))

(assert (= (and b!854843 res!580291) b!854847))

(assert (= (and b!854847 res!580283) b!854849))

(assert (= (and b!854849 res!580286) b!854841))

(assert (= (and b!854841 res!580288) b!854853))

(assert (= (and b!854853 c!92194) b!854848))

(assert (= (and b!854853 (not c!92194)) b!854842))

(assert (= (or b!854848 b!854842) bm!38380))

(assert (= (or b!854848 b!854842) bm!38381))

(assert (= (and b!854853 (not res!580290)) b!854851))

(assert (= (and b!854844 condMapEmpty!26045) mapIsEmpty!26045))

(assert (= (and b!854844 (not condMapEmpty!26045)) mapNonEmpty!26045))

(get-info :version)

(assert (= (and mapNonEmpty!26045 ((_ is ValueCellFull!7709) mapValue!26045)) b!854850))

(assert (= (and b!854844 ((_ is ValueCellFull!7709) mapDefault!26045)) b!854854))

(assert (= start!73414 b!854844))

(declare-fun b_lambda!11707 () Bool)

(assert (=> (not b_lambda!11707) (not b!854851)))

(declare-fun t!23153 () Bool)

(declare-fun tb!4455 () Bool)

(assert (=> (and start!73414 (= defaultEntry!696 defaultEntry!696) t!23153) tb!4455))

(declare-fun result!8529 () Bool)

(assert (=> tb!4455 (= result!8529 tp_is_empty!16297)))

(assert (=> b!854851 t!23153))

(declare-fun b_and!23493 () Bool)

(assert (= b_and!23491 (and (=> t!23153 result!8529) b_and!23493)))

(declare-fun m!796515 () Bool)

(assert (=> mapNonEmpty!26045 m!796515))

(declare-fun m!796517 () Bool)

(assert (=> bm!38380 m!796517))

(declare-fun m!796519 () Bool)

(assert (=> b!854852 m!796519))

(declare-fun m!796521 () Bool)

(assert (=> b!854841 m!796521))

(declare-fun m!796523 () Bool)

(assert (=> b!854841 m!796523))

(declare-fun m!796525 () Bool)

(assert (=> b!854841 m!796525))

(declare-fun m!796527 () Bool)

(assert (=> b!854853 m!796527))

(assert (=> b!854853 m!796527))

(declare-fun m!796529 () Bool)

(assert (=> b!854853 m!796529))

(declare-fun m!796531 () Bool)

(assert (=> b!854853 m!796531))

(declare-fun m!796533 () Bool)

(assert (=> b!854848 m!796533))

(declare-fun m!796535 () Bool)

(assert (=> b!854849 m!796535))

(declare-fun m!796537 () Bool)

(assert (=> b!854851 m!796537))

(declare-fun m!796539 () Bool)

(assert (=> b!854851 m!796539))

(declare-fun m!796541 () Bool)

(assert (=> b!854851 m!796541))

(assert (=> b!854851 m!796517))

(declare-fun m!796543 () Bool)

(assert (=> b!854851 m!796543))

(assert (=> b!854851 m!796523))

(assert (=> b!854851 m!796527))

(declare-fun m!796545 () Bool)

(assert (=> b!854851 m!796545))

(assert (=> b!854851 m!796537))

(declare-fun m!796547 () Bool)

(assert (=> b!854851 m!796547))

(declare-fun m!796549 () Bool)

(assert (=> b!854851 m!796549))

(declare-fun m!796551 () Bool)

(assert (=> b!854851 m!796551))

(assert (=> b!854851 m!796543))

(declare-fun m!796553 () Bool)

(assert (=> b!854851 m!796553))

(assert (=> b!854851 m!796549))

(declare-fun m!796555 () Bool)

(assert (=> b!854851 m!796555))

(declare-fun m!796557 () Bool)

(assert (=> b!854845 m!796557))

(declare-fun m!796559 () Bool)

(assert (=> b!854847 m!796559))

(declare-fun m!796561 () Bool)

(assert (=> b!854846 m!796561))

(declare-fun m!796563 () Bool)

(assert (=> bm!38381 m!796563))

(declare-fun m!796565 () Bool)

(assert (=> start!73414 m!796565))

(declare-fun m!796567 () Bool)

(assert (=> start!73414 m!796567))

(check-sat (not mapNonEmpty!26045) tp_is_empty!16297 (not b_next!14161) (not b!854853) (not b!854841) (not bm!38381) (not start!73414) b_and!23493 (not b!854845) (not b!854851) (not b!854852) (not b!854847) (not bm!38380) (not b!854846) (not b_lambda!11707) (not b!854848))
(check-sat b_and!23493 (not b_next!14161))
