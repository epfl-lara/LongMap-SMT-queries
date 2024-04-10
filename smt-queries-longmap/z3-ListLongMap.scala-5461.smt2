; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72552 () Bool)

(assert start!72552)

(declare-fun b_free!13737 () Bool)

(declare-fun b_next!13737 () Bool)

(assert (=> start!72552 (= b_free!13737 (not b_next!13737))))

(declare-fun tp!48310 () Bool)

(declare-fun b_and!22823 () Bool)

(assert (=> start!72552 (= tp!48310 b_and!22823)))

(declare-fun b!842183 () Bool)

(declare-fun e!469746 () Bool)

(declare-fun e!469750 () Bool)

(declare-fun mapRes!25004 () Bool)

(assert (=> b!842183 (= e!469746 (and e!469750 mapRes!25004))))

(declare-fun condMapEmpty!25004 () Bool)

(declare-datatypes ((V!25851 0))(
  ( (V!25852 (val!7849 Int)) )
))
(declare-datatypes ((ValueCell!7362 0))(
  ( (ValueCellFull!7362 (v!10274 V!25851)) (EmptyCell!7362) )
))
(declare-datatypes ((array!47480 0))(
  ( (array!47481 (arr!22771 (Array (_ BitVec 32) ValueCell!7362)) (size!23211 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47480)

(declare-fun mapDefault!25004 () ValueCell!7362)

(assert (=> b!842183 (= condMapEmpty!25004 (= (arr!22771 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7362)) mapDefault!25004)))))

(declare-fun b!842184 () Bool)

(declare-fun e!469747 () Bool)

(declare-fun tp_is_empty!15603 () Bool)

(assert (=> b!842184 (= e!469747 tp_is_empty!15603)))

(declare-fun mapIsEmpty!25004 () Bool)

(assert (=> mapIsEmpty!25004 mapRes!25004))

(declare-fun b!842185 () Bool)

(declare-fun res!572434 () Bool)

(declare-fun e!469748 () Bool)

(assert (=> b!842185 (=> (not res!572434) (not e!469748))))

(declare-datatypes ((array!47482 0))(
  ( (array!47483 (arr!22772 (Array (_ BitVec 32) (_ BitVec 64))) (size!23212 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47482)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47482 (_ BitVec 32)) Bool)

(assert (=> b!842185 (= res!572434 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!842186 () Bool)

(declare-fun res!572440 () Bool)

(assert (=> b!842186 (=> (not res!572440) (not e!469748))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!842186 (= res!572440 (validKeyInArray!0 k0!854))))

(declare-fun b!842187 () Bool)

(declare-datatypes ((tuple2!10424 0))(
  ( (tuple2!10425 (_1!5223 (_ BitVec 64)) (_2!5223 V!25851)) )
))
(declare-datatypes ((List!16201 0))(
  ( (Nil!16198) (Cons!16197 (h!17328 tuple2!10424) (t!22572 List!16201)) )
))
(declare-datatypes ((ListLongMap!9193 0))(
  ( (ListLongMap!9194 (toList!4612 List!16201)) )
))
(declare-fun call!37445 () ListLongMap!9193)

(declare-fun v!557 () V!25851)

(declare-fun e!469749 () Bool)

(declare-fun call!37444 () ListLongMap!9193)

(declare-fun +!2073 (ListLongMap!9193 tuple2!10424) ListLongMap!9193)

(assert (=> b!842187 (= e!469749 (= call!37444 (+!2073 call!37445 (tuple2!10425 k0!854 v!557))))))

(declare-fun b!842188 () Bool)

(declare-fun res!572435 () Bool)

(assert (=> b!842188 (=> (not res!572435) (not e!469748))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!842188 (= res!572435 (and (= (select (arr!22772 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23212 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!842189 () Bool)

(assert (=> b!842189 (= e!469750 tp_is_empty!15603)))

(declare-fun b!842190 () Bool)

(declare-fun res!572439 () Bool)

(assert (=> b!842190 (=> (not res!572439) (not e!469748))))

(assert (=> b!842190 (= res!572439 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23212 _keys!868))))))

(declare-fun b!842191 () Bool)

(assert (=> b!842191 (= e!469749 (= call!37444 call!37445))))

(declare-fun b!842192 () Bool)

(assert (=> b!842192 (= e!469748 (not true))))

(assert (=> b!842192 e!469749))

(declare-fun c!91465 () Bool)

(assert (=> b!842192 (= c!91465 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28925 0))(
  ( (Unit!28926) )
))
(declare-fun lt!380971 () Unit!28925)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25851)

(declare-fun zeroValue!654 () V!25851)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!308 (array!47482 array!47480 (_ BitVec 32) (_ BitVec 32) V!25851 V!25851 (_ BitVec 32) (_ BitVec 64) V!25851 (_ BitVec 32) Int) Unit!28925)

(assert (=> b!842192 (= lt!380971 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!308 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842193 () Bool)

(declare-fun res!572438 () Bool)

(assert (=> b!842193 (=> (not res!572438) (not e!469748))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!842193 (= res!572438 (validMask!0 mask!1196))))

(declare-fun bm!37441 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2597 (array!47482 array!47480 (_ BitVec 32) (_ BitVec 32) V!25851 V!25851 (_ BitVec 32) Int) ListLongMap!9193)

(assert (=> bm!37441 (= call!37444 (getCurrentListMapNoExtraKeys!2597 _keys!868 (array!47481 (store (arr!22771 _values!688) i!612 (ValueCellFull!7362 v!557)) (size!23211 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!842194 () Bool)

(declare-fun res!572441 () Bool)

(assert (=> b!842194 (=> (not res!572441) (not e!469748))))

(declare-datatypes ((List!16202 0))(
  ( (Nil!16199) (Cons!16198 (h!17329 (_ BitVec 64)) (t!22573 List!16202)) )
))
(declare-fun arrayNoDuplicates!0 (array!47482 (_ BitVec 32) List!16202) Bool)

(assert (=> b!842194 (= res!572441 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16199))))

(declare-fun mapNonEmpty!25004 () Bool)

(declare-fun tp!48309 () Bool)

(assert (=> mapNonEmpty!25004 (= mapRes!25004 (and tp!48309 e!469747))))

(declare-fun mapRest!25004 () (Array (_ BitVec 32) ValueCell!7362))

(declare-fun mapValue!25004 () ValueCell!7362)

(declare-fun mapKey!25004 () (_ BitVec 32))

(assert (=> mapNonEmpty!25004 (= (arr!22771 _values!688) (store mapRest!25004 mapKey!25004 mapValue!25004))))

(declare-fun b!842195 () Bool)

(declare-fun res!572437 () Bool)

(assert (=> b!842195 (=> (not res!572437) (not e!469748))))

(assert (=> b!842195 (= res!572437 (and (= (size!23211 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23212 _keys!868) (size!23211 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37442 () Bool)

(assert (=> bm!37442 (= call!37445 (getCurrentListMapNoExtraKeys!2597 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!572436 () Bool)

(assert (=> start!72552 (=> (not res!572436) (not e!469748))))

(assert (=> start!72552 (= res!572436 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23212 _keys!868))))))

(assert (=> start!72552 e!469748))

(assert (=> start!72552 tp_is_empty!15603))

(assert (=> start!72552 true))

(assert (=> start!72552 tp!48310))

(declare-fun array_inv!18120 (array!47482) Bool)

(assert (=> start!72552 (array_inv!18120 _keys!868)))

(declare-fun array_inv!18121 (array!47480) Bool)

(assert (=> start!72552 (and (array_inv!18121 _values!688) e!469746)))

(assert (= (and start!72552 res!572436) b!842193))

(assert (= (and b!842193 res!572438) b!842195))

(assert (= (and b!842195 res!572437) b!842185))

(assert (= (and b!842185 res!572434) b!842194))

(assert (= (and b!842194 res!572441) b!842190))

(assert (= (and b!842190 res!572439) b!842186))

(assert (= (and b!842186 res!572440) b!842188))

(assert (= (and b!842188 res!572435) b!842192))

(assert (= (and b!842192 c!91465) b!842187))

(assert (= (and b!842192 (not c!91465)) b!842191))

(assert (= (or b!842187 b!842191) bm!37441))

(assert (= (or b!842187 b!842191) bm!37442))

(assert (= (and b!842183 condMapEmpty!25004) mapIsEmpty!25004))

(assert (= (and b!842183 (not condMapEmpty!25004)) mapNonEmpty!25004))

(get-info :version)

(assert (= (and mapNonEmpty!25004 ((_ is ValueCellFull!7362) mapValue!25004)) b!842184))

(assert (= (and b!842183 ((_ is ValueCellFull!7362) mapDefault!25004)) b!842189))

(assert (= start!72552 b!842183))

(declare-fun m!785375 () Bool)

(assert (=> bm!37442 m!785375))

(declare-fun m!785377 () Bool)

(assert (=> b!842193 m!785377))

(declare-fun m!785379 () Bool)

(assert (=> b!842186 m!785379))

(declare-fun m!785381 () Bool)

(assert (=> b!842192 m!785381))

(declare-fun m!785383 () Bool)

(assert (=> b!842185 m!785383))

(declare-fun m!785385 () Bool)

(assert (=> b!842188 m!785385))

(declare-fun m!785387 () Bool)

(assert (=> mapNonEmpty!25004 m!785387))

(declare-fun m!785389 () Bool)

(assert (=> bm!37441 m!785389))

(declare-fun m!785391 () Bool)

(assert (=> bm!37441 m!785391))

(declare-fun m!785393 () Bool)

(assert (=> b!842194 m!785393))

(declare-fun m!785395 () Bool)

(assert (=> b!842187 m!785395))

(declare-fun m!785397 () Bool)

(assert (=> start!72552 m!785397))

(declare-fun m!785399 () Bool)

(assert (=> start!72552 m!785399))

(check-sat b_and!22823 tp_is_empty!15603 (not b!842186) (not mapNonEmpty!25004) (not b!842193) (not bm!37442) (not b_next!13737) (not bm!37441) (not b!842194) (not b!842187) (not b!842192) (not start!72552) (not b!842185))
(check-sat b_and!22823 (not b_next!13737))
