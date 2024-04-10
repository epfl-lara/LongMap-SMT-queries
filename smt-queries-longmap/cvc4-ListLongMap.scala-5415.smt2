; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72278 () Bool)

(assert start!72278)

(declare-fun b!837440 () Bool)

(declare-fun e!467383 () Bool)

(declare-fun e!467379 () Bool)

(declare-fun mapRes!24593 () Bool)

(assert (=> b!837440 (= e!467383 (and e!467379 mapRes!24593))))

(declare-fun condMapEmpty!24593 () Bool)

(declare-datatypes ((V!25485 0))(
  ( (V!25486 (val!7712 Int)) )
))
(declare-datatypes ((ValueCell!7225 0))(
  ( (ValueCellFull!7225 (v!10137 V!25485)) (EmptyCell!7225) )
))
(declare-datatypes ((array!46958 0))(
  ( (array!46959 (arr!22510 (Array (_ BitVec 32) ValueCell!7225)) (size!22950 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!46958)

(declare-fun mapDefault!24593 () ValueCell!7225)

