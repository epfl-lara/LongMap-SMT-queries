; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!72454 () Bool)

(assert start!72454)

(declare-fun b_free!13657 () Bool)

(declare-fun b_next!13657 () Bool)

(assert (=> start!72454 (= b_free!13657 (not b_next!13657))))

(declare-fun tp!48071 () Bool)

(declare-fun b_and!22717 () Bool)

(assert (=> start!72454 (= tp!48071 b_and!22717)))

(declare-fun b!840384 () Bool)

(declare-fun res!571370 () Bool)

(declare-fun e!468878 () Bool)

(assert (=> b!840384 (=> (not res!571370) (not e!468878))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k0!854 () (_ BitVec 64))

(declare-datatypes ((array!47301 0))(
  ( (array!47302 (arr!22682 (Array (_ BitVec 32) (_ BitVec 64))) (size!23124 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47301)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840384 (= res!571370 (and (= (select (arr!22682 _keys!868) i!612) k0!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23124 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840385 () Bool)

(declare-fun e!468880 () Bool)

(declare-fun e!468882 () Bool)

(declare-fun mapRes!24884 () Bool)

(assert (=> b!840385 (= e!468880 (and e!468882 mapRes!24884))))

(declare-fun condMapEmpty!24884 () Bool)

(declare-datatypes ((V!25745 0))(
  ( (V!25746 (val!7809 Int)) )
))
(declare-datatypes ((ValueCell!7322 0))(
  ( (ValueCellFull!7322 (v!10228 V!25745)) (EmptyCell!7322) )
))
(declare-datatypes ((array!47303 0))(
  ( (array!47304 (arr!22683 (Array (_ BitVec 32) ValueCell!7322)) (size!23125 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47303)

(declare-fun mapDefault!24884 () ValueCell!7322)

(assert (=> b!840385 (= condMapEmpty!24884 (= (arr!22683 _values!688) ((as const (Array (_ BitVec 32) ValueCell!7322)) mapDefault!24884)))))

(declare-fun b!840386 () Bool)

(declare-fun res!571367 () Bool)

(assert (=> b!840386 (=> (not res!571367) (not e!468878))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47301 (_ BitVec 32)) Bool)

(assert (=> b!840386 (= res!571367 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!840387 () Bool)

(declare-fun e!468877 () Bool)

(declare-datatypes ((tuple2!10368 0))(
  ( (tuple2!10369 (_1!5195 (_ BitVec 64)) (_2!5195 V!25745)) )
))
(declare-datatypes ((List!16147 0))(
  ( (Nil!16144) (Cons!16143 (h!17274 tuple2!10368) (t!22509 List!16147)) )
))
(declare-datatypes ((ListLongMap!9127 0))(
  ( (ListLongMap!9128 (toList!4579 List!16147)) )
))
(declare-fun call!37178 () ListLongMap!9127)

(declare-fun call!37179 () ListLongMap!9127)

(assert (=> b!840387 (= e!468877 (= call!37178 call!37179))))

(declare-fun b!840388 () Bool)

(declare-fun res!571366 () Bool)

(assert (=> b!840388 (=> (not res!571366) (not e!468878))))

(declare-datatypes ((List!16148 0))(
  ( (Nil!16145) (Cons!16144 (h!17275 (_ BitVec 64)) (t!22510 List!16148)) )
))
(declare-fun arrayNoDuplicates!0 (array!47301 (_ BitVec 32) List!16148) Bool)

(assert (=> b!840388 (= res!571366 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16145))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun bm!37175 () Bool)

(declare-fun minValue!654 () V!25745)

(declare-fun zeroValue!654 () V!25745)

(declare-fun getCurrentListMapNoExtraKeys!2598 (array!47301 array!47303 (_ BitVec 32) (_ BitVec 32) V!25745 V!25745 (_ BitVec 32) Int) ListLongMap!9127)

(assert (=> bm!37175 (= call!37179 (getCurrentListMapNoExtraKeys!2598 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840390 () Bool)

(declare-fun tp_is_empty!15523 () Bool)

(assert (=> b!840390 (= e!468882 tp_is_empty!15523)))

(declare-fun b!840391 () Bool)

(declare-fun res!571371 () Bool)

(assert (=> b!840391 (=> (not res!571371) (not e!468878))))

(assert (=> b!840391 (= res!571371 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23124 _keys!868))))))

(declare-fun bm!37176 () Bool)

(declare-fun v!557 () V!25745)

(assert (=> bm!37176 (= call!37178 (getCurrentListMapNoExtraKeys!2598 _keys!868 (array!47304 (store (arr!22683 _values!688) i!612 (ValueCellFull!7322 v!557)) (size!23125 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840392 () Bool)

(declare-fun res!571365 () Bool)

(assert (=> b!840392 (=> (not res!571365) (not e!468878))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840392 (= res!571365 (validMask!0 mask!1196))))

(declare-fun b!840393 () Bool)

(declare-fun +!2066 (ListLongMap!9127 tuple2!10368) ListLongMap!9127)

(assert (=> b!840393 (= e!468877 (= call!37178 (+!2066 call!37179 (tuple2!10369 k0!854 v!557))))))

(declare-fun b!840394 () Bool)

(declare-fun e!468881 () Bool)

(assert (=> b!840394 (= e!468881 tp_is_empty!15523)))

(declare-fun b!840395 () Bool)

(declare-fun res!571369 () Bool)

(assert (=> b!840395 (=> (not res!571369) (not e!468878))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!840395 (= res!571369 (validKeyInArray!0 k0!854))))

(declare-fun res!571368 () Bool)

(assert (=> start!72454 (=> (not res!571368) (not e!468878))))

(assert (=> start!72454 (= res!571368 (and (bvsge from!1053 #b00000000000000000000000000000000) (bvsle from!1053 (size!23124 _keys!868))))))

(assert (=> start!72454 e!468878))

(assert (=> start!72454 tp_is_empty!15523))

(assert (=> start!72454 true))

(assert (=> start!72454 tp!48071))

(declare-fun array_inv!18132 (array!47301) Bool)

(assert (=> start!72454 (array_inv!18132 _keys!868)))

(declare-fun array_inv!18133 (array!47303) Bool)

(assert (=> start!72454 (and (array_inv!18133 _values!688) e!468880)))

(declare-fun b!840389 () Bool)

(assert (=> b!840389 (= e!468878 (not true))))

(assert (=> b!840389 e!468877))

(declare-fun c!91280 () Bool)

(assert (=> b!840389 (= c!91280 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28819 0))(
  ( (Unit!28820) )
))
(declare-fun lt!380615 () Unit!28819)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!284 (array!47301 array!47303 (_ BitVec 32) (_ BitVec 32) V!25745 V!25745 (_ BitVec 32) (_ BitVec 64) V!25745 (_ BitVec 32) Int) Unit!28819)

(assert (=> b!840389 (= lt!380615 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!284 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k0!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun mapIsEmpty!24884 () Bool)

(assert (=> mapIsEmpty!24884 mapRes!24884))

(declare-fun b!840396 () Bool)

(declare-fun res!571364 () Bool)

(assert (=> b!840396 (=> (not res!571364) (not e!468878))))

(assert (=> b!840396 (= res!571364 (and (= (size!23125 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23124 _keys!868) (size!23125 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!24884 () Bool)

(declare-fun tp!48070 () Bool)

(assert (=> mapNonEmpty!24884 (= mapRes!24884 (and tp!48070 e!468881))))

(declare-fun mapKey!24884 () (_ BitVec 32))

(declare-fun mapValue!24884 () ValueCell!7322)

(declare-fun mapRest!24884 () (Array (_ BitVec 32) ValueCell!7322))

(assert (=> mapNonEmpty!24884 (= (arr!22683 _values!688) (store mapRest!24884 mapKey!24884 mapValue!24884))))

(assert (= (and start!72454 res!571368) b!840392))

(assert (= (and b!840392 res!571365) b!840396))

(assert (= (and b!840396 res!571364) b!840386))

(assert (= (and b!840386 res!571367) b!840388))

(assert (= (and b!840388 res!571366) b!840391))

(assert (= (and b!840391 res!571371) b!840395))

(assert (= (and b!840395 res!571369) b!840384))

(assert (= (and b!840384 res!571370) b!840389))

(assert (= (and b!840389 c!91280) b!840393))

(assert (= (and b!840389 (not c!91280)) b!840387))

(assert (= (or b!840393 b!840387) bm!37176))

(assert (= (or b!840393 b!840387) bm!37175))

(assert (= (and b!840385 condMapEmpty!24884) mapIsEmpty!24884))

(assert (= (and b!840385 (not condMapEmpty!24884)) mapNonEmpty!24884))

(get-info :version)

(assert (= (and mapNonEmpty!24884 ((_ is ValueCellFull!7322) mapValue!24884)) b!840394))

(assert (= (and b!840385 ((_ is ValueCellFull!7322) mapDefault!24884)) b!840390))

(assert (= start!72454 b!840385))

(declare-fun m!783581 () Bool)

(assert (=> b!840386 m!783581))

(declare-fun m!783583 () Bool)

(assert (=> b!840389 m!783583))

(declare-fun m!783585 () Bool)

(assert (=> b!840392 m!783585))

(declare-fun m!783587 () Bool)

(assert (=> b!840384 m!783587))

(declare-fun m!783589 () Bool)

(assert (=> b!840393 m!783589))

(declare-fun m!783591 () Bool)

(assert (=> b!840388 m!783591))

(declare-fun m!783593 () Bool)

(assert (=> start!72454 m!783593))

(declare-fun m!783595 () Bool)

(assert (=> start!72454 m!783595))

(declare-fun m!783597 () Bool)

(assert (=> mapNonEmpty!24884 m!783597))

(declare-fun m!783599 () Bool)

(assert (=> bm!37175 m!783599))

(declare-fun m!783601 () Bool)

(assert (=> bm!37176 m!783601))

(declare-fun m!783603 () Bool)

(assert (=> bm!37176 m!783603))

(declare-fun m!783605 () Bool)

(assert (=> b!840395 m!783605))

(check-sat (not b!840388) b_and!22717 (not start!72454) (not b!840392) (not b!840389) tp_is_empty!15523 (not b!840395) (not bm!37175) (not bm!37176) (not mapNonEmpty!24884) (not b!840393) (not b_next!13657) (not b!840386))
(check-sat b_and!22717 (not b_next!13657))
