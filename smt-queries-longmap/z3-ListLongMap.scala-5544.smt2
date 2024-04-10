; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73050 () Bool)

(assert start!73050)

(declare-fun b_free!13965 () Bool)

(declare-fun b_next!13965 () Bool)

(assert (=> start!73050 (= b_free!13965 (not b_next!13965))))

(declare-fun tp!49399 () Bool)

(declare-fun b_and!23089 () Bool)

(assert (=> start!73050 (= tp!49399 b_and!23089)))

(declare-fun b!849332 () Bool)

(declare-fun e!473847 () Bool)

(declare-fun tp_is_empty!16101 () Bool)

(assert (=> b!849332 (= e!473847 tp_is_empty!16101)))

(declare-fun b!849333 () Bool)

(declare-fun res!576999 () Bool)

(declare-fun e!473843 () Bool)

(assert (=> b!849333 (=> (not res!576999) (not e!473843))))

(declare-datatypes ((array!48408 0))(
  ( (array!48409 (arr!23235 (Array (_ BitVec 32) (_ BitVec 64))) (size!23675 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48408)

(declare-datatypes ((List!16451 0))(
  ( (Nil!16448) (Cons!16447 (h!17578 (_ BitVec 64)) (t!22862 List!16451)) )
))
(declare-fun arrayNoDuplicates!0 (array!48408 (_ BitVec 32) List!16451) Bool)

(assert (=> b!849333 (= res!576999 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16448))))

(declare-fun res!577006 () Bool)

(assert (=> start!73050 (=> (not res!577006) (not e!473843))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> start!73050 (= res!577006 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23675 _keys!868))))))

(assert (=> start!73050 e!473843))

(assert (=> start!73050 tp_is_empty!16101))

(assert (=> start!73050 true))

(assert (=> start!73050 tp!49399))

(declare-fun array_inv!18442 (array!48408) Bool)

(assert (=> start!73050 (array_inv!18442 _keys!868)))

