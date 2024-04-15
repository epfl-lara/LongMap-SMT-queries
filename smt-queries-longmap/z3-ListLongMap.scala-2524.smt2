; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38948 () Bool)

(assert start!38948)

(declare-fun b!407680 () Bool)

(declare-fun res!235813 () Bool)

(declare-fun e!244760 () Bool)

(assert (=> b!407680 (=> (not res!235813) (not e!244760))))

(declare-datatypes ((array!24633 0))(
  ( (array!24634 (arr!11766 (Array (_ BitVec 32) (_ BitVec 64))) (size!12119 (_ BitVec 32))) )
))
(declare-fun _keys!709 () array!24633)

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!14947 0))(
  ( (V!14948 (val!5235 Int)) )
))
(declare-datatypes ((ValueCell!4847 0))(
  ( (ValueCellFull!4847 (v!7476 V!14947)) (EmptyCell!4847) )
))
(declare-datatypes ((array!24635 0))(
  ( (array!24636 (arr!11767 (Array (_ BitVec 32) ValueCell!4847)) (size!12120 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!24635)

(declare-fun mask!1025 () (_ BitVec 32))

(assert (=> b!407680 (= res!235813 (and (= (size!12120 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12119 _keys!709) (size!12120 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun b!407681 () Bool)

(declare-fun e!244764 () Bool)

(assert (=> b!407681 (= e!244760 e!244764)))

(declare-fun res!235817 () Bool)

(assert (=> b!407681 (=> (not res!235817) (not e!244764))))

(declare-fun lt!188489 () array!24633)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!24633 (_ BitVec 32)) Bool)

(assert (=> b!407681 (= res!235817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!188489 mask!1025))))

(declare-fun i!563 () (_ BitVec 32))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!407681 (= lt!188489 (array!24634 (store (arr!11766 _keys!709) i!563 k0!794) (size!12119 _keys!709)))))

(declare-fun b!407682 () Bool)

(declare-fun res!235810 () Bool)

(assert (=> b!407682 (=> (not res!235810) (not e!244760))))

(assert (=> b!407682 (= res!235810 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12119 _keys!709))))))

(declare-fun res!235814 () Bool)

(assert (=> start!38948 (=> (not res!235814) (not e!244760))))

(declare-fun from!863 () (_ BitVec 32))

(assert (=> start!38948 (= res!235814 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12119 _keys!709))))))

(assert (=> start!38948 e!244760))

(assert (=> start!38948 true))

(declare-fun e!244761 () Bool)

(declare-fun array_inv!8630 (array!24635) Bool)

(assert (=> start!38948 (and (array_inv!8630 _values!549) e!244761)))

(declare-fun array_inv!8631 (array!24633) Bool)

(assert (=> start!38948 (array_inv!8631 _keys!709)))

(declare-fun b!407683 () Bool)

(declare-fun e!244762 () Bool)

(declare-fun tp_is_empty!10381 () Bool)

(assert (=> b!407683 (= e!244762 tp_is_empty!10381)))

(declare-fun b!407684 () Bool)

(declare-fun res!235816 () Bool)

(assert (=> b!407684 (=> (not res!235816) (not e!244760))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!407684 (= res!235816 (validKeyInArray!0 k0!794))))

(declare-fun b!407685 () Bool)

(declare-fun e!244759 () Bool)

(assert (=> b!407685 (= e!244759 tp_is_empty!10381)))

(declare-fun b!407686 () Bool)

(assert (=> b!407686 (= e!244764 false)))

(declare-fun lt!188488 () Bool)

(declare-datatypes ((List!6798 0))(
  ( (Nil!6795) (Cons!6794 (h!7650 (_ BitVec 64)) (t!11963 List!6798)) )
))
(declare-fun arrayNoDuplicates!0 (array!24633 (_ BitVec 32) List!6798) Bool)

