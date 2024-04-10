; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72522 () Bool)

(assert start!72522)

(declare-fun b_free!13707 () Bool)

(declare-fun b_next!13707 () Bool)

(assert (=> start!72522 (= b_free!13707 (not b_next!13707))))

(declare-fun tp!48220 () Bool)

(declare-fun b_and!22793 () Bool)

(assert (=> start!72522 (= tp!48220 b_and!22793)))

(declare-fun b!841598 () Bool)

(declare-fun res!572077 () Bool)

(declare-fun e!469475 () Bool)

(assert (=> b!841598 (=> (not res!572077) (not e!469475))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47422 0))(
  ( (array!47423 (arr!22742 (Array (_ BitVec 32) (_ BitVec 64))) (size!23182 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47422)

(assert (=> b!841598 (= res!572077 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23182 _keys!868))))))

(declare-fun b!841599 () Bool)

(declare-fun res!572074 () Bool)

(assert (=> b!841599 (=> (not res!572074) (not e!469475))))

(declare-datatypes ((List!16177 0))(
  ( (Nil!16174) (Cons!16173 (h!17304 (_ BitVec 64)) (t!22548 List!16177)) )
))
(declare-fun arrayNoDuplicates!0 (array!47422 (_ BitVec 32) List!16177) Bool)

(assert (=> b!841599 (= res!572074 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16174))))

(declare-fun b!841600 () Bool)

(declare-fun res!572079 () Bool)

(assert (=> b!841600 (=> (not res!572079) (not e!469475))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841600 (= res!572079 (validKeyInArray!0 k0!854))))

(declare-fun mapNonEmpty!24959 () Bool)

(declare-fun mapRes!24959 () Bool)

(declare-fun tp!48219 () Bool)

(declare-fun e!469476 () Bool)

(assert (=> mapNonEmpty!24959 (= mapRes!24959 (and tp!48219 e!469476))))

(declare-datatypes ((V!25811 0))(
  ( (V!25812 (val!7834 Int)) )
))
(declare-datatypes ((ValueCell!7347 0))(
  ( (ValueCellFull!7347 (v!10259 V!25811)) (EmptyCell!7347) )
))
(declare-fun mapValue!24959 () ValueCell!7347)

(declare-fun mapKey!24959 () (_ BitVec 32))

(declare-fun mapRest!24959 () (Array (_ BitVec 32) ValueCell!7347))

