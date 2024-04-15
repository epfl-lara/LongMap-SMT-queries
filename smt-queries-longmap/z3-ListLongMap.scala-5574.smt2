; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73210 () Bool)

(assert start!73210)

(declare-fun b_free!14143 () Bool)

(declare-fun b_next!14143 () Bool)

(assert (=> start!73210 (= b_free!14143 (not b_next!14143))))

(declare-fun tp!49934 () Bool)

(declare-fun b_and!23419 () Bool)

(assert (=> start!73210 (= tp!49934 b_and!23419)))

(declare-fun b!853277 () Bool)

(declare-fun e!475830 () Bool)

(declare-fun tp_is_empty!16279 () Bool)

(assert (=> b!853277 (= e!475830 tp_is_empty!16279)))

(declare-fun b!853278 () Bool)

(declare-fun res!579558 () Bool)

(declare-fun e!475832 () Bool)

(assert (=> b!853278 (=> (not res!579558) (not e!475832))))

(declare-datatypes ((array!48741 0))(
  ( (array!48742 (arr!23402 (Array (_ BitVec 32) (_ BitVec 64))) (size!23844 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48741)

(declare-datatypes ((List!16604 0))(
  ( (Nil!16601) (Cons!16600 (h!17731 (_ BitVec 64)) (t!23184 List!16604)) )
))
(declare-fun arrayNoDuplicates!0 (array!48741 (_ BitVec 32) List!16604) Bool)

(assert (=> b!853278 (= res!579558 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16601))))

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((V!26753 0))(
  ( (V!26754 (val!8187 Int)) )
))
(declare-datatypes ((ValueCell!7700 0))(
  ( (ValueCellFull!7700 (v!10606 V!26753)) (EmptyCell!7700) )
))
(declare-datatypes ((array!48743 0))(
  ( (array!48744 (arr!23403 (Array (_ BitVec 32) ValueCell!7700)) (size!23845 (_ BitVec 32))) )
))
(declare-fun lt!384556 () array!48743)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!38255 () Bool)

(declare-fun _values!688 () array!48743)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26753)

(declare-fun zeroValue!654 () V!26753)

(declare-fun c!91820 () Bool)

(declare-datatypes ((tuple2!10780 0))(
  ( (tuple2!10781 (_1!5401 (_ BitVec 64)) (_2!5401 V!26753)) )
))
(declare-datatypes ((List!16605 0))(
  ( (Nil!16602) (Cons!16601 (h!17732 tuple2!10780) (t!23185 List!16605)) )
))
(declare-datatypes ((ListLongMap!9539 0))(
  ( (ListLongMap!9540 (toList!4785 List!16605)) )
))
(declare-fun call!38258 () ListLongMap!9539)

(declare-fun getCurrentListMapNoExtraKeys!2793 (array!48741 array!48743 (_ BitVec 32) (_ BitVec 32) V!26753 V!26753 (_ BitVec 32) Int) ListLongMap!9539)

