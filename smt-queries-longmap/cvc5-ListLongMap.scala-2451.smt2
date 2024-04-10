; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38524 () Bool)

(assert start!38524)

(declare-fun b!398114 () Bool)

(declare-fun res!228728 () Bool)

(declare-fun e!240671 () Bool)

(assert (=> b!398114 (=> (not res!228728) (not e!240671))))

(declare-datatypes ((array!23797 0))(
  ( (array!23798 (arr!11348 (Array (_ BitVec 32) (_ BitVec 64))) (size!11700 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23797)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14363 0))(
  ( (V!14364 (val!5016 Int)) )
))
(declare-datatypes ((ValueCell!4628 0))(
  ( (ValueCellFull!4628 (v!7263 V!14363)) (EmptyCell!4628) )
))
(declare-datatypes ((array!23799 0))(
  ( (array!23800 (arr!11349 (Array (_ BitVec 32) ValueCell!4628)) (size!11701 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23799)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!398114 (= res!228728 (and (= (size!11701 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!11700 _keys!709) (size!11701 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!398115 () Bool)

(declare-fun res!228729 () Bool)

(assert (=> b!398115 (=> (not res!228729) (not e!240671))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!398115 (= res!228729 (validKeyInArray!0 k!794))))

(declare-fun b!398116 () Bool)

(declare-fun res!228726 () Bool)

(assert (=> b!398116 (=> (not res!228726) (not e!240671))))

(declare-fun arrayContainsKey!0 (array!23797 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!398116 (= res!228726 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!398117 () Bool)

(declare-fun e!240668 () Bool)

(declare-fun tp_is_empty!9943 () Bool)

(assert (=> b!398117 (= e!240668 tp_is_empty!9943)))

(declare-fun b!398118 () Bool)

(declare-fun res!228725 () Bool)

(assert (=> b!398118 (=> (not res!228725) (not e!240671))))

(declare-datatypes ((List!6565 0))(
  ( (Nil!6562) (Cons!6561 (h!7417 (_ BitVec 64)) (t!11739 List!6565)) )
))
(declare-fun arrayNoDuplicates!0 (array!23797 (_ BitVec 32) List!6565) Bool)

(assert (=> b!398118 (= res!228725 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6562))))

(declare-fun b!398119 () Bool)

(declare-fun e!240669 () Bool)

(declare-fun mapRes!16536 () Bool)

(assert (=> b!398119 (= e!240669 (and e!240668 mapRes!16536))))

(declare-fun condMapEmpty!16536 () Bool)

(declare-fun mapDefault!16536 () ValueCell!4628)

