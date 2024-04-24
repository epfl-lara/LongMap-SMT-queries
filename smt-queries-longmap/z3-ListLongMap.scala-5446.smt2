; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72628 () Bool)

(assert start!72628)

(declare-fun b_free!13645 () Bool)

(declare-fun b_next!13645 () Bool)

(assert (=> start!72628 (= b_free!13645 (not b_next!13645))))

(declare-fun tp!48034 () Bool)

(declare-fun b_and!22741 () Bool)

(assert (=> start!72628 (= tp!48034 b_and!22741)))

(declare-fun mapIsEmpty!24866 () Bool)

(declare-fun mapRes!24866 () Bool)

(assert (=> mapIsEmpty!24866 mapRes!24866))

(declare-fun b!841292 () Bool)

(declare-fun e!469501 () Bool)

(assert (=> b!841292 (= e!469501 (not true))))

(declare-fun e!469499 () Bool)

(assert (=> b!841292 e!469499))

(declare-fun c!91609 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841292 (= c!91609 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((V!25729 0))(
  ( (V!25730 (val!7803 Int)) )
))
(declare-fun v!557 () V!25729)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47317 0))(
  ( (array!47318 (arr!22685 (Array (_ BitVec 32) (_ BitVec 64))) (size!23126 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47317)

(declare-datatypes ((ValueCell!7316 0))(
  ( (ValueCellFull!7316 (v!10228 V!25729)) (EmptyCell!7316) )
))
(declare-datatypes ((array!47319 0))(
  ( (array!47320 (arr!22686 (Array (_ BitVec 32) ValueCell!7316)) (size!23127 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47319)

(declare-fun minValue!654 () V!25729)

(declare-fun zeroValue!654 () V!25729)

(declare-datatypes ((Unit!28878 0))(
  ( (Unit!28879) )
))
(declare-fun lt!381194 () Unit!28878)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!275 (array!47317 array!47319 (_ BitVec 32) (_ BitVec 32) V!25729 V!25729 (_ BitVec 32) (_ BitVec 64) V!25729 (_ BitVec 32) Int) Unit!28878)

(assert (=> b!841292 (= lt!381194 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841293 () Bool)

(declare-fun e!469503 () Bool)

(declare-fun tp_is_empty!15511 () Bool)

(assert (=> b!841293 (= e!469503 tp_is_empty!15511)))

(declare-fun mapNonEmpty!24866 () Bool)

(declare-fun tp!48035 () Bool)

(declare-fun e!469500 () Bool)

(assert (=> mapNonEmpty!24866 (= mapRes!24866 (and tp!48035 e!469500))))

(declare-fun mapValue!24866 () ValueCell!7316)

(declare-fun mapKey!24866 () (_ BitVec 32))

(declare-fun mapRest!24866 () (Array (_ BitVec 32) ValueCell!7316))

(assert (=> mapNonEmpty!24866 (= (arr!22686 _values!688) (store mapRest!24866 mapKey!24866 mapValue!24866))))

(declare-fun b!841294 () Bool)

(declare-fun e!469504 () Bool)

(assert (=> b!841294 (= e!469504 (and e!469503 mapRes!24866))))

(declare-fun condMapEmpty!24866 () Bool)

(declare-fun mapDefault!24866 () ValueCell!7316)

(assert (=> b!841294 (= condMapEmpty!24866 (= (arr!22686 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7316)) mapDefault!24866)))))

(declare-fun b!841295 () Bool)

(declare-fun res!571680 () Bool)

(assert (=> b!841295 (=> (not res!571680) (not e!469501))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841295 (= res!571680 (validKeyInArray!0 k0!854))))

(declare-fun b!841296 () Bool)

(declare-fun res!571677 () Bool)

(assert (=> b!841296 (=> (not res!571677) (not e!469501))))

(assert (=> b!841296 (= res!571677 (and (= (select (arr!22685 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23126 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841297 () Bool)

(declare-fun res!571676 () Bool)

(assert (=> b!841297 (=> (not res!571676) (not e!469501))))

(assert (=> b!841297 (= res!571676 (and (= (size!23127 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23126 _keys!868) (size!23127 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841298 () Bool)

(assert (=> b!841298 (= e!469500 tp_is_empty!15511)))

(declare-fun res!571681 () Bool)

(assert (=> start!72628 (=> (not res!571681) (not e!469501))))

(assert (=> start!72628 (= res!571681 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23126 _keys!868))))))

(assert (=> start!72628 e!469501))

(assert (=> start!72628 tp_is_empty!15511))

(assert (=> start!72628 true))

(assert (=> start!72628 tp!48034))

(declare-fun array_inv!18100 (array!47317) Bool)

(assert (=> start!72628 (array_inv!18100 _keys!868)))

(declare-fun array_inv!18101 (array!47319) Bool)

(assert (=> start!72628 (and (array_inv!18101 _values!688) e!469504)))

(declare-datatypes ((tuple2!10270 0))(
  ( (tuple2!10271 (_1!5146 (_ BitVec 64)) (_2!5146 V!25729)) )
))
(declare-datatypes ((List!16046 0))(
  ( (Nil!16043) (Cons!16042 (h!17179 tuple2!10270) (t!22409 List!16046)) )
))
(declare-datatypes ((ListLongMap!9041 0))(
  ( (ListLongMap!9042 (toList!4536 List!16046)) )
))
(declare-fun call!37213 () ListLongMap!9041)

(declare-fun b!841299 () Bool)

(declare-fun call!37214 () ListLongMap!9041)

(declare-fun +!2045 (ListLongMap!9041 tuple2!10270) ListLongMap!9041)

(assert (=> b!841299 (= e!469499 (= call!37214 (+!2045 call!37213 (tuple2!10271 k0!854 v!557))))))

(declare-fun b!841300 () Bool)

(declare-fun res!571678 () Bool)

(assert (=> b!841300 (=> (not res!571678) (not e!469501))))

(declare-datatypes ((List!16047 0))(
  ( (Nil!16044) (Cons!16043 (h!17180 (_ BitVec 64)) (t!22410 List!16047)) )
))
(declare-fun arrayNoDuplicates!0 (array!47317 (_ BitVec 32) List!16047) Bool)

(assert (=> b!841300 (= res!571678 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16044))))

(declare-fun b!841301 () Bool)

(assert (=> b!841301 (= e!469499 (= call!37214 call!37213))))

(declare-fun b!841302 () Bool)

(declare-fun res!571675 () Bool)

(assert (=> b!841302 (=> (not res!571675) (not e!469501))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47317 (_ BitVec 32)) Bool)

(assert (=> b!841302 (= res!571675 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841303 () Bool)

(declare-fun res!571674 () Bool)

(assert (=> b!841303 (=> (not res!571674) (not e!469501))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841303 (= res!571674 (validMask!0 mask!1196))))

(declare-fun bm!37210 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2597 (array!47317 array!47319 (_ BitVec 32) (_ BitVec 32) V!25729 V!25729 (_ BitVec 32) Int) ListLongMap!9041)

(assert (=> bm!37210 (= call!37214 (getCurrentListMapNoExtraKeys!2597 _keys!868 (array!47320 (store (arr!22686 _values!688) i!612 (ValueCellFull!7316 v!557)) (size!23127 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841304 () Bool)

(declare-fun res!571679 () Bool)

(assert (=> b!841304 (=> (not res!571679) (not e!469501))))

(assert (=> b!841304 (= res!571679 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23126 _keys!868))))))

(declare-fun bm!37211 () Bool)

(assert (=> bm!37211 (= call!37213 (getCurrentListMapNoExtraKeys!2597 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72628 res!571681) b!841303))

(assert (= (and b!841303 res!571674) b!841297))

(assert (= (and b!841297 res!571676) b!841302))

(assert (= (and b!841302 res!571675) b!841300))

(assert (= (and b!841300 res!571678) b!841304))

(assert (= (and b!841304 res!571679) b!841295))

(assert (= (and b!841295 res!571680) b!841296))

(assert (= (and b!841296 res!571677) b!841292))

(assert (= (and b!841292 c!91609) b!841299))

(assert (= (and b!841292 (not c!91609)) b!841301))

(assert (= (or b!841299 b!841301) bm!37210))

(assert (= (or b!841299 b!841301) bm!37211))

(assert (= (and b!841294 condMapEmpty!24866) mapIsEmpty!24866))

(assert (= (and b!841294 (not condMapEmpty!24866)) mapNonEmpty!24866))

(get-info :version)

(assert (= (and mapNonEmpty!24866 ((_ is ValueCellFull!7316) mapValue!24866)) b!841298))

(assert (= (and b!841294 ((_ is ValueCellFull!7316) mapDefault!24866)) b!841293))

(assert (= start!72628 b!841294))

(declare-fun m!785471 () Bool)

(assert (=> b!841292 m!785471))

(declare-fun m!785473 () Bool)

(assert (=> start!72628 m!785473))

(declare-fun m!785475 () Bool)

(assert (=> start!72628 m!785475))

(declare-fun m!785477 () Bool)

(assert (=> mapNonEmpty!24866 m!785477))

(declare-fun m!785479 () Bool)

(assert (=> bm!37210 m!785479))

(declare-fun m!785481 () Bool)

(assert (=> bm!37210 m!785481))

(declare-fun m!785483 () Bool)

(assert (=> b!841296 m!785483))

(declare-fun m!785485 () Bool)

(assert (=> b!841295 m!785485))

(declare-fun m!785487 () Bool)

(assert (=> b!841299 m!785487))

(declare-fun m!785489 () Bool)

(assert (=> b!841300 m!785489))

(declare-fun m!785491 () Bool)

(assert (=> b!841302 m!785491))

(declare-fun m!785493 () Bool)

(assert (=> b!841303 m!785493))

(declare-fun m!785495 () Bool)

(assert (=> bm!37211 m!785495))

(check-sat tp_is_empty!15511 (not mapNonEmpty!24866) (not b!841299) (not bm!37211) (not b!841292) (not b!841302) b_and!22741 (not start!72628) (not b!841295) (not bm!37210) (not b!841303) (not b!841300) (not b_next!13645))
(check-sat b_and!22741 (not b_next!13645))
