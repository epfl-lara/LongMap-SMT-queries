; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39184 () Bool)

(assert start!39184)

(declare-fun b_free!9451 () Bool)

(declare-fun b_next!9451 () Bool)

(assert (=> start!39184 (= b_free!9451 (not b_next!9451))))

(declare-fun tp!33882 () Bool)

(declare-fun b_and!16837 () Bool)

(assert (=> start!39184 (= tp!33882 b_and!16837)))

(declare-fun b!412752 () Bool)

(declare-fun e!246935 () Bool)

(declare-fun e!246934 () Bool)

(declare-fun mapRes!17526 () Bool)

(assert (=> b!412752 (= e!246935 (and e!246934 mapRes!17526))))

(declare-fun condMapEmpty!17526 () Bool)

(declare-datatypes ((V!15243 0))(
  ( (V!15244 (val!5346 Int)) )
))
(declare-datatypes ((ValueCell!4958 0))(
  ( (ValueCellFull!4958 (v!7593 V!15243)) (EmptyCell!4958) )
))
(declare-datatypes ((array!25067 0))(
  ( (array!25068 (arr!11983 (Array (_ BitVec 32) ValueCell!4958)) (size!12335 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25067)

(declare-fun mapDefault!17526 () ValueCell!4958)

