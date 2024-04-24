; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!39512 () Bool)

(assert start!39512)

(declare-fun b_free!9793 () Bool)

(declare-fun b_next!9793 () Bool)

(assert (=> start!39512 (= b_free!9793 (not b_next!9793))))

(declare-fun tp!34907 () Bool)

(declare-fun b_and!17463 () Bool)

(assert (=> start!39512 (= tp!34907 b_and!17463)))

(declare-fun b!422540 () Bool)

(declare-fun res!246803 () Bool)

(declare-fun e!251367 () Bool)

(assert (=> b!422540 (=> (not res!246803) (not e!251367))))

(declare-datatypes ((array!25744 0))(
  ( (array!25745 (arr!12321 (Array (_ BitVec 32) (_ BitVec 64))) (size!12673 (_ BitVec 32))) )
))
(declare-fun lt!194019 () array!25744)

(declare-datatypes ((List!7130 0))(
  ( (Nil!7127) (Cons!7126 (h!7982 (_ BitVec 64)) (t!12566 List!7130)) )
))
(declare-fun arrayNoDuplicates!0 (array!25744 (_ BitVec 32) List!7130) Bool)

(assert (=> b!422540 (= res!246803 (arrayNoDuplicates!0 lt!194019 #b00000000000000000000000000000000 Nil!7127))))

(declare-fun b!422541 () Bool)

(declare-fun res!246796 () Bool)

(assert (=> b!422541 (=> (not res!246796) (not e!251367))))

(declare-fun from!863 () (_ BitVec 32))

(declare-fun i!563 () (_ BitVec 32))

(assert (=> b!422541 (= res!246796 (bvsle from!863 i!563))))

(declare-fun b!422542 () Bool)

(declare-fun res!246801 () Bool)

(declare-fun e!251364 () Bool)

(assert (=> b!422542 (=> (not res!246801) (not e!251364))))

(declare-fun _keys!709 () array!25744)

(assert (=> b!422542 (= res!246801 (arrayNoDuplicates!0 _keys!709 #b00000000000000000000000000000000 Nil!7127))))

(declare-fun b!422543 () Bool)

(declare-fun res!246804 () Bool)

(assert (=> b!422543 (=> (not res!246804) (not e!251364))))

(declare-fun mask!1025 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!25744 (_ BitVec 32)) Bool)

(assert (=> b!422543 (= res!246804 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!709 mask!1025))))

(declare-fun b!422544 () Bool)

(declare-fun res!246800 () Bool)

(assert (=> b!422544 (=> (not res!246800) (not e!251364))))

(declare-fun extraKeys!496 () (_ BitVec 32))

(declare-datatypes ((V!15699 0))(
  ( (V!15700 (val!5517 Int)) )
))
(declare-datatypes ((ValueCell!5129 0))(
  ( (ValueCellFull!5129 (v!7765 V!15699)) (EmptyCell!5129) )
))
(declare-datatypes ((array!25746 0))(
  ( (array!25747 (arr!12322 (Array (_ BitVec 32) ValueCell!5129)) (size!12674 (_ BitVec 32))) )
))
(declare-fun _values!549 () array!25746)

(assert (=> b!422544 (= res!246800 (and (= (size!12674 _values!549) (bvadd #b00000000000000000000000000000001 mask!1025)) (= (size!12673 _keys!709) (size!12674 _values!549)) (bvsge mask!1025 #b00000000000000000000000000000000) (bvsge extraKeys!496 #b00000000000000000000000000000000) (bvsle extraKeys!496 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!18039 () Bool)

(declare-fun mapRes!18039 () Bool)

(assert (=> mapIsEmpty!18039 mapRes!18039))

(declare-fun b!422545 () Bool)

(declare-fun res!246793 () Bool)

(assert (=> b!422545 (=> (not res!246793) (not e!251364))))

(assert (=> b!422545 (= res!246793 (or (= (select (arr!12321 _keys!709) i!563) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!12321 _keys!709) i!563) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!422546 () Bool)

(declare-fun res!246799 () Bool)

(assert (=> b!422546 (=> (not res!246799) (not e!251364))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> b!422546 (= res!246799 (validMask!0 mask!1025))))

(declare-fun mapNonEmpty!18039 () Bool)

(declare-fun tp!34908 () Bool)

(declare-fun e!251366 () Bool)

(assert (=> mapNonEmpty!18039 (= mapRes!18039 (and tp!34908 e!251366))))

(declare-fun mapValue!18039 () ValueCell!5129)

(declare-fun mapKey!18039 () (_ BitVec 32))

(declare-fun mapRest!18039 () (Array (_ BitVec 32) ValueCell!5129))

(assert (=> mapNonEmpty!18039 (= (arr!12322 _values!549) (store mapRest!18039 mapKey!18039 mapValue!18039))))

(declare-fun b!422548 () Bool)

(declare-fun e!251368 () Bool)

(declare-fun e!251365 () Bool)

(assert (=> b!422548 (= e!251368 (and e!251365 mapRes!18039))))

(declare-fun condMapEmpty!18039 () Bool)

(declare-fun mapDefault!18039 () ValueCell!5129)

(assert (=> b!422548 (= condMapEmpty!18039 (= (arr!12322 _values!549) ((as const (Array (_ BitVec 32) ValueCell!5129)) mapDefault!18039)))))

(declare-fun b!422549 () Bool)

(assert (=> b!422549 (= e!251364 e!251367)))

(declare-fun res!246795 () Bool)

(assert (=> b!422549 (=> (not res!246795) (not e!251367))))

(assert (=> b!422549 (= res!246795 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!194019 mask!1025))))

(declare-fun k0!794 () (_ BitVec 64))

(assert (=> b!422549 (= lt!194019 (array!25745 (store (arr!12321 _keys!709) i!563 k0!794) (size!12673 _keys!709)))))

(declare-fun b!422550 () Bool)

(declare-fun res!246798 () Bool)

(assert (=> b!422550 (=> (not res!246798) (not e!251364))))

(declare-fun arrayContainsKey!0 (array!25744 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!422550 (= res!246798 (not (arrayContainsKey!0 _keys!709 k0!794 #b00000000000000000000000000000000)))))

(declare-fun b!422551 () Bool)

(declare-fun tp_is_empty!10945 () Bool)

(assert (=> b!422551 (= e!251365 tp_is_empty!10945)))

(declare-fun b!422552 () Bool)

(assert (=> b!422552 (= e!251366 tp_is_empty!10945)))

(declare-fun b!422553 () Bool)

(assert (=> b!422553 (= e!251367 false)))

(declare-fun minValue!515 () V!15699)

(declare-fun defaultEntry!557 () Int)

(declare-datatypes ((tuple2!7128 0))(
  ( (tuple2!7129 (_1!3575 (_ BitVec 64)) (_2!3575 V!15699)) )
))
(declare-datatypes ((List!7131 0))(
  ( (Nil!7128) (Cons!7127 (h!7983 tuple2!7128) (t!12567 List!7131)) )
))
(declare-datatypes ((ListLongMap!6043 0))(
  ( (ListLongMap!6044 (toList!3037 List!7131)) )
))
(declare-fun lt!194017 () ListLongMap!6043)

(declare-fun zeroValue!515 () V!15699)

(declare-fun v!412 () V!15699)

(declare-fun getCurrentListMapNoExtraKeys!1283 (array!25744 array!25746 (_ BitVec 32) (_ BitVec 32) V!15699 V!15699 (_ BitVec 32) Int) ListLongMap!6043)

(assert (=> b!422553 (= lt!194017 (getCurrentListMapNoExtraKeys!1283 lt!194019 (array!25747 (store (arr!12322 _values!549) i!563 (ValueCellFull!5129 v!412)) (size!12674 _values!549)) mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun lt!194018 () ListLongMap!6043)

(assert (=> b!422553 (= lt!194018 (getCurrentListMapNoExtraKeys!1283 _keys!709 _values!549 mask!1025 extraKeys!496 zeroValue!515 minValue!515 from!863 defaultEntry!557))))

(declare-fun b!422554 () Bool)

(declare-fun res!246802 () Bool)

(assert (=> b!422554 (=> (not res!246802) (not e!251364))))

(assert (=> b!422554 (= res!246802 (and (bvsge i!563 #b00000000000000000000000000000000) (bvslt i!563 (size!12673 _keys!709))))))

(declare-fun b!422547 () Bool)

(declare-fun res!246797 () Bool)

(assert (=> b!422547 (=> (not res!246797) (not e!251364))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!422547 (= res!246797 (validKeyInArray!0 k0!794))))

(declare-fun res!246794 () Bool)

(assert (=> start!39512 (=> (not res!246794) (not e!251364))))

(assert (=> start!39512 (= res!246794 (and (bvsge from!863 #b00000000000000000000000000000000) (bvsle from!863 (size!12673 _keys!709))))))

(assert (=> start!39512 e!251364))

(assert (=> start!39512 tp_is_empty!10945))

(assert (=> start!39512 tp!34907))

(assert (=> start!39512 true))

(declare-fun array_inv!9054 (array!25746) Bool)

(assert (=> start!39512 (and (array_inv!9054 _values!549) e!251368)))

(declare-fun array_inv!9055 (array!25744) Bool)

(assert (=> start!39512 (array_inv!9055 _keys!709)))

(assert (= (and start!39512 res!246794) b!422546))

(assert (= (and b!422546 res!246799) b!422544))

(assert (= (and b!422544 res!246800) b!422543))

(assert (= (and b!422543 res!246804) b!422542))

(assert (= (and b!422542 res!246801) b!422554))

(assert (= (and b!422554 res!246802) b!422547))

(assert (= (and b!422547 res!246797) b!422545))

(assert (= (and b!422545 res!246793) b!422550))

(assert (= (and b!422550 res!246798) b!422549))

(assert (= (and b!422549 res!246795) b!422540))

(assert (= (and b!422540 res!246803) b!422541))

(assert (= (and b!422541 res!246796) b!422553))

(assert (= (and b!422548 condMapEmpty!18039) mapIsEmpty!18039))

(assert (= (and b!422548 (not condMapEmpty!18039)) mapNonEmpty!18039))

(get-info :version)

(assert (= (and mapNonEmpty!18039 ((_ is ValueCellFull!5129) mapValue!18039)) b!422552))

(assert (= (and b!422548 ((_ is ValueCellFull!5129) mapDefault!18039)) b!422551))

(assert (= start!39512 b!422548))

(declare-fun m!412571 () Bool)

(assert (=> b!422545 m!412571))

(declare-fun m!412573 () Bool)

(assert (=> b!422553 m!412573))

(declare-fun m!412575 () Bool)

(assert (=> b!422553 m!412575))

(declare-fun m!412577 () Bool)

(assert (=> b!422553 m!412577))

(declare-fun m!412579 () Bool)

(assert (=> b!422550 m!412579))

(declare-fun m!412581 () Bool)

(assert (=> start!39512 m!412581))

(declare-fun m!412583 () Bool)

(assert (=> start!39512 m!412583))

(declare-fun m!412585 () Bool)

(assert (=> b!422547 m!412585))

(declare-fun m!412587 () Bool)

(assert (=> b!422549 m!412587))

(declare-fun m!412589 () Bool)

(assert (=> b!422549 m!412589))

(declare-fun m!412591 () Bool)

(assert (=> b!422546 m!412591))

(declare-fun m!412593 () Bool)

(assert (=> b!422540 m!412593))

(declare-fun m!412595 () Bool)

(assert (=> b!422542 m!412595))

(declare-fun m!412597 () Bool)

(assert (=> b!422543 m!412597))

(declare-fun m!412599 () Bool)

(assert (=> mapNonEmpty!18039 m!412599))

(check-sat (not b!422542) (not b!422549) tp_is_empty!10945 (not b!422540) (not b!422550) (not b!422546) (not b!422543) (not b_next!9793) (not start!39512) (not mapNonEmpty!18039) (not b!422547) b_and!17463 (not b!422553))
(check-sat b_and!17463 (not b_next!9793))
