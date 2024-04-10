; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72452 () Bool)

(assert start!72452)

(declare-fun b_free!13637 () Bool)

(declare-fun b_next!13637 () Bool)

(assert (=> start!72452 (= b_free!13637 (not b_next!13637))))

(declare-fun tp!48010 () Bool)

(declare-fun b_and!22723 () Bool)

(assert (=> start!72452 (= tp!48010 b_and!22723)))

(declare-fun b!840233 () Bool)

(declare-fun res!571238 () Bool)

(declare-fun e!468850 () Bool)

(assert (=> b!840233 (=> (not res!571238) (not e!468850))))

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!47286 0))(
  ( (array!47287 (arr!22674 (Array (_ BitVec 32) (_ BitVec 64))) (size!23114 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47286)

(declare-datatypes ((V!25717 0))(
  ( (V!25718 (val!7799 Int)) )
))
(declare-datatypes ((ValueCell!7312 0))(
  ( (ValueCellFull!7312 (v!10224 V!25717)) (EmptyCell!7312) )
))
(declare-datatypes ((array!47288 0))(
  ( (array!47289 (arr!22675 (Array (_ BitVec 32) ValueCell!7312)) (size!23115 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47288)

(assert (=> b!840233 (= res!571238 (and (= (size!23115 _values!688) (bvadd #b00000000000000000000000000000001 mask!1196)) (= (size!23114 _keys!868) (size!23115 _values!688)) (bvsge mask!1196 #b00000000000000000000000000000000) (bvsge extraKeys!635 #b00000000000000000000000000000000) (bvsle extraKeys!635 #b00000000000000000000000000000011)))))

(declare-fun b!840234 () Bool)

(declare-fun res!571241 () Bool)

(assert (=> b!840234 (=> (not res!571241) (not e!468850))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!840234 (= res!571241 (validMask!0 mask!1196))))

(declare-fun b!840235 () Bool)

(assert (=> b!840235 (= e!468850 (not true))))

(declare-fun e!468847 () Bool)

(assert (=> b!840235 e!468847))

(declare-fun c!91315 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!840235 (= c!91315 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun minValue!654 () V!25717)

(declare-fun zeroValue!654 () V!25717)

(declare-fun v!557 () V!25717)

(declare-datatypes ((Unit!28859 0))(
  ( (Unit!28860) )
))
(declare-fun lt!380821 () Unit!28859)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!275 (array!47286 array!47288 (_ BitVec 32) (_ BitVec 32) V!25717 V!25717 (_ BitVec 32) (_ BitVec 64) V!25717 (_ BitVec 32) Int) Unit!28859)

(assert (=> b!840235 (= lt!380821 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!275 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840236 () Bool)

(declare-datatypes ((tuple2!10334 0))(
  ( (tuple2!10335 (_1!5178 (_ BitVec 64)) (_2!5178 V!25717)) )
))
(declare-datatypes ((List!16127 0))(
  ( (Nil!16124) (Cons!16123 (h!17254 tuple2!10334) (t!22498 List!16127)) )
))
(declare-datatypes ((ListLongMap!9103 0))(
  ( (ListLongMap!9104 (toList!4567 List!16127)) )
))
(declare-fun call!37145 () ListLongMap!9103)

(declare-fun call!37144 () ListLongMap!9103)

(declare-fun +!2036 (ListLongMap!9103 tuple2!10334) ListLongMap!9103)

(assert (=> b!840236 (= e!468847 (= call!37145 (+!2036 call!37144 (tuple2!10335 k!854 v!557))))))

(declare-fun bm!37141 () Bool)

(declare-fun getCurrentListMapNoExtraKeys!2555 (array!47286 array!47288 (_ BitVec 32) (_ BitVec 32) V!25717 V!25717 (_ BitVec 32) Int) ListLongMap!9103)

(assert (=> bm!37141 (= call!37144 (getCurrentListMapNoExtraKeys!2555 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840237 () Bool)

(declare-fun res!571234 () Bool)

(assert (=> b!840237 (=> (not res!571234) (not e!468850))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!47286 (_ BitVec 32)) Bool)

(assert (=> b!840237 (= res!571234 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!868 mask!1196))))

(declare-fun bm!37142 () Bool)

(assert (=> bm!37142 (= call!37145 (getCurrentListMapNoExtraKeys!2555 _keys!868 (array!47289 (store (arr!22675 _values!688) i!612 (ValueCellFull!7312 v!557)) (size!23115 _values!688)) mask!1196 extraKeys!635 zeroValue!654 minValue!654 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!840238 () Bool)

(declare-fun res!571239 () Bool)

(assert (=> b!840238 (=> (not res!571239) (not e!468850))))

(assert (=> b!840238 (= res!571239 (and (= (select (arr!22674 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23114 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840239 () Bool)

(declare-fun res!571240 () Bool)

(assert (=> b!840239 (=> (not res!571240) (not e!468850))))

(assert (=> b!840239 (= res!571240 (and (bvsge i!612 #b00000000000000000000000000000000) (bvslt i!612 (size!23114 _keys!868))))))

(declare-fun b!840240 () Bool)

(declare-fun e!468845 () Bool)

(declare-fun e!468848 () Bool)

(declare-fun mapRes!24854 () Bool)

(assert (=> b!840240 (= e!468845 (and e!468848 mapRes!24854))))

(declare-fun condMapEmpty!24854 () Bool)

(declare-fun mapDefault!24854 () ValueCell!7312)

