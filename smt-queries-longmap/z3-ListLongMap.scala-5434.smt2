; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72390 () Bool)

(assert start!72390)

(declare-fun b_free!13575 () Bool)

(declare-fun b_next!13575 () Bool)

(assert (=> start!72390 (= b_free!13575 (not b_next!13575))))

(declare-fun tp!47823 () Bool)

(declare-fun b_and!22661 () Bool)

(assert (=> start!72390 (= tp!47823 b_and!22661)))

(declare-fun b!839024 () Bool)

(declare-fun res!570496 () Bool)

(declare-fun e!468290 () Bool)

(assert (=> b!839024 (=> (not res!570496) (not e!468290))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!839024 (= res!570496 (validKeyInArray!0 k0!854))))

(declare-fun b!839025 () Bool)

(declare-fun e!468288 () Bool)

(declare-fun tp_is_empty!15441 () Bool)

(assert (=> b!839025 (= e!468288 tp_is_empty!15441)))

(declare-fun b!839026 () Bool)

(declare-fun res!570495 () Bool)

(assert (=> b!839026 (=> (not res!570495) (not e!468290))))

(declare-fun i!612 () (_ BitVec 32))

(declare-datatypes ((array!47166 0))(
  ( (array!47167 (arr!22614 (Array (_ BitVec 32) (_ BitVec 64))) (size!23054 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47166)

(assert (=> b!839026 (= res!570495 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23054 _keys!868))))))

(declare-fun res!570491 () Bool)

(assert (=> start!72390 (=> (not res!570491) (not e!468290))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72390 (= res!570491 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23054 _keys!868))))))

(assert (=> start!72390 e!468290))

(assert (=> start!72390 tp_is_empty!15441))

(assert (=> start!72390 true))

(assert (=> start!72390 tp!47823))

(declare-fun array_inv!18016 (array!47166) Bool)

(assert (=> start!72390 (array_inv!18016 _keys!868)))

(declare-datatypes ((V!25635 0))(
  ( (V!25636 (val!7768 Int)) )
))
(declare-datatypes ((ValueCell!7281 0))(
  ( (ValueCellFull!7281 (v!10193 V!25635)) (EmptyCell!7281) )
))
(declare-datatypes ((array!47168 0))(
  ( (array!47169 (arr!22615 (Array (_ BitVec 32) ValueCell!7281)) (size!23055 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47168)

(declare-fun e!468291 () Bool)

(declare-fun array_inv!18017 (array!47168) Bool)

(assert (=> start!72390 (and (array_inv!18017 _values!688) e!468291)))

(declare-fun mapIsEmpty!24761 () Bool)

(declare-fun mapRes!24761 () Bool)

(assert (=> mapIsEmpty!24761 mapRes!24761))

(declare-fun b!839027 () Bool)

(declare-fun res!570492 () Bool)

(assert (=> b!839027 (=> (not res!570492) (not e!468290))))

(declare-datatypes ((List!16078 0))(
  ( (Nil!16075) (Cons!16074 (h!17205 (_ BitVec 64)) (t!22449 List!16078)) )
))
(declare-fun arrayNoDuplicates!0 (array!47166 (_ BitVec 32) List!16078) Bool)

(assert (=> b!839027 (= res!570492 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16075))))

(declare-fun b!839028 () Bool)

(assert (=> b!839028 (= e!468291 (and e!468288 mapRes!24761))))

(declare-fun condMapEmpty!24761 () Bool)

(declare-fun mapDefault!24761 () ValueCell!7281)

(assert (=> b!839028 (= condMapEmpty!24761 (= (arr!22615 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7281)) mapDefault!24761)))))

(declare-fun v!557 () V!25635)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun bm!36955 () Bool)

(declare-fun minValue!654 () V!25635)

(declare-fun zeroValue!654 () V!25635)

(declare-datatypes ((tuple2!10278 0))(
  ( (tuple2!10279 (_1!5150 (_ BitVec 64)) (_2!5150 V!25635)) )
))
(declare-datatypes ((List!16079 0))(
  ( (Nil!16076) (Cons!16075 (h!17206 tuple2!10278) (t!22450 List!16079)) )
))
(declare-datatypes ((ListLongMap!9047 0))(
  ( (ListLongMap!9048 (toList!4539 List!16079)) )
))
(declare-fun call!36959 () ListLongMap!9047)

(declare-fun getCurrentListMapNoExtraKeys!2531 (array!47166 array!47168 (_ BitVec 32) (_ BitVec 32) V!25635 V!25635 (_ BitVec 32) Int) ListLongMap!9047)

