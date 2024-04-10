; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36952 () Bool)

(assert start!36952)

(declare-fun b_free!8079 () Bool)

(declare-fun b_next!8079 () Bool)

(assert (=> start!36952 (= b_free!8079 (not b_next!8079))))

(declare-fun tp!28952 () Bool)

(declare-fun b_and!15321 () Bool)

(assert (=> start!36952 (= tp!28952 b_and!15321)))

(declare-fun b!370580 () Bool)

(declare-fun res!208133 () Bool)

(declare-fun e!226324 () Bool)

(assert (=> b!370580 (=> (not res!208133) (not e!226324))))

(declare-datatypes ((array!21397 0))(
  ( (array!21398 (arr!10167 (Array (_ BitVec 32) (_ BitVec 64))) (size!10519 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21397)

(declare-datatypes ((List!5683 0))(
  ( (Nil!5680) (Cons!5679 (h!6535 (_ BitVec 64)) (t!10833 List!5683)) )
))
(declare-fun arrayNoDuplicates!0 (array!21397 (_ BitVec 32) List!5683) Bool)

(assert (=> b!370580 (= res!208133 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5680))))

(declare-fun b!370581 () Bool)

(declare-fun res!208138 () Bool)

(assert (=> b!370581 (=> (not res!208138) (not e!226324))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!370581 (= res!208138 (validKeyInArray!0 k0!778))))

(declare-fun b!370582 () Bool)

(declare-fun res!208135 () Bool)

(assert (=> b!370582 (=> (not res!208135) (not e!226324))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(declare-datatypes ((V!12741 0))(
  ( (V!12742 (val!4408 Int)) )
))
(declare-datatypes ((ValueCell!4020 0))(
  ( (ValueCellFull!4020 (v!6605 V!12741)) (EmptyCell!4020) )
))
(declare-datatypes ((array!21399 0))(
  ( (array!21400 (arr!10168 (Array (_ BitVec 32) ValueCell!4020)) (size!10520 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21399)

(assert (=> b!370582 (= res!208135 (and (= (size!10520 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10519 _keys!658) (size!10520 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!14655 () Bool)

(declare-fun mapRes!14655 () Bool)

(declare-fun tp!28953 () Bool)

(declare-fun e!226325 () Bool)

(assert (=> mapNonEmpty!14655 (= mapRes!14655 (and tp!28953 e!226325))))

(declare-fun mapValue!14655 () ValueCell!4020)

(declare-fun mapKey!14655 () (_ BitVec 32))

(declare-fun mapRest!14655 () (Array (_ BitVec 32) ValueCell!4020))

(assert (=> mapNonEmpty!14655 (= (arr!10168 _values!506) (store mapRest!14655 mapKey!14655 mapValue!14655))))

(declare-fun b!370583 () Bool)

(declare-fun res!208139 () Bool)

(assert (=> b!370583 (=> (not res!208139) (not e!226324))))

(declare-fun arrayContainsKey!0 (array!21397 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!370583 (= res!208139 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!370584 () Bool)

(declare-fun e!226320 () Bool)

(declare-fun tp_is_empty!8727 () Bool)

(assert (=> b!370584 (= e!226320 tp_is_empty!8727)))

(declare-fun b!370585 () Bool)

(declare-fun res!208137 () Bool)

(declare-fun e!226323 () Bool)

(assert (=> b!370585 (=> (not res!208137) (not e!226323))))

(declare-fun lt!170000 () array!21397)

(assert (=> b!370585 (= res!208137 (arrayNoDuplicates!0 lt!170000 #b00000000000000000000000000000000 Nil!5680))))

(declare-fun b!370586 () Bool)

(assert (=> b!370586 (= e!226323 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5844 0))(
  ( (tuple2!5845 (_1!2933 (_ BitVec 64)) (_2!2933 V!12741)) )
))
(declare-datatypes ((List!5684 0))(
  ( (Nil!5681) (Cons!5680 (h!6536 tuple2!5844) (t!10834 List!5684)) )
))
(declare-datatypes ((ListLongMap!4757 0))(
  ( (ListLongMap!4758 (toList!2394 List!5684)) )
))
(declare-fun lt!170001 () ListLongMap!4757)

(declare-fun zeroValue!472 () V!12741)

(declare-fun v!373 () V!12741)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12741)

(declare-fun getCurrentListMapNoExtraKeys!671 (array!21397 array!21399 (_ BitVec 32) (_ BitVec 32) V!12741 V!12741 (_ BitVec 32) Int) ListLongMap!4757)

(assert (=> b!370586 (= lt!170001 (getCurrentListMapNoExtraKeys!671 lt!170000 (array!21400 (store (arr!10168 _values!506) i!548 (ValueCellFull!4020 v!373)) (size!10520 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169999 () ListLongMap!4757)

(assert (=> b!370586 (= lt!169999 (getCurrentListMapNoExtraKeys!671 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!370587 () Bool)

(declare-fun res!208134 () Bool)

(assert (=> b!370587 (=> (not res!208134) (not e!226324))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21397 (_ BitVec 32)) Bool)

(assert (=> b!370587 (= res!208134 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!370588 () Bool)

(declare-fun res!208136 () Bool)

(assert (=> b!370588 (=> (not res!208136) (not e!226324))))

(assert (=> b!370588 (= res!208136 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10519 _keys!658))))))

(declare-fun b!370589 () Bool)

(declare-fun e!226322 () Bool)

(assert (=> b!370589 (= e!226322 (and e!226320 mapRes!14655))))

(declare-fun condMapEmpty!14655 () Bool)

(declare-fun mapDefault!14655 () ValueCell!4020)

(assert (=> b!370589 (= condMapEmpty!14655 (= (arr!10168 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4020)) mapDefault!14655)))))

(declare-fun b!370590 () Bool)

(assert (=> b!370590 (= e!226324 e!226323)))

(declare-fun res!208130 () Bool)

(assert (=> b!370590 (=> (not res!208130) (not e!226323))))

(assert (=> b!370590 (= res!208130 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170000 mask!970))))

(assert (=> b!370590 (= lt!170000 (array!21398 (store (arr!10167 _keys!658) i!548 k0!778) (size!10519 _keys!658)))))

(declare-fun b!370591 () Bool)

(declare-fun res!208132 () Bool)

(assert (=> b!370591 (=> (not res!208132) (not e!226324))))

(assert (=> b!370591 (= res!208132 (or (= (select (arr!10167 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10167 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14655 () Bool)

(assert (=> mapIsEmpty!14655 mapRes!14655))

(declare-fun b!370592 () Bool)

(assert (=> b!370592 (= e!226325 tp_is_empty!8727)))

(declare-fun res!208131 () Bool)

(assert (=> start!36952 (=> (not res!208131) (not e!226324))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36952 (= res!208131 (validMask!0 mask!970))))

(assert (=> start!36952 e!226324))

(declare-fun array_inv!7510 (array!21399) Bool)

(assert (=> start!36952 (and (array_inv!7510 _values!506) e!226322)))

(assert (=> start!36952 tp!28952))

(assert (=> start!36952 true))

(assert (=> start!36952 tp_is_empty!8727))

(declare-fun array_inv!7511 (array!21397) Bool)

(assert (=> start!36952 (array_inv!7511 _keys!658)))

(assert (= (and start!36952 res!208131) b!370582))

(assert (= (and b!370582 res!208135) b!370587))

(assert (= (and b!370587 res!208134) b!370580))

(assert (= (and b!370580 res!208133) b!370588))

(assert (= (and b!370588 res!208136) b!370581))

(assert (= (and b!370581 res!208138) b!370591))

(assert (= (and b!370591 res!208132) b!370583))

(assert (= (and b!370583 res!208139) b!370590))

(assert (= (and b!370590 res!208130) b!370585))

(assert (= (and b!370585 res!208137) b!370586))

(assert (= (and b!370589 condMapEmpty!14655) mapIsEmpty!14655))

(assert (= (and b!370589 (not condMapEmpty!14655)) mapNonEmpty!14655))

(get-info :version)

(assert (= (and mapNonEmpty!14655 ((_ is ValueCellFull!4020) mapValue!14655)) b!370592))

(assert (= (and b!370589 ((_ is ValueCellFull!4020) mapDefault!14655)) b!370584))

(assert (= start!36952 b!370589))

(declare-fun m!366693 () Bool)

(assert (=> b!370585 m!366693))

(declare-fun m!366695 () Bool)

(assert (=> b!370587 m!366695))

(declare-fun m!366697 () Bool)

(assert (=> start!36952 m!366697))

(declare-fun m!366699 () Bool)

(assert (=> start!36952 m!366699))

(declare-fun m!366701 () Bool)

(assert (=> start!36952 m!366701))

(declare-fun m!366703 () Bool)

(assert (=> b!370581 m!366703))

(declare-fun m!366705 () Bool)

(assert (=> b!370591 m!366705))

(declare-fun m!366707 () Bool)

(assert (=> b!370583 m!366707))

(declare-fun m!366709 () Bool)

(assert (=> b!370580 m!366709))

(declare-fun m!366711 () Bool)

(assert (=> mapNonEmpty!14655 m!366711))

(declare-fun m!366713 () Bool)

(assert (=> b!370590 m!366713))

(declare-fun m!366715 () Bool)

(assert (=> b!370590 m!366715))

(declare-fun m!366717 () Bool)

(assert (=> b!370586 m!366717))

(declare-fun m!366719 () Bool)

(assert (=> b!370586 m!366719))

(declare-fun m!366721 () Bool)

(assert (=> b!370586 m!366721))

(check-sat (not b!370590) (not b!370585) (not b!370583) (not start!36952) tp_is_empty!8727 (not b_next!8079) (not b!370586) (not b!370580) b_and!15321 (not b!370587) (not b!370581) (not mapNonEmpty!14655))
(check-sat b_and!15321 (not b_next!8079))