(declare-datatypes ((array!47424 0))(
  ( (array!47425 (arr!22743 (Array (_ BitVec 32) ValueCell!7347)) (size!23183 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47424)

(assert (=> mapNonEmpty!24959 (= (arr!22743 _values!688) (store mapRest!24959 mapKey!24959 mapValue!24959))))

(declare-fun b!841601 () Bool)

(declare-fun e!469480 () Bool)

(declare-datatypes ((tuple2!10398 0))(
  ( (tuple2!10399 (_1!5210 (_ BitVec 64)) (_2!5210 V!25811)) )
))
(declare-datatypes ((List!16178 0))(
  ( (Nil!16175) (Cons!16174 (h!17305 tuple2!10398) (t!22549 List!16178)) )
))
(declare-datatypes ((ListLongMap!9167 0))(
  ( (ListLongMap!9168 (toList!4599 List!16178)) )
))
(declare-fun call!37355 () ListLongMap!9167)

(declare-fun call!37354 () ListLongMap!9167)

(assert (=> b!841601 (= e!469480 (= call!37355 call!37354))))

(declare-fun b!841602 () Bool)

(declare-fun e!469477 () Bool)

(declare-fun e!469478 () Bool)

(assert (=> b!841602 (= e!469477 (and e!469478 mapRes!24959))))

(declare-fun condMapEmpty!24959 () Bool)

(declare-fun mapDefault!24959 () ValueCell!7347)

(assert (=> b!841602 (= condMapEmpty!24959 (= (arr!22743 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7347)) mapDefault!24959)))))

(declare-fun b!841603 () Bool)

(declare-fun tp_is_empty!15573 () Bool)

(assert (=> b!841603 (= e!469478 tp_is_empty!15573)))

(declare-fun b!841604 () Bool)

(declare-fun res!572075 () Bool)

(assert (=> b!841604 (=> (not res!572075) (not e!469475))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841604 (= res!572075 (validMask!0 mask!1196))))

(declare-fun b!841605 () Bool)

(declare-fun res!572076 () Bool)

(assert (=> b!841605 (=> (not res!572076) (not e!469475))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47422 (_ BitVec 32)) Bool)

(assert (=> b!841605 (= res!572076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841606 () Bool)

(declare-fun res!572081 () Bool)

(assert (=> b!841606 (=> (not res!572081) (not e!469475))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!841606 (= res!572081 (and (= (select (arr!22742 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23182 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841607 () Bool)

(assert (=> b!841607 (= e!469475 (not true))))

(assert (=> b!841607 e!469480))

(declare-fun c!91420 () Bool)

(assert (=> b!841607 (= c!91420 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25811)

(declare-datatypes ((Unit!28903 0))(
  ( (Unit!28904) )
))
(declare-fun lt!380926 () Unit!28903)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun minValue!654 () V!25811)

(declare-fun zeroValue!654 () V!25811)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!297 (array!47422 array!47424 (_ BitVec 32) (_ BitVec 32) V!25811 V!25811 (_ BitVec 32) (_ BitVec 64) V!25811 (_ BitVec 32) Int) Unit!28903)

(assert (=> b!841607 (= lt!380926 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!297 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun res!572078 () Bool)

(assert (=> start!72522 (=> (not res!572078) (not e!469475))))

(assert (=> start!72522 (= res!572078 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23182 _keys!868))))))

(assert (=> start!72522 e!469475))

(assert (=> start!72522 tp_is_empty!15573))

(assert (=> start!72522 true))

(assert (=> start!72522 tp!48220))

(declare-fun array_inv!18094 (array!47422) Bool)

(assert (=> start!72522 (array_inv!18094 _keys!868)))

(declare-fun array_inv!18095 (array!47424) Bool)

(assert (=> start!72522 (and (array_inv!18095 _values!688) e!469477)))

(declare-fun b!841608 () Bool)

(assert (=> b!841608 (= e!469476 tp_is_empty!15573)))

(declare-fun bm!37351 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2584 (array!47422 array!47424 (_ BitVec 32) (_ BitVec 32) V!25811 V!25811 (_ BitVec 32) Int) ListLongMap!9167)

(assert (=> bm!37351 (= call!37355 (getCurrentListMapNoExtraKeys!2584 _keys!868 (array!47425 (store (arr!22743 _values!688) i!612 (ValueCellFull!7347 v!557)) (size!23183 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37352 () Bool)

(assert (=> bm!37352 (= call!37354 (getCurrentListMapNoExtraKeys!2584 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841609 () Bool)

(declare-fun res!572080 () Bool)

(assert (=> b!841609 (=> (not res!572080) (not e!469475))))

(assert (=> b!841609 (= res!572080 (and (= (size!23183 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23182 _keys!868) (size!23183 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841610 () Bool)

(declare-fun +!2063 (ListLongMap!9167 tuple2!10398) ListLongMap!9167)

(assert (=> b!841610 (= e!469480 (= call!37355 (+!2063 call!37354 (tuple2!10399 k0!854 v!557))))))

(declare-fun mapIsEmpty!24959 () Bool)

(assert (=> mapIsEmpty!24959 mapRes!24959))

(assert (= (and start!72522 res!572078) b!841604))

(assert (= (and b!841604 res!572075) b!841609))

(assert (= (and b!841609 res!572080) b!841605))

(assert (= (and b!841605 res!572076) b!841599))

(assert (= (and b!841599 res!572074) b!841598))

(assert (= (and b!841598 res!572077) b!841600))

(assert (= (and b!841600 res!572079) b!841606))

(assert (= (and b!841606 res!572081) b!841607))

(assert (= (and b!841607 c!91420) b!841610))

(assert (= (and b!841607 (not c!91420)) b!841601))

(assert (= (or b!841610 b!841601) bm!37351))

(assert (= (or b!841610 b!841601) bm!37352))

(assert (= (and b!841602 condMapEmpty!24959) mapIsEmpty!24959))

(assert (= (and b!841602 (not condMapEmpty!24959)) mapNonEmpty!24959))

(get-info :version)

(assert (= (and mapNonEmpty!24959 ((_ is ValueCellFull!7347) mapValue!24959)) b!841608))

(assert (= (and b!841602 ((_ is ValueCellFull!7347) mapDefault!24959)) b!841603))

(assert (= start!72522 b!841602))

(declare-fun m!784985 () Bool)

(assert (=> b!841600 m!784985))

(declare-fun m!784987 () Bool)

(assert (=> b!841607 m!784987))

(declare-fun m!784989 () Bool)

(assert (=> b!841605 m!784989))

(declare-fun m!784991 () Bool)

(assert (=> bm!37352 m!784991))

(declare-fun m!784993 () Bool)

(assert (=> b!841604 m!784993))

(declare-fun m!784995 () Bool)

(assert (=> b!841610 m!784995))

(declare-fun m!784997 () Bool)

(assert (=> b!841599 m!784997))

(declare-fun m!784999 () Bool)

(assert (=> b!841606 m!784999))

(declare-fun m!785001 () Bool)

(assert (=> mapNonEmpty!24959 m!785001))

(declare-fun m!785003 () Bool)

(assert (=> bm!37351 m!785003))

(declare-fun m!785005 () Bool)

(assert (=> bm!37351 m!785005))

(declare-fun m!785007 () Bool)

(assert (=> start!72522 m!785007))

(declare-fun m!785009 () Bool)

(assert (=> start!72522 m!785009))

(check-sat tp_is_empty!15573 (not b!841600) b_and!22793 (not b!841607) (not b_next!13707) (not mapNonEmpty!24959) (not b!841599) (not b!841610) (not bm!37351) (not bm!37352) (not b!841605) (not b!841604) (not start!72522))
(check-sat b_and!22793 (not b_next!13707))