(assert (=> bm!36955 (= call!36959 (getCurrentListMapNoExtraKeys!2531 _keys!868 (array!47169 (store (arr!22615 _values!688) i!612 (ValueCellFull!7281 v!557)) (size!23055 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839029 () Bool)

(declare-fun e!468292 () Bool)

(assert (=> b!839029 (= e!468292 tp_is_empty!15441)))

(declare-fun bm!36956 () Bool)

(declare-fun call!36958 () ListLongMap!9047)

(assert (=> bm!36956 (= call!36958 (getCurrentListMapNoExtraKeys!2531 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839030 () Bool)

(declare-fun e!468289 () Bool)

(declare-fun +!2012 (ListLongMap!9047 tuple2!10278) ListLongMap!9047)

(assert (=> b!839030 (= e!468289 (= call!36959 (+!2012 call!36958 (tuple2!10279 k0!854 v!557))))))

(declare-fun mapNonEmpty!24761 () Bool)

(declare-fun tp!47824 () Bool)

(assert (=> mapNonEmpty!24761 (= mapRes!24761 (and tp!47824 e!468292))))

(declare-fun mapRest!24761 () (Array (_ BitVec 32) ValueCell!7281))

(declare-fun mapKey!24761 () (_ BitVec 32))

(declare-fun mapValue!24761 () ValueCell!7281)

(assert (=> mapNonEmpty!24761 (= (arr!22615 _values!688) (store mapRest!24761 mapKey!24761 mapValue!24761))))

(declare-fun b!839031 () Bool)

(declare-fun res!570493 () Bool)

(assert (=> b!839031 (=> (not res!570493) (not e!468290))))

(assert (=> b!839031 (= res!570493 (and (= (size!23055 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23054 _keys!868) (size!23055 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!839032 () Bool)

(declare-fun res!570490 () Bool)

(assert (=> b!839032 (=> (not res!570490) (not e!468290))))

(assert (=> b!839032 (= res!570490 (and (= (select (arr!22614 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23054 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!839033 () Bool)

(declare-fun res!570497 () Bool)

(assert (=> b!839033 (=> (not res!570497) (not e!468290))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839033 (= res!570497 (validMask!0 mask!1196))))

(declare-fun b!839034 () Bool)

(assert (=> b!839034 (= e!468289 (= call!36959 call!36958))))

(declare-fun b!839035 () Bool)

(declare-fun res!570494 () Bool)

(assert (=> b!839035 (=> (not res!570494) (not e!468290))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47166 (_ BitVec 32)) Bool)

(assert (=> b!839035 (= res!570494 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!839036 () Bool)

(assert (=> b!839036 (= e!468290 (not true))))

(assert (=> b!839036 e!468289))

(declare-fun c!91222 () Bool)

(assert (=> b!839036 (= c!91222 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28815 0))(
  ( (Unit!28816) )
))
(declare-fun lt!380728 () Unit!28815)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!253 (array!47166 array!47168 (_ BitVec 32) (_ BitVec 32) V!25635 V!25635 (_ BitVec 32) (_ BitVec 64) V!25635 (_ BitVec 32) Int) Unit!28815)

(assert (=> b!839036 (= lt!380728 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!253 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(assert (= (and start!72390 res!570491) b!839033))

(assert (= (and b!839033 res!570497) b!839031))

(assert (= (and b!839031 res!570493) b!839035))

(assert (= (and b!839035 res!570494) b!839027))

(assert (= (and b!839027 res!570492) b!839026))

(assert (= (and b!839026 res!570495) b!839024))

(assert (= (and b!839024 res!570496) b!839032))

(assert (= (and b!839032 res!570490) b!839036))

(assert (= (and b!839036 c!91222) b!839030))

(assert (= (and b!839036 (not c!91222)) b!839034))

(assert (= (or b!839030 b!839034) bm!36955))

(assert (= (or b!839030 b!839034) bm!36956))

(assert (= (and b!839028 condMapEmpty!24761) mapIsEmpty!24761))

(assert (= (and b!839028 (not condMapEmpty!24761)) mapNonEmpty!24761))

(get-info :version)

(assert (= (and mapNonEmpty!24761 ((_ is ValueCellFull!7281) mapValue!24761)) b!839029))

(assert (= (and b!839028 ((_ is ValueCellFull!7281) mapDefault!24761)) b!839025))

(assert (= start!72390 b!839028))

(declare-fun m!783269 () Bool)

(assert (=> b!839027 m!783269))

(declare-fun m!783271 () Bool)

(assert (=> bm!36955 m!783271))

(declare-fun m!783273 () Bool)

(assert (=> bm!36955 m!783273))

(declare-fun m!783275 () Bool)

(assert (=> b!839030 m!783275))

(declare-fun m!783277 () Bool)

(assert (=> b!839036 m!783277))

(declare-fun m!783279 () Bool)

(assert (=> mapNonEmpty!24761 m!783279))

(declare-fun m!783281 () Bool)

(assert (=> start!72390 m!783281))

(declare-fun m!783283 () Bool)

(assert (=> start!72390 m!783283))

(declare-fun m!783285 () Bool)

(assert (=> b!839033 m!783285))

(declare-fun m!783287 () Bool)

(assert (=> b!839035 m!783287))

(declare-fun m!783289 () Bool)

(assert (=> bm!36956 m!783289))

(declare-fun m!783291 () Bool)

(assert (=> b!839032 m!783291))

(declare-fun m!783293 () Bool)

(assert (=> b!839024 m!783293))

(check-sat (not b!839024) (not bm!36955) (not mapNonEmpty!24761) (not b!839027) (not b!839035) (not b!839036) (not start!72390) (not b_next!13575) (not bm!36956) b_and!22661 (not b!839033) tp_is_empty!15441 (not b!839030))
(check-sat b_and!22661 (not b_next!13575))
