; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39004 () Bool)

(assert start!39004)

(declare-fun mapIsEmpty!17256 () Bool)

(declare-fun mapRes!17256 () Bool)

(assert (=> mapIsEmpty!17256 mapRes!17256))

(declare-fun b!408770 () Bool)

(declare-fun res!236569 () Bool)

(declare-fun e!245313 () Bool)

(assert (=> b!408770 (=> (not res!236569) (not e!245313))))

(declare-datatypes ((array!24721 0))(
  ( (array!24722 (arr!11810 (Array (_ BitVec 32) (_ BitVec 64))) (size!12162 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24721)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24721 (_ BitVec 32)) Bool)

(assert (=> b!408770 (= res!236569 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!408771 () Bool)

(declare-fun res!236572 () Bool)

(assert (=> b!408771 (=> (not res!236572) (not e!245313))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!408771 (= res!236572 (validKeyInArray!0 k!794))))

(declare-fun b!408772 () Bool)

(declare-fun e!245312 () Bool)

(declare-fun tp_is_empty!10423 () Bool)

(assert (=> b!408772 (= e!245312 tp_is_empty!10423)))

(declare-fun b!408773 () Bool)

(declare-fun res!236573 () Bool)

(assert (=> b!408773 (=> (not res!236573) (not e!245313))))

(declare-fun arrayContainsKey!0 (array!24721 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!408773 (= res!236573 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!408774 () Bool)

(declare-fun res!236577 () Bool)

(assert (=> b!408774 (=> (not res!236577) (not e!245313))))

(declare-datatypes ((V!15003 0))(
  ( (V!15004 (val!5256 Int)) )
))
(declare-datatypes ((ValueCell!4868 0))(
  ( (ValueCellFull!4868 (v!7503 V!15003)) (EmptyCell!4868) )
))
(declare-datatypes ((array!24723 0))(
  ( (array!24724 (arr!11811 (Array (_ BitVec 32) ValueCell!4868)) (size!12163 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24723)

(declare-fun extraKeys!496 () (_ BitVec 32))

(assert (=> b!408774 (= res!236577 (and (= (size!12163 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12162 _keys!709) (size!12163 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!408775 () Bool)

(declare-fun res!236571 () Bool)

(assert (=> b!408775 (=> (not res!236571) (not e!245313))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!408775 (= res!236571 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12162 _keys!709))))))

(declare-fun b!408777 () Bool)

(declare-fun res!236576 () Bool)

(assert (=> b!408777 (=> (not res!236576) (not e!245313))))

(declare-datatypes ((List!6840 0))(
  ( (Nil!6837) (Cons!6836 (h!7692 (_ BitVec 64)) (t!12014 List!6840)) )
))
(declare-fun arrayNoDuplicates!0 (array!24721 (_ BitVec 32) List!6840) Bool)

(assert (=> b!408777 (= res!236576 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6837))))

(declare-fun mapNonEmpty!17256 () Bool)

(declare-fun tp!33375 () Bool)

(declare-fun e!245315 () Bool)

(assert (=> mapNonEmpty!17256 (= mapRes!17256 (and tp!33375 e!245315))))

(declare-fun mapValue!17256 () ValueCell!4868)

(declare-fun mapRest!17256 () (Array (_ BitVec 32) ValueCell!4868))

(declare-fun mapKey!17256 () (_ BitVec 32))

(assert (=> mapNonEmpty!17256 (= (arr!11811 _values!549) (store mapRest!17256 mapKey!17256 mapValue!17256))))

(declare-fun b!408778 () Bool)

(declare-fun res!236575 () Bool)

(assert (=> b!408778 (=> (not res!236575) (not e!245313))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!408778 (= res!236575 (validMask!0 mask!1025))))

(declare-fun b!408779 () Bool)

(declare-fun e!245316 () Bool)

(assert (=> b!408779 (= e!245313 e!245316)))

(declare-fun res!236568 () Bool)

(assert (=> b!408779 (=> (not res!236568) (not e!245316))))

(declare-fun lt!188849 () array!24721)

(assert (=> b!408779 (= res!236568 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188849 mask!1025))))

(assert (=> b!408779 (= lt!188849 (array!24722 (store (arr!11810 _keys!709) i!563 k!794) (size!12162 _keys!709)))))

(declare-fun b!408780 () Bool)

(assert (=> b!408780 (= e!245316 false)))

(declare-fun lt!188848 () Bool)

(assert (=> b!408780 (= lt!188848 (arrayNoDuplicates!0 lt!188849 #b00000000000000000000000000000000 Nil!6837))))

(declare-fun b!408781 () Bool)

(declare-fun e!245314 () Bool)

(assert (=> b!408781 (= e!245314 (and e!245312 mapRes!17256))))

(declare-fun condMapEmpty!17256 () Bool)

(declare-fun mapDefault!17256 () ValueCell!4868)

