; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72460 () Bool)

(assert start!72460)

(declare-fun b_free!13663 () Bool)

(declare-fun b_next!13663 () Bool)

(assert (=> start!72460 (= b_free!13663 (not b_next!13663))))

(declare-fun tp!48089 () Bool)

(declare-fun b_and!22723 () Bool)

(assert (=> start!72460 (= tp!48089 b_and!22723)))

(declare-fun b!840501 () Bool)

(declare-fun res!571439 () Bool)

(declare-fun e!468931 () Bool)

(assert (=> b!840501 (=> (not res!571439) (not e!468931))))

(declare-datatypes ((array!47313 0))(
  ( (array!47314 (arr!22688 (Array (_ BitVec 32) (_ BitVec 64))) (size!23130 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47313)

(declare-datatypes ((List!16152 0))(
  ( (Nil!16149) (Cons!16148 (h!17279 (_ BitVec 64)) (t!22514 List!16152)) )
))
(declare-fun arrayNoDuplicates!0 (array!47313 (_ BitVec 32) List!16152) Bool)

(assert (=> b!840501 (= res!571439 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16149))))

(declare-fun b!840502 () Bool)

(declare-fun res!571436 () Bool)

(assert (=> b!840502 (=> (not res!571436) (not e!468931))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840502 (= res!571436 (validMask!0 mask!1196))))

(declare-fun mapNonEmpty!24893 () Bool)

(declare-fun mapRes!24893 () Bool)

(declare-fun tp!48088 () Bool)

(declare-fun e!468934 () Bool)

(assert (=> mapNonEmpty!24893 (= mapRes!24893 (and tp!48088 e!468934))))

(declare-datatypes ((V!25753 0))(
  ( (V!25754 (val!7812 Int)) )
))
(declare-datatypes ((ValueCell!7325 0))(
  ( (ValueCellFull!7325 (v!10231 V!25753)) (EmptyCell!7325) )
))
(declare-fun mapRest!24893 () (Array (_ BitVec 32) ValueCell!7325))

(declare-fun mapValue!24893 () ValueCell!7325)

(declare-fun mapKey!24893 () (_ BitVec 32))

(declare-datatypes ((array!47315 0))(
  ( (array!47316 (arr!22689 (Array (_ BitVec 32) ValueCell!7325)) (size!23131 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47315)

(assert (=> mapNonEmpty!24893 (= (arr!22689 _values!688) (store mapRest!24893 mapKey!24893 mapValue!24893))))

(declare-datatypes ((tuple2!10374 0))(
  ( (tuple2!10375 (_1!5198 (_ BitVec 64)) (_2!5198 V!25753)) )
))
(declare-datatypes ((List!16153 0))(
  ( (Nil!16150) (Cons!16149 (h!17280 tuple2!10374) (t!22515 List!16153)) )
))
(declare-datatypes ((ListLongMap!9133 0))(
  ( (ListLongMap!9134 (toList!4582 List!16153)) )
))
(declare-fun call!37197 () ListLongMap!9133)

(declare-fun bm!37193 () Bool)

(declare-fun v!557 () V!25753)

(declare-fun i!612 () (_ BitVec 32))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun minValue!654 () V!25753)

(declare-fun zeroValue!654 () V!25753)

(declare-fun getCurrentListMapNoExtraKeys!2600 (array!47313 array!47315 (_ BitVec 32) (_ BitVec 32) V!25753 V!25753 (_ BitVec 32) Int) ListLongMap!9133)

(assert (=> bm!37193 (= call!37197 (getCurrentListMapNoExtraKeys!2600 _keys!868 (array!47316 (store (arr!22689 _values!688) i!612 (ValueCellFull!7325 v!557)) (size!23131 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840503 () Bool)

(assert (=> b!840503 (= e!468931 (not true))))

(declare-fun e!468935 () Bool)

(assert (=> b!840503 e!468935))

(declare-fun c!91289 () Bool)

(assert (=> b!840503 (= c!91289 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((Unit!28825 0))(
  ( (Unit!28826) )
))
(declare-fun lt!380624 () Unit!28825)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!287 (array!47313 array!47315 (_ BitVec 32) (_ BitVec 32) V!25753 V!25753 (_ BitVec 32) (_ BitVec 64) V!25753 (_ BitVec 32) Int) Unit!28825)

(assert (=> b!840503 (= lt!380624 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!287 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840504 () Bool)

(declare-fun call!37196 () ListLongMap!9133)

(assert (=> b!840504 (= e!468935 (= call!37197 call!37196))))

(declare-fun bm!37194 () Bool)

(assert (=> bm!37194 (= call!37196 (getCurrentListMapNoExtraKeys!2600 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840505 () Bool)

(declare-fun res!571441 () Bool)

(assert (=> b!840505 (=> (not res!571441) (not e!468931))))

(assert (=> b!840505 (= res!571441 (and (= (size!23131 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23130 _keys!868) (size!23131 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840506 () Bool)

(declare-fun res!571438 () Bool)

(assert (=> b!840506 (=> (not res!571438) (not e!468931))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840506 (= res!571438 (validKeyInArray!0 k0!854))))

(declare-fun b!840507 () Bool)

(declare-fun res!571437 () Bool)

(assert (=> b!840507 (=> (not res!571437) (not e!468931))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47313 (_ BitVec 32)) Bool)

(assert (=> b!840507 (= res!571437 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840508 () Bool)

(declare-fun tp_is_empty!15529 () Bool)

(assert (=> b!840508 (= e!468934 tp_is_empty!15529)))

(declare-fun res!571443 () Bool)

(assert (=> start!72460 (=> (not res!571443) (not e!468931))))

(assert (=> start!72460 (= res!571443 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23130 _keys!868))))))

(assert (=> start!72460 e!468931))

(assert (=> start!72460 tp_is_empty!15529))

(assert (=> start!72460 true))

(assert (=> start!72460 tp!48089))

(declare-fun array_inv!18136 (array!47313) Bool)

(assert (=> start!72460 (array_inv!18136 _keys!868)))

(declare-fun e!468936 () Bool)

(declare-fun array_inv!18137 (array!47315) Bool)

(assert (=> start!72460 (and (array_inv!18137 _values!688) e!468936)))

(declare-fun mapIsEmpty!24893 () Bool)

(assert (=> mapIsEmpty!24893 mapRes!24893))

(declare-fun b!840509 () Bool)

(declare-fun e!468932 () Bool)

(assert (=> b!840509 (= e!468932 tp_is_empty!15529)))

(declare-fun b!840510 () Bool)

(declare-fun res!571440 () Bool)

(assert (=> b!840510 (=> (not res!571440) (not e!468931))))

(assert (=> b!840510 (= res!571440 (and (= (select (arr!22688 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23130 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840511 () Bool)

(assert (=> b!840511 (= e!468936 (and e!468932 mapRes!24893))))

(declare-fun condMapEmpty!24893 () Bool)

(declare-fun mapDefault!24893 () ValueCell!7325)

(assert (=> b!840511 (= condMapEmpty!24893 (= (arr!22689 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7325)) mapDefault!24893)))))

(declare-fun b!840512 () Bool)

(declare-fun res!571442 () Bool)

(assert (=> b!840512 (=> (not res!571442) (not e!468931))))

(assert (=> b!840512 (= res!571442 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23130 _keys!868))))))

(declare-fun b!840513 () Bool)

(declare-fun +!2069 (ListLongMap!9133 tuple2!10374) ListLongMap!9133)

(assert (=> b!840513 (= e!468935 (= call!37197 (+!2069 call!37196 (tuple2!10375 k0!854 v!557))))))

(assert (= (and start!72460 res!571443) b!840502))

(assert (= (and b!840502 res!571436) b!840505))

(assert (= (and b!840505 res!571441) b!840507))

(assert (= (and b!840507 res!571437) b!840501))

(assert (= (and b!840501 res!571439) b!840512))

(assert (= (and b!840512 res!571442) b!840506))

(assert (= (and b!840506 res!571438) b!840510))

(assert (= (and b!840510 res!571440) b!840503))

(assert (= (and b!840503 c!91289) b!840513))

(assert (= (and b!840503 (not c!91289)) b!840504))

(assert (= (or b!840513 b!840504) bm!37193))

(assert (= (or b!840513 b!840504) bm!37194))

(assert (= (and b!840511 condMapEmpty!24893) mapIsEmpty!24893))

(assert (= (and b!840511 (not condMapEmpty!24893)) mapNonEmpty!24893))

(get-info :version)

(assert (= (and mapNonEmpty!24893 ((_ is ValueCellFull!7325) mapValue!24893)) b!840508))

(assert (= (and b!840511 ((_ is ValueCellFull!7325) mapDefault!24893)) b!840509))

(assert (= start!72460 b!840511))

(declare-fun m!783659 () Bool)

(assert (=> bm!37193 m!783659))

(declare-fun m!783661 () Bool)

(assert (=> bm!37193 m!783661))

(declare-fun m!783663 () Bool)

(assert (=> b!840502 m!783663))

(declare-fun m!783665 () Bool)

(assert (=> b!840510 m!783665))

(declare-fun m!783667 () Bool)

(assert (=> bm!37194 m!783667))

(declare-fun m!783669 () Bool)

(assert (=> b!840507 m!783669))

(declare-fun m!783671 () Bool)

(assert (=> b!840513 m!783671))

(declare-fun m!783673 () Bool)

(assert (=> mapNonEmpty!24893 m!783673))

(declare-fun m!783675 () Bool)

(assert (=> b!840506 m!783675))

(declare-fun m!783677 () Bool)

(assert (=> b!840501 m!783677))

(declare-fun m!783679 () Bool)

(assert (=> start!72460 m!783679))

(declare-fun m!783681 () Bool)

(assert (=> start!72460 m!783681))

(declare-fun m!783683 () Bool)

(assert (=> b!840503 m!783683))

(check-sat (not start!72460) (not bm!37194) (not mapNonEmpty!24893) (not bm!37193) (not b!840501) (not b_next!13663) (not b!840502) (not b!840506) (not b!840513) b_and!22723 (not b!840503) (not b!840507) tp_is_empty!15529)
(check-sat b_and!22723 (not b_next!13663))
