; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!73000 () Bool)

(assert start!73000)

(declare-fun b_free!13933 () Bool)

(declare-fun b_next!13933 () Bool)

(assert (=> start!73000 (= b_free!13933 (not b_next!13933))))

(declare-fun tp!49304 () Bool)

(declare-fun b_and!22999 () Bool)

(assert (=> start!73000 (= tp!49304 b_and!22999)))

(declare-fun mapNonEmpty!25703 () Bool)

(declare-fun mapRes!25703 () Bool)

(declare-fun tp!49303 () Bool)

(declare-fun e!473310 () Bool)

(assert (=> mapNonEmpty!25703 (= mapRes!25703 (and tp!49303 e!473310))))

(declare-datatypes ((V!26473 0))(
  ( (V!26474 (val!8082 Int)) )
))
(declare-datatypes ((ValueCell!7595 0))(
  ( (ValueCellFull!7595 (v!10501 V!26473)) (EmptyCell!7595) )
))
(declare-fun mapValue!25703 () ValueCell!7595)

(declare-fun mapRest!25703 () (Array (_ BitVec 32) ValueCell!7595))

(declare-fun mapKey!25703 () (_ BitVec 32))

(declare-datatypes ((array!48345 0))(
  ( (array!48346 (arr!23204 (Array (_ BitVec 32) ValueCell!7595)) (size!23646 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48345)

(assert (=> mapNonEmpty!25703 (= (arr!23204 _values!688) (store mapRest!25703 mapKey!25703 mapValue!25703))))

(declare-fun b!848341 () Bool)

(declare-fun tp_is_empty!16069 () Bool)

(assert (=> b!848341 (= e!473310 tp_is_empty!16069)))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((tuple2!10600 0))(
  ( (tuple2!10601 (_1!5311 (_ BitVec 64)) (_2!5311 V!26473)) )
))
(declare-datatypes ((List!16450 0))(
  ( (Nil!16447) (Cons!16446 (h!17577 tuple2!10600) (t!22820 List!16450)) )
))
(declare-datatypes ((ListLongMap!9359 0))(
  ( (ListLongMap!9360 (toList!4695 List!16450)) )
))
(declare-fun call!37629 () ListLongMap!9359)

(declare-datatypes ((array!48347 0))(
  ( (array!48348 (arr!23205 (Array (_ BitVec 32) (_ BitVec 64))) (size!23647 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48347)

(declare-fun lt!381821 () array!48345)

(declare-fun minValue!654 () V!26473)

(declare-fun zeroValue!654 () V!26473)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun bm!37625 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2705 (array!48347 array!48345 (_ BitVec 32) (_ BitVec 32) V!26473 V!26473 (_ BitVec 32) Int) ListLongMap!9359)

(assert (=> bm!37625 (= call!37629 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!381821 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848342 () Bool)

(declare-fun res!576413 () Bool)

(declare-fun e!473313 () Bool)

(assert (=> b!848342 (=> (not res!576413) (not e!473313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!848342 (= res!576413 (validMask!0 mask!1196))))

(declare-fun b!848343 () Bool)

(declare-fun e!473309 () Bool)

(declare-fun call!37628 () ListLongMap!9359)

(assert (=> b!848343 (= e!473309 (= call!37629 call!37628))))

(declare-fun b!848344 () Bool)

(declare-fun res!576412 () Bool)

(assert (=> b!848344 (=> (not res!576412) (not e!473313))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(assert (=> b!848344 (= res!576412 (and (= (select (arr!23205 _keys!868) i!612) k0!854) (bvsle from!1053 i!612)))))

(declare-fun b!848345 () Bool)

(declare-fun res!576409 () Bool)

(assert (=> b!848345 (=> (not res!576409) (not e!473313))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!848345 (= res!576409 (validKeyInArray!0 k0!854))))

(declare-fun bm!37626 () Bool)

(assert (=> bm!37626 (= call!37628 (getCurrentListMapNoExtraKeys!2705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun v!557 () V!26473)

(declare-fun b!848346 () Bool)

(declare-fun +!2123 (ListLongMap!9359 tuple2!10600) ListLongMap!9359)

(assert (=> b!848346 (= e!473309 (= call!37629 (+!2123 call!37628 (tuple2!10601 k0!854 v!557))))))

(declare-fun b!848347 () Bool)

(declare-fun res!576410 () Bool)

(assert (=> b!848347 (=> (not res!576410) (not e!473313))))

(declare-datatypes ((List!16451 0))(
  ( (Nil!16448) (Cons!16447 (h!17578 (_ BitVec 64)) (t!22821 List!16451)) )
))
(declare-fun arrayNoDuplicates!0 (array!48347 (_ BitVec 32) List!16451) Bool)

(assert (=> b!848347 (= res!576410 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16448))))

(declare-fun mapIsEmpty!25703 () Bool)

(assert (=> mapIsEmpty!25703 mapRes!25703))

(declare-fun res!576408 () Bool)

(assert (=> start!73000 (=> (not res!576408) (not e!473313))))

(assert (=> start!73000 (= res!576408 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23647 _keys!868))))))

(assert (=> start!73000 e!473313))

(assert (=> start!73000 tp_is_empty!16069))

(assert (=> start!73000 true))

(assert (=> start!73000 tp!49304))

(declare-fun array_inv!18504 (array!48347) Bool)

(assert (=> start!73000 (array_inv!18504 _keys!868)))

(declare-fun e!473316 () Bool)

(declare-fun array_inv!18505 (array!48345) Bool)

(assert (=> start!73000 (and (array_inv!18505 _values!688) e!473316)))

(declare-fun b!848348 () Bool)

(declare-fun e!473315 () Bool)

(assert (=> b!848348 (= e!473315 tp_is_empty!16069)))

(declare-fun b!848349 () Bool)

(assert (=> b!848349 (= e!473316 (and e!473315 mapRes!25703))))

(declare-fun condMapEmpty!25703 () Bool)

(declare-fun mapDefault!25703 () ValueCell!7595)

(assert (=> b!848349 (= condMapEmpty!25703 (= (arr!23204 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7595)) mapDefault!25703)))))

(declare-fun b!848350 () Bool)

(declare-fun e!473314 () Bool)

(assert (=> b!848350 (= e!473314 true)))

(declare-fun lt!381818 () ListLongMap!9359)

(declare-fun get!12215 (ValueCell!7595 V!26473) V!26473)

(declare-fun dynLambda!990 (Int (_ BitVec 64)) V!26473)

(assert (=> b!848350 (= lt!381818 (+!2123 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!381821 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696) (tuple2!10601 (select (arr!23205 _keys!868) from!1053) (get!12215 (select (arr!23204 lt!381821) from!1053) (dynLambda!990 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000)))))))

(declare-fun b!848351 () Bool)

(declare-fun e!473312 () Bool)

(assert (=> b!848351 (= e!473312 (not e!473314))))

(declare-fun res!576417 () Bool)

(assert (=> b!848351 (=> res!576417 e!473314)))

(assert (=> b!848351 (= res!576417 (not (validKeyInArray!0 (select (arr!23205 _keys!868) from!1053))))))

(assert (=> b!848351 e!473309))

(declare-fun c!91505 () Bool)

(assert (=> b!848351 (= c!91505 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28925 0))(
  ( (Unit!28926) )
))
(declare-fun lt!381820 () Unit!28925)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!337 (array!48347 array!48345 (_ BitVec 32) (_ BitVec 32) V!26473 V!26473 (_ BitVec 32) (_ BitVec 64) V!26473 (_ BitVec 32) Int) Unit!28925)

(assert (=> b!848351 (= lt!381820 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!337 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!848352 () Bool)

(declare-fun res!576415 () Bool)

(assert (=> b!848352 (=> (not res!576415) (not e!473313))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48347 (_ BitVec 32)) Bool)

(assert (=> b!848352 (= res!576415 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!848353 () Bool)

(declare-fun res!576411 () Bool)

(assert (=> b!848353 (=> (not res!576411) (not e!473313))))

(assert (=> b!848353 (= res!576411 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23647 _keys!868))))))

(declare-fun b!848354 () Bool)

(assert (=> b!848354 (= e!473313 e!473312)))

(declare-fun res!576416 () Bool)

(assert (=> b!848354 (=> (not res!576416) (not e!473312))))

(assert (=> b!848354 (= res!576416 (= from!1053 i!612))))

(assert (=> b!848354 (= lt!381818 (getCurrentListMapNoExtraKeys!2705 _keys!868 lt!381821 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(assert (=> b!848354 (= lt!381821 (array!48346 (store (arr!23204 _values!688) i!612 (ValueCellFull!7595 v!557)) (size!23646 _values!688)))))

(declare-fun lt!381819 () ListLongMap!9359)

(assert (=> b!848354 (= lt!381819 (getCurrentListMapNoExtraKeys!2705 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!848355 () Bool)

(declare-fun res!576414 () Bool)

(assert (=> b!848355 (=> (not res!576414) (not e!473313))))

(assert (=> b!848355 (= res!576414 (and (= (size!23646 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23647 _keys!868) (size!23646 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(assert (= (and start!73000 res!576408) b!848342))

(assert (= (and b!848342 res!576413) b!848355))

(assert (= (and b!848355 res!576414) b!848352))

(assert (= (and b!848352 res!576415) b!848347))

(assert (= (and b!848347 res!576410) b!848353))

(assert (= (and b!848353 res!576411) b!848345))

(assert (= (and b!848345 res!576409) b!848344))

(assert (= (and b!848344 res!576412) b!848354))

(assert (= (and b!848354 res!576416) b!848351))

(assert (= (and b!848351 c!91505) b!848346))

(assert (= (and b!848351 (not c!91505)) b!848343))

(assert (= (or b!848346 b!848343) bm!37626))

(assert (= (or b!848346 b!848343) bm!37625))

(assert (= (and b!848351 (not res!576417)) b!848350))

(assert (= (and b!848349 condMapEmpty!25703) mapIsEmpty!25703))

(assert (= (and b!848349 (not condMapEmpty!25703)) mapNonEmpty!25703))

(get-info :version)

(assert (= (and mapNonEmpty!25703 ((_ is ValueCellFull!7595) mapValue!25703)) b!848341))

(assert (= (and b!848349 ((_ is ValueCellFull!7595) mapDefault!25703)) b!848348))

(assert (= start!73000 b!848349))

(declare-fun b_lambda!11447 () Bool)

(assert (=> (not b_lambda!11447) (not b!848350)))

(declare-fun t!22819 () Bool)

(declare-fun tb!4227 () Bool)

(assert (=> (and start!73000 (= defaultEntry!696 defaultEntry!696) t!22819) tb!4227))

(declare-fun result!8073 () Bool)

(assert (=> tb!4227 (= result!8073 tp_is_empty!16069)))

(assert (=> b!848350 t!22819))

(declare-fun b_and!23001 () Bool)

(assert (= b_and!22999 (and (=> t!22819 result!8073) b_and!23001)))

(declare-fun m!788597 () Bool)

(assert (=> b!848346 m!788597))

(declare-fun m!788599 () Bool)

(assert (=> bm!37626 m!788599))

(declare-fun m!788601 () Bool)

(assert (=> b!848351 m!788601))

(assert (=> b!848351 m!788601))

(declare-fun m!788603 () Bool)

(assert (=> b!848351 m!788603))

(declare-fun m!788605 () Bool)

(assert (=> b!848351 m!788605))

(declare-fun m!788607 () Bool)

(assert (=> b!848344 m!788607))

(declare-fun m!788609 () Bool)

(assert (=> start!73000 m!788609))

(declare-fun m!788611 () Bool)

(assert (=> start!73000 m!788611))

(declare-fun m!788613 () Bool)

(assert (=> mapNonEmpty!25703 m!788613))

(declare-fun m!788615 () Bool)

(assert (=> b!848354 m!788615))

(declare-fun m!788617 () Bool)

(assert (=> b!848354 m!788617))

(declare-fun m!788619 () Bool)

(assert (=> b!848354 m!788619))

(declare-fun m!788621 () Bool)

(assert (=> b!848345 m!788621))

(declare-fun m!788623 () Bool)

(assert (=> b!848352 m!788623))

(declare-fun m!788625 () Bool)

(assert (=> b!848350 m!788625))

(declare-fun m!788627 () Bool)

(assert (=> b!848350 m!788627))

(declare-fun m!788629 () Bool)

(assert (=> b!848350 m!788629))

(declare-fun m!788631 () Bool)

(assert (=> b!848350 m!788631))

(declare-fun m!788633 () Bool)

(assert (=> b!848350 m!788633))

(assert (=> b!848350 m!788631))

(assert (=> b!848350 m!788625))

(assert (=> b!848350 m!788601))

(assert (=> b!848350 m!788627))

(declare-fun m!788635 () Bool)

(assert (=> b!848342 m!788635))

(declare-fun m!788637 () Bool)

(assert (=> b!848347 m!788637))

(assert (=> bm!37625 m!788631))

(check-sat (not start!73000) (not bm!37625) (not b!848354) (not b!848346) (not b!848351) (not b_lambda!11447) b_and!23001 (not b!848342) tp_is_empty!16069 (not bm!37626) (not b!848347) (not b!848352) (not b!848350) (not b_next!13933) (not b!848345) (not mapNonEmpty!25703))
(check-sat b_and!23001 (not b_next!13933))
