; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73264 () Bool)

(assert start!73264)

(declare-fun b_free!14011 () Bool)

(declare-fun b_next!14011 () Bool)

(assert (=> start!73264 (= b_free!14011 (not b_next!14011))))

(declare-fun tp!49538 () Bool)

(declare-fun b_and!23191 () Bool)

(assert (=> start!73264 (= tp!49538 b_and!23191)))

(declare-datatypes ((V!26577 0))(
  ( (V!26578 (val!8121 Int)) )
))
(declare-datatypes ((ValueCell!7634 0))(
  ( (ValueCellFull!7634 (v!10546 V!26577)) (EmptyCell!7634) )
))
(declare-datatypes ((array!48549 0))(
  ( (array!48550 (arr!23301 (Array (_ BitVec 32) ValueCell!7634)) (size!23742 (_ BitVec 32))) )
))
(declare-fun lt!383169 () array!48549)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48551 0))(
  ( (array!48552 (arr!23302 (Array (_ BitVec 32) (_ BitVec 64))) (size!23743 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48551)

(declare-fun bm!37930 () Bool)

(declare-datatypes ((tuple2!10570 0))(
  ( (tuple2!10571 (_1!5296 (_ BitVec 64)) (_2!5296 V!26577)) )
))
(declare-datatypes ((List!16431 0))(
  ( (Nil!16428) (Cons!16427 (h!17564 tuple2!10570) (t!22880 List!16431)) )
))
(declare-datatypes ((ListLongMap!9341 0))(
  ( (ListLongMap!9342 (toList!4686 List!16431)) )
))
(declare-fun call!37933 () ListLongMap!9341)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26577)

(declare-fun zeroValue!654 () V!26577)

(declare-fun getCurrentListMapNoExtraKeys!2744 (array!48551 array!48549 (_ BitVec 32) (_ BitVec 32) V!26577 V!26577 (_ BitVec 32) Int) ListLongMap!9341)

(assert (=> bm!37930 (= call!37933 (getCurrentListMapNoExtraKeys!2744 _keys!868 lt!383169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851316 () Bool)

(declare-fun res!578038 () Bool)

(declare-fun e!474975 () Bool)

(assert (=> b!851316 (=> (not res!578038) (not e!474975))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851316 (= res!578038 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23743 _keys!868))))))

(declare-fun b!851317 () Bool)

(declare-fun res!578040 () Bool)

(assert (=> b!851317 (=> (not res!578040) (not e!474975))))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!851317 (= res!578040 (and (= (select (arr!23302 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!851318 () Bool)

(declare-fun e!474976 () Bool)

(declare-fun tp_is_empty!16147 () Bool)

(assert (=> b!851318 (= e!474976 tp_is_empty!16147)))

(declare-fun e!474981 () Bool)

(declare-fun v!557 () V!26577)

(declare-fun call!37934 () ListLongMap!9341)

(declare-fun b!851319 () Bool)

(declare-fun +!2135 (ListLongMap!9341 tuple2!10570) ListLongMap!9341)

(assert (=> b!851319 (= e!474981 (= call!37933 (+!2135 call!37934 (tuple2!10571 k0!854 v!557))))))

(declare-fun b!851320 () Bool)

(declare-fun e!474980 () Bool)

(assert (=> b!851320 (= e!474980 tp_is_empty!16147)))

(declare-fun mapNonEmpty!25820 () Bool)

(declare-fun mapRes!25820 () Bool)

(declare-fun tp!49537 () Bool)

(assert (=> mapNonEmpty!25820 (= mapRes!25820 (and tp!49537 e!474976))))

(declare-fun mapValue!25820 () ValueCell!7634)

(declare-fun _values!688 () array!48549)

(declare-fun mapKey!25820 () (_ BitVec 32))

(declare-fun mapRest!25820 () (Array (_ BitVec 32) ValueCell!7634))

(assert (=> mapNonEmpty!25820 (= (arr!23301 _values!688) (store mapRest!25820 mapKey!25820 mapValue!25820))))

(declare-fun b!851321 () Bool)

(declare-fun res!578039 () Bool)

(assert (=> b!851321 (=> (not res!578039) (not e!474975))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851321 (= res!578039 (validMask!0 mask!1196))))

(declare-fun b!851322 () Bool)

(declare-fun e!474978 () Bool)

(declare-fun e!474979 () Bool)

(assert (=> b!851322 (= e!474978 (not e!474979))))

(declare-fun res!578036 () Bool)

(assert (=> b!851322 (=> res!578036 e!474979)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851322 (= res!578036 (not (validKeyInArray!0 (select (arr!23302 _keys!868) from!1053))))))

(assert (=> b!851322 e!474981))

(declare-fun c!91969 () Bool)

(assert (=> b!851322 (= c!91969 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29034 0))(
  ( (Unit!29035) )
))
(declare-fun lt!383168 () Unit!29034)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!352 (array!48551 array!48549 (_ BitVec 32) (_ BitVec 32) V!26577 V!26577 (_ BitVec 32) (_ BitVec 64) V!26577 (_ BitVec 32) Int) Unit!29034)

(assert (=> b!851322 (= lt!383168 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!352 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851323 () Bool)

(declare-fun e!474977 () Bool)

(assert (=> b!851323 (= e!474977 (and e!474980 mapRes!25820))))

(declare-fun condMapEmpty!25820 () Bool)

(declare-fun mapDefault!25820 () ValueCell!7634)

(assert (=> b!851323 (= condMapEmpty!25820 (= (arr!23301 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7634)) mapDefault!25820)))))

(declare-fun b!851324 () Bool)

(declare-fun res!578033 () Bool)

(assert (=> b!851324 (=> (not res!578033) (not e!474975))))

(declare-datatypes ((List!16432 0))(
  ( (Nil!16429) (Cons!16428 (h!17565 (_ BitVec 64)) (t!22881 List!16432)) )
))
(declare-fun arrayNoDuplicates!0 (array!48551 (_ BitVec 32) List!16432) Bool)

(assert (=> b!851324 (= res!578033 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16429))))

(declare-fun b!851325 () Bool)

(assert (=> b!851325 (= e!474975 e!474978)))

(declare-fun res!578034 () Bool)

(assert (=> b!851325 (=> (not res!578034) (not e!474978))))

(assert (=> b!851325 (= res!578034 (= from!1053 i!612))))

(declare-fun lt!383172 () ListLongMap!9341)

(assert (=> b!851325 (= lt!383172 (getCurrentListMapNoExtraKeys!2744 _keys!868 lt!383169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!851325 (= lt!383169 (array!48550 (store (arr!23301 _values!688) i!612 (ValueCellFull!7634 v!557)) (size!23742 _values!688)))))

(declare-fun lt!383171 () ListLongMap!9341)

(assert (=> b!851325 (= lt!383171 (getCurrentListMapNoExtraKeys!2744 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851326 () Bool)

(assert (=> b!851326 (= e!474981 (= call!37933 call!37934))))

(declare-fun b!851327 () Bool)

(declare-fun res!578035 () Bool)

(assert (=> b!851327 (=> (not res!578035) (not e!474975))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48551 (_ BitVec 32)) Bool)

(assert (=> b!851327 (= res!578035 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37931 () Bool)

(assert (=> bm!37931 (= call!37934 (getCurrentListMapNoExtraKeys!2744 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851328 () Bool)

(declare-fun res!578032 () Bool)

(assert (=> b!851328 (=> (not res!578032) (not e!474975))))

(assert (=> b!851328 (= res!578032 (and (= (size!23742 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23743 _keys!868) (size!23742 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!851329 () Bool)

(assert (=> b!851329 (= e!474979 true)))

(declare-fun lt!383165 () tuple2!10570)

(declare-fun lt!383174 () V!26577)

(declare-fun lt!383173 () ListLongMap!9341)

(assert (=> b!851329 (= (+!2135 lt!383173 lt!383165) (+!2135 (+!2135 lt!383173 (tuple2!10571 k0!854 lt!383174)) lt!383165))))

(declare-fun lt!383170 () V!26577)

(assert (=> b!851329 (= lt!383165 (tuple2!10571 k0!854 lt!383170))))

(declare-fun lt!383167 () Unit!29034)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!265 (ListLongMap!9341 (_ BitVec 64) V!26577 V!26577) Unit!29034)

(assert (=> b!851329 (= lt!383167 (addSameAsAddTwiceSameKeyDiffValues!265 lt!383173 k0!854 lt!383174 lt!383170))))

(declare-fun lt!383166 () V!26577)

(declare-fun get!12266 (ValueCell!7634 V!26577) V!26577)

(assert (=> b!851329 (= lt!383174 (get!12266 (select (arr!23301 _values!688) from!1053) lt!383166))))

(assert (=> b!851329 (= lt!383172 (+!2135 lt!383173 (tuple2!10571 (select (arr!23302 _keys!868) from!1053) lt!383170)))))

(assert (=> b!851329 (= lt!383170 (get!12266 (select (store (arr!23301 _values!688) i!612 (ValueCellFull!7634 v!557)) from!1053) lt!383166))))

(declare-fun dynLambda!1012 (Int (_ BitVec 64)) V!26577)

(assert (=> b!851329 (= lt!383166 (dynLambda!1012 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(assert (=> b!851329 (= lt!383173 (getCurrentListMapNoExtraKeys!2744 _keys!868 lt!383169 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!578037 () Bool)

(assert (=> start!73264 (=> (not res!578037) (not e!474975))))

(assert (=> start!73264 (= res!578037 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23743 _keys!868))))))

(assert (=> start!73264 e!474975))

(assert (=> start!73264 tp_is_empty!16147))

(assert (=> start!73264 true))

(assert (=> start!73264 tp!49538))

(declare-fun array_inv!18538 (array!48551) Bool)

(assert (=> start!73264 (array_inv!18538 _keys!868)))

(declare-fun array_inv!18539 (array!48549) Bool)

(assert (=> start!73264 (and (array_inv!18539 _values!688) e!474977)))

(declare-fun b!851330 () Bool)

(declare-fun res!578041 () Bool)

(assert (=> b!851330 (=> (not res!578041) (not e!474975))))

(assert (=> b!851330 (= res!578041 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25820 () Bool)

(assert (=> mapIsEmpty!25820 mapRes!25820))

(assert (= (and start!73264 res!578037) b!851321))

(assert (= (and b!851321 res!578039) b!851328))

(assert (= (and b!851328 res!578032) b!851327))

(assert (= (and b!851327 res!578035) b!851324))

(assert (= (and b!851324 res!578033) b!851316))

(assert (= (and b!851316 res!578038) b!851330))

(assert (= (and b!851330 res!578041) b!851317))

(assert (= (and b!851317 res!578040) b!851325))

(assert (= (and b!851325 res!578034) b!851322))

(assert (= (and b!851322 c!91969) b!851319))

(assert (= (and b!851322 (not c!91969)) b!851326))

(assert (= (or b!851319 b!851326) bm!37930))

(assert (= (or b!851319 b!851326) bm!37931))

(assert (= (and b!851322 (not res!578036)) b!851329))

(assert (= (and b!851323 condMapEmpty!25820) mapIsEmpty!25820))

(assert (= (and b!851323 (not condMapEmpty!25820)) mapNonEmpty!25820))

(get-info :version)

(assert (= (and mapNonEmpty!25820 ((_ is ValueCellFull!7634) mapValue!25820)) b!851318))

(assert (= (and b!851323 ((_ is ValueCellFull!7634) mapDefault!25820)) b!851320))

(assert (= start!73264 b!851323))

(declare-fun b_lambda!11557 () Bool)

(assert (=> (not b_lambda!11557) (not b!851329)))

(declare-fun t!22879 () Bool)

(declare-fun tb!4305 () Bool)

(assert (=> (and start!73264 (= defaultEntry!696 defaultEntry!696) t!22879) tb!4305))

(declare-fun result!8229 () Bool)

(assert (=> tb!4305 (= result!8229 tp_is_empty!16147)))

(assert (=> b!851329 t!22879))

(declare-fun b_and!23193 () Bool)

(assert (= b_and!23191 (and (=> t!22879 result!8229) b_and!23193)))

(declare-fun m!792463 () Bool)

(assert (=> b!851327 m!792463))

(declare-fun m!792465 () Bool)

(assert (=> b!851317 m!792465))

(declare-fun m!792467 () Bool)

(assert (=> b!851324 m!792467))

(declare-fun m!792469 () Bool)

(assert (=> b!851330 m!792469))

(declare-fun m!792471 () Bool)

(assert (=> start!73264 m!792471))

(declare-fun m!792473 () Bool)

(assert (=> start!73264 m!792473))

(declare-fun m!792475 () Bool)

(assert (=> b!851329 m!792475))

(declare-fun m!792477 () Bool)

(assert (=> b!851329 m!792477))

(declare-fun m!792479 () Bool)

(assert (=> b!851329 m!792479))

(declare-fun m!792481 () Bool)

(assert (=> b!851329 m!792481))

(declare-fun m!792483 () Bool)

(assert (=> b!851329 m!792483))

(declare-fun m!792485 () Bool)

(assert (=> b!851329 m!792485))

(declare-fun m!792487 () Bool)

(assert (=> b!851329 m!792487))

(declare-fun m!792489 () Bool)

(assert (=> b!851329 m!792489))

(assert (=> b!851329 m!792477))

(declare-fun m!792491 () Bool)

(assert (=> b!851329 m!792491))

(assert (=> b!851329 m!792487))

(declare-fun m!792493 () Bool)

(assert (=> b!851329 m!792493))

(declare-fun m!792495 () Bool)

(assert (=> b!851329 m!792495))

(declare-fun m!792497 () Bool)

(assert (=> b!851329 m!792497))

(assert (=> b!851329 m!792485))

(declare-fun m!792499 () Bool)

(assert (=> b!851329 m!792499))

(declare-fun m!792501 () Bool)

(assert (=> bm!37931 m!792501))

(declare-fun m!792503 () Bool)

(assert (=> mapNonEmpty!25820 m!792503))

(declare-fun m!792505 () Bool)

(assert (=> b!851325 m!792505))

(assert (=> b!851325 m!792493))

(declare-fun m!792507 () Bool)

(assert (=> b!851325 m!792507))

(declare-fun m!792509 () Bool)

(assert (=> b!851319 m!792509))

(declare-fun m!792511 () Bool)

(assert (=> b!851321 m!792511))

(assert (=> b!851322 m!792495))

(assert (=> b!851322 m!792495))

(declare-fun m!792513 () Bool)

(assert (=> b!851322 m!792513))

(declare-fun m!792515 () Bool)

(assert (=> b!851322 m!792515))

(assert (=> bm!37930 m!792475))

(check-sat (not bm!37930) (not start!73264) (not b!851322) b_and!23193 (not b!851321) (not b!851327) (not bm!37931) (not b!851319) (not b!851330) (not b!851325) (not b_next!14011) (not b!851324) (not mapNonEmpty!25820) tp_is_empty!16147 (not b_lambda!11557) (not b!851329))
(check-sat b_and!23193 (not b_next!14011))
