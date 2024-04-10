; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39076 () Bool)

(assert start!39076)

(declare-fun b_free!9343 () Bool)

(declare-fun b_next!9343 () Bool)

(assert (=> start!39076 (= b_free!9343 (not b_next!9343))))

(declare-fun tp!33558 () Bool)

(declare-fun b_and!16729 () Bool)

(assert (=> start!39076 (= tp!33558 b_and!16729)))

(declare-fun b!410322 () Bool)

(declare-fun e!245960 () Bool)

(declare-fun e!245962 () Bool)

(declare-fun mapRes!17364 () Bool)

(assert (=> b!410322 (= e!245960 (and e!245962 mapRes!17364))))

(declare-fun condMapEmpty!17364 () Bool)

(declare-datatypes ((V!15099 0))(
  ( (V!15100 (val!5292 Int)) )
))
(declare-datatypes ((ValueCell!4904 0))(
  ( (ValueCellFull!4904 (v!7539 V!15099)) (EmptyCell!4904) )
))
(declare-datatypes ((array!24861 0))(
  ( (array!24862 (arr!11880 (Array (_ BitVec 32) ValueCell!4904)) (size!12232 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24861)

(declare-fun mapDefault!17364 () ValueCell!4904)

