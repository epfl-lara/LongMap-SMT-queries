; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73056 () Bool)

(assert start!73056)

(declare-fun b_free!13971 () Bool)

(declare-fun b_next!13971 () Bool)

(assert (=> start!73056 (= b_free!13971 (not b_next!13971))))

(declare-fun tp!49417 () Bool)

(declare-fun b_and!23101 () Bool)

(assert (=> start!73056 (= tp!49417 b_and!23101)))

(declare-fun b!849473 () Bool)

(declare-fun res!577093 () Bool)

(declare-fun e!473918 () Bool)

(assert (=> b!849473 (=> (not res!577093) (not e!473918))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!849473 (= res!577093 (validMask!0 mask!1196))))

(declare-fun b!849474 () Bool)

(declare-fun res!577092 () Bool)

(assert (=> b!849474 (=> (not res!577092) (not e!473918))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-datatypes ((array!48420 0))(
  ( (array!48421 (arr!23241 (Array (_ BitVec 32) (_ BitVec 64))) (size!23681 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48420)

(declare-datatypes ((V!26523 0))(
  ( (V!26524 (val!8101 Int)) )
))
(declare-datatypes ((ValueCell!7614 0))(
  ( (ValueCellFull!7614 (v!10526 V!26523)) (EmptyCell!7614) )
))
(declare-datatypes ((array!48422 0))(
  ( (array!48423 (arr!23242 (Array (_ BitVec 32) ValueCell!7614)) (size!23682 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48422)

(assert (=> b!849474 (= res!577092 (and (= (size!23682 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23681 _keys!868) (size!23682 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!849475 () Bool)

(declare-fun res!577097 () Bool)

(assert (=> b!849475 (=> (not res!577097) (not e!473918))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!849475 (= res!577097 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23681 _keys!868))))))

(declare-fun b!849476 () Bool)

(declare-fun e!473919 () Bool)

(declare-fun e!473913 () Bool)

(declare-fun mapRes!25760 () Bool)

(assert (=> b!849476 (= e!473919 (and e!473913 mapRes!25760))))

(declare-fun condMapEmpty!25760 () Bool)

(declare-fun mapDefault!25760 () ValueCell!7614)

(assert (=> b!849476 (= condMapEmpty!25760 (= (arr!23242 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7614)) mapDefault!25760)))))

(declare-fun b!849477 () Bool)

(declare-fun e!473920 () Bool)

(declare-datatypes ((tuple2!10608 0))(
  ( (tuple2!10609 (_1!5315 (_ BitVec 64)) (_2!5315 V!26523)) )
))
(declare-datatypes ((List!16456 0))(
  ( (Nil!16453) (Cons!16452 (h!17583 tuple2!10608) (t!22873 List!16456)) )
))
(declare-datatypes ((ListLongMap!9377 0))(
  ( (ListLongMap!9378 (toList!4704 List!16456)) )
))
(declare-fun call!37768 () ListLongMap!9377)

(declare-fun call!37769 () ListLongMap!9377)

(assert (=> b!849477 (= e!473920 (= call!37768 call!37769))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-fun b!849478 () Bool)

(declare-fun v!557 () V!26523)

(declare-fun +!2109 (ListLongMap!9377 tuple2!10608) ListLongMap!9377)

(assert (=> b!849478 (= e!473920 (= call!37768 (+!2109 call!37769 (tuple2!10609 k0!854 v!557))))))

(declare-fun mapNonEmpty!25760 () Bool)

(declare-fun tp!49416 () Bool)

(declare-fun e!473915 () Bool)

(assert (=> mapNonEmpty!25760 (= mapRes!25760 (and tp!49416 e!473915))))

(declare-fun mapValue!25760 () ValueCell!7614)

(declare-fun mapRest!25760 () (Array (_ BitVec 32) ValueCell!7614))

(declare-fun mapKey!25760 () (_ BitVec 32))

(assert (=> mapNonEmpty!25760 (= (arr!23242 _values!688) (store mapRest!25760 mapKey!25760 mapValue!25760))))

(declare-fun b!849479 () Bool)

(declare-fun e!473917 () Bool)

(assert (=> b!849479 (= e!473917 true)))

(declare-fun lt!382283 () ListLongMap!9377)

(declare-fun defaultEntry!696 () Int)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!26523)

(declare-fun lt!382282 () array!48422)

(declare-fun zeroValue!654 () V!26523)

(declare-fun getCurrentListMapNoExtraKeys!2686 (array!48420 array!48422 (_ BitVec 32) (_ BitVec 32) V!26523 V!26523 (_ BitVec 32) Int) ListLongMap!9377)

(declare-fun get!12234 (ValueCell!7614 V!26523) V!26523)

(declare-fun dynLambda!1000 (Int (_ BitVec 64)) V!26523)

(assert (=> b!849479 (= lt!382283 (+!2109 (getCurrentListMapNoExtraKeys!2686 _keys!868 lt!382282 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10609 (select (arr!23241 _keys!868) from!1053) (get!12234 (select (arr!23242 lt!382282) from!1053) (dynLambda!1000 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!849480 () Bool)

(declare-fun res!577094 () Bool)

(assert (=> b!849480 (=> (not res!577094) (not e!473918))))

(declare-datatypes ((List!16457 0))(
  ( (Nil!16454) (Cons!16453 (h!17584 (_ BitVec 64)) (t!22874 List!16457)) )
))
(declare-fun arrayNoDuplicates!0 (array!48420 (_ BitVec 32) List!16457) Bool)

(assert (=> b!849480 (= res!577094 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16454))))

(declare-fun b!849481 () Bool)

(declare-fun res!577095 () Bool)

(assert (=> b!849481 (=> (not res!577095) (not e!473918))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!849481 (= res!577095 (validKeyInArray!0 k0!854))))

(declare-fun mapIsEmpty!25760 () Bool)

(assert (=> mapIsEmpty!25760 mapRes!25760))

(declare-fun b!849482 () Bool)

(declare-fun tp_is_empty!16107 () Bool)

(assert (=> b!849482 (= e!473915 tp_is_empty!16107)))

(declare-fun res!577091 () Bool)

(assert (=> start!73056 (=> (not res!577091) (not e!473918))))

(assert (=> start!73056 (= res!577091 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23681 _keys!868))))))

(assert (=> start!73056 e!473918))

(assert (=> start!73056 tp_is_empty!16107))

(assert (=> start!73056 true))

(assert (=> start!73056 tp!49417))

(declare-fun array_inv!18446 (array!48420) Bool)

(assert (=> start!73056 (array_inv!18446 _keys!868)))

(declare-fun array_inv!18447 (array!48422) Bool)

(assert (=> start!73056 (and (array_inv!18447 _values!688) e!473919)))

(declare-fun b!849483 () Bool)

(declare-fun e!473916 () Bool)

(assert (=> b!849483 (= e!473916 (not e!473917))))

(declare-fun res!577096 () Bool)

(assert (=> b!849483 (=> res!577096 e!473917)))

(assert (=> b!849483 (= res!577096 (not (validKeyInArray!0 (select (arr!23241 _keys!868) from!1053))))))

(assert (=> b!849483 e!473920))

(declare-fun c!91627 () Bool)

(assert (=> b!849483 (= c!91627 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29007 0))(
  ( (Unit!29008) )
))
(declare-fun lt!382285 () Unit!29007)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!349 (array!48420 array!48422 (_ BitVec 32) (_ BitVec 32) V!26523 V!26523 (_ BitVec 32) (_ BitVec 64) V!26523 (_ BitVec 32) Int) Unit!29007)

(assert (=> b!849483 (= lt!382285 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!349 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37765 () Bool)

(assert (=> bm!37765 (= call!37769 (getCurrentListMapNoExtraKeys!2686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun bm!37766 () Bool)

(assert (=> bm!37766 (= call!37768 (getCurrentListMapNoExtraKeys!2686 _keys!868 lt!382282 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!849484 () Bool)

(declare-fun res!577088 () Bool)

(assert (=> b!849484 (=> (not res!577088) (not e!473918))))

(assert (=> b!849484 (= res!577088 (and (= (select (arr!23241 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!849485 () Bool)

(assert (=> b!849485 (= e!473913 tp_is_empty!16107)))

(declare-fun b!849486 () Bool)

(assert (=> b!849486 (= e!473918 e!473916)))

(declare-fun res!577090 () Bool)

(assert (=> b!849486 (=> (not res!577090) (not e!473916))))

(assert (=> b!849486 (= res!577090 (= from!1053 i!612))))

(assert (=> b!849486 (= lt!382283 (getCurrentListMapNoExtraKeys!2686 _keys!868 lt!382282 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!849486 (= lt!382282 (array!48423 (store (arr!23242 _values!688) i!612 (ValueCellFull!7614 v!557)) (size!23682 _values!688)))))

(declare-fun lt!382284 () ListLongMap!9377)

(assert (=> b!849486 (= lt!382284 (getCurrentListMapNoExtraKeys!2686 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!849487 () Bool)

(declare-fun res!577089 () Bool)

(assert (=> b!849487 (=> (not res!577089) (not e!473918))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48420 (_ BitVec 32)) Bool)

(assert (=> b!849487 (= res!577089 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(assert (= (and start!73056 res!577091) b!849473))

(assert (= (and b!849473 res!577093) b!849474))

(assert (= (and b!849474 res!577092) b!849487))

(assert (= (and b!849487 res!577089) b!849480))

(assert (= (and b!849480 res!577094) b!849475))

(assert (= (and b!849475 res!577097) b!849481))

(assert (= (and b!849481 res!577095) b!849484))

(assert (= (and b!849484 res!577088) b!849486))

(assert (= (and b!849486 res!577090) b!849483))

(assert (= (and b!849483 c!91627) b!849478))

(assert (= (and b!849483 (not c!91627)) b!849477))

(assert (= (or b!849478 b!849477) bm!37766))

(assert (= (or b!849478 b!849477) bm!37765))

(assert (= (and b!849483 (not res!577096)) b!849479))

(assert (= (and b!849476 condMapEmpty!25760) mapIsEmpty!25760))

(assert (= (and b!849476 (not condMapEmpty!25760)) mapNonEmpty!25760))

(get-info :version)

(assert (= (and mapNonEmpty!25760 ((_ is ValueCellFull!7614) mapValue!25760)) b!849482))

(assert (= (and b!849476 ((_ is ValueCellFull!7614) mapDefault!25760)) b!849485))

(assert (= start!73056 b!849476))

(declare-fun b_lambda!11503 () Bool)

(assert (=> (not b_lambda!11503) (not b!849479)))

(declare-fun t!22872 () Bool)

(declare-fun tb!4273 () Bool)

(assert (=> (and start!73056 (= defaultEntry!696 defaultEntry!696) t!22872) tb!4273))

(declare-fun result!8157 () Bool)

(assert (=> tb!4273 (= result!8157 tp_is_empty!16107)))

(assert (=> b!849479 t!22872))

(declare-fun b_and!23103 () Bool)

(assert (= b_and!23101 (and (=> t!22872 result!8157) b_and!23103)))

(declare-fun m!790149 () Bool)

(assert (=> start!73056 m!790149))

(declare-fun m!790151 () Bool)

(assert (=> start!73056 m!790151))

(declare-fun m!790153 () Bool)

(assert (=> b!849487 m!790153))

(declare-fun m!790155 () Bool)

(assert (=> b!849484 m!790155))

(declare-fun m!790157 () Bool)

(assert (=> bm!37766 m!790157))

(declare-fun m!790159 () Bool)

(assert (=> b!849473 m!790159))

(declare-fun m!790161 () Bool)

(assert (=> b!849480 m!790161))

(declare-fun m!790163 () Bool)

(assert (=> b!849481 m!790163))

(declare-fun m!790165 () Bool)

(assert (=> bm!37765 m!790165))

(declare-fun m!790167 () Bool)

(assert (=> b!849478 m!790167))

(declare-fun m!790169 () Bool)

(assert (=> mapNonEmpty!25760 m!790169))

(declare-fun m!790171 () Bool)

(assert (=> b!849479 m!790171))

(declare-fun m!790173 () Bool)

(assert (=> b!849479 m!790173))

(declare-fun m!790175 () Bool)

(assert (=> b!849479 m!790175))

(assert (=> b!849479 m!790157))

(assert (=> b!849479 m!790171))

(assert (=> b!849479 m!790157))

(declare-fun m!790177 () Bool)

(assert (=> b!849479 m!790177))

(declare-fun m!790179 () Bool)

(assert (=> b!849479 m!790179))

(assert (=> b!849479 m!790173))

(assert (=> b!849483 m!790179))

(assert (=> b!849483 m!790179))

(declare-fun m!790181 () Bool)

(assert (=> b!849483 m!790181))

(declare-fun m!790183 () Bool)

(assert (=> b!849483 m!790183))

(declare-fun m!790185 () Bool)

(assert (=> b!849486 m!790185))

(declare-fun m!790187 () Bool)

(assert (=> b!849486 m!790187))

(declare-fun m!790189 () Bool)

(assert (=> b!849486 m!790189))

(check-sat (not b!849473) (not b!849483) (not start!73056) (not b_next!13971) (not mapNonEmpty!25760) (not b!849479) tp_is_empty!16107 (not b_lambda!11503) (not bm!37765) (not b!849481) b_and!23103 (not bm!37766) (not b!849478) (not b!849487) (not b!849480) (not b!849486))
(check-sat b_and!23103 (not b_next!13971))