(assert (=> bm!38255 (= call!38258 (getCurrentListMapNoExtraKeys!2793 _keys!868 (ite c!91820 lt!384556 _values!688) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!26753)

(declare-fun b!853279 () Bool)

(declare-fun call!38259 () ListLongMap!9539)

(declare-fun e!475835 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2198 (ListLongMap!9539 tuple2!10780) ListLongMap!9539)

(assert (=> b!853279 (= e!475835 (= call!38258 (+!2198 call!38259 (tuple2!10781 k0!854 v!557))))))

(declare-fun b!853280 () Bool)

(declare-fun e!475831 () Bool)

(assert (=> b!853280 (= e!475831 true)))

(declare-fun lt!384552 () tuple2!10780)

(declare-fun lt!384555 () ListLongMap!9539)

(declare-fun lt!384557 () V!26753)

(assert (=> b!853280 (= (+!2198 lt!384555 lt!384552) (+!2198 (+!2198 lt!384555 (tuple2!10781 k0!854 lt!384557)) lt!384552))))

(declare-fun lt!384554 () V!26753)

(assert (=> b!853280 (= lt!384552 (tuple2!10781 k0!854 lt!384554))))

(declare-datatypes ((Unit!29067 0))(
  ( (Unit!29068) )
))
(declare-fun lt!384551 () Unit!29067)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!306 (ListLongMap!9539 (_ BitVec 64) V!26753 V!26753) Unit!29067)

(assert (=> b!853280 (= lt!384551 (addSameAsAddTwiceSameKeyDiffValues!306 lt!384555 k0!854 lt!384557 lt!384554))))

(declare-fun lt!384549 () V!26753)

(declare-fun get!12351 (ValueCell!7700 V!26753) V!26753)

(assert (=> b!853280 (= lt!384557 (get!12351 (select (arr!23403 _values!688) from!1053) lt!384549))))

(declare-fun lt!384553 () ListLongMap!9539)

(assert (=> b!853280 (= lt!384553 (+!2198 lt!384555 (tuple2!10781 (select (arr!23402 _keys!868) from!1053) lt!384554)))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!853280 (= lt!384554 (get!12351 (select (store (arr!23403 _values!688) i!612 (ValueCellFull!7700 v!557)) from!1053) lt!384549))))

(declare-fun dynLambda!1056 (Int (_ BitVec 64)) V!26753)

(assert (=> b!853280 (= lt!384549 (dynLambda!1056 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!853280 (= lt!384555 (getCurrentListMapNoExtraKeys!2793 _keys!868 lt!384556 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853281 () Bool)

(declare-fun e!475833 () Bool)

(declare-fun e!475836 () Bool)

(declare-fun mapRes!26018 () Bool)

(assert (=> b!853281 (= e!475833 (and e!475836 mapRes!26018))))

(declare-fun condMapEmpty!26018 () Bool)

(declare-fun mapDefault!26018 () ValueCell!7700)

(assert (=> b!853281 (= condMapEmpty!26018 (= (arr!23403 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7700)) mapDefault!26018)))))

(declare-fun b!853282 () Bool)

(declare-fun res!579565 () Bool)

(assert (=> b!853282 (=> (not res!579565) (not e!475832))))

(assert (=> b!853282 (= res!579565 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23844 _keys!868))))))

(declare-fun b!853283 () Bool)

(declare-fun res!579561 () Bool)

(assert (=> b!853283 (=> (not res!579561) (not e!475832))))

(assert (=> b!853283 (= res!579561 (and (= (size!23845 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23844 _keys!868) (size!23845 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!853276 () Bool)

(declare-fun res!579567 () Bool)

(assert (=> b!853276 (=> (not res!579567) (not e!475832))))

(assert (=> b!853276 (= res!579567 (and (= (select (arr!23402 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun res!579564 () Bool)

(assert (=> start!73210 (=> (not res!579564) (not e!475832))))

(assert (=> start!73210 (= res!579564 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23844 _keys!868))))))

(assert (=> start!73210 e!475832))

(assert (=> start!73210 tp_is_empty!16279))

(assert (=> start!73210 true))

(assert (=> start!73210 tp!49934))

(declare-fun array_inv!18638 (array!48741) Bool)

(assert (=> start!73210 (array_inv!18638 _keys!868)))

(declare-fun array_inv!18639 (array!48743) Bool)

(assert (=> start!73210 (and (array_inv!18639 _values!688) e!475833)))

(declare-fun b!853284 () Bool)

(declare-fun res!579560 () Bool)

(assert (=> b!853284 (=> (not res!579560) (not e!475832))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!853284 (= res!579560 (validKeyInArray!0 k0!854))))

(declare-fun b!853285 () Bool)

(declare-fun e!475829 () Bool)

(assert (=> b!853285 (= e!475829 (not e!475831))))

(declare-fun res!579566 () Bool)

(assert (=> b!853285 (=> res!579566 e!475831)))

(assert (=> b!853285 (= res!579566 (not (validKeyInArray!0 (select (arr!23402 _keys!868) from!1053))))))

(assert (=> b!853285 e!475835))

(assert (=> b!853285 (= c!91820 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!384550 () Unit!29067)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!400 (array!48741 array!48743 (_ BitVec 32) (_ BitVec 32) V!26753 V!26753 (_ BitVec 32) (_ BitVec 64) V!26753 (_ BitVec 32) Int) Unit!29067)

(assert (=> b!853285 (= lt!384550 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!400 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853286 () Bool)

(assert (=> b!853286 (= e!475836 tp_is_empty!16279)))

(declare-fun bm!38256 () Bool)

(assert (=> bm!38256 (= call!38259 (getCurrentListMapNoExtraKeys!2793 _keys!868 (ite c!91820 _values!688 lt!384556) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!853287 () Bool)

(declare-fun res!579563 () Bool)

(assert (=> b!853287 (=> (not res!579563) (not e!475832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48741 (_ BitVec 32)) Bool)

(assert (=> b!853287 (= res!579563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun mapIsEmpty!26018 () Bool)

(assert (=> mapIsEmpty!26018 mapRes!26018))

(declare-fun b!853288 () Bool)

(assert (=> b!853288 (= e!475832 e!475829)))

(declare-fun res!579562 () Bool)

(assert (=> b!853288 (=> (not res!579562) (not e!475829))))

(assert (=> b!853288 (= res!579562 (= from!1053 i!612))))

(assert (=> b!853288 (= lt!384553 (getCurrentListMapNoExtraKeys!2793 _keys!868 lt!384556 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!853288 (= lt!384556 (array!48744 (store (arr!23403 _values!688) i!612 (ValueCellFull!7700 v!557)) (size!23845 _values!688)))))

(declare-fun lt!384548 () ListLongMap!9539)

(assert (=> b!853288 (= lt!384548 (getCurrentListMapNoExtraKeys!2793 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun mapNonEmpty!26018 () Bool)

(declare-fun tp!49933 () Bool)

(assert (=> mapNonEmpty!26018 (= mapRes!26018 (and tp!49933 e!475830))))

(declare-fun mapKey!26018 () (_ BitVec 32))

(declare-fun mapRest!26018 () (Array (_ BitVec 32) ValueCell!7700))

(declare-fun mapValue!26018 () ValueCell!7700)

(assert (=> mapNonEmpty!26018 (= (arr!23403 _values!688) (store mapRest!26018 mapKey!26018 mapValue!26018))))

(declare-fun b!853289 () Bool)

(declare-fun res!579559 () Bool)

(assert (=> b!853289 (=> (not res!579559) (not e!475832))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!853289 (= res!579559 (validMask!0 mask!1196))))

(declare-fun b!853290 () Bool)

(assert (=> b!853290 (= e!475835 (= call!38259 call!38258))))

(assert (= (and start!73210 res!579564) b!853289))

(assert (= (and b!853289 res!579559) b!853283))

(assert (= (and b!853283 res!579561) b!853287))

(assert (= (and b!853287 res!579563) b!853278))

(assert (= (and b!853278 res!579558) b!853282))

(assert (= (and b!853282 res!579565) b!853284))

(assert (= (and b!853284 res!579560) b!853276))

(assert (= (and b!853276 res!579567) b!853288))

(assert (= (and b!853288 res!579562) b!853285))

(assert (= (and b!853285 c!91820) b!853279))

(assert (= (and b!853285 (not c!91820)) b!853290))

(assert (= (or b!853279 b!853290) bm!38256))

(assert (= (or b!853279 b!853290) bm!38255))

(assert (= (and b!853285 (not res!579566)) b!853280))

(assert (= (and b!853281 condMapEmpty!26018) mapIsEmpty!26018))

(assert (= (and b!853281 (not condMapEmpty!26018)) mapNonEmpty!26018))

(get-info :version)

(assert (= (and mapNonEmpty!26018 ((_ is ValueCellFull!7700) mapValue!26018)) b!853277))

(assert (= (and b!853281 ((_ is ValueCellFull!7700) mapDefault!26018)) b!853286))

(assert (= start!73210 b!853281))

(declare-fun b_lambda!11657 () Bool)

(assert (=> (not b_lambda!11657) (not b!853280)))

(declare-fun t!23183 () Bool)

(declare-fun tb!4437 () Bool)

(assert (=> (and start!73210 (= defaultEntry!696 defaultEntry!696) t!23183) tb!4437))

(declare-fun result!8493 () Bool)

(assert (=> tb!4437 (= result!8493 tp_is_empty!16279)))

(assert (=> b!853280 t!23183))

(declare-fun b_and!23421 () Bool)

(assert (= b_and!23419 (and (=> t!23183 result!8493) b_and!23421)))

(declare-fun m!793981 () Bool)

(assert (=> start!73210 m!793981))

(declare-fun m!793983 () Bool)

(assert (=> start!73210 m!793983))

(declare-fun m!793985 () Bool)

(assert (=> b!853284 m!793985))

(declare-fun m!793987 () Bool)

(assert (=> b!853287 m!793987))

(declare-fun m!793989 () Bool)

(assert (=> b!853288 m!793989))

(declare-fun m!793991 () Bool)

(assert (=> b!853288 m!793991))

(declare-fun m!793993 () Bool)

(assert (=> b!853288 m!793993))

(declare-fun m!793995 () Bool)

(assert (=> b!853285 m!793995))

(assert (=> b!853285 m!793995))

(declare-fun m!793997 () Bool)

(assert (=> b!853285 m!793997))

(declare-fun m!793999 () Bool)

(assert (=> b!853285 m!793999))

(declare-fun m!794001 () Bool)

(assert (=> mapNonEmpty!26018 m!794001))

(declare-fun m!794003 () Bool)

(assert (=> b!853279 m!794003))

(declare-fun m!794005 () Bool)

(assert (=> b!853278 m!794005))

(declare-fun m!794007 () Bool)

(assert (=> bm!38256 m!794007))

(declare-fun m!794009 () Bool)

(assert (=> bm!38255 m!794009))

(declare-fun m!794011 () Bool)

(assert (=> b!853276 m!794011))

(declare-fun m!794013 () Bool)

(assert (=> b!853289 m!794013))

(declare-fun m!794015 () Bool)

(assert (=> b!853280 m!794015))

(declare-fun m!794017 () Bool)

(assert (=> b!853280 m!794017))

(declare-fun m!794019 () Bool)

(assert (=> b!853280 m!794019))

(declare-fun m!794021 () Bool)

(assert (=> b!853280 m!794021))

(assert (=> b!853280 m!794015))

(declare-fun m!794023 () Bool)

(assert (=> b!853280 m!794023))

(declare-fun m!794025 () Bool)

(assert (=> b!853280 m!794025))

(declare-fun m!794027 () Bool)

(assert (=> b!853280 m!794027))

(assert (=> b!853280 m!794021))

(declare-fun m!794029 () Bool)

(assert (=> b!853280 m!794029))

(assert (=> b!853280 m!794025))

(declare-fun m!794031 () Bool)

(assert (=> b!853280 m!794031))

(assert (=> b!853280 m!793995))

(declare-fun m!794033 () Bool)

(assert (=> b!853280 m!794033))

(declare-fun m!794035 () Bool)

(assert (=> b!853280 m!794035))

(assert (=> b!853280 m!793991))

(check-sat (not start!73210) (not b!853285) b_and!23421 (not b_next!14143) (not b!853289) (not b!853280) (not b!853278) (not b!853284) (not bm!38255) (not bm!38256) (not mapNonEmpty!26018) (not b!853279) (not b!853288) (not b_lambda!11657) (not b!853287) tp_is_empty!16279)
(check-sat b_and!23421 (not b_next!14143))
