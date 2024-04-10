; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72494 () Bool)

(assert start!72494)

(declare-fun b_free!13679 () Bool)

(declare-fun b_next!13679 () Bool)

(assert (=> start!72494 (= b_free!13679 (not b_next!13679))))

(declare-fun tp!48135 () Bool)

(declare-fun b_and!22765 () Bool)

(assert (=> start!72494 (= tp!48135 b_and!22765)))

(declare-fun b!841052 () Bool)

(declare-fun e!469223 () Bool)

(declare-fun tp_is_empty!15545 () Bool)

(assert (=> b!841052 (= e!469223 tp_is_empty!15545)))

(declare-fun b!841053 () Bool)

(declare-fun e!469226 () Bool)

(declare-datatypes ((V!25773 0))(
  ( (V!25774 (val!7820 Int)) )
))
(declare-datatypes ((tuple2!10372 0))(
  ( (tuple2!10373 (_1!5197 (_ BitVec 64)) (_2!5197 V!25773)) )
))
(declare-datatypes ((List!16158 0))(
  ( (Nil!16155) (Cons!16154 (h!17285 tuple2!10372) (t!22529 List!16158)) )
))
(declare-datatypes ((ListLongMap!9141 0))(
  ( (ListLongMap!9142 (toList!4586 List!16158)) )
))
(declare-fun call!37271 () ListLongMap!9141)

(declare-fun call!37270 () ListLongMap!9141)

(assert (=> b!841053 (= e!469226 (= call!37271 call!37270))))

(declare-fun b!841054 () Bool)

(declare-fun e!469227 () Bool)

(assert (=> b!841054 (= e!469227 (not true))))

(assert (=> b!841054 e!469226))

(declare-fun c!91378 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!841054 (= c!91378 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun v!557 () V!25773)

(declare-fun defaultEntry!696 () Int)

(declare-datatypes ((Unit!28887 0))(
  ( (Unit!28888) )
))
(declare-fun lt!380884 () Unit!28887)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47368 0))(
  ( (array!47369 (arr!22715 (Array (_ BitVec 32) (_ BitVec 64))) (size!23155 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47368)

(declare-datatypes ((ValueCell!7333 0))(
  ( (ValueCellFull!7333 (v!10245 V!25773)) (EmptyCell!7333) )
))
(declare-datatypes ((array!47370 0))(
  ( (array!47371 (arr!22716 (Array (_ BitVec 32) ValueCell!7333)) (size!23156 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47370)

(declare-fun minValue!654 () V!25773)

(declare-fun zeroValue!654 () V!25773)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!289 (array!47368 array!47370 (_ BitVec 32) (_ BitVec 32) V!25773 V!25773 (_ BitVec 32) (_ BitVec 64) V!25773 (_ BitVec 32) Int) Unit!28887)

(assert (=> b!841054 (= lt!380884 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!289 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841055 () Bool)

(declare-fun res!571744 () Bool)

(assert (=> b!841055 (=> (not res!571744) (not e!469227))))

(assert (=> b!841055 (= res!571744 (and (= (size!23156 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23155 _keys!868) (size!23156 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun bm!37267 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2573 (array!47368 array!47370 (_ BitVec 32) (_ BitVec 32) V!25773 V!25773 (_ BitVec 32) Int) ListLongMap!9141)

(assert (=> bm!37267 (= call!37271 (getCurrentListMapNoExtraKeys!2573 _keys!868 (array!47371 (store (arr!22716 _values!688) i!612 (ValueCellFull!7333 v!557)) (size!23156 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!841056 () Bool)

(declare-fun e!469228 () Bool)

(declare-fun mapRes!24917 () Bool)

(assert (=> b!841056 (= e!469228 (and e!469223 mapRes!24917))))

(declare-fun condMapEmpty!24917 () Bool)

(declare-fun mapDefault!24917 () ValueCell!7333)

