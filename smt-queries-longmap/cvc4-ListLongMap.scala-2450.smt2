; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38522 () Bool)

(assert start!38522)

(declare-fun b!398075 () Bool)

(declare-fun e!240653 () Bool)

(declare-fun tp_is_empty!9941 () Bool)

(assert (=> b!398075 (= e!240653 tp_is_empty!9941)))

(declare-fun b!398076 () Bool)

(declare-fun res!228693 () Bool)

(declare-fun e!240651 () Bool)

(assert (=> b!398076 (=> (not res!228693) (not e!240651))))

(declare-datatypes ((array!23793 0))(
  ( (array!23794 (arr!11346 (Array (_ BitVec 32) (_ BitVec 64))) (size!11698 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!23793)

(declare-datatypes ((List!6564 0))(
  ( (Nil!6561) (Cons!6560 (h!7416 (_ BitVec 64)) (t!11738 List!6564)) )
))
(declare-fun arrayNoDuplicates!0 (array!23793 (_ BitVec 32) List!6564) Bool)

(assert (=> b!398076 (= res!228693 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6561))))

(declare-fun b!398077 () Bool)

(declare-fun e!240649 () Bool)

(declare-fun e!240650 () Bool)

(declare-fun mapRes!16533 () Bool)

(assert (=> b!398077 (= e!240649 (and e!240650 mapRes!16533))))

(declare-fun condMapEmpty!16533 () Bool)

(declare-datatypes ((V!14359 0))(
  ( (V!14360 (val!5015 Int)) )
))
(declare-datatypes ((ValueCell!4627 0))(
  ( (ValueCellFull!4627 (v!7262 V!14359)) (EmptyCell!4627) )
))
(declare-datatypes ((array!23795 0))(
  ( (array!23796 (arr!11347 (Array (_ BitVec 32) ValueCell!4627)) (size!11699 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!23795)

(declare-fun mapDefault!16533 () ValueCell!4627)

