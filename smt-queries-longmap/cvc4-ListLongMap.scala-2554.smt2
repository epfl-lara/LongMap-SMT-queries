; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39146 () Bool)

(assert start!39146)

(declare-fun b_free!9413 () Bool)

(declare-fun b_next!9413 () Bool)

(assert (=> start!39146 (= b_free!9413 (not b_next!9413))))

(declare-fun tp!33767 () Bool)

(declare-fun b_and!16799 () Bool)

(assert (=> start!39146 (= tp!33767 b_and!16799)))

(declare-fun b!411897 () Bool)

(declare-fun res!239057 () Bool)

(declare-fun e!246593 () Bool)

(assert (=> b!411897 (=> (not res!239057) (not e!246593))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411897 (= res!239057 (validMask!0 mask!1025))))

(declare-fun b!411898 () Bool)

(declare-fun e!246590 () Bool)

(assert (=> b!411898 (= e!246593 e!246590)))

(declare-fun res!239065 () Bool)

(assert (=> b!411898 (=> (not res!239065) (not e!246590))))

(declare-datatypes ((array!24991 0))(
  ( (array!24992 (arr!11945 (Array (_ BitVec 32) (_ BitVec 64))) (size!12297 (_ BitVec 32))) )
))
(declare-fun lt!189374 () array!24991)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24991 (_ BitVec 32)) Bool)

(assert (=> b!411898 (= res!239065 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!189374 mask!1025))))

(declare-fun _keys!709 () array!24991)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411898 (= lt!189374 (array!24992 (store (arr!11945 _keys!709) i!563 k!794) (size!12297 _keys!709)))))

(declare-fun b!411899 () Bool)

(declare-fun e!246591 () Bool)

(declare-fun tp_is_empty!10565 () Bool)

(assert (=> b!411899 (= e!246591 tp_is_empty!10565)))

(declare-fun b!411900 () Bool)

(declare-fun res!239061 () Bool)

(assert (=> b!411900 (=> (not res!239061) (not e!246593))))

(assert (=> b!411900 (= res!239061 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411901 () Bool)

(declare-fun e!246592 () Bool)

(declare-fun mapRes!17469 () Bool)

(assert (=> b!411901 (= e!246592 (and e!246591 mapRes!17469))))

(declare-fun condMapEmpty!17469 () Bool)

(declare-datatypes ((V!15191 0))(
  ( (V!15192 (val!5327 Int)) )
))
(declare-datatypes ((ValueCell!4939 0))(
  ( (ValueCellFull!4939 (v!7574 V!15191)) (EmptyCell!4939) )
))
(declare-datatypes ((array!24993 0))(
  ( (array!24994 (arr!11946 (Array (_ BitVec 32) ValueCell!4939)) (size!12298 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24993)

(declare-fun mapDefault!17469 () ValueCell!4939)

