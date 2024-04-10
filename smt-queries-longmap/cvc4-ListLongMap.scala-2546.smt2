; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39098 () Bool)

(assert start!39098)

(declare-fun b_free!9365 () Bool)

(declare-fun b_next!9365 () Bool)

(assert (=> start!39098 (= b_free!9365 (not b_next!9365))))

(declare-fun tp!33623 () Bool)

(declare-fun b_and!16751 () Bool)

(assert (=> start!39098 (= tp!33623 b_and!16751)))

(declare-fun b!410817 () Bool)

(declare-fun e!246157 () Bool)

(declare-fun e!246160 () Bool)

(declare-fun mapRes!17397 () Bool)

(assert (=> b!410817 (= e!246157 (and e!246160 mapRes!17397))))

(declare-fun condMapEmpty!17397 () Bool)

(declare-datatypes ((V!15127 0))(
  ( (V!15128 (val!5303 Int)) )
))
(declare-datatypes ((ValueCell!4915 0))(
  ( (ValueCellFull!4915 (v!7550 V!15127)) (EmptyCell!4915) )
))
(declare-datatypes ((array!24897 0))(
  ( (array!24898 (arr!11898 (Array (_ BitVec 32) ValueCell!4915)) (size!12250 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24897)

(declare-fun mapDefault!17397 () ValueCell!4915)

