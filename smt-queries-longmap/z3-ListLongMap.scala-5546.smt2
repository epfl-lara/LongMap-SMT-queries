; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73062 () Bool)

(assert start!73062)

(declare-fun b_free!13977 () Bool)

(declare-fun b_next!13977 () Bool)

(assert (=> start!73062 (= b_free!13977 (not b_next!13977))))

(declare-fun tp!49434 () Bool)

(declare-fun b_and!23113 () Bool)

(assert (=> start!73062 (= tp!49434 b_and!23113)))

(declare-fun b!849614 () Bool)

(declare-fun e!473989 () Bool)

(declare-datatypes ((V!26531 0))(
  ( (V!26532 (val!8104 Int)) )
))
(declare-datatypes ((tuple2!10614 0))(
  ( (tuple2!10615 (_1!5318 (_ BitVec 64)) (_2!5318 V!26531)) )
))
(declare-datatypes ((List!16461 0))(
  ( (Nil!16458) (Cons!16457 (h!17588 tuple2!10614) (t!22884 List!16461)) )
))
(declare-datatypes ((ListLongMap!9383 0))(
  ( (ListLongMap!9384 (toList!4707 List!16461)) )
))
(declare-fun call!37787 () ListLongMap!9383)

(declare-fun call!37786 () ListLongMap!9383)

(assert (=> b!849614 (= e!473989 (= call!37787 call!37786))))

(declare-fun b!849615 () Bool)

(declare-fun e!473992 () Bool)

(declare-fun e!473988 () Bool)

(assert (=> b!849615 (= e!473992 e!473988)))

(declare-fun res!577184 () Bool)

(assert (=> b!849615 (=> (not res!577184) (not e!473988))))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849615 (= res!577184 (= from!1053 i!612))))

