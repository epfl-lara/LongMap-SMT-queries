; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72508 () Bool)

(assert start!72508)

(declare-fun b_free!13711 () Bool)

(declare-fun b_next!13711 () Bool)

(assert (=> start!72508 (= b_free!13711 (not b_next!13711))))

(declare-fun tp!48233 () Bool)

(declare-fun b_and!22771 () Bool)

(assert (=> start!72508 (= tp!48233 b_and!22771)))

(declare-fun b!841437 () Bool)

(declare-fun e!469368 () Bool)

(declare-fun e!469367 () Bool)

(declare-fun mapRes!24965 () Bool)

(assert (=> b!841437 (= e!469368 (and e!469367 mapRes!24965))))

(declare-fun condMapEmpty!24965 () Bool)

(declare-datatypes ((V!25817 0))(
  ( (V!25818 (val!7836 Int)) )
))
(declare-datatypes ((ValueCell!7349 0))(
  ( (ValueCellFull!7349 (v!10255 V!25817)) (EmptyCell!7349) )
))
(declare-datatypes ((array!47407 0))(
  ( (array!47408 (arr!22735 (Array (_ BitVec 32) ValueCell!7349)) (size!23177 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47407)

(declare-fun mapDefault!24965 () ValueCell!7349)

(assert (=> b!841437 (= condMapEmpty!24965 (= (arr!22735 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7349)) mapDefault!24965)))))

(declare-fun b!841438 () Bool)

(declare-fun e!469363 () Bool)

(declare-datatypes ((tuple2!10418 0))(
  ( (tuple2!10419 (_1!5220 (_ BitVec 64)) (_2!5220 V!25817)) )
))
(declare-datatypes ((List!16189 0))(
  ( (Nil!16186) (Cons!16185 (h!17316 tuple2!10418) (t!22551 List!16189)) )
))
(declare-datatypes ((ListLongMap!9177 0))(
  ( (ListLongMap!9178 (toList!4604 List!16189)) )
))
(declare-fun call!37341 () ListLongMap!9177)

(declare-fun call!37340 () ListLongMap!9177)

(assert (=> b!841438 (= e!469363 (= call!37341 call!37340))))

(declare-fun b!841439 () Bool)

(declare-fun res!572016 () Bool)

(declare-fun e!469364 () Bool)

(assert (=> b!841439 (=> (not res!572016) (not e!469364))))

(declare-datatypes ((array!47409 0))(
  ( (array!47410 (arr!22736 (Array (_ BitVec 32) (_ BitVec 64))) (size!23178 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47409)

(declare-datatypes ((List!16190 0))(
  ( (Nil!16187) (Cons!16186 (h!17317 (_ BitVec 64)) (t!22552 List!16190)) )
))
(declare-fun arrayNoDuplicates!0 (array!47409 (_ BitVec 32) List!16190) Bool)

(assert (=> b!841439 (= res!572016 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16187))))

(declare-fun mapIsEmpty!24965 () Bool)

(assert (=> mapIsEmpty!24965 mapRes!24965))

(declare-fun b!841440 () Bool)

(declare-fun tp_is_empty!15577 () Bool)

(assert (=> b!841440 (= e!469367 tp_is_empty!15577)))

(declare-fun mapNonEmpty!24965 () Bool)

(declare-fun tp!48232 () Bool)

(declare-fun e!469365 () Bool)

(assert (=> mapNonEmpty!24965 (= mapRes!24965 (and tp!48232 e!469365))))

(declare-fun mapRest!24965 () (Array (_ BitVec 32) ValueCell!7349))

(declare-fun mapValue!24965 () ValueCell!7349)

(declare-fun mapKey!24965 () (_ BitVec 32))

(assert (=> mapNonEmpty!24965 (= (arr!22735 _values!688) (store mapRest!24965 mapKey!24965 mapValue!24965))))

(declare-fun res!572019 () Bool)

(assert (=> start!72508 (=> (not res!572019) (not e!469364))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!72508 (= res!572019 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23178 _keys!868))))))

(assert (=> start!72508 e!469364))

(assert (=> start!72508 tp_is_empty!15577))

(assert (=> start!72508 true))

(assert (=> start!72508 tp!48233))

(declare-fun array_inv!18168 (array!47409) Bool)

(assert (=> start!72508 (array_inv!18168 _keys!868)))

(declare-fun array_inv!18169 (array!47407) Bool)

(assert (=> start!72508 (and (array_inv!18169 _values!688) e!469368)))

(declare-fun b!841441 () Bool)

(declare-fun res!572013 () Bool)

(assert (=> b!841441 (=> (not res!572013) (not e!469364))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(assert (=> b!841441 (= res!572013 (and (= (size!23177 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23178 _keys!868) (size!23177 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!841442 () Bool)

(declare-fun res!572014 () Bool)

(assert (=> b!841442 (=> (not res!572014) (not e!469364))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841442 (= res!572014 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23178 _keys!868))))))

(declare-fun b!841443 () Bool)

(assert (=> b!841443 (= e!469364 (not true))))

(assert (=> b!841443 e!469363))

(declare-fun c!91361 () Bool)

(assert (=> b!841443 (= c!91361 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25817)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25817)

(declare-fun zeroValue!654 () V!25817)

(declare-datatypes ((Unit!28853 0))(
  ( (Unit!28854) )
))
(declare-fun lt!380696 () Unit!28853)

(declare-fun defaultEntry!696 () Int)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!301 (array!47409 array!47407 (_ BitVec 32) (_ BitVec 32) V!25817 V!25817 (_ BitVec 32) (_ BitVec 64) V!25817 (_ BitVec 32) Int) Unit!28853)

(assert (=> b!841443 (= lt!380696 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!301 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37337 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2620 (array!47409 array!47407 (_ BitVec 32) (_ BitVec 32) V!25817 V!25817 (_ BitVec 32) Int) ListLongMap!9177)

(assert (=> bm!37337 (= call!37340 (getCurrentListMapNoExtraKeys!2620 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37338 () Bool)

(assert (=> bm!37338 (= call!37341 (getCurrentListMapNoExtraKeys!2620 _keys!868 (array!47408 (store (arr!22735 _values!688) i!612 (ValueCellFull!7349 v!557)) (size!23177 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841444 () Bool)

(declare-fun res!572015 () Bool)

(assert (=> b!841444 (=> (not res!572015) (not e!469364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!841444 (= res!572015 (validKeyInArray!0 k0!854))))

(declare-fun b!841445 () Bool)

(declare-fun res!572012 () Bool)

(assert (=> b!841445 (=> (not res!572012) (not e!469364))))

(assert (=> b!841445 (= res!572012 (and (= (select (arr!22736 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23178 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!841446 () Bool)

(declare-fun res!572017 () Bool)

(assert (=> b!841446 (=> (not res!572017) (not e!469364))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47409 (_ BitVec 32)) Bool)

(assert (=> b!841446 (= res!572017 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!841447 () Bool)

(assert (=> b!841447 (= e!469365 tp_is_empty!15577)))

(declare-fun b!841448 () Bool)

(declare-fun +!2085 (ListLongMap!9177 tuple2!10418) ListLongMap!9177)

(assert (=> b!841448 (= e!469363 (= call!37341 (+!2085 call!37340 (tuple2!10419 k0!854 v!557))))))

(declare-fun b!841449 () Bool)

(declare-fun res!572018 () Bool)

(assert (=> b!841449 (=> (not res!572018) (not e!469364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!841449 (= res!572018 (validMask!0 mask!1196))))

(assert (= (and start!72508 res!572019) b!841449))

(assert (= (and b!841449 res!572018) b!841441))

(assert (= (and b!841441 res!572013) b!841446))

(assert (= (and b!841446 res!572017) b!841439))

(assert (= (and b!841439 res!572016) b!841442))

(assert (= (and b!841442 res!572014) b!841444))

(assert (= (and b!841444 res!572015) b!841445))

(assert (= (and b!841445 res!572012) b!841443))

(assert (= (and b!841443 c!91361) b!841448))

(assert (= (and b!841443 (not c!91361)) b!841438))

(assert (= (or b!841448 b!841438) bm!37338))

(assert (= (or b!841448 b!841438) bm!37337))

(assert (= (and b!841437 condMapEmpty!24965) mapIsEmpty!24965))

(assert (= (and b!841437 (not condMapEmpty!24965)) mapNonEmpty!24965))

(get-info :version)

(assert (= (and mapNonEmpty!24965 ((_ is ValueCellFull!7349) mapValue!24965)) b!841447))

(assert (= (and b!841437 ((_ is ValueCellFull!7349) mapDefault!24965)) b!841440))

(assert (= start!72508 b!841437))

(declare-fun m!784283 () Bool)

(assert (=> bm!37337 m!784283))

(declare-fun m!784285 () Bool)

(assert (=> b!841446 m!784285))

(declare-fun m!784287 () Bool)

(assert (=> b!841449 m!784287))

(declare-fun m!784289 () Bool)

(assert (=> b!841439 m!784289))

(declare-fun m!784291 () Bool)

(assert (=> b!841448 m!784291))

(declare-fun m!784293 () Bool)

(assert (=> b!841444 m!784293))

(declare-fun m!784295 () Bool)

(assert (=> start!72508 m!784295))

(declare-fun m!784297 () Bool)

(assert (=> start!72508 m!784297))

(declare-fun m!784299 () Bool)

(assert (=> bm!37338 m!784299))

(declare-fun m!784301 () Bool)

(assert (=> bm!37338 m!784301))

(declare-fun m!784303 () Bool)

(assert (=> b!841445 m!784303))

(declare-fun m!784305 () Bool)

(assert (=> mapNonEmpty!24965 m!784305))

(declare-fun m!784307 () Bool)

(assert (=> b!841443 m!784307))

(check-sat (not start!72508) (not b_next!13711) (not bm!37337) (not b!841444) (not b!841439) (not mapNonEmpty!24965) (not b!841448) b_and!22771 (not bm!37338) (not b!841446) (not b!841443) tp_is_empty!15577 (not b!841449))
(check-sat b_and!22771 (not b_next!13711))
