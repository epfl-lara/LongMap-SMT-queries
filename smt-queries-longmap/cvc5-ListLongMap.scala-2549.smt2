; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39112 () Bool)

(assert start!39112)

(declare-fun b_free!9379 () Bool)

(declare-fun b_next!9379 () Bool)

(assert (=> start!39112 (= b_free!9379 (not b_next!9379))))

(declare-fun tp!33665 () Bool)

(declare-fun b_and!16765 () Bool)

(assert (=> start!39112 (= tp!33665 b_and!16765)))

(declare-fun b!411132 () Bool)

(declare-fun res!238450 () Bool)

(declare-fun e!246287 () Bool)

(assert (=> b!411132 (=> (not res!238450) (not e!246287))))

(declare-datatypes ((array!24923 0))(
  ( (array!24924 (arr!11911 (Array (_ BitVec 32) (_ BitVec 64))) (size!12263 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24923)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24923 (_ BitVec 32)) Bool)

(assert (=> b!411132 (= res!238450 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411133 () Bool)

(declare-fun res!238449 () Bool)

(declare-fun e!246286 () Bool)

(assert (=> b!411133 (=> (not res!238449) (not e!246286))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411133 (= res!238449 (bvsle from!863 i!563))))

(declare-fun b!411134 () Bool)

(declare-fun e!246283 () Bool)

(declare-fun e!246288 () Bool)

(declare-fun mapRes!17418 () Bool)

(assert (=> b!411134 (= e!246283 (and e!246288 mapRes!17418))))

(declare-fun condMapEmpty!17418 () Bool)

(declare-datatypes ((V!15147 0))(
  ( (V!15148 (val!5310 Int)) )
))
(declare-datatypes ((ValueCell!4922 0))(
  ( (ValueCellFull!4922 (v!7557 V!15147)) (EmptyCell!4922) )
))
(declare-datatypes ((array!24925 0))(
  ( (array!24926 (arr!11912 (Array (_ BitVec 32) ValueCell!4922)) (size!12264 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24925)

(declare-fun mapDefault!17418 () ValueCell!4922)

