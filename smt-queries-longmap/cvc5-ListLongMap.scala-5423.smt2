; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!72322 () Bool)

(assert start!72322)

(declare-fun b!837902 () Bool)

(declare-fun e!467711 () Bool)

(declare-fun e!467712 () Bool)

(declare-fun mapRes!24659 () Bool)

(assert (=> b!837902 (= e!467711 (and e!467712 mapRes!24659))))

(declare-fun condMapEmpty!24659 () Bool)

(declare-datatypes ((V!25545 0))(
  ( (V!25546 (val!7734 Int)) )
))
(declare-datatypes ((ValueCell!7247 0))(
  ( (ValueCellFull!7247 (v!10159 V!25545)) (EmptyCell!7247) )
))
(declare-datatypes ((array!47042 0))(
  ( (array!47043 (arr!22552 (Array (_ BitVec 32) ValueCell!7247)) (size!22992 (_ BitVec 32))) )
))
(declare-fun _values!688 () array!47042)

(declare-fun mapDefault!24659 () ValueCell!7247)

