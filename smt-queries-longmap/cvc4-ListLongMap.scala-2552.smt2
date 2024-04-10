; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!39134 () Bool)

(assert start!39134)

(declare-fun b_free!9401 () Bool)

(declare-fun b_next!9401 () Bool)

(assert (=> start!39134 (= b_free!9401 (not b_next!9401))))

(declare-fun tp!33732 () Bool)

(declare-fun b_and!16787 () Bool)

(assert (=> start!39134 (= tp!33732 b_and!16787)))

(declare-fun b!411627 () Bool)

(declare-fun res!238849 () Bool)

(declare-fun e!246483 () Bool)

(assert (=> b!411627 (=> (not res!238849) (not e!246483))))

(declare-datatypes ((array!24967 0))(
  ( (array!24968 (arr!11933 (Array (_ BitVec 32) (_ BitVec 64))) (size!12285 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24967)

(declare-fun k!794 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!24967 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!411627 (= res!238849 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun res!238846 () Bool)

(assert (=> start!39134 (=> (not res!238846) (not e!246483))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!39134 (= res!238846 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12285 _keys!709))))))

(assert (=> start!39134 e!246483))

(declare-fun tp_is_empty!10553 () Bool)

(assert (=> start!39134 tp_is_empty!10553))

(assert (=> start!39134 tp!33732))

(assert (=> start!39134 true))

(declare-datatypes ((V!15175 0))(
  ( (V!15176 (val!5321 Int)) )
))
(declare-datatypes ((ValueCell!4933 0))(
  ( (ValueCellFull!4933 (v!7568 V!15175)) (EmptyCell!4933) )
))
(declare-datatypes ((array!24969 0))(
  ( (array!24970 (arr!11934 (Array (_ BitVec 32) ValueCell!4933)) (size!12286 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24969)

(declare-fun e!246486 () Bool)

(declare-fun array_inv!8706 (array!24969) Bool)

(assert (=> start!39134 (and (array_inv!8706 _values!549) e!246486)))

(declare-fun array_inv!8707 (array!24967) Bool)

(assert (=> start!39134 (array_inv!8707 _keys!709)))

(declare-fun mapNonEmpty!17451 () Bool)

(declare-fun mapRes!17451 () Bool)

(declare-fun tp!33731 () Bool)

(declare-fun e!246482 () Bool)

(assert (=> mapNonEmpty!17451 (= mapRes!17451 (and tp!33731 e!246482))))

(declare-fun mapRest!17451 () (Array (_ BitVec 32) ValueCell!4933))

(declare-fun mapKey!17451 () (_ BitVec 32))

(declare-fun mapValue!17451 () ValueCell!4933)

(assert (=> mapNonEmpty!17451 (= (arr!11934 _values!549) (store mapRest!17451 mapKey!17451 mapValue!17451))))

(declare-fun b!411628 () Bool)

(declare-fun res!238851 () Bool)

(assert (=> b!411628 (=> (not res!238851) (not e!246483))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24967 (_ BitVec 32)) Bool)

(assert (=> b!411628 (= res!238851 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!411629 () Bool)

(declare-fun res!238844 () Bool)

(declare-fun e!246481 () Bool)

(assert (=> b!411629 (=> (not res!238844) (not e!246481))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!411629 (= res!238844 (bvsle from!863 i!563))))

(declare-fun b!411630 () Bool)

(declare-fun res!238850 () Bool)

(assert (=> b!411630 (=> (not res!238850) (not e!246483))))

(assert (=> b!411630 (= res!238850 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12285 _keys!709))))))

(declare-fun b!411631 () Bool)

(declare-fun res!238842 () Bool)

(assert (=> b!411631 (=> (not res!238842) (not e!246483))))

(assert (=> b!411631 (= res!238842 (or (= (select (arr!11933 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11933 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!411632 () Bool)

(declare-fun res!238848 () Bool)

(assert (=> b!411632 (=> (not res!238848) (not e!246483))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!411632 (= res!238848 (validMask!0 mask!1025))))

(declare-fun b!411633 () Bool)

(declare-fun res!238845 () Bool)

(assert (=> b!411633 (=> (not res!238845) (not e!246483))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!411633 (= res!238845 (validKeyInArray!0 k!794))))

(declare-fun b!411634 () Bool)

(declare-fun e!246484 () Bool)

(assert (=> b!411634 (= e!246486 (and e!246484 mapRes!17451))))

(declare-fun condMapEmpty!17451 () Bool)

(declare-fun mapDefault!17451 () ValueCell!4933)

