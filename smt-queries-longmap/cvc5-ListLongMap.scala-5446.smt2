; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72460 () Bool)

(assert start!72460)

(declare-fun b_free!13645 () Bool)

(declare-fun b_next!13645 () Bool)

(assert (=> start!72460 (= b_free!13645 (not b_next!13645))))

(declare-fun tp!48033 () Bool)

(declare-fun b_and!22731 () Bool)

(assert (=> start!72460 (= tp!48033 b_and!22731)))

(declare-fun b!840389 () Bool)

(declare-fun e!468917 () Bool)

(declare-fun e!468921 () Bool)

(declare-fun mapRes!24866 () Bool)

(assert (=> b!840389 (= e!468917 (and e!468921 mapRes!24866))))

(declare-fun condMapEmpty!24866 () Bool)

(declare-datatypes ((V!25729 0))(
  ( (V!25730 (val!7803 Int)) )
))
(declare-datatypes ((ValueCell!7316 0))(
  ( (ValueCellFull!7316 (v!10228 V!25729)) (EmptyCell!7316) )
))
(declare-datatypes ((array!47302 0))(
  ( (array!47303 (arr!22682 (Array (_ BitVec 32) ValueCell!7316)) (size!23122 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47302)

(declare-fun mapDefault!24866 () ValueCell!7316)