(declare-datatypes ((V!26515 0))(
  ( (V!26516 (val!8098 Int)) )
))
(declare-datatypes ((ValueCell!7611 0))(
  ( (ValueCellFull!7611 (v!10523 V!26515)) (EmptyCell!7611) )
))
(declare-datatypes ((array!48410 0))(
  ( (array!48411 (arr!23236 (Array (_ BitVec 32) ValueCell!7611)) (size!23676 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48410)

(declare-fun e!473846 () Bool)

(declare-fun array_inv!18443 (array!48410) Bool)

(assert (=> start!73050 (and (array_inv!18443 _values!688) e!473846)))

(declare-fun b!849334 () Bool)

(declare-fun res!577000 () Bool)

(assert (=> b!849334 (=> (not res!577000) (not e!473843))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849334 (= res!577000 (validMask!0 mask!1196))))

(declare-fun b!849335 () Bool)

(declare-fun res!576998 () Bool)

(assert (=> b!849335 (=> (not res!576998) (not e!473843))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!849335 (= res!576998 (and (= (select (arr!23235 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-datatypes ((tuple2!10602 0))(
  ( (tuple2!10603 (_1!5312 (_ BitVec 64)) (_2!5312 V!26515)) )
))
(declare-datatypes ((List!16452 0))(
  ( (Nil!16449) (Cons!16448 (h!17579 tuple2!10602) (t!22863 List!16452)) )
))
(declare-datatypes ((ListLongMap!9371 0))(
  ( (ListLongMap!9372 (toList!4701 List!16452)) )
))
(declare-fun call!37751 () ListLongMap!9371)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37747 () Bool)

(declare-fun lt!382249 () array!48410)

(declare-fun minValue!654 () V!26515)

(declare-fun zeroValue!654 () V!26515)

(declare-fun getCurrentListMapNoExtraKeys!2683 (array!48408 array!48410 (_ BitVec 32) (_ BitVec 32) V!26515 V!26515 (_ BitVec 32) Int) ListLongMap!9371)

(assert (=> bm!37747 (= call!37751 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!382249 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849336 () Bool)

(declare-fun res!577002 () Bool)

(assert (=> b!849336 (=> (not res!577002) (not e!473843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48408 (_ BitVec 32)) Bool)

(assert (=> b!849336 (= res!577002 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!849337 () Bool)

(declare-fun e!473842 () Bool)

(assert (=> b!849337 (= e!473842 tp_is_empty!16101)))

(declare-fun b!849338 () Bool)

(declare-fun v!557 () V!26515)

(declare-fun e!473844 () Bool)

(declare-fun call!37750 () ListLongMap!9371)

(declare-fun +!2106 (ListLongMap!9371 tuple2!10602) ListLongMap!9371)

(assert (=> b!849338 (= e!473844 (= call!37751 (+!2106 call!37750 (tuple2!10603 k0!854 v!557))))))

(declare-fun mapIsEmpty!25751 () Bool)

(declare-fun mapRes!25751 () Bool)

(assert (=> mapIsEmpty!25751 mapRes!25751))

(declare-fun b!849339 () Bool)

(declare-fun e!473845 () Bool)

(assert (=> b!849339 (= e!473843 e!473845)))

(declare-fun res!577005 () Bool)

(assert (=> b!849339 (=> (not res!577005) (not e!473845))))

(assert (=> b!849339 (= res!577005 (= from!1053 i!612))))

(declare-fun lt!382247 () ListLongMap!9371)

(assert (=> b!849339 (= lt!382247 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!382249 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849339 (= lt!382249 (array!48411 (store (arr!23236 _values!688) i!612 (ValueCellFull!7611 v!557)) (size!23676 _values!688)))))

(declare-fun lt!382246 () ListLongMap!9371)

(assert (=> b!849339 (= lt!382246 (getCurrentListMapNoExtraKeys!2683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849340 () Bool)

(declare-fun res!577007 () Bool)

(assert (=> b!849340 (=> (not res!577007) (not e!473843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849340 (= res!577007 (validKeyInArray!0 k0!854))))

(declare-fun b!849341 () Bool)

(assert (=> b!849341 (= e!473844 (= call!37751 call!37750))))

(declare-fun b!849342 () Bool)

(declare-fun res!577001 () Bool)

(assert (=> b!849342 (=> (not res!577001) (not e!473843))))

(assert (=> b!849342 (= res!577001 (and (= (size!23676 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23675 _keys!868) (size!23676 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849343 () Bool)

(declare-fun res!577003 () Bool)

(assert (=> b!849343 (=> (not res!577003) (not e!473843))))

(assert (=> b!849343 (= res!577003 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23675 _keys!868))))))

(declare-fun b!849344 () Bool)

(declare-fun e!473841 () Bool)

(assert (=> b!849344 (= e!473841 true)))

(declare-fun get!12229 (ValueCell!7611 V!26515) V!26515)

(declare-fun dynLambda!997 (Int (_ BitVec 64)) V!26515)

(assert (=> b!849344 (= lt!382247 (+!2106 (getCurrentListMapNoExtraKeys!2683 _keys!868 lt!382249 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10603 (select (arr!23235 _keys!868) from!1053) (get!12229 (select (arr!23236 lt!382249) from!1053) (dynLambda!997 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849345 () Bool)

(assert (=> b!849345 (= e!473845 (not e!473841))))

(declare-fun res!577004 () Bool)

(assert (=> b!849345 (=> res!577004 e!473841)))

(assert (=> b!849345 (= res!577004 (not (validKeyInArray!0 (select (arr!23235 _keys!868) from!1053))))))

(assert (=> b!849345 e!473844))

(declare-fun c!91618 () Bool)

(assert (=> b!849345 (= c!91618 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29003 0))(
  ( (Unit!29004) )
))
(declare-fun lt!382248 () Unit!29003)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!347 (array!48408 array!48410 (_ BitVec 32) (_ BitVec 32) V!26515 V!26515 (_ BitVec 32) (_ BitVec 64) V!26515 (_ BitVec 32) Int) Unit!29003)

(assert (=> b!849345 (= lt!382248 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!347 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37748 () Bool)

(assert (=> bm!37748 (= call!37750 (getCurrentListMapNoExtraKeys!2683 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849346 () Bool)

(assert (=> b!849346 (= e!473846 (and e!473842 mapRes!25751))))

(declare-fun condMapEmpty!25751 () Bool)

(declare-fun mapDefault!25751 () ValueCell!7611)

(assert (=> b!849346 (= condMapEmpty!25751 (= (arr!23236 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7611)) mapDefault!25751)))))

(declare-fun mapNonEmpty!25751 () Bool)

(declare-fun tp!49398 () Bool)

(assert (=> mapNonEmpty!25751 (= mapRes!25751 (and tp!49398 e!473847))))

(declare-fun mapRest!25751 () (Array (_ BitVec 32) ValueCell!7611))

(declare-fun mapValue!25751 () ValueCell!7611)

(declare-fun mapKey!25751 () (_ BitVec 32))

(assert (=> mapNonEmpty!25751 (= (arr!23236 _values!688) (store mapRest!25751 mapKey!25751 mapValue!25751))))

(assert (= (and start!73050 res!577006) b!849334))

(assert (= (and b!849334 res!577000) b!849342))

(assert (= (and b!849342 res!577001) b!849336))

(assert (= (and b!849336 res!577002) b!849333))

(assert (= (and b!849333 res!576999) b!849343))

(assert (= (and b!849343 res!577003) b!849340))

(assert (= (and b!849340 res!577007) b!849335))

(assert (= (and b!849335 res!576998) b!849339))

(assert (= (and b!849339 res!577005) b!849345))

(assert (= (and b!849345 c!91618) b!849338))

(assert (= (and b!849345 (not c!91618)) b!849341))

(assert (= (or b!849338 b!849341) bm!37747))

(assert (= (or b!849338 b!849341) bm!37748))

(assert (= (and b!849345 (not res!577004)) b!849344))

(assert (= (and b!849346 condMapEmpty!25751) mapIsEmpty!25751))

(assert (= (and b!849346 (not condMapEmpty!25751)) mapNonEmpty!25751))

(get-info :version)

(assert (= (and mapNonEmpty!25751 ((_ is ValueCellFull!7611) mapValue!25751)) b!849332))

(assert (= (and b!849346 ((_ is ValueCellFull!7611) mapDefault!25751)) b!849337))

(assert (= start!73050 b!849346))

(declare-fun b_lambda!11497 () Bool)

(assert (=> (not b_lambda!11497) (not b!849344)))

(declare-fun t!22861 () Bool)

(declare-fun tb!4267 () Bool)

(assert (=> (and start!73050 (= defaultEntry!696 defaultEntry!696) t!22861) tb!4267))

(declare-fun result!8145 () Bool)

(assert (=> tb!4267 (= result!8145 tp_is_empty!16101)))

(assert (=> b!849344 t!22861))

(declare-fun b_and!23091 () Bool)

(assert (= b_and!23089 (and (=> t!22861 result!8145) b_and!23091)))

(declare-fun m!790023 () Bool)

(assert (=> bm!37748 m!790023))

(declare-fun m!790025 () Bool)

(assert (=> b!849345 m!790025))

(assert (=> b!849345 m!790025))

(declare-fun m!790027 () Bool)

(assert (=> b!849345 m!790027))

(declare-fun m!790029 () Bool)

(assert (=> b!849345 m!790029))

(declare-fun m!790031 () Bool)

(assert (=> b!849334 m!790031))

(declare-fun m!790033 () Bool)

(assert (=> mapNonEmpty!25751 m!790033))

(declare-fun m!790035 () Bool)

(assert (=> b!849340 m!790035))

(declare-fun m!790037 () Bool)

(assert (=> b!849338 m!790037))

(declare-fun m!790039 () Bool)

(assert (=> bm!37747 m!790039))

(declare-fun m!790041 () Bool)

(assert (=> b!849333 m!790041))

(assert (=> b!849344 m!790039))

(declare-fun m!790043 () Bool)

(assert (=> b!849344 m!790043))

(declare-fun m!790045 () Bool)

(assert (=> b!849344 m!790045))

(declare-fun m!790047 () Bool)

(assert (=> b!849344 m!790047))

(assert (=> b!849344 m!790025))

(assert (=> b!849344 m!790045))

(assert (=> b!849344 m!790043))

(assert (=> b!849344 m!790039))

(declare-fun m!790049 () Bool)

(assert (=> b!849344 m!790049))

(declare-fun m!790051 () Bool)

(assert (=> start!73050 m!790051))

(declare-fun m!790053 () Bool)

(assert (=> start!73050 m!790053))

(declare-fun m!790055 () Bool)

(assert (=> b!849336 m!790055))

(declare-fun m!790057 () Bool)

(assert (=> b!849339 m!790057))

(declare-fun m!790059 () Bool)

(assert (=> b!849339 m!790059))

(declare-fun m!790061 () Bool)

(assert (=> b!849339 m!790061))

(declare-fun m!790063 () Bool)

(assert (=> b!849335 m!790063))

(check-sat (not bm!37748) (not b_next!13965) (not start!73050) b_and!23091 (not b!849336) (not b!849338) (not b!849333) (not b!849339) (not b!849334) tp_is_empty!16101 (not b!849340) (not b!849344) (not b!849345) (not bm!37747) (not mapNonEmpty!25751) (not b_lambda!11497))
(check-sat b_and!23091 (not b_next!13965))
