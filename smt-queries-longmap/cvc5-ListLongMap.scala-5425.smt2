; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72334 () Bool)

(assert start!72334)

(declare-fun b!838028 () Bool)

(declare-fun e!467803 () Bool)

(declare-fun e!467801 () Bool)

(declare-fun mapRes!24677 () Bool)

(assert (=> b!838028 (= e!467803 (and e!467801 mapRes!24677))))

(declare-fun condMapEmpty!24677 () Bool)

(declare-datatypes ((V!25561 0))(
  ( (V!25562 (val!7740 Int)) )
))
(declare-datatypes ((ValueCell!7253 0))(
  ( (ValueCellFull!7253 (v!10165 V!25561)) (EmptyCell!7253) )
))
(declare-datatypes ((array!47064 0))(
  ( (array!47065 (arr!22563 (Array (_ BitVec 32) ValueCell!7253)) (size!23003 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47064)

(declare-fun mapDefault!24677 () ValueCell!7253)

