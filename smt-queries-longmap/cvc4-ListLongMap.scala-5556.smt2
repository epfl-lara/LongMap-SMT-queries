; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73124 () Bool)

(assert start!73124)

(declare-fun b_free!14039 () Bool)

(declare-fun b_next!14039 () Bool)

(assert (=> start!73124 (= b_free!14039 (not b_next!14039))))

(declare-fun tp!49621 () Bool)

(declare-fun b_and!23237 () Bool)

(assert (=> start!73124 (= tp!49621 b_and!23237)))

(declare-fun b!851071 () Bool)

(declare-fun e!474729 () Bool)

(declare-datatypes ((V!26613 0))(
  ( (V!26614 (val!8135 Int)) )
))
(declare-datatypes ((tuple2!10672 0))(
  ( (tuple2!10673 (_1!5347 (_ BitVec 64)) (_2!5347 V!26613)) )
))
(declare-datatypes ((List!16512 0))(
  ( (Nil!16509) (Cons!16508 (h!17639 tuple2!10672) (t!22997 List!16512)) )
))
(declare-datatypes ((ListLongMap!9441 0))(
  ( (ListLongMap!9442 (toList!4736 List!16512)) )
))
(declare-fun call!37973 () ListLongMap!9441)

(declare-fun call!37972 () ListLongMap!9441)

(assert (=> b!851071 (= e!474729 (= call!37973 call!37972))))

(declare-fun b!851072 () Bool)

(declare-fun res!578114 () Bool)

(declare-fun e!474733 () Bool)

(assert (=> b!851072 (=> (not res!578114) (not e!474733))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!851072 (= res!578114 (validMask!0 mask!1196))))

(declare-fun b!851073 () Bool)

(declare-fun e!474732 () Bool)

(declare-fun e!474736 () Bool)

(assert (=> b!851073 (= e!474732 (not e!474736))))

(declare-fun res!578108 () Bool)

(assert (=> b!851073 (=> res!578108 e!474736)))

(declare-datatypes ((array!48554 0))(
  ( (array!48555 (arr!23308 (Array (_ BitVec 32) (_ BitVec 64))) (size!23748 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48554)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851073 (= res!578108 (not (validKeyInArray!0 (select (arr!23308 _keys!868) from!1053))))))

(assert (=> b!851073 e!474729))

(declare-fun c!91729 () Bool)

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851073 (= c!91729 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!26613)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!29063 0))(
  ( (Unit!29064) )
))
(declare-fun lt!383227 () Unit!29063)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((ValueCell!7648 0))(
  ( (ValueCellFull!7648 (v!10560 V!26613)) (EmptyCell!7648) )
))
(declare-datatypes ((array!48556 0))(
  ( (array!48557 (arr!23309 (Array (_ BitVec 32) ValueCell!7648)) (size!23749 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48556)

(declare-fun minValue!654 () V!26613)

(declare-fun zeroValue!654 () V!26613)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!373 (array!48554 array!48556 (_ BitVec 32) (_ BitVec 32) V!26613 V!26613 (_ BitVec 32) (_ BitVec 64) V!26613 (_ BitVec 32) Int) Unit!29063)

(assert (=> b!851073 (= lt!383227 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!373 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851074 () Bool)

(declare-fun res!578117 () Bool)

(assert (=> b!851074 (=> (not res!578117) (not e!474733))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48554 (_ BitVec 32)) Bool)

(assert (=> b!851074 (= res!578117 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851075 () Bool)

(assert (=> b!851075 (= e!474736 true)))

(declare-fun lt!383232 () V!26613)

(declare-fun lt!383231 () ListLongMap!9441)

(declare-fun lt!383233 () tuple2!10672)

(declare-fun +!2136 (ListLongMap!9441 tuple2!10672) ListLongMap!9441)

(assert (=> b!851075 (= (+!2136 lt!383231 lt!383233) (+!2136 (+!2136 lt!383231 (tuple2!10673 k!854 lt!383232)) lt!383233))))

(declare-fun lt!383226 () V!26613)

(assert (=> b!851075 (= lt!383233 (tuple2!10673 k!854 lt!383226))))

(declare-fun lt!383230 () Unit!29063)

(declare-fun addSameAsAddTwiceSameKeyDiffValues!270 (ListLongMap!9441 (_ BitVec 64) V!26613 V!26613) Unit!29063)

(assert (=> b!851075 (= lt!383230 (addSameAsAddTwiceSameKeyDiffValues!270 lt!383231 k!854 lt!383232 lt!383226))))

(declare-fun lt!383229 () V!26613)

(declare-fun get!12280 (ValueCell!7648 V!26613) V!26613)

(assert (=> b!851075 (= lt!383232 (get!12280 (select (arr!23309 _values!688) from!1053) lt!383229))))

(declare-fun lt!383224 () ListLongMap!9441)

(assert (=> b!851075 (= lt!383224 (+!2136 lt!383231 (tuple2!10673 (select (arr!23308 _keys!868) from!1053) lt!383226)))))

(assert (=> b!851075 (= lt!383226 (get!12280 (select (store (arr!23309 _values!688) i!612 (ValueCellFull!7648 v!557)) from!1053) lt!383229))))

(declare-fun dynLambda!1024 (Int (_ BitVec 64)) V!26613)

(assert (=> b!851075 (= lt!383229 (dynLambda!1024 defaultEntry!696 #b0000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!383228 () array!48556)

(declare-fun getCurrentListMapNoExtraKeys!2718 (array!48554 array!48556 (_ BitVec 32) (_ BitVec 32) V!26613 V!26613 (_ BitVec 32) Int) ListLongMap!9441)

(assert (=> b!851075 (= lt!383231 (getCurrentListMapNoExtraKeys!2718 _keys!868 lt!383228 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851076 () Bool)

(declare-fun res!578115 () Bool)

(assert (=> b!851076 (=> (not res!578115) (not e!474733))))

(assert (=> b!851076 (= res!578115 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23748 _keys!868))))))

(declare-fun b!851077 () Bool)

(declare-fun e!474735 () Bool)

(declare-fun e!474730 () Bool)

(declare-fun mapRes!25862 () Bool)

(assert (=> b!851077 (= e!474735 (and e!474730 mapRes!25862))))

(declare-fun condMapEmpty!25862 () Bool)

(declare-fun mapDefault!25862 () ValueCell!7648)

