; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72476 () Bool)

(assert start!72476)

(declare-fun b_free!13661 () Bool)

(declare-fun b_next!13661 () Bool)

(assert (=> start!72476 (= b_free!13661 (not b_next!13661))))

(declare-fun tp!48082 () Bool)

(declare-fun b_and!22747 () Bool)

(assert (=> start!72476 (= tp!48082 b_and!22747)))

(declare-fun b!840701 () Bool)

(declare-fun res!571526 () Bool)

(declare-fun e!469062 () Bool)

(assert (=> b!840701 (=> (not res!571526) (not e!469062))))

(declare-fun i!612 () (_ BitVec 32))

(declare-fun k!854 () (_ BitVec 64))

(declare-datatypes ((array!47332 0))(
  ( (array!47333 (arr!22697 (Array (_ BitVec 32) (_ BitVec 64))) (size!23137 (_ BitVec 32))) )
))
(declare-fun _keys!868 () array!47332)

(declare-fun from!1053 () (_ BitVec 32))

(assert (=> b!840701 (= res!571526 (and (= (select (arr!22697 _keys!868) i!612) k!854) (bvsgt from!1053 i!612) (bvsle (bvadd #b00000000000000000000000000000001 from!1053) (size!23137 _keys!868)) (bvsge (bvadd #b00000000000000000000000000000001 from!1053) #b00000000000000000000000000000000)))))

(declare-fun b!840702 () Bool)

(declare-fun e!469064 () Bool)

(declare-fun e!469065 () Bool)

(declare-fun mapRes!24890 () Bool)

(assert (=> b!840702 (= e!469064 (and e!469065 mapRes!24890))))

(declare-fun condMapEmpty!24890 () Bool)

(declare-datatypes ((V!25749 0))(
  ( (V!25750 (val!7811 Int)) )
))
(declare-datatypes ((ValueCell!7324 0))(
  ( (ValueCellFull!7324 (v!10236 V!25749)) (EmptyCell!7324) )
))
(declare-datatypes ((array!47334 0))(
  ( (array!47335 (arr!22698 (Array (_ BitVec 32) ValueCell!7324)) (size!23138 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47334)

(declare-fun mapDefault!24890 () ValueCell!7324)

