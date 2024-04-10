; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72824 () Bool)

(assert start!72824)

(declare-fun b!845117 () Bool)

(declare-fun e!471799 () Bool)

(declare-fun e!471801 () Bool)

(declare-fun mapRes!25412 () Bool)

(assert (=> b!845117 (= e!471799 (and e!471801 mapRes!25412))))

(declare-fun condMapEmpty!25412 () Bool)

(declare-datatypes ((V!26213 0))(
  ( (V!26214 (val!7985 Int)) )
))
(declare-datatypes ((ValueCell!7498 0))(
  ( (ValueCellFull!7498 (v!10410 V!26213)) (EmptyCell!7498) )
))
(declare-datatypes ((array!47972 0))(
  ( (array!47973 (arr!23017 (Array (_ BitVec 32) ValueCell!7498)) (size!23457 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47972)

(declare-fun mapDefault!25412 () ValueCell!7498)

