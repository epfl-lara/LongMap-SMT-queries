; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39092 () Bool)

(assert start!39092)

(declare-fun b_free!9359 () Bool)

(declare-fun b_next!9359 () Bool)

(assert (=> start!39092 (= b_free!9359 (not b_next!9359))))

(declare-fun tp!33606 () Bool)

(declare-fun b_and!16745 () Bool)

(assert (=> start!39092 (= tp!33606 b_and!16745)))

(declare-fun b!410683 () Bool)

(declare-fun e!246108 () Bool)

(declare-fun e!246107 () Bool)

(declare-fun mapRes!17388 () Bool)

(assert (=> b!410683 (= e!246108 (and e!246107 mapRes!17388))))

(declare-fun condMapEmpty!17388 () Bool)

(declare-datatypes ((V!15119 0))(
  ( (V!15120 (val!5300 Int)) )
))
(declare-datatypes ((ValueCell!4912 0))(
  ( (ValueCellFull!4912 (v!7547 V!15119)) (EmptyCell!4912) )
))
(declare-datatypes ((array!24889 0))(
  ( (array!24890 (arr!11894 (Array (_ BitVec 32) ValueCell!4912)) (size!12246 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24889)

(declare-fun mapDefault!17388 () ValueCell!4912)

