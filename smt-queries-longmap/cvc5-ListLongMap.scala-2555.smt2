; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39148 () Bool)

(assert start!39148)

(declare-fun b_free!9415 () Bool)

(declare-fun b_next!9415 () Bool)

(assert (=> start!39148 (= b_free!9415 (not b_next!9415))))

(declare-fun tp!33773 () Bool)

(declare-fun b_and!16801 () Bool)

(assert (=> start!39148 (= tp!33773 b_and!16801)))

(declare-fun b!411942 () Bool)

(declare-fun res!239097 () Bool)

(declare-fun e!246609 () Bool)

(assert (=> b!411942 (=> (not res!239097) (not e!246609))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411942 (= res!239097 (validKeyInArray!0 k!794))))

(declare-fun b!411943 () Bool)

(declare-fun res!239092 () Bool)

(assert (=> b!411943 (=> (not res!239092) (not e!246609))))

(declare-datatypes ((array!24995 0))(
  ( (array!24996 (arr!11947 (Array (_ BitVec 32) (_ BitVec 64))) (size!12299 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24995)

(declare-fun arrayContainsKey!0 (array!24995 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411943 (= res!239092 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!411944 () Bool)

(declare-fun e!246611 () Bool)

(assert (=> b!411944 (= e!246609 e!246611)))

(declare-fun res!239099 () Bool)

(assert (=> b!411944 (=> (not res!239099) (not e!246611))))

(declare-fun lt!189382 () array!24995)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24995 (_ BitVec 32)) Bool)

(assert (=> b!411944 (= res!239099 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189382 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411944 (= lt!189382 (array!24996 (store (arr!11947 _keys!709) i!563 k!794) (size!12299 _keys!709)))))

(declare-fun mapNonEmpty!17472 () Bool)

(declare-fun mapRes!17472 () Bool)

(declare-fun tp!33774 () Bool)

(declare-fun e!246612 () Bool)

(assert (=> mapNonEmpty!17472 (= mapRes!17472 (and tp!33774 e!246612))))

(declare-datatypes ((V!15195 0))(
  ( (V!15196 (val!5328 Int)) )
))
(declare-datatypes ((ValueCell!4940 0))(
  ( (ValueCellFull!4940 (v!7575 V!15195)) (EmptyCell!4940) )
))
(declare-fun mapRest!17472 () (Array (_ BitVec 32) ValueCell!4940))

(declare-datatypes ((array!24997 0))(
  ( (array!24998 (arr!11948 (Array (_ BitVec 32) ValueCell!4940)) (size!12300 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24997)

(declare-fun mapValue!17472 () ValueCell!4940)

(declare-fun mapKey!17472 () (_ BitVec 32))

(assert (=> mapNonEmpty!17472 (= (arr!11948 _values!549) (store mapRest!17472 mapKey!17472 mapValue!17472))))

(declare-fun b!411945 () Bool)

(declare-fun e!246608 () Bool)

(declare-fun e!246607 () Bool)

(assert (=> b!411945 (= e!246608 (and e!246607 mapRes!17472))))

(declare-fun condMapEmpty!17472 () Bool)

(declare-fun mapDefault!17472 () ValueCell!4940)

