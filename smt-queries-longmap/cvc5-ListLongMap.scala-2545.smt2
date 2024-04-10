; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39088 () Bool)

(assert start!39088)

(declare-fun b_free!9355 () Bool)

(declare-fun b_next!9355 () Bool)

(assert (=> start!39088 (= b_free!9355 (not b_next!9355))))

(declare-fun tp!33593 () Bool)

(declare-fun b_and!16741 () Bool)

(assert (=> start!39088 (= tp!33593 b_and!16741)))

(declare-fun b!410592 () Bool)

(declare-fun e!246068 () Bool)

(declare-fun tp_is_empty!10507 () Bool)

(assert (=> b!410592 (= e!246068 tp_is_empty!10507)))

(declare-fun b!410593 () Bool)

(declare-fun e!246072 () Bool)

(declare-fun mapRes!17382 () Bool)

(assert (=> b!410593 (= e!246072 (and e!246068 mapRes!17382))))

(declare-fun condMapEmpty!17382 () Bool)

(declare-datatypes ((V!15115 0))(
  ( (V!15116 (val!5298 Int)) )
))
(declare-datatypes ((ValueCell!4910 0))(
  ( (ValueCellFull!4910 (v!7545 V!15115)) (EmptyCell!4910) )
))
(declare-datatypes ((array!24883 0))(
  ( (array!24884 (arr!11891 (Array (_ BitVec 32) ValueCell!4910)) (size!12243 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24883)

(declare-fun mapDefault!17382 () ValueCell!4910)

