; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38912 () Bool)

(assert start!38912)

(declare-fun b!406976 () Bool)

(declare-fun e!244487 () Bool)

(declare-fun e!244483 () Bool)

(declare-fun mapRes!17118 () Bool)

(assert (=> b!406976 (= e!244487 (and e!244483 mapRes!17118))))

(declare-fun condMapEmpty!17118 () Bool)

(declare-datatypes ((V!14879 0))(
  ( (V!14880 (val!5210 Int)) )
))
(declare-datatypes ((ValueCell!4822 0))(
  ( (ValueCellFull!4822 (v!7457 V!14879)) (EmptyCell!4822) )
))
(declare-datatypes ((array!24547 0))(
  ( (array!24548 (arr!11723 (Array (_ BitVec 32) ValueCell!4822)) (size!12075 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24547)

(declare-fun mapDefault!17118 () ValueCell!4822)

