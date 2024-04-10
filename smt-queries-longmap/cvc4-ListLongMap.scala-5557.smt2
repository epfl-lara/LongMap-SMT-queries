; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!73130 () Bool)

(assert start!73130)

(declare-fun b_free!14045 () Bool)

(declare-fun b_next!14045 () Bool)

(assert (=> start!73130 (= b_free!14045 (not b_next!14045))))

(declare-fun tp!49639 () Bool)

(declare-fun b_and!23249 () Bool)

(assert (=> start!73130 (= tp!49639 b_and!23249)))

(declare-fun b!851212 () Bool)

(declare-fun res!578207 () Bool)

(declare-fun e!474801 () Bool)

(assert (=> b!851212 (=> (not res!578207) (not e!474801))))

(declare-datatypes ((array!48564 0))(
  ( (array!48565 (arr!23313 (Array (_ BitVec 32) (_ BitVec 64))) (size!23753 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48564)

(declare-datatypes ((List!16515 0))(
  ( (Nil!16512) (Cons!16511 (h!17642 (_ BitVec 64)) (t!23006 List!16515)) )
))
(declare-fun arrayNoDuplicates!0 (array!48564 (_ BitVec 32) List!16515) Bool)

(assert (=> b!851212 (= res!578207 (arrayNoDuplicates!0 _keys!868 #b00000000000000000000000000000000 Nil!16512))))

(declare-fun b!851213 () Bool)

(declare-fun res!578205 () Bool)

(assert (=> b!851213 (=> (not res!578205) (not e!474801))))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!851213 (= res!578205 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23753 _keys!868))))))

(declare-fun b!851214 () Bool)

(declare-fun e!474805 () Bool)

(declare-datatypes ((V!26621 0))(
  ( (V!26622 (val!8138 Int)) )
))
(declare-datatypes ((tuple2!10676 0))(
  ( (tuple2!10677 (_1!5349 (_ BitVec 64)) (_2!5349 V!26621)) )
))
(declare-datatypes ((List!16516 0))(
  ( (Nil!16513) (Cons!16512 (h!17643 tuple2!10676) (t!23007 List!16516)) )
))
(declare-datatypes ((ListLongMap!9445 0))(
  ( (ListLongMap!9446 (toList!4738 List!16516)) )
))
(declare-fun call!37991 () ListLongMap!9445)

(declare-fun call!37990 () ListLongMap!9445)

(assert (=> b!851214 (= e!474805 (= call!37991 call!37990))))

(declare-fun b!851215 () Bool)

(declare-fun res!578200 () Bool)

(assert (=> b!851215 (=> (not res!578200) (not e!474801))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!48564 (_ BitVec 32)) Bool)

(assert (=> b!851215 (= res!578200 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun b!851216 () Bool)

(declare-fun res!578206 () Bool)

(assert (=> b!851216 (=> (not res!578206) (not e!474801))))

(declare-fun k!854 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!851216 (= res!578206 (validKeyInArray!0 k!854))))

(declare-fun mapIsEmpty!25871 () Bool)

(declare-fun mapRes!25871 () Bool)

(assert (=> mapIsEmpty!25871 mapRes!25871))

(declare-fun b!851217 () Bool)

(declare-fun res!578202 () Bool)

(assert (=> b!851217 (=> (not res!578202) (not e!474801))))

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!851217 (= res!578202 (and (= (select (arr!23313 _keys!868) i!612) k!854) (bvsle from!1053 i!612)))))

(declare-fun b!851218 () Bool)

(declare-fun e!474803 () Bool)

(assert (=> b!851218 (= e!474801 e!474803)))

(declare-fun res!578199 () Bool)

(assert (=> b!851218 (=> (not res!578199) (not e!474803))))

(assert (=> b!851218 (= res!578199 (= from!1053 i!612))))

(declare-datatypes ((ValueCell!7651 0))(
  ( (ValueCellFull!7651 (v!10563 V!26621)) (EmptyCell!7651) )
))
(declare-datatypes ((array!48566 0))(
  ( (array!48567 (arr!23314 (Array (_ BitVec 32) ValueCell!7651)) (size!23754 (_ BitVec 32))) )
))
(declare-fun lt!383321 () array!48566)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun lt!383314 () ListLongMap!9445)

(declare-fun minValue!654 () V!26621)

(declare-fun zeroValue!654 () V!26621)

(declare-fun getCurrentListMapNoExtraKeys!2720 (array!48564 array!48566 (_ BitVec 32) (_ BitVec 32) V!26621 V!26621 (_ BitVec 32) Int) ListLongMap!9445)

(assert (=> b!851218 (= lt!383314 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!383321 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun v!557 () V!26621)

(declare-fun _values!688 () array!48566)

(assert (=> b!851218 (= lt!383321 (array!48567 (store (arr!23314 _values!688) i!612 (ValueCellFull!7651 v!557)) (size!23754 _values!688)))))

(declare-fun lt!383320 () ListLongMap!9445)

(assert (=> b!851218 (= lt!383320 (getCurrentListMapNoExtraKeys!2720 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 from!1053 defaultEntry!696))))

(declare-fun b!851219 () Bool)

(declare-fun e!474808 () Bool)

(assert (=> b!851219 (= e!474803 (not e!474808))))

(declare-fun res!578198 () Bool)

(assert (=> b!851219 (=> res!578198 e!474808)))

(assert (=> b!851219 (= res!578198 (not (validKeyInArray!0 (select (arr!23313 _keys!868) from!1053))))))

(assert (=> b!851219 e!474805))

(declare-fun c!91738 () Bool)

(assert (=> b!851219 (= c!91738 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!29067 0))(
  ( (Unit!29068) )
))
(declare-fun lt!383323 () Unit!29067)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!375 (array!48564 array!48566 (_ BitVec 32) (_ BitVec 32) V!26621 V!26621 (_ BitVec 32) (_ BitVec 64) V!26621 (_ BitVec 32) Int) Unit!29067)

(assert (=> b!851219 (= lt!383323 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!375 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851220 () Bool)

(declare-fun +!2138 (ListLongMap!9445 tuple2!10676) ListLongMap!9445)

(assert (=> b!851220 (= e!474805 (= call!37991 (+!2138 call!37990 (tuple2!10677 k!854 v!557))))))

(declare-fun bm!37988 () Bool)

(assert (=> bm!37988 (= call!37991 (getCurrentListMapNoExtraKeys!2720 _keys!868 lt!383321 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!851221 () Bool)

(declare-fun e!474806 () Bool)

(declare-fun e!474802 () Bool)

(assert (=> b!851221 (= e!474806 (and e!474802 mapRes!25871))))

(declare-fun condMapEmpty!25871 () Bool)

(declare-fun mapDefault!25871 () ValueCell!7651)

