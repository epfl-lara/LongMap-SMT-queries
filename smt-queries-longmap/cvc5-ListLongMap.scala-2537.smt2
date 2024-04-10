; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39040 () Bool)

(assert start!39040)

(declare-fun b_free!9307 () Bool)

(declare-fun b_next!9307 () Bool)

(assert (=> start!39040 (= b_free!9307 (not b_next!9307))))

(declare-fun tp!33449 () Bool)

(declare-fun b_and!16693 () Bool)

(assert (=> start!39040 (= tp!33449 b_and!16693)))

(declare-fun b!409512 () Bool)

(declare-fun res!237156 () Bool)

(declare-fun e!245638 () Bool)

(assert (=> b!409512 (=> (not res!237156) (not e!245638))))

(declare-fun i!563 () (_ BitVec 32))

(declare-datatypes ((array!24791 0))(
  ( (array!24792 (arr!11845 (Array (_ BitVec 32) (_ BitVec 64))) (size!12197 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24791)

(assert (=> b!409512 (= res!237156 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12197 _keys!709))))))

(declare-fun b!409513 () Bool)

(declare-fun res!237148 () Bool)

(assert (=> b!409513 (=> (not res!237148) (not e!245638))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15051 0))(
  ( (V!15052 (val!5274 Int)) )
))
(declare-datatypes ((ValueCell!4886 0))(
  ( (ValueCellFull!4886 (v!7521 V!15051)) (EmptyCell!4886) )
))
(declare-datatypes ((array!24793 0))(
  ( (array!24794 (arr!11846 (Array (_ BitVec 32) ValueCell!4886)) (size!12198 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24793)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!409513 (= res!237148 (and (= (size!12198 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12197 _keys!709) (size!12198 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!409514 () Bool)

(declare-fun res!237157 () Bool)

(assert (=> b!409514 (=> (not res!237157) (not e!245638))))

(declare-datatypes ((List!6860 0))(
  ( (Nil!6857) (Cons!6856 (h!7712 (_ BitVec 64)) (t!12034 List!6860)) )
))
(declare-fun arrayNoDuplicates!0 (array!24791 (_ BitVec 32) List!6860) Bool)

(assert (=> b!409514 (= res!237157 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6857))))

(declare-fun b!409515 () Bool)

(declare-fun res!237150 () Bool)

(assert (=> b!409515 (=> (not res!237150) (not e!245638))))

(assert (=> b!409515 (= res!237150 (or (= (select (arr!11845 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11845 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!409516 () Bool)

(declare-fun res!237149 () Bool)

(assert (=> b!409516 (=> (not res!237149) (not e!245638))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24791 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!409516 (= res!237149 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!409517 () Bool)

(declare-fun res!237155 () Bool)

(assert (=> b!409517 (=> (not res!237155) (not e!245638))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24791 (_ BitVec 32)) Bool)

(assert (=> b!409517 (= res!237155 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun mapNonEmpty!17310 () Bool)

(declare-fun mapRes!17310 () Bool)

(declare-fun tp!33450 () Bool)

(declare-fun e!245635 () Bool)

(assert (=> mapNonEmpty!17310 (= mapRes!17310 (and tp!33450 e!245635))))

(declare-fun mapRest!17310 () (Array (_ BitVec 32) ValueCell!4886))

(declare-fun mapKey!17310 () (_ BitVec 32))

(declare-fun mapValue!17310 () ValueCell!4886)

(assert (=> mapNonEmpty!17310 (= (arr!11846 _values!549) (store mapRest!17310 mapKey!17310 mapValue!17310))))

(declare-fun b!409518 () Bool)

(declare-fun e!245637 () Bool)

(assert (=> b!409518 (= e!245638 e!245637)))

(declare-fun res!237152 () Bool)

(assert (=> b!409518 (=> (not res!237152) (not e!245637))))

(declare-fun lt!188957 () array!24791)

(assert (=> b!409518 (= res!237152 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188957 mask!1025))))

(assert (=> b!409518 (= lt!188957 (array!24792 (store (arr!11845 _keys!709) i!563 k!794) (size!12197 _keys!709)))))

(declare-fun res!237159 () Bool)

(assert (=> start!39040 (=> (not res!237159) (not e!245638))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39040 (= res!237159 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12197 _keys!709))))))

(assert (=> start!39040 e!245638))

(declare-fun tp_is_empty!10459 () Bool)

(assert (=> start!39040 tp_is_empty!10459))

(assert (=> start!39040 tp!33449))

(assert (=> start!39040 true))

(declare-fun e!245636 () Bool)

(declare-fun array_inv!8644 (array!24793) Bool)

(assert (=> start!39040 (and (array_inv!8644 _values!549) e!245636)))

(declare-fun array_inv!8645 (array!24791) Bool)

(assert (=> start!39040 (array_inv!8645 _keys!709)))

(declare-fun b!409519 () Bool)

(assert (=> b!409519 (= e!245635 tp_is_empty!10459)))

(declare-fun b!409520 () Bool)

(declare-fun res!237153 () Bool)

(assert (=> b!409520 (=> (not res!237153) (not e!245637))))

(assert (=> b!409520 (= res!237153 (bvsle from!863 i!563))))

(declare-fun b!409521 () Bool)

(declare-fun res!237154 () Bool)

(assert (=> b!409521 (=> (not res!237154) (not e!245638))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!409521 (= res!237154 (validMask!0 mask!1025))))

(declare-fun b!409522 () Bool)

(declare-fun res!237158 () Bool)

(assert (=> b!409522 (=> (not res!237158) (not e!245637))))

(assert (=> b!409522 (= res!237158 (arrayNoDuplicates!0 lt!188957 #b00000000000000000000000000000000 Nil!6857))))

(declare-fun b!409523 () Bool)

(declare-fun e!245639 () Bool)

(assert (=> b!409523 (= e!245639 tp_is_empty!10459)))

(declare-fun b!409524 () Bool)

(declare-fun res!237151 () Bool)

(assert (=> b!409524 (=> (not res!237151) (not e!245638))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!409524 (= res!237151 (validKeyInArray!0 k!794))))

(declare-fun b!409525 () Bool)

(assert (=> b!409525 (= e!245636 (and e!245639 mapRes!17310))))

(declare-fun condMapEmpty!17310 () Bool)

(declare-fun mapDefault!17310 () ValueCell!4886)

