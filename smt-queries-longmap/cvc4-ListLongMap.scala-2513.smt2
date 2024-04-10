; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38900 () Bool)

(assert start!38900)

(declare-fun b!406742 () Bool)

(declare-fun e!244375 () Bool)

(declare-fun e!244379 () Bool)

(declare-fun mapRes!17100 () Bool)

(assert (=> b!406742 (= e!244375 (and e!244379 mapRes!17100))))

(declare-fun condMapEmpty!17100 () Bool)

(declare-datatypes ((V!14863 0))(
  ( (V!14864 (val!5204 Int)) )
))
(declare-datatypes ((ValueCell!4816 0))(
  ( (ValueCellFull!4816 (v!7451 V!14863)) (EmptyCell!4816) )
))
(declare-datatypes ((array!24527 0))(
  ( (array!24528 (arr!11713 (Array (_ BitVec 32) ValueCell!4816)) (size!12065 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24527)

(declare-fun mapDefault!17100 () ValueCell!4816)