(declare-fun lt!382320 () ListLongMap!9383)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48432 0))(
  ( (array!48433 (arr!23247 (Array (_ BitVec 32) (_ BitVec 64))) (size!23687 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48432)

(declare-fun minValue!654 () V!26531)

(declare-fun zeroValue!654 () V!26531)

(declare-fun defaultEntry!696 () Int)

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((ValueCell!7617 0))(
  ( (ValueCellFull!7617 (v!10529 V!26531)) (EmptyCell!7617) )
))
(declare-datatypes ((array!48434 0))(
  ( (array!48435 (arr!23248 (Array (_ BitVec 32) ValueCell!7617)) (size!23688 (_ BitVec 32))) )
))
(declare-fun lt!382318 () array!48434)

(declare-fun getCurrentListMapNoExtraKeys!2689 (array!48432 array!48434 (_ BitVec 32) (_ BitVec 32) V!26531 V!26531 (_ BitVec 32) Int) ListLongMap!9383)

(assert (=> b!849615 (= lt!382320 (getCurrentListMapNoExtraKeys!2689 _keys!868 lt!382318 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26531)

(declare-fun _values!688 () array!48434)

(assert (=> b!849615 (= lt!382318 (array!48435 (store (arr!23248 _values!688) i!612 (ValueCellFull!7617 v!557)) (size!23688 _values!688)))))

(declare-fun lt!382319 () ListLongMap!9383)

(assert (=> b!849615 (= lt!382319 (getCurrentListMapNoExtraKeys!2689 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun res!577185 () Bool)

(assert (=> start!73062 (=> (not res!577185) (not e!473992))))

(assert (=> start!73062 (= res!577185 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23687 _keys!868))))))

(assert (=> start!73062 e!473992))

(declare-fun tp_is_empty!16113 () Bool)

(assert (=> start!73062 tp_is_empty!16113))

(assert (=> start!73062 true))

(assert (=> start!73062 tp!49434))

(declare-fun array_inv!18450 (array!48432) Bool)

(assert (=> start!73062 (array_inv!18450 _keys!868)))

(declare-fun e!473990 () Bool)

(declare-fun array_inv!18451 (array!48434) Bool)

(assert (=> start!73062 (and (array_inv!18451 _values!688) e!473990)))

(declare-fun b!849616 () Bool)

(declare-fun e!473986 () Bool)

(assert (=> b!849616 (= e!473986 tp_is_empty!16113)))

(declare-fun b!849617 () Bool)

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun +!2111 (ListLongMap!9383 tuple2!10614) ListLongMap!9383)

(assert (=> b!849617 (= e!473989 (= call!37787 (+!2111 call!37786 (tuple2!10615 k0!854 v!557))))))

(declare-fun bm!37783 () Bool)

(assert (=> bm!37783 (= call!37787 (getCurrentListMapNoExtraKeys!2689 _keys!868 lt!382318 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37784 () Bool)

(assert (=> bm!37784 (= call!37786 (getCurrentListMapNoExtraKeys!2689 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849618 () Bool)

(declare-fun res!577179 () Bool)

(assert (=> b!849618 (=> (not res!577179) (not e!473992))))

(assert (=> b!849618 (= res!577179 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23687 _keys!868))))))

(declare-fun b!849619 () Bool)

(declare-fun res!577181 () Bool)

(assert (=> b!849619 (=> (not res!577181) (not e!473992))))

(declare-datatypes ((List!16462 0))(
  ( (Nil!16459) (Cons!16458 (h!17589 (_ BitVec 64)) (t!22885 List!16462)) )
))
(declare-fun arrayNoDuplicates!0 (array!48432 (_ BitVec 32) List!16462) Bool)

(assert (=> b!849619 (= res!577181 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16459))))

(declare-fun b!849620 () Bool)

(declare-fun res!577178 () Bool)

(assert (=> b!849620 (=> (not res!577178) (not e!473992))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849620 (= res!577178 (validMask!0 mask!1196))))

(declare-fun b!849621 () Bool)

(declare-fun res!577182 () Bool)

(assert (=> b!849621 (=> (not res!577182) (not e!473992))))

(assert (=> b!849621 (= res!577182 (and (= (select (arr!23247 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun mapNonEmpty!25769 () Bool)

(declare-fun mapRes!25769 () Bool)

(declare-fun tp!49435 () Bool)

(assert (=> mapNonEmpty!25769 (= mapRes!25769 (and tp!49435 e!473986))))

(declare-fun mapKey!25769 () (_ BitVec 32))

(declare-fun mapValue!25769 () ValueCell!7617)

(declare-fun mapRest!25769 () (Array (_ BitVec 32) ValueCell!7617))

(assert (=> mapNonEmpty!25769 (= (arr!23248 _values!688) (store mapRest!25769 mapKey!25769 mapValue!25769))))

(declare-fun b!849622 () Bool)

(declare-fun e!473991 () Bool)

(assert (=> b!849622 (= e!473990 (and e!473991 mapRes!25769))))

(declare-fun condMapEmpty!25769 () Bool)

(declare-fun mapDefault!25769 () ValueCell!7617)

(assert (=> b!849622 (= condMapEmpty!25769 (= (arr!23248 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7617)) mapDefault!25769)))))

(declare-fun b!849623 () Bool)

(assert (=> b!849623 (= e!473991 tp_is_empty!16113)))

(declare-fun mapIsEmpty!25769 () Bool)

(assert (=> mapIsEmpty!25769 mapRes!25769))

(declare-fun b!849624 () Bool)

(declare-fun e!473987 () Bool)

(assert (=> b!849624 (= e!473988 (not e!473987))))

(declare-fun res!577187 () Bool)

(assert (=> b!849624 (=> res!577187 e!473987)))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849624 (= res!577187 (not (validKeyInArray!0 (select (arr!23247 _keys!868) from!1053))))))

(assert (=> b!849624 e!473989))

(declare-fun c!91636 () Bool)

(assert (=> b!849624 (= c!91636 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29011 0))(
  ( (Unit!29012) )
))
(declare-fun lt!382321 () Unit!29011)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!351 (array!48432 array!48434 (_ BitVec 32) (_ BitVec 32) V!26531 V!26531 (_ BitVec 32) (_ BitVec 64) V!26531 (_ BitVec 32) Int) Unit!29011)

(assert (=> b!849624 (= lt!382321 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!351 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849625 () Bool)

(declare-fun res!577180 () Bool)

(assert (=> b!849625 (=> (not res!577180) (not e!473992))))

(assert (=> b!849625 (= res!577180 (validKeyInArray!0 k0!854))))

(declare-fun b!849626 () Bool)

(declare-fun res!577186 () Bool)

(assert (=> b!849626 (=> (not res!577186) (not e!473992))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48432 (_ BitVec 32)) Bool)

(assert (=> b!849626 (= res!577186 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849627 () Bool)

(declare-fun res!577183 () Bool)

(assert (=> b!849627 (=> (not res!577183) (not e!473992))))

(assert (=> b!849627 (= res!577183 (and (= (size!23688 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23687 _keys!868) (size!23688 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849628 () Bool)

(assert (=> b!849628 (= e!473987 (and (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23687 _keys!868))))))

(declare-fun get!12238 (ValueCell!7617 V!26531) V!26531)

(declare-fun dynLambda!1002 (Int (_ BitVec 64)) V!26531)

(assert (=> b!849628 (= lt!382320 (+!2111 (getCurrentListMapNoExtraKeys!2689 _keys!868 lt!382318 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10615 (select (arr!23247 _keys!868) from!1053) (get!12238 (select (arr!23248 lt!382318) from!1053) (dynLambda!1002 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(assert (= (and start!73062 res!577185) b!849620))

(assert (= (and b!849620 res!577178) b!849627))

(assert (= (and b!849627 res!577183) b!849626))

(assert (= (and b!849626 res!577186) b!849619))

(assert (= (and b!849619 res!577181) b!849618))

(assert (= (and b!849618 res!577179) b!849625))

(assert (= (and b!849625 res!577180) b!849621))

(assert (= (and b!849621 res!577182) b!849615))

(assert (= (and b!849615 res!577184) b!849624))

(assert (= (and b!849624 c!91636) b!849617))

(assert (= (and b!849624 (not c!91636)) b!849614))

(assert (= (or b!849617 b!849614) bm!37783))

(assert (= (or b!849617 b!849614) bm!37784))

(assert (= (and b!849624 (not res!577187)) b!849628))

(assert (= (and b!849622 condMapEmpty!25769) mapIsEmpty!25769))

(assert (= (and b!849622 (not condMapEmpty!25769)) mapNonEmpty!25769))

(get-info :version)

(assert (= (and mapNonEmpty!25769 ((_ is ValueCellFull!7617) mapValue!25769)) b!849616))

(assert (= (and b!849622 ((_ is ValueCellFull!7617) mapDefault!25769)) b!849623))

(assert (= start!73062 b!849622))

(declare-fun b_lambda!11509 () Bool)

(assert (=> (not b_lambda!11509) (not b!849628)))

(declare-fun t!22883 () Bool)

(declare-fun tb!4279 () Bool)

(assert (=> (and start!73062 (= defaultEntry!696 defaultEntry!696) t!22883) tb!4279))

(declare-fun result!8169 () Bool)

(assert (=> tb!4279 (= result!8169 tp_is_empty!16113)))

(assert (=> b!849628 t!22883))

(declare-fun b_and!23115 () Bool)

(assert (= b_and!23113 (and (=> t!22883 result!8169) b_and!23115)))

(declare-fun m!790275 () Bool)

(assert (=> start!73062 m!790275))

(declare-fun m!790277 () Bool)

(assert (=> start!73062 m!790277))

(declare-fun m!790279 () Bool)

(assert (=> mapNonEmpty!25769 m!790279))

(declare-fun m!790281 () Bool)

(assert (=> b!849624 m!790281))

(assert (=> b!849624 m!790281))

(declare-fun m!790283 () Bool)

(assert (=> b!849624 m!790283))

(declare-fun m!790285 () Bool)

(assert (=> b!849624 m!790285))

(declare-fun m!790287 () Bool)

(assert (=> b!849619 m!790287))

(declare-fun m!790289 () Bool)

(assert (=> b!849615 m!790289))

(declare-fun m!790291 () Bool)

(assert (=> b!849615 m!790291))

(declare-fun m!790293 () Bool)

(assert (=> b!849615 m!790293))

(declare-fun m!790295 () Bool)

(assert (=> bm!37783 m!790295))

(declare-fun m!790297 () Bool)

(assert (=> bm!37784 m!790297))

(declare-fun m!790299 () Bool)

(assert (=> b!849621 m!790299))

(declare-fun m!790301 () Bool)

(assert (=> b!849625 m!790301))

(declare-fun m!790303 () Bool)

(assert (=> b!849626 m!790303))

(declare-fun m!790305 () Bool)

(assert (=> b!849620 m!790305))

(declare-fun m!790307 () Bool)

(assert (=> b!849617 m!790307))

(assert (=> b!849628 m!790295))

(declare-fun m!790309 () Bool)

(assert (=> b!849628 m!790309))

(declare-fun m!790311 () Bool)

(assert (=> b!849628 m!790311))

(assert (=> b!849628 m!790295))

(assert (=> b!849628 m!790311))

(declare-fun m!790313 () Bool)

(assert (=> b!849628 m!790313))

(declare-fun m!790315 () Bool)

(assert (=> b!849628 m!790315))

(assert (=> b!849628 m!790281))

(assert (=> b!849628 m!790313))

(check-sat (not b_next!13977) (not b!849625) (not bm!37783) (not b_lambda!11509) b_and!23115 (not b!849626) (not b!849617) (not b!849624) (not mapNonEmpty!25769) (not start!73062) (not b!849620) (not b!849615) (not bm!37784) (not b!849619) (not b!849628) tp_is_empty!16113)
(check-sat b_and!23115 (not b_next!13977))
