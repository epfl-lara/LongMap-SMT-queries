; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72958 () Bool)

(assert start!72958)

(declare-fun b_free!13873 () Bool)

(declare-fun b_next!13873 () Bool)

(assert (=> start!72958 (= b_free!13873 (not b_next!13873))))

(declare-fun tp!49123 () Bool)

(declare-fun b_and!22959 () Bool)

(assert (=> start!72958 (= tp!49123 b_and!22959)))

(declare-fun b!847294 () Bool)

(declare-datatypes ((V!26393 0))(
  ( (V!26394 (val!8052 Int)) )
))
(declare-datatypes ((tuple2!10514 0))(
  ( (tuple2!10515 (_1!5268 (_ BitVec 64)) (_2!5268 V!26393)) )
))
(declare-datatypes ((List!16374 0))(
  ( (Nil!16371) (Cons!16370 (h!17501 tuple2!10514) (t!22745 List!16374)) )
))
(declare-datatypes ((ListLongMap!9283 0))(
  ( (ListLongMap!9284 (toList!4657 List!16374)) )
))
(declare-fun call!37475 () ListLongMap!9283)

(declare-fun v!557 () V!26393)

(declare-fun e!472807 () Bool)

(declare-fun k!854 () (_ BitVec 64))

(declare-fun call!37474 () ListLongMap!9283)

(declare-fun +!2077 (ListLongMap!9283 tuple2!10514) ListLongMap!9283)

(assert (=> b!847294 (= e!472807 (= call!37475 (+!2077 call!37474 (tuple2!10515 k!854 v!557))))))

(declare-fun b!847295 () Bool)

(declare-fun e!472811 () Bool)

(assert (=> b!847295 (= e!472811 (not true))))

(assert (=> b!847295 e!472807))

(declare-fun c!91480 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!847295 (= c!91480 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-datatypes ((array!48228 0))(
  ( (array!48229 (arr!23145 (Array (_ BitVec 32) (_ BitVec 64))) (size!23585 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!48228)

(declare-datatypes ((ValueCell!7565 0))(
  ( (ValueCellFull!7565 (v!10477 V!26393)) (EmptyCell!7565) )
))
(declare-datatypes ((array!48230 0))(
  ( (array!48231 (arr!23146 (Array (_ BitVec 32) ValueCell!7565)) (size!23586 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!48230)

(declare-fun minValue!654 () V!26393)

(declare-datatypes ((Unit!28933 0))(
  ( (Unit!28934) )
))
(declare-fun lt!381696 () Unit!28933)

(declare-fun zeroValue!654 () V!26393)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!312 (array!48228 array!48230 (_ BitVec 32) (_ BitVec 32) V!26393 V!26393 (_ BitVec 32) (_ BitVec 64) V!26393 (_ BitVec 32) Int) Unit!28933)

(assert (=> b!847295 (= lt!381696 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!312 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!847296 () Bool)

(declare-fun e!472810 () Bool)

(declare-fun e!472812 () Bool)

(declare-fun mapRes!25613 () Bool)

(assert (=> b!847296 (= e!472810 (and e!472812 mapRes!25613))))

(declare-fun condMapEmpty!25613 () Bool)

(declare-fun mapDefault!25613 () ValueCell!7565)