(assert (=> b!407686 (= lt!188488 (arrayNoDuplicates!0 lt!188489 #b00000000000000000000000000000000 Nil!6795))))

(declare-fun b!407687 () Bool)

(declare-fun res!235811 () Bool)

(assert (=> b!407687 (=> (not res!235811) (not e!244760))))

(assert (=> b!407687 (= res!235811 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!6795))))

(declare-fun b!407688 () Bool)

(declare-fun res!235818 () Bool)

(assert (=> b!407688 (=> (not res!235818) (not e!244760))))

(assert (=> b!407688 (= res!235818 (or (= (select (arr!11766 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11766 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!17193 () Bool)

(declare-fun mapRes!17193 () Bool)

(declare-fun tp!33312 () Bool)

(assert (=> mapNonEmpty!17193 (= mapRes!17193 (and tp!33312 e!244759))))

(declare-fun mapRest!17193 () (Array (_ BitVec 32) ValueCell!4847))

(declare-fun mapKey!17193 () (_ BitVec 32))

(declare-fun mapValue!17193 () ValueCell!4847)

(assert (=> mapNonEmpty!17193 (= (arr!11767 _values!549) (store mapRest!17193 mapKey!17193 mapValue!17193))))

(declare-fun mapIsEmpty!17193 () Bool)

(assert (=> mapIsEmpty!17193 mapRes!17193))

(declare-fun b!407689 () Bool)

(declare-fun res!235812 () Bool)

(assert (=> b!407689 (=> (not res!235812) (not e!244760))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!407689 (= res!235812 (validMask!0 mask!1025))))

(declare-fun b!407690 () Bool)

(declare-fun res!235815 () Bool)

(assert (=> b!407690 (=> (not res!235815) (not e!244760))))

(declare-fun arrayContainsKey!0 (array!24633 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!407690 (= res!235815 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!407691 () Bool)

(declare-fun res!235809 () Bool)

(assert (=> b!407691 (=> (not res!235809) (not e!244760))))

(assert (=> b!407691 (= res!235809 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!407692 () Bool)

(assert (=> b!407692 (= e!244761 (and e!244762 mapRes!17193))))

(declare-fun condMapEmpty!17193 () Bool)

(declare-fun mapDefault!17193 () ValueCell!4847)

(assert (=> b!407692 (= condMapEmpty!17193 (= (arr!11767 _values!549) ((as const (Array (_ BitVec 32) ValueCell!4847)) mapDefault!17193)))))

(assert (= (and start!38948 res!235814) b!407689))

(assert (= (and b!407689 res!235812) b!407680))

(assert (= (and b!407680 res!235813) b!407691))

(assert (= (and b!407691 res!235809) b!407687))

(assert (= (and b!407687 res!235811) b!407682))

(assert (= (and b!407682 res!235810) b!407684))

(assert (= (and b!407684 res!235816) b!407688))

(assert (= (and b!407688 res!235818) b!407690))

(assert (= (and b!407690 res!235815) b!407681))

(assert (= (and b!407681 res!235817) b!407686))

(assert (= (and b!407692 condMapEmpty!17193) mapIsEmpty!17193))

(assert (= (and b!407692 (not condMapEmpty!17193)) mapNonEmpty!17193))

(get-info :version)

(assert (= (and mapNonEmpty!17193 ((_ is ValueCellFull!4847) mapValue!17193)) b!407685))

(assert (= (and b!407692 ((_ is ValueCellFull!4847) mapDefault!17193)) b!407683))

(assert (= start!38948 b!407692))

(declare-fun m!398715 () Bool)

(assert (=> b!407688 m!398715))

(declare-fun m!398717 () Bool)

(assert (=> b!407686 m!398717))

(declare-fun m!398719 () Bool)

(assert (=> b!407689 m!398719))

(declare-fun m!398721 () Bool)

(assert (=> b!407691 m!398721))

(declare-fun m!398723 () Bool)

(assert (=> start!38948 m!398723))

(declare-fun m!398725 () Bool)

(assert (=> start!38948 m!398725))

(declare-fun m!398727 () Bool)

(assert (=> b!407684 m!398727))

(declare-fun m!398729 () Bool)

(assert (=> mapNonEmpty!17193 m!398729))

(declare-fun m!398731 () Bool)

(assert (=> b!407687 m!398731))

(declare-fun m!398733 () Bool)

(assert (=> b!407690 m!398733))

(declare-fun m!398735 () Bool)

(assert (=> b!407681 m!398735))

(declare-fun m!398737 () Bool)

(assert (=> b!407681 m!398737))

(check-sat (not b!407686) (not b!407691) (not b!407687) (not b!407684) tp_is_empty!10381 (not b!407689) (not b!407681) (not mapNonEmpty!17193) (not start!38948) (not b!407690))
(check-sat)
