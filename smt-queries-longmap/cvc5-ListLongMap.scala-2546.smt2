; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39094 () Bool)

(assert start!39094)

(declare-fun b_free!9361 () Bool)

(declare-fun b_next!9361 () Bool)

(assert (=> start!39094 (= b_free!9361 (not b_next!9361))))

(declare-fun tp!33611 () Bool)

(declare-fun b_and!16747 () Bool)

(assert (=> start!39094 (= tp!33611 b_and!16747)))

(declare-fun b!410727 () Bool)

(declare-fun e!246126 () Bool)

(declare-fun e!246124 () Bool)

(declare-fun mapRes!17391 () Bool)

(assert (=> b!410727 (= e!246126 (and e!246124 mapRes!17391))))

(declare-fun condMapEmpty!17391 () Bool)

(declare-datatypes ((V!15123 0))(
  ( (V!15124 (val!5301 Int)) )
))
(declare-datatypes ((ValueCell!4913 0))(
  ( (ValueCellFull!4913 (v!7548 V!15123)) (EmptyCell!4913) )
))
(declare-datatypes ((array!24891 0))(
  ( (array!24892 (arr!11895 (Array (_ BitVec 32) ValueCell!4913)) (size!12247 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24891)

(declare-fun mapDefault!17391 () ValueCell!4913)

