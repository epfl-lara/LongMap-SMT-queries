; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73092 () Bool)

(assert start!73092)

(declare-fun b_free!14007 () Bool)

(declare-fun b_next!14007 () Bool)

(assert (=> start!73092 (= b_free!14007 (not b_next!14007))))

(declare-fun tp!49524 () Bool)

(declare-fun b_and!23173 () Bool)

(assert (=> start!73092 (= tp!49524 b_and!23173)))

(declare-fun b!850319 () Bool)

(declare-fun e!474348 () Bool)

(assert (=> b!850319 (= e!474348 true)))

(declare-datatypes ((V!26571 0))(
  ( (V!26572 (val!8119 Int)) )
))
(declare-datatypes ((tuple2!10640 0))(
  ( (tuple2!10641 (_1!5331 (_ BitVec 64)) (_2!5331 V!26571)) )
))
(declare-fun lt!382746 () tuple2!10640)

(declare-datatypes ((List!16484 0))(
  ( (Nil!16481) (Cons!16480 (h!17611 tuple2!10640) (t!22937 List!16484)) )
))
(declare-datatypes ((ListLongMap!9409 0))(
  ( (ListLongMap!9410 (toList!4720 List!16484)) )
))
(declare-fun lt!382747 () ListLongMap!9409)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun lt!382750 () V!26571)

(declare-fun +!2122 (ListLongMap!9409 tuple2!10640) ListLongMap!9409)

(assert (=> b!850319 (= (+!2122 lt!382747 lt!382746) (+!2122 (+!2122 lt!382747 (tuple2!10641 k0!854 lt!382750)) lt!382746))))

(declare-fun lt!382745 () V!26571)

(assert (=> b!850319 (= lt!382746 (tuple2!10641 k0!854 lt!382745))))

(declare-datatypes ((Unit!29035 0))(
  ( (Unit!29036) )
))
(declare-fun lt!382753 () Unit!29035)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!258 (ListLongMap!9409 (_ BitVec 64) V!26571 V!26571) Unit!29035)

(assert (=> b!850319 (= lt!382753 (addSameAsAddTwiceSameKeyDiffValues!258 lt!382747 k0!854 lt!382750 lt!382745))))

(declare-fun lt!382744 () V!26571)

