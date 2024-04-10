; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72406 () Bool)

(assert start!72406)

(declare-fun b_free!13591 () Bool)

(declare-fun b_next!13591 () Bool)

(assert (=> start!72406 (= b_free!13591 (not b_next!13591))))

(declare-fun tp!47871 () Bool)

(declare-fun b_and!22677 () Bool)

(assert (=> start!72406 (= tp!47871 b_and!22677)))

(declare-fun b!839336 () Bool)

(declare-fun res!570687 () Bool)

(declare-fun e!468436 () Bool)

(assert (=> b!839336 (=> (not res!570687) (not e!468436))))

(declare-fun mask!1196 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!839336 (= res!570687 (validMask!0 mask!1196))))

(declare-fun b!839337 () Bool)

(assert (=> b!839337 (= e!468436 (not true))))

(declare-fun e!468434 () Bool)

(assert (=> b!839337 e!468434))

(declare-fun c!91246 () Bool)

(declare-fun from!1053 () (_ BitVec 32))

(declare-fun i!612 () (_ BitVec 32))

(assert (=> b!839337 (= c!91246 (bvsle (bvadd #b00000000000000000000000000000001 from!1053) i!612))))

(declare-datatypes ((Unit!28825 0))(
  ( (Unit!28826) )
))
(declare-fun lt!380752 () Unit!28825)

(declare-datatypes ((V!25657 0))(
  ( (V!25658 (val!7776 Int)) )
))
(declare-fun v!557 () V!25657)

(declare-fun defaultEntry!696 () Int)

(declare-fun extraKeys!635 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47196 0))(
  ( (array!47197 (arr!22629 (Array (_ BitVec 32) (_ BitVec 64))) (size!23069 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47196)

(declare-datatypes ((ValueCell!7289 0))(
  ( (ValueCellFull!7289 (v!10201 V!25657)) (EmptyCell!7289) )
))
(declare-datatypes ((array!47198 0))(
  ( (array!47199 (arr!22630 (Array (_ BitVec 32) ValueCell!7289)) (size!23070 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47198)

(declare-fun minValue!654 () V!25657)

(declare-fun zeroValue!654 () V!25657)

(declare-fun lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!258 (array!47196 array!47198 (_ BitVec 32) (_ BitVec 32) V!25657 V!25657 (_ BitVec 32) (_ BitVec 64) V!25657 (_ BitVec 32) Int) Unit!28825)

(assert (=> b!839337 (= lt!380752 (lemmaChangeValueExistingKeyToArrayThenMapNoExtrasAddPair!258 _keys!868 _values!688 mask!1196 extraKeys!635 zeroValue!654 minValue!654 i!612 k!854 v!557 (bvadd #b00000000000000000000000000000001 from!1053) defaultEntry!696))))

(declare-fun b!839338 () Bool)

(declare-datatypes ((tuple2!10292 0))(
  ( (tuple2!10293 (_1!5157 (_ BitVec 64)) (_2!5157 V!25657)) )
))
(declare-datatypes ((List!16092 0))(
  ( (Nil!16089) (Cons!16088 (h!17219 tuple2!10292) (t!22463 List!16092)) )
))
(declare-datatypes ((ListLongMap!9061 0))(
  ( (ListLongMap!9062 (toList!4546 List!16092)) )
))
(declare-fun call!37007 () ListLongMap!9061)

(declare-fun call!37006 () ListLongMap!9061)

(declare-fun +!2018 (ListLongMap!9061 tuple2!10292) ListLongMap!9061)

(assert (=> b!839338 (= e!468434 (= call!37006 (+!2018 call!37007 (tuple2!10293 k!854 v!557))))))

(declare-fun b!839339 () Bool)

(declare-fun e!468435 () Bool)

(declare-fun e!468432 () Bool)

(declare-fun mapRes!24785 () Bool)

(assert (=> b!839339 (= e!468435 (and e!468432 mapRes!24785))))

(declare-fun condMapEmpty!24785 () Bool)

(declare-fun mapDefault!24785 () ValueCell!7289)

