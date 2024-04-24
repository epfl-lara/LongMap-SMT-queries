; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73306 () Bool)

(assert start!73306)

(declare-fun b_free!14053 () Bool)

(declare-fun b_next!14053 () Bool)

(assert (=> start!73306 (= b_free!14053 (not b_next!14053))))

(declare-fun tp!49663 () Bool)

(declare-fun b_and!23275 () Bool)

(assert (=> start!73306 (= tp!49663 b_and!23275)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((V!26633 0))(
  ( (V!26634 (val!8142 Int)) )
))
(declare-datatypes ((ValueCell!7655 0))(
  ( (ValueCellFull!7655 (v!10567 V!26633)) (EmptyCell!7655) )
))
(declare-datatypes ((array!48627 0))(
  ( (array!48628 (arr!23340 (Array (_ BitVec 32) ValueCell!7655)) (size!23781 (_ BitVec 32))) )
))
(declare-fun lt!383802 () array!48627)

(declare-fun bm!38056 () Bool)

(declare-datatypes ((array!48629 0))(
  ( (array!48630 (arr!23341 (Array (_ BitVec 32) (_ BitVec 64))) (size!23782 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48629)

(declare-datatypes ((tuple2!10602 0))(
  ( (tuple2!10603 (_1!5312 (_ BitVec 64)) (_2!5312 V!26633)) )
))
(declare-datatypes ((List!16460 0))(
  ( (Nil!16457) (Cons!16456 (h!17593 tuple2!10602) (t!22951 List!16460)) )
))
(declare-datatypes ((ListLongMap!9373 0))(
  ( (ListLongMap!9374 (toList!4702 List!16460)) )
))
(declare-fun call!38059 () ListLongMap!9373)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26633)

(declare-fun zeroValue!654 () V!26633)

(declare-fun getCurrentListMapNoExtraKeys!2760 (array!48629 array!48627 (_ BitVec 32) (_ BitVec 32) V!26633 V!26633 (_ BitVec 32) Int) ListLongMap!9373)

(assert (=> bm!38056 (= call!38059 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!383802 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852304 () Bool)

(declare-fun res!578663 () Bool)

(declare-fun e!475480 () Bool)

(assert (=> b!852304 (=> (not res!578663) (not e!475480))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48629 (_ BitVec 32)) Bool)

(assert (=> b!852304 (= res!578663 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!852305 () Bool)

(declare-fun res!578666 () Bool)

(assert (=> b!852305 (=> (not res!578666) (not e!475480))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!852305 (= res!578666 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23782 _keys!868))))))

(declare-fun b!852306 () Bool)

(declare-fun e!475483 () Bool)

(declare-fun e!475479 () Bool)

(declare-fun mapRes!25883 () Bool)

(assert (=> b!852306 (= e!475483 (and e!475479 mapRes!25883))))

(declare-fun condMapEmpty!25883 () Bool)

(declare-fun _values!688 () array!48627)

(declare-fun mapDefault!25883 () ValueCell!7655)

(assert (=> b!852306 (= condMapEmpty!25883 (= (arr!23340 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7655)) mapDefault!25883)))))

(declare-fun b!852307 () Bool)

(declare-fun res!578664 () Bool)

(assert (=> b!852307 (=> (not res!578664) (not e!475480))))

(declare-datatypes ((List!16461 0))(
  ( (Nil!16458) (Cons!16457 (h!17594 (_ BitVec 64)) (t!22952 List!16461)) )
))
(declare-fun arrayNoDuplicates!0 (array!48629 (_ BitVec 32) List!16461) Bool)

(assert (=> b!852307 (= res!578664 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16458))))

(declare-fun mapNonEmpty!25883 () Bool)

(declare-fun tp!49664 () Bool)

(declare-fun e!475486 () Bool)

(assert (=> mapNonEmpty!25883 (= mapRes!25883 (and tp!49664 e!475486))))

(declare-fun mapKey!25883 () (_ BitVec 32))

(declare-fun mapValue!25883 () ValueCell!7655)

(declare-fun mapRest!25883 () (Array (_ BitVec 32) ValueCell!7655))

(assert (=> mapNonEmpty!25883 (= (arr!23340 _values!688) (store mapRest!25883 mapKey!25883 mapValue!25883))))

(declare-fun v!557 () V!26633)

(declare-fun call!38060 () ListLongMap!9373)

(declare-fun e!475481 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!852308 () Bool)

(declare-fun +!2149 (ListLongMap!9373 tuple2!10602) ListLongMap!9373)

(assert (=> b!852308 (= e!475481 (= call!38059 (+!2149 call!38060 (tuple2!10603 k0!854 v!557))))))

(declare-fun b!852309 () Bool)

(declare-fun tp_is_empty!16189 () Bool)

(assert (=> b!852309 (= e!475486 tp_is_empty!16189)))

(declare-fun b!852310 () Bool)

(declare-fun res!578671 () Bool)

(assert (=> b!852310 (=> (not res!578671) (not e!475480))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!852310 (= res!578671 (validMask!0 mask!1196))))

(declare-fun mapIsEmpty!25883 () Bool)

(assert (=> mapIsEmpty!25883 mapRes!25883))

(declare-fun b!852303 () Bool)

(declare-fun e!475485 () Bool)

(assert (=> b!852303 (= e!475485 true)))

(declare-fun lt!383798 () tuple2!10602)

(declare-fun lt!383801 () ListLongMap!9373)

(declare-fun lt!383799 () V!26633)

(assert (=> b!852303 (= (+!2149 lt!383801 lt!383798) (+!2149 (+!2149 lt!383801 (tuple2!10603 k0!854 lt!383799)) lt!383798))))

(declare-fun lt!383797 () V!26633)

(assert (=> b!852303 (= lt!383798 (tuple2!10603 k0!854 lt!383797))))

(declare-datatypes ((Unit!29060 0))(
  ( (Unit!29061) )
))
(declare-fun lt!383795 () Unit!29060)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!278 (ListLongMap!9373 (_ BitVec 64) V!26633 V!26633) Unit!29060)

(assert (=> b!852303 (= lt!383795 (addSameAsAddTwiceSameKeyDiffValues!278 lt!383801 k0!854 lt!383799 lt!383797))))

(declare-fun lt!383800 () V!26633)

(declare-fun get!12293 (ValueCell!7655 V!26633) V!26633)

(assert (=> b!852303 (= lt!383799 (get!12293 (select (arr!23340 _values!688) from!1053) lt!383800))))

(declare-fun lt!383803 () ListLongMap!9373)

(assert (=> b!852303 (= lt!383803 (+!2149 lt!383801 (tuple2!10603 (select (arr!23341 _keys!868) from!1053) lt!383797)))))

(assert (=> b!852303 (= lt!383797 (get!12293 (select (store (arr!23340 _values!688) i!612 (ValueCellFull!7655 v!557)) from!1053) lt!383800))))

(declare-fun dynLambda!1025 (Int (_ BitVec 64)) V!26633)

(assert (=> b!852303 (= lt!383800 (dynLambda!1025 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!852303 (= lt!383801 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!383802 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578668 () Bool)

(assert (=> start!73306 (=> (not res!578668) (not e!475480))))

(assert (=> start!73306 (= res!578668 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23782 _keys!868))))))

(assert (=> start!73306 e!475480))

(assert (=> start!73306 tp_is_empty!16189))

(assert (=> start!73306 true))

(assert (=> start!73306 tp!49663))

(declare-fun array_inv!18564 (array!48629) Bool)

(assert (=> start!73306 (array_inv!18564 _keys!868)))

(declare-fun array_inv!18565 (array!48627) Bool)

(assert (=> start!73306 (and (array_inv!18565 _values!688) e!475483)))

(declare-fun b!852311 () Bool)

(declare-fun res!578669 () Bool)

(assert (=> b!852311 (=> (not res!578669) (not e!475480))))

(assert (=> b!852311 (= res!578669 (and (= (size!23781 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23782 _keys!868) (size!23781 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!38057 () Bool)

(assert (=> bm!38057 (= call!38060 (getCurrentListMapNoExtraKeys!2760 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852312 () Bool)

(declare-fun e!475482 () Bool)

(assert (=> b!852312 (= e!475482 (not e!475485))))

(declare-fun res!578665 () Bool)

(assert (=> b!852312 (=> res!578665 e!475485)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!852312 (= res!578665 (not (validKeyInArray!0 (select (arr!23341 _keys!868) from!1053))))))

(assert (=> b!852312 e!475481))

(declare-fun c!92032 () Bool)

(assert (=> b!852312 (= c!92032 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!383804 () Unit!29060)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!363 (array!48629 array!48627 (_ BitVec 32) (_ BitVec 32) V!26633 V!26633 (_ BitVec 32) (_ BitVec 64) V!26633 (_ BitVec 32) Int) Unit!29060)

(assert (=> b!852312 (= lt!383804 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!363 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!852313 () Bool)

(declare-fun res!578667 () Bool)

(assert (=> b!852313 (=> (not res!578667) (not e!475480))))

(assert (=> b!852313 (= res!578667 (validKeyInArray!0 k0!854))))

(declare-fun b!852314 () Bool)

(assert (=> b!852314 (= e!475479 tp_is_empty!16189)))

(declare-fun b!852315 () Bool)

(assert (=> b!852315 (= e!475480 e!475482)))

(declare-fun res!578670 () Bool)

(assert (=> b!852315 (=> (not res!578670) (not e!475482))))

(assert (=> b!852315 (= res!578670 (= from!1053 i!612))))

(assert (=> b!852315 (= lt!383803 (getCurrentListMapNoExtraKeys!2760 _keys!868 lt!383802 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!852315 (= lt!383802 (array!48628 (store (arr!23340 _values!688) i!612 (ValueCellFull!7655 v!557)) (size!23781 _values!688)))))

(declare-fun lt!383796 () ListLongMap!9373)

(assert (=> b!852315 (= lt!383796 (getCurrentListMapNoExtraKeys!2760 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!852316 () Bool)

(declare-fun res!578662 () Bool)

(assert (=> b!852316 (=> (not res!578662) (not e!475480))))

(assert (=> b!852316 (= res!578662 (and (= (select (arr!23341 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!852317 () Bool)

(assert (=> b!852317 (= e!475481 (= call!38059 call!38060))))

(assert (= (and start!73306 res!578668) b!852310))

(assert (= (and b!852310 res!578671) b!852311))

(assert (= (and b!852311 res!578669) b!852304))

(assert (= (and b!852304 res!578663) b!852307))

(assert (= (and b!852307 res!578664) b!852305))

(assert (= (and b!852305 res!578666) b!852313))

(assert (= (and b!852313 res!578667) b!852316))

(assert (= (and b!852316 res!578662) b!852315))

(assert (= (and b!852315 res!578670) b!852312))

(assert (= (and b!852312 c!92032) b!852308))

(assert (= (and b!852312 (not c!92032)) b!852317))

(assert (= (or b!852308 b!852317) bm!38056))

(assert (= (or b!852308 b!852317) bm!38057))

(assert (= (and b!852312 (not res!578665)) b!852303))

(assert (= (and b!852306 condMapEmpty!25883) mapIsEmpty!25883))

(assert (= (and b!852306 (not condMapEmpty!25883)) mapNonEmpty!25883))

(get-info :version)

(assert (= (and mapNonEmpty!25883 ((_ is ValueCellFull!7655) mapValue!25883)) b!852309))

(assert (= (and b!852306 ((_ is ValueCellFull!7655) mapDefault!25883)) b!852314))

(assert (= start!73306 b!852306))

(declare-fun b_lambda!11599 () Bool)

(assert (=> (not b_lambda!11599) (not b!852303)))

(declare-fun t!22950 () Bool)

(declare-fun tb!4347 () Bool)

(assert (=> (and start!73306 (= defaultEntry!696 defaultEntry!696) t!22950) tb!4347))

(declare-fun result!8313 () Bool)

(assert (=> tb!4347 (= result!8313 tp_is_empty!16189)))

(assert (=> b!852303 t!22950))

(declare-fun b_and!23277 () Bool)

(assert (= b_and!23275 (and (=> t!22950 result!8313) b_and!23277)))

(declare-fun m!793597 () Bool)

(assert (=> start!73306 m!793597))

(declare-fun m!793599 () Bool)

(assert (=> start!73306 m!793599))

(declare-fun m!793601 () Bool)

(assert (=> bm!38057 m!793601))

(declare-fun m!793603 () Bool)

(assert (=> b!852303 m!793603))

(declare-fun m!793605 () Bool)

(assert (=> b!852303 m!793605))

(declare-fun m!793607 () Bool)

(assert (=> b!852303 m!793607))

(declare-fun m!793609 () Bool)

(assert (=> b!852303 m!793609))

(declare-fun m!793611 () Bool)

(assert (=> b!852303 m!793611))

(declare-fun m!793613 () Bool)

(assert (=> b!852303 m!793613))

(assert (=> b!852303 m!793607))

(declare-fun m!793615 () Bool)

(assert (=> b!852303 m!793615))

(declare-fun m!793617 () Bool)

(assert (=> b!852303 m!793617))

(declare-fun m!793619 () Bool)

(assert (=> b!852303 m!793619))

(assert (=> b!852303 m!793611))

(declare-fun m!793621 () Bool)

(assert (=> b!852303 m!793621))

(declare-fun m!793623 () Bool)

(assert (=> b!852303 m!793623))

(declare-fun m!793625 () Bool)

(assert (=> b!852303 m!793625))

(declare-fun m!793627 () Bool)

(assert (=> b!852303 m!793627))

(assert (=> b!852303 m!793625))

(assert (=> bm!38056 m!793615))

(declare-fun m!793629 () Bool)

(assert (=> b!852308 m!793629))

(declare-fun m!793631 () Bool)

(assert (=> b!852307 m!793631))

(declare-fun m!793633 () Bool)

(assert (=> mapNonEmpty!25883 m!793633))

(declare-fun m!793635 () Bool)

(assert (=> b!852316 m!793635))

(assert (=> b!852312 m!793621))

(assert (=> b!852312 m!793621))

(declare-fun m!793637 () Bool)

(assert (=> b!852312 m!793637))

(declare-fun m!793639 () Bool)

(assert (=> b!852312 m!793639))

(declare-fun m!793641 () Bool)

(assert (=> b!852313 m!793641))

(declare-fun m!793643 () Bool)

(assert (=> b!852310 m!793643))

(declare-fun m!793645 () Bool)

(assert (=> b!852304 m!793645))

(declare-fun m!793647 () Bool)

(assert (=> b!852315 m!793647))

(assert (=> b!852315 m!793617))

(declare-fun m!793649 () Bool)

(assert (=> b!852315 m!793649))

(check-sat (not b_next!14053) (not b!852312) (not b_lambda!11599) (not b!852303) (not b!852315) (not b!852304) (not b!852313) (not bm!38056) (not b!852307) (not b!852308) (not b!852310) tp_is_empty!16189 b_and!23277 (not bm!38057) (not mapNonEmpty!25883) (not start!73306))
(check-sat b_and!23277 (not b_next!14053))