(declare-fun from!1053 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7632 0))(
  ( (ValueCellFull!7632 (v!10544 V!26571)) (EmptyCell!7632) )
))
(declare-datatypes ((array!48490 0))(
  ( (array!48491 (arr!23276 (Array (_ BitVec 32) ValueCell!7632)) (size!23716 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48490)

(declare-fun get!12258 (ValueCell!7632 V!26571) V!26571)

(assert (=> b!850319 (= lt!382750 (get!12258 (select (arr!23276 _values!688) from!1053) lt!382744))))

(declare-fun lt!382752 () ListLongMap!9409)

(declare-datatypes ((array!48492 0))(
  ( (array!48493 (arr!23277 (Array (_ BitVec 32) (_ BitVec 64))) (size!23717 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48492)

(assert (=> b!850319 (= lt!382752 (+!2122 lt!382747 (tuple2!10641 (select (arr!23277 _keys!868) from!1053) lt!382745)))))

(declare-fun v!557 () V!26571)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!850319 (= lt!382745 (get!12258 (select (store (arr!23276 _values!688) i!612 (ValueCellFull!7632 v!557)) from!1053) lt!382744))))

(declare-fun defaultEntry!696 () Int)

(declare-fun dynLambda!1012 (Int (_ BitVec 64)) V!26571)

(assert (=> b!850319 (= lt!382744 (dynLambda!1012 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!382749 () array!48490)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun minValue!654 () V!26571)

(declare-fun zeroValue!654 () V!26571)

(declare-fun getCurrentListMapNoExtraKeys!2702 (array!48492 array!48490 (_ BitVec 32) (_ BitVec 32) V!26571 V!26571 (_ BitVec 32) Int) ListLongMap!9409)

(assert (=> b!850319 (= lt!382747 (getCurrentListMapNoExtraKeys!2702 _keys!868 lt!382749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850320 () Bool)

(declare-fun e!474350 () Bool)

(declare-fun tp_is_empty!16143 () Bool)

(assert (=> b!850320 (= e!474350 tp_is_empty!16143)))

(declare-fun b!850321 () Bool)

(declare-fun e!474345 () Bool)

(declare-fun e!474346 () Bool)

(declare-fun mapRes!25814 () Bool)

(assert (=> b!850321 (= e!474345 (and e!474346 mapRes!25814))))

(declare-fun condMapEmpty!25814 () Bool)

(declare-fun mapDefault!25814 () ValueCell!7632)

(assert (=> b!850321 (= condMapEmpty!25814 (= (arr!23276 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7632)) mapDefault!25814)))))

(declare-fun call!37876 () ListLongMap!9409)

(declare-fun b!850322 () Bool)

(declare-fun e!474352 () Bool)

(declare-fun call!37877 () ListLongMap!9409)

(assert (=> b!850322 (= e!474352 (= call!37877 (+!2122 call!37876 (tuple2!10641 k0!854 v!557))))))

(declare-fun b!850323 () Bool)

(declare-fun e!474349 () Bool)

(declare-fun e!474347 () Bool)

(assert (=> b!850323 (= e!474349 e!474347)))

(declare-fun res!577630 () Bool)

(assert (=> b!850323 (=> (not res!577630) (not e!474347))))

(assert (=> b!850323 (= res!577630 (= from!1053 i!612))))

(assert (=> b!850323 (= lt!382752 (getCurrentListMapNoExtraKeys!2702 _keys!868 lt!382749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!850323 (= lt!382749 (array!48491 (store (arr!23276 _values!688) i!612 (ValueCellFull!7632 v!557)) (size!23716 _values!688)))))

(declare-fun lt!382751 () ListLongMap!9409)

(assert (=> b!850323 (= lt!382751 (getCurrentListMapNoExtraKeys!2702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!850324 () Bool)

(declare-fun res!577632 () Bool)

(assert (=> b!850324 (=> (not res!577632) (not e!474349))))

(assert (=> b!850324 (= res!577632 (and (= (size!23716 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23717 _keys!868) (size!23716 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37873 () Bool)

(assert (=> bm!37873 (= call!37877 (getCurrentListMapNoExtraKeys!2702 _keys!868 lt!382749 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850325 () Bool)

(declare-fun res!577635 () Bool)

(assert (=> b!850325 (=> (not res!577635) (not e!474349))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!850325 (= res!577635 (validMask!0 mask!1196))))

(declare-fun res!577629 () Bool)

(assert (=> start!73092 (=> (not res!577629) (not e!474349))))

(assert (=> start!73092 (= res!577629 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23717 _keys!868))))))

(assert (=> start!73092 e!474349))

(assert (=> start!73092 tp_is_empty!16143))

(assert (=> start!73092 true))

(assert (=> start!73092 tp!49524))

(declare-fun array_inv!18472 (array!48492) Bool)

(assert (=> start!73092 (array_inv!18472 _keys!868)))

(declare-fun array_inv!18473 (array!48490) Bool)

(assert (=> start!73092 (and (array_inv!18473 _values!688) e!474345)))

(declare-fun b!850326 () Bool)

(assert (=> b!850326 (= e!474352 (= call!37877 call!37876))))

(declare-fun mapNonEmpty!25814 () Bool)

(declare-fun tp!49525 () Bool)

(assert (=> mapNonEmpty!25814 (= mapRes!25814 (and tp!49525 e!474350))))

(declare-fun mapKey!25814 () (_ BitVec 32))

(declare-fun mapRest!25814 () (Array (_ BitVec 32) ValueCell!7632))

(declare-fun mapValue!25814 () ValueCell!7632)

(assert (=> mapNonEmpty!25814 (= (arr!23276 _values!688) (store mapRest!25814 mapKey!25814 mapValue!25814))))

(declare-fun b!850327 () Bool)

(declare-fun res!577636 () Bool)

(assert (=> b!850327 (=> (not res!577636) (not e!474349))))

(assert (=> b!850327 (= res!577636 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23717 _keys!868))))))

(declare-fun mapIsEmpty!25814 () Bool)

(assert (=> mapIsEmpty!25814 mapRes!25814))

(declare-fun bm!37874 () Bool)

(assert (=> bm!37874 (= call!37876 (getCurrentListMapNoExtraKeys!2702 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850328 () Bool)

(assert (=> b!850328 (= e!474346 tp_is_empty!16143)))

(declare-fun b!850329 () Bool)

(declare-fun res!577634 () Bool)

(assert (=> b!850329 (=> (not res!577634) (not e!474349))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48492 (_ BitVec 32)) Bool)

(assert (=> b!850329 (= res!577634 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!850330 () Bool)

(declare-fun res!577633 () Bool)

(assert (=> b!850330 (=> (not res!577633) (not e!474349))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!850330 (= res!577633 (validKeyInArray!0 k0!854))))

(declare-fun b!850331 () Bool)

(declare-fun res!577628 () Bool)

(assert (=> b!850331 (=> (not res!577628) (not e!474349))))

(declare-datatypes ((List!16485 0))(
  ( (Nil!16482) (Cons!16481 (h!17612 (_ BitVec 64)) (t!22938 List!16485)) )
))
(declare-fun arrayNoDuplicates!0 (array!48492 (_ BitVec 32) List!16485) Bool)

(assert (=> b!850331 (= res!577628 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16482))))

(declare-fun b!850332 () Bool)

(assert (=> b!850332 (= e!474347 (not e!474348))))

(declare-fun res!577631 () Bool)

(assert (=> b!850332 (=> res!577631 e!474348)))

(assert (=> b!850332 (= res!577631 (not (validKeyInArray!0 (select (arr!23277 _keys!868) from!1053))))))

(assert (=> b!850332 e!474352))

(declare-fun c!91681 () Bool)

(assert (=> b!850332 (= c!91681 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun lt!382748 () Unit!29035)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!361 (array!48492 array!48490 (_ BitVec 32) (_ BitVec 32) V!26571 V!26571 (_ BitVec 32) (_ BitVec 64) V!26571 (_ BitVec 32) Int) Unit!29035)

(assert (=> b!850332 (= lt!382748 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!361 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!850333 () Bool)

(declare-fun res!577637 () Bool)

(assert (=> b!850333 (=> (not res!577637) (not e!474349))))

(assert (=> b!850333 (= res!577637 (and (= (select (arr!23277 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(assert (= (and start!73092 res!577629) b!850325))

(assert (= (and b!850325 res!577635) b!850324))

(assert (= (and b!850324 res!577632) b!850329))

(assert (= (and b!850329 res!577634) b!850331))

(assert (= (and b!850331 res!577628) b!850327))

(assert (= (and b!850327 res!577636) b!850330))

(assert (= (and b!850330 res!577633) b!850333))

(assert (= (and b!850333 res!577637) b!850323))

(assert (= (and b!850323 res!577630) b!850332))

(assert (= (and b!850332 c!91681) b!850322))

(assert (= (and b!850332 (not c!91681)) b!850326))

(assert (= (or b!850322 b!850326) bm!37873))

(assert (= (or b!850322 b!850326) bm!37874))

(assert (= (and b!850332 (not res!577631)) b!850319))

(assert (= (and b!850321 condMapEmpty!25814) mapIsEmpty!25814))

(assert (= (and b!850321 (not condMapEmpty!25814)) mapNonEmpty!25814))

(get-info :version)

(assert (= (and mapNonEmpty!25814 ((_ is ValueCellFull!7632) mapValue!25814)) b!850320))

(assert (= (and b!850321 ((_ is ValueCellFull!7632) mapDefault!25814)) b!850328))

(assert (= start!73092 b!850321))

(declare-fun b_lambda!11539 () Bool)

(assert (=> (not b_lambda!11539) (not b!850319)))

(declare-fun t!22936 () Bool)

(declare-fun tb!4309 () Bool)

(assert (=> (and start!73092 (= defaultEntry!696 defaultEntry!696) t!22936) tb!4309))

(declare-fun result!8229 () Bool)

(assert (=> tb!4309 (= result!8229 tp_is_empty!16143)))

(assert (=> b!850319 t!22936))

(declare-fun b_and!23175 () Bool)

(assert (= b_and!23173 (and (=> t!22936 result!8229) b_and!23175)))

(declare-fun m!791061 () Bool)

(assert (=> start!73092 m!791061))

(declare-fun m!791063 () Bool)

(assert (=> start!73092 m!791063))

(declare-fun m!791065 () Bool)

(assert (=> b!850331 m!791065))

(declare-fun m!791067 () Bool)

(assert (=> bm!37873 m!791067))

(declare-fun m!791069 () Bool)

(assert (=> b!850333 m!791069))

(declare-fun m!791071 () Bool)

(assert (=> b!850332 m!791071))

(assert (=> b!850332 m!791071))

(declare-fun m!791073 () Bool)

(assert (=> b!850332 m!791073))

(declare-fun m!791075 () Bool)

(assert (=> b!850332 m!791075))

(declare-fun m!791077 () Bool)

(assert (=> b!850323 m!791077))

(declare-fun m!791079 () Bool)

(assert (=> b!850323 m!791079))

(declare-fun m!791081 () Bool)

(assert (=> b!850323 m!791081))

(declare-fun m!791083 () Bool)

(assert (=> b!850330 m!791083))

(declare-fun m!791085 () Bool)

(assert (=> b!850329 m!791085))

(declare-fun m!791087 () Bool)

(assert (=> b!850322 m!791087))

(declare-fun m!791089 () Bool)

(assert (=> mapNonEmpty!25814 m!791089))

(declare-fun m!791091 () Bool)

(assert (=> b!850325 m!791091))

(declare-fun m!791093 () Bool)

(assert (=> b!850319 m!791093))

(declare-fun m!791095 () Bool)

(assert (=> b!850319 m!791095))

(declare-fun m!791097 () Bool)

(assert (=> b!850319 m!791097))

(declare-fun m!791099 () Bool)

(assert (=> b!850319 m!791099))

(assert (=> b!850319 m!791099))

(declare-fun m!791101 () Bool)

(assert (=> b!850319 m!791101))

(assert (=> b!850319 m!791095))

(declare-fun m!791103 () Bool)

(assert (=> b!850319 m!791103))

(assert (=> b!850319 m!791067))

(declare-fun m!791105 () Bool)

(assert (=> b!850319 m!791105))

(assert (=> b!850319 m!791103))

(declare-fun m!791107 () Bool)

(assert (=> b!850319 m!791107))

(assert (=> b!850319 m!791071))

(declare-fun m!791109 () Bool)

(assert (=> b!850319 m!791109))

(declare-fun m!791111 () Bool)

(assert (=> b!850319 m!791111))

(assert (=> b!850319 m!791079))

(declare-fun m!791113 () Bool)

(assert (=> bm!37874 m!791113))

(check-sat (not start!73092) (not b!850323) (not b!850325) (not bm!37874) tp_is_empty!16143 (not b!850331) (not mapNonEmpty!25814) (not b!850332) (not b_next!14007) (not bm!37873) (not b!850319) (not b_lambda!11539) (not b!850330) b_and!23175 (not b!850329) (not b!850322))
(check-sat b_and!23175 (not b_next!14007))
