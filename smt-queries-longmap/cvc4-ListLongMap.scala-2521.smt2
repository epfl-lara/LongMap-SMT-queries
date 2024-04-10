; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!38948 () Bool)

(assert start!38948)

(declare-fun b!407678 () Bool)

(declare-fun res!235729 () Bool)

(declare-fun e!244807 () Bool)

(assert (=> b!407678 (=> (not res!235729) (not e!244807))))

(declare-fun k!794 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407678 (= res!235729 (validKeyInArray!0 k!794))))

(declare-fun b!407679 () Bool)

(declare-fun res!235734 () Bool)

(assert (=> b!407679 (=> (not res!235734) (not e!244807))))

(declare-datatypes ((array!24615 0))(
  ( (array!24616 (arr!11757 (Array (_ BitVec 32) (_ BitVec 64))) (size!12109 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24615)

(declare-fun arrayContainsKey!0 (array!24615 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407679 (= res!235734 (not (arrayContainsKey!0 _keys!709 k!794 #b00000000000000000000000000000000)))))

(declare-fun b!407680 () Bool)

(declare-fun res!235728 () Bool)

(assert (=> b!407680 (=> (not res!235728) (not e!244807))))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!407680 (= res!235728 (or (= (select (arr!11757 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11757 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!407681 () Bool)

(declare-fun e!244812 () Bool)

(assert (=> b!407681 (= e!244807 e!244812)))

(declare-fun res!235733 () Bool)

(assert (=> b!407681 (=> (not res!235733) (not e!244812))))

(declare-fun lt!188681 () array!24615)

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24615 (_ BitVec 32)) Bool)

(assert (=> b!407681 (= res!235733 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188681 mask!1025))))

(assert (=> b!407681 (= lt!188681 (array!24616 (store (arr!11757 _keys!709) i!563 k!794) (size!12109 _keys!709)))))

(declare-fun mapIsEmpty!17172 () Bool)

(declare-fun mapRes!17172 () Bool)

(assert (=> mapIsEmpty!17172 mapRes!17172))

(declare-fun mapNonEmpty!17172 () Bool)

(declare-fun tp!33291 () Bool)

(declare-fun e!244809 () Bool)

(assert (=> mapNonEmpty!17172 (= mapRes!17172 (and tp!33291 e!244809))))

(declare-datatypes ((V!14927 0))(
  ( (V!14928 (val!5228 Int)) )
))
(declare-datatypes ((ValueCell!4840 0))(
  ( (ValueCellFull!4840 (v!7475 V!14927)) (EmptyCell!4840) )
))
(declare-fun mapValue!17172 () ValueCell!4840)

(declare-datatypes ((array!24617 0))(
  ( (array!24618 (arr!11758 (Array (_ BitVec 32) ValueCell!4840)) (size!12110 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24617)

(declare-fun mapKey!17172 () (_ BitVec 32))

(declare-fun mapRest!17172 () (Array (_ BitVec 32) ValueCell!4840))

(assert (=> mapNonEmpty!17172 (= (arr!11758 _values!549) (store mapRest!17172 mapKey!17172 mapValue!17172))))

(declare-fun b!407683 () Bool)

(declare-fun res!235731 () Bool)

(assert (=> b!407683 (=> (not res!235731) (not e!244807))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407683 (= res!235731 (validMask!0 mask!1025))))

(declare-fun b!407684 () Bool)

(declare-fun res!235736 () Bool)

(assert (=> b!407684 (=> (not res!235736) (not e!244807))))

(assert (=> b!407684 (= res!235736 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12109 _keys!709))))))

(declare-fun b!407685 () Bool)

(declare-fun e!244810 () Bool)

(declare-fun tp_is_empty!10367 () Bool)

(assert (=> b!407685 (= e!244810 tp_is_empty!10367)))

(declare-fun b!407686 () Bool)

(declare-fun e!244808 () Bool)

(assert (=> b!407686 (= e!244808 (and e!244810 mapRes!17172))))

(declare-fun condMapEmpty!17172 () Bool)

(declare-fun mapDefault!17172 () ValueCell!4840)

