; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73222 () Bool)

(assert start!73222)

(declare-fun b_free!14155 () Bool)

(declare-fun b_next!14155 () Bool)

(assert (=> start!73222 (= b_free!14155 (not b_next!14155))))

(declare-fun tp!49970 () Bool)

(declare-fun b_and!23443 () Bool)

(assert (=> start!73222 (= tp!49970 b_and!23443)))

(declare-fun b!853558 () Bool)

(declare-fun res!579746 () Bool)

(declare-fun e!475978 () Bool)

(assert (=> b!853558 (=> (not res!579746) (not e!475978))))

(declare-datatypes ((array!48765 0))(
  ( (array!48766 (arr!23414 (Array (_ BitVec 32) (_ BitVec 64))) (size!23856 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48765)

(declare-datatypes ((List!16613 0))(
  ( (Nil!16610) (Cons!16609 (h!17740 (_ BitVec 64)) (t!23205 List!16613)) )
))
(declare-fun arrayNoDuplicates!0 (array!48765 (_ BitVec 32) List!16613) Bool)

(assert (=> b!853558 (= res!579746 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16610))))

(declare-fun b!853559 () Bool)

(declare-fun e!475975 () Bool)

(declare-fun tp_is_empty!16291 () Bool)

(assert (=> b!853559 (= e!475975 tp_is_empty!16291)))

(declare-datatypes ((V!26769 0))(
  ( (V!26770 (val!8193 Int)) )
))
(declare-datatypes ((tuple2!10792 0))(
  ( (tuple2!10793 (_1!5407 (_ BitVec 64)) (_2!5407 V!26769)) )
))
(declare-datatypes ((List!16614 0))(
  ( (Nil!16611) (Cons!16610 (h!17741 tuple2!10792) (t!23206 List!16614)) )
))
(declare-datatypes ((ListLongMap!9551 0))(
  ( (ListLongMap!9552 (toList!4791 List!16614)) )
))
(declare-fun call!38294 () ListLongMap!9551)

(declare-datatypes ((ValueCell!7706 0))(
  ( (ValueCellFull!7706 (v!10612 V!26769)) (EmptyCell!7706) )
))
(declare-datatypes ((array!48767 0))(
  ( (array!48768 (arr!23415 (Array (_ BitVec 32) ValueCell!7706)) (size!23857 (_ BitVec 32))) )
))
(declare-fun lt!384733 () array!48767)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38291 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26769)

(declare-fun zeroValue!654 () V!26769)

(declare-fun getCurrentListMapNoExtraKeys!2799 (array!48765 array!48767 (_ BitVec 32) (_ BitVec 32) V!26769 V!26769 (_ BitVec 32) Int) ListLongMap!9551)

(assert (=> bm!38291 (= call!38294 (getCurrentListMapNoExtraKeys!2799 _keys!868 lt!384733 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853560 () Bool)

(declare-fun e!475974 () Bool)

(declare-fun e!475977 () Bool)

(assert (=> b!853560 (= e!475974 (not e!475977))))

(declare-fun res!579739 () Bool)

(assert (=> b!853560 (=> res!579739 e!475977)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853560 (= res!579739 (not (validKeyInArray!0 (select (arr!23414 _keys!868) from!1053))))))

(declare-fun e!475980 () Bool)

(assert (=> b!853560 e!475980))

(declare-fun c!91838 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853560 (= c!91838 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26769)

(declare-datatypes ((Unit!29075 0))(
  ( (Unit!29076) )
))
(declare-fun lt!384734 () Unit!29075)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun _values!688 () array!48767)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!404 (array!48765 array!48767 (_ BitVec 32) (_ BitVec 32) V!26769 V!26769 (_ BitVec 32) (_ BitVec 64) V!26769 (_ BitVec 32) Int) Unit!29075)

(assert (=> b!853560 (= lt!384734 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!404 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853561 () Bool)

(declare-fun call!38295 () ListLongMap!9551)

(assert (=> b!853561 (= e!475980 (= call!38294 call!38295))))

(declare-fun bm!38292 () Bool)

(assert (=> bm!38292 (= call!38295 (getCurrentListMapNoExtraKeys!2799 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853562 () Bool)

(declare-fun +!2202 (ListLongMap!9551 tuple2!10792) ListLongMap!9551)

(assert (=> b!853562 (= e!475980 (= call!38294 (+!2202 call!38295 (tuple2!10793 k0!854 v!557))))))

(declare-fun mapIsEmpty!26036 () Bool)

(declare-fun mapRes!26036 () Bool)

(assert (=> mapIsEmpty!26036 mapRes!26036))

(declare-fun b!853564 () Bool)

(declare-fun res!579747 () Bool)

(assert (=> b!853564 (=> (not res!579747) (not e!475978))))

(assert (=> b!853564 (= res!579747 (validKeyInArray!0 k0!854))))

(declare-fun b!853565 () Bool)

(declare-fun res!579738 () Bool)

(assert (=> b!853565 (=> (not res!579738) (not e!475978))))

(assert (=> b!853565 (= res!579738 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23856 _keys!868))))))

(declare-fun b!853566 () Bool)

(declare-fun res!579740 () Bool)

(assert (=> b!853566 (=> (not res!579740) (not e!475978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48765 (_ BitVec 32)) Bool)

(assert (=> b!853566 (= res!579740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!853567 () Bool)

(declare-fun e!475973 () Bool)

(declare-fun e!475976 () Bool)

(assert (=> b!853567 (= e!475973 (and e!475976 mapRes!26036))))

(declare-fun condMapEmpty!26036 () Bool)

(declare-fun mapDefault!26036 () ValueCell!7706)

(assert (=> b!853567 (= condMapEmpty!26036 (= (arr!23415 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7706)) mapDefault!26036)))))

(declare-fun b!853568 () Bool)

(assert (=> b!853568 (= e!475976 tp_is_empty!16291)))

(declare-fun b!853563 () Bool)

(assert (=> b!853563 (= e!475978 e!475974)))

(declare-fun res!579742 () Bool)

(assert (=> b!853563 (=> (not res!579742) (not e!475974))))

(assert (=> b!853563 (= res!579742 (= from!1053 i!612))))

(declare-fun lt!384732 () ListLongMap!9551)

(assert (=> b!853563 (= lt!384732 (getCurrentListMapNoExtraKeys!2799 _keys!868 lt!384733 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853563 (= lt!384733 (array!48768 (store (arr!23415 _values!688) i!612 (ValueCellFull!7706 v!557)) (size!23857 _values!688)))))

(declare-fun lt!384735 () ListLongMap!9551)

(assert (=> b!853563 (= lt!384735 (getCurrentListMapNoExtraKeys!2799 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!579744 () Bool)

(assert (=> start!73222 (=> (not res!579744) (not e!475978))))

(assert (=> start!73222 (= res!579744 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23856 _keys!868))))))

(assert (=> start!73222 e!475978))

(assert (=> start!73222 tp_is_empty!16291))

(assert (=> start!73222 true))

(assert (=> start!73222 tp!49970))

(declare-fun array_inv!18642 (array!48765) Bool)

(assert (=> start!73222 (array_inv!18642 _keys!868)))

(declare-fun array_inv!18643 (array!48767) Bool)

(assert (=> start!73222 (and (array_inv!18643 _values!688) e!475973)))

(declare-fun b!853569 () Bool)

(assert (=> b!853569 (= e!475977 true)))

(declare-fun lt!384731 () ListLongMap!9551)

(declare-fun lt!384730 () V!26769)

(declare-fun lt!384736 () tuple2!10792)

(assert (=> b!853569 (= (+!2202 lt!384731 lt!384736) (+!2202 (+!2202 lt!384731 (tuple2!10793 k0!854 lt!384730)) lt!384736))))

(declare-fun lt!384737 () V!26769)

(assert (=> b!853569 (= lt!384736 (tuple2!10793 k0!854 lt!384737))))

(declare-fun lt!384728 () Unit!29075)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!310 (ListLongMap!9551 (_ BitVec 64) V!26769 V!26769) Unit!29075)

(assert (=> b!853569 (= lt!384728 (addSameAsAddTwiceSameKeyDiffValues!310 lt!384731 k0!854 lt!384730 lt!384737))))

(declare-fun lt!384729 () V!26769)

(declare-fun get!12359 (ValueCell!7706 V!26769) V!26769)

(assert (=> b!853569 (= lt!384730 (get!12359 (select (arr!23415 _values!688) from!1053) lt!384729))))

(assert (=> b!853569 (= lt!384732 (+!2202 lt!384731 (tuple2!10793 (select (arr!23414 _keys!868) from!1053) lt!384737)))))

(assert (=> b!853569 (= lt!384737 (get!12359 (select (store (arr!23415 _values!688) i!612 (ValueCellFull!7706 v!557)) from!1053) lt!384729))))

(declare-fun dynLambda!1060 (Int (_ BitVec 64)) V!26769)

(assert (=> b!853569 (= lt!384729 (dynLambda!1060 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853569 (= lt!384731 (getCurrentListMapNoExtraKeys!2799 _keys!868 lt!384733 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853570 () Bool)

(declare-fun res!579741 () Bool)

(assert (=> b!853570 (=> (not res!579741) (not e!475978))))

(assert (=> b!853570 (= res!579741 (and (= (size!23857 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23856 _keys!868) (size!23857 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!26036 () Bool)

(declare-fun tp!49969 () Bool)

(assert (=> mapNonEmpty!26036 (= mapRes!26036 (and tp!49969 e!475975))))

(declare-fun mapRest!26036 () (Array (_ BitVec 32) ValueCell!7706))

(declare-fun mapKey!26036 () (_ BitVec 32))

(declare-fun mapValue!26036 () ValueCell!7706)

(assert (=> mapNonEmpty!26036 (= (arr!23415 _values!688) (store mapRest!26036 mapKey!26036 mapValue!26036))))

(declare-fun b!853571 () Bool)

(declare-fun res!579743 () Bool)

(assert (=> b!853571 (=> (not res!579743) (not e!475978))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853571 (= res!579743 (validMask!0 mask!1196))))

(declare-fun b!853572 () Bool)

(declare-fun res!579745 () Bool)

(assert (=> b!853572 (=> (not res!579745) (not e!475978))))

(assert (=> b!853572 (= res!579745 (and (= (select (arr!23414 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73222 res!579744) b!853571))

(assert (= (and b!853571 res!579743) b!853570))

(assert (= (and b!853570 res!579741) b!853566))

(assert (= (and b!853566 res!579740) b!853558))

(assert (= (and b!853558 res!579746) b!853565))

(assert (= (and b!853565 res!579738) b!853564))

(assert (= (and b!853564 res!579747) b!853572))

(assert (= (and b!853572 res!579745) b!853563))

(assert (= (and b!853563 res!579742) b!853560))

(assert (= (and b!853560 c!91838) b!853562))

(assert (= (and b!853560 (not c!91838)) b!853561))

(assert (= (or b!853562 b!853561) bm!38291))

(assert (= (or b!853562 b!853561) bm!38292))

(assert (= (and b!853560 (not res!579739)) b!853569))

(assert (= (and b!853567 condMapEmpty!26036) mapIsEmpty!26036))

(assert (= (and b!853567 (not condMapEmpty!26036)) mapNonEmpty!26036))

(get-info :version)

(assert (= (and mapNonEmpty!26036 ((_ is ValueCellFull!7706) mapValue!26036)) b!853559))

(assert (= (and b!853567 ((_ is ValueCellFull!7706) mapDefault!26036)) b!853568))

(assert (= start!73222 b!853567))

(declare-fun b_lambda!11669 () Bool)

(assert (=> (not b_lambda!11669) (not b!853569)))

(declare-fun t!23204 () Bool)

(declare-fun tb!4449 () Bool)

(assert (=> (and start!73222 (= defaultEntry!696 defaultEntry!696) t!23204) tb!4449))

(declare-fun result!8517 () Bool)

(assert (=> tb!4449 (= result!8517 tp_is_empty!16291)))

(assert (=> b!853569 t!23204))

(declare-fun b_and!23445 () Bool)

(assert (= b_and!23443 (and (=> t!23204 result!8517) b_and!23445)))

(declare-fun m!794307 () Bool)

(assert (=> bm!38292 m!794307))

(declare-fun m!794309 () Bool)

(assert (=> b!853560 m!794309))

(assert (=> b!853560 m!794309))

(declare-fun m!794311 () Bool)

(assert (=> b!853560 m!794311))

(declare-fun m!794313 () Bool)

(assert (=> b!853560 m!794313))

(declare-fun m!794315 () Bool)

(assert (=> b!853571 m!794315))

(declare-fun m!794317 () Bool)

(assert (=> start!73222 m!794317))

(declare-fun m!794319 () Bool)

(assert (=> start!73222 m!794319))

(declare-fun m!794321 () Bool)

(assert (=> b!853563 m!794321))

(declare-fun m!794323 () Bool)

(assert (=> b!853563 m!794323))

(declare-fun m!794325 () Bool)

(assert (=> b!853563 m!794325))

(declare-fun m!794327 () Bool)

(assert (=> b!853562 m!794327))

(declare-fun m!794329 () Bool)

(assert (=> b!853566 m!794329))

(declare-fun m!794331 () Bool)

(assert (=> b!853558 m!794331))

(declare-fun m!794333 () Bool)

(assert (=> b!853572 m!794333))

(declare-fun m!794335 () Bool)

(assert (=> bm!38291 m!794335))

(declare-fun m!794337 () Bool)

(assert (=> b!853564 m!794337))

(declare-fun m!794339 () Bool)

(assert (=> mapNonEmpty!26036 m!794339))

(declare-fun m!794341 () Bool)

(assert (=> b!853569 m!794341))

(assert (=> b!853569 m!794335))

(declare-fun m!794343 () Bool)

(assert (=> b!853569 m!794343))

(declare-fun m!794345 () Bool)

(assert (=> b!853569 m!794345))

(declare-fun m!794347 () Bool)

(assert (=> b!853569 m!794347))

(declare-fun m!794349 () Bool)

(assert (=> b!853569 m!794349))

(declare-fun m!794351 () Bool)

(assert (=> b!853569 m!794351))

(assert (=> b!853569 m!794347))

(declare-fun m!794353 () Bool)

(assert (=> b!853569 m!794353))

(assert (=> b!853569 m!794343))

(assert (=> b!853569 m!794323))

(declare-fun m!794355 () Bool)

(assert (=> b!853569 m!794355))

(declare-fun m!794357 () Bool)

(assert (=> b!853569 m!794357))

(assert (=> b!853569 m!794355))

(assert (=> b!853569 m!794309))

(declare-fun m!794359 () Bool)

(assert (=> b!853569 m!794359))

(check-sat (not b!853560) b_and!23445 tp_is_empty!16291 (not b!853566) (not b!853564) (not b!853571) (not b!853562) (not b_lambda!11669) (not start!73222) (not b!853569) (not b!853558) (not bm!38291) (not bm!38292) (not b_next!14155) (not b!853563) (not mapNonEmpty!26036))
(check-sat b_and!23445 (not b_next!14155))
