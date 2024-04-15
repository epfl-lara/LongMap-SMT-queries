; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36852 () Bool)

(assert start!36852)

(declare-fun b_free!7993 () Bool)

(declare-fun b_next!7993 () Bool)

(assert (=> start!36852 (= b_free!7993 (not b_next!7993))))

(declare-fun tp!28694 () Bool)

(declare-fun b_and!15209 () Bool)

(assert (=> start!36852 (= tp!28694 b_and!15209)))

(declare-fun b!368632 () Bool)

(declare-fun e!225372 () Bool)

(assert (=> b!368632 (= e!225372 false)))

(declare-datatypes ((V!12627 0))(
  ( (V!12628 (val!4365 Int)) )
))
(declare-datatypes ((ValueCell!3977 0))(
  ( (ValueCellFull!3977 (v!6556 V!12627)) (EmptyCell!3977) )
))
(declare-datatypes ((array!21219 0))(
  ( (array!21220 (arr!10078 (Array (_ BitVec 32) ValueCell!3977)) (size!10431 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21219)

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!5756 0))(
  ( (tuple2!5757 (_1!2889 (_ BitVec 64)) (_2!2889 V!12627)) )
))
(declare-datatypes ((List!5585 0))(
  ( (Nil!5582) (Cons!5581 (h!6437 tuple2!5756) (t!10726 List!5585)) )
))
(declare-datatypes ((ListLongMap!4659 0))(
  ( (ListLongMap!4660 (toList!2345 List!5585)) )
))
(declare-fun lt!169380 () ListLongMap!4659)

(declare-fun zeroValue!472 () V!12627)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((array!21221 0))(
  ( (array!21222 (arr!10079 (Array (_ BitVec 32) (_ BitVec 64))) (size!10432 (_ BitVec 32))) )
))
(declare-fun lt!169379 () array!21221)

(declare-fun v!373 () V!12627)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12627)

(declare-fun getCurrentListMapNoExtraKeys!636 (array!21221 array!21219 (_ BitVec 32) (_ BitVec 32) V!12627 V!12627 (_ BitVec 32) Int) ListLongMap!4659)

(assert (=> b!368632 (= lt!169380 (getCurrentListMapNoExtraKeys!636 lt!169379 (array!21220 (store (arr!10078 _values!506) i!548 (ValueCellFull!3977 v!373)) (size!10431 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun _keys!658 () array!21221)

(declare-fun lt!169378 () ListLongMap!4659)

(assert (=> b!368632 (= lt!169378 (getCurrentListMapNoExtraKeys!636 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!368633 () Bool)

(declare-fun res!206716 () Bool)

(assert (=> b!368633 (=> (not res!206716) (not e!225372))))

(declare-datatypes ((List!5586 0))(
  ( (Nil!5583) (Cons!5582 (h!6438 (_ BitVec 64)) (t!10727 List!5586)) )
))
(declare-fun arrayNoDuplicates!0 (array!21221 (_ BitVec 32) List!5586) Bool)

(assert (=> b!368633 (= res!206716 (arrayNoDuplicates!0 lt!169379 #b00000000000000000000000000000000 Nil!5583))))

(declare-fun b!368634 () Bool)

(declare-fun res!206712 () Bool)

(declare-fun e!225377 () Bool)

(assert (=> b!368634 (=> (not res!206712) (not e!225377))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21221 (_ BitVec 32)) Bool)

(assert (=> b!368634 (= res!206712 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!368635 () Bool)

(declare-fun res!206713 () Bool)

(assert (=> b!368635 (=> (not res!206713) (not e!225377))))

(assert (=> b!368635 (= res!206713 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5583))))

(declare-fun mapIsEmpty!14526 () Bool)

(declare-fun mapRes!14526 () Bool)

(assert (=> mapIsEmpty!14526 mapRes!14526))

(declare-fun b!368636 () Bool)

(declare-fun res!206715 () Bool)

(assert (=> b!368636 (=> (not res!206715) (not e!225377))))

(assert (=> b!368636 (= res!206715 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10432 _keys!658))))))

(declare-fun b!368637 () Bool)

(declare-fun e!225375 () Bool)

(declare-fun tp_is_empty!8641 () Bool)

(assert (=> b!368637 (= e!225375 tp_is_empty!8641)))

(declare-fun res!206720 () Bool)

(assert (=> start!36852 (=> (not res!206720) (not e!225377))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36852 (= res!206720 (validMask!0 mask!970))))

(assert (=> start!36852 e!225377))

(declare-fun e!225373 () Bool)

(declare-fun array_inv!7462 (array!21219) Bool)

(assert (=> start!36852 (and (array_inv!7462 _values!506) e!225373)))

(assert (=> start!36852 tp!28694))

(assert (=> start!36852 true))

(assert (=> start!36852 tp_is_empty!8641))

(declare-fun array_inv!7463 (array!21221) Bool)

(assert (=> start!36852 (array_inv!7463 _keys!658)))

(declare-fun mapNonEmpty!14526 () Bool)

(declare-fun tp!28695 () Bool)

(declare-fun e!225376 () Bool)

(assert (=> mapNonEmpty!14526 (= mapRes!14526 (and tp!28695 e!225376))))

(declare-fun mapRest!14526 () (Array (_ BitVec 32) ValueCell!3977))

(declare-fun mapKey!14526 () (_ BitVec 32))

(declare-fun mapValue!14526 () ValueCell!3977)

(assert (=> mapNonEmpty!14526 (= (arr!10078 _values!506) (store mapRest!14526 mapKey!14526 mapValue!14526))))

(declare-fun b!368638 () Bool)

(assert (=> b!368638 (= e!225377 e!225372)))

(declare-fun res!206714 () Bool)

(assert (=> b!368638 (=> (not res!206714) (not e!225372))))

(assert (=> b!368638 (= res!206714 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169379 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!368638 (= lt!169379 (array!21222 (store (arr!10079 _keys!658) i!548 k0!778) (size!10432 _keys!658)))))

(declare-fun b!368639 () Bool)

(declare-fun res!206711 () Bool)

(assert (=> b!368639 (=> (not res!206711) (not e!225377))))

(assert (=> b!368639 (= res!206711 (and (= (size!10431 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10432 _keys!658) (size!10431 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!368640 () Bool)

(assert (=> b!368640 (= e!225373 (and e!225375 mapRes!14526))))

(declare-fun condMapEmpty!14526 () Bool)

(declare-fun mapDefault!14526 () ValueCell!3977)

(assert (=> b!368640 (= condMapEmpty!14526 (= (arr!10078 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3977)) mapDefault!14526)))))

(declare-fun b!368641 () Bool)

(declare-fun res!206719 () Bool)

(assert (=> b!368641 (=> (not res!206719) (not e!225377))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!368641 (= res!206719 (validKeyInArray!0 k0!778))))

(declare-fun b!368642 () Bool)

(assert (=> b!368642 (= e!225376 tp_is_empty!8641)))

(declare-fun b!368643 () Bool)

(declare-fun res!206717 () Bool)

(assert (=> b!368643 (=> (not res!206717) (not e!225377))))

(assert (=> b!368643 (= res!206717 (or (= (select (arr!10079 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10079 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!368644 () Bool)

(declare-fun res!206718 () Bool)

(assert (=> b!368644 (=> (not res!206718) (not e!225377))))

(declare-fun arrayContainsKey!0 (array!21221 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!368644 (= res!206718 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!36852 res!206720) b!368639))

(assert (= (and b!368639 res!206711) b!368634))

(assert (= (and b!368634 res!206712) b!368635))

(assert (= (and b!368635 res!206713) b!368636))

(assert (= (and b!368636 res!206715) b!368641))

(assert (= (and b!368641 res!206719) b!368643))

(assert (= (and b!368643 res!206717) b!368644))

(assert (= (and b!368644 res!206718) b!368638))

(assert (= (and b!368638 res!206714) b!368633))

(assert (= (and b!368633 res!206716) b!368632))

(assert (= (and b!368640 condMapEmpty!14526) mapIsEmpty!14526))

(assert (= (and b!368640 (not condMapEmpty!14526)) mapNonEmpty!14526))

(get-info :version)

(assert (= (and mapNonEmpty!14526 ((_ is ValueCellFull!3977) mapValue!14526)) b!368642))

(assert (= (and b!368640 ((_ is ValueCellFull!3977) mapDefault!14526)) b!368637))

(assert (= start!36852 b!368640))

(declare-fun m!364679 () Bool)

(assert (=> b!368638 m!364679))

(declare-fun m!364681 () Bool)

(assert (=> b!368638 m!364681))

(declare-fun m!364683 () Bool)

(assert (=> start!36852 m!364683))

(declare-fun m!364685 () Bool)

(assert (=> start!36852 m!364685))

(declare-fun m!364687 () Bool)

(assert (=> start!36852 m!364687))

(declare-fun m!364689 () Bool)

(assert (=> b!368644 m!364689))

(declare-fun m!364691 () Bool)

(assert (=> b!368634 m!364691))

(declare-fun m!364693 () Bool)

(assert (=> mapNonEmpty!14526 m!364693))

(declare-fun m!364695 () Bool)

(assert (=> b!368632 m!364695))

(declare-fun m!364697 () Bool)

(assert (=> b!368632 m!364697))

(declare-fun m!364699 () Bool)

(assert (=> b!368632 m!364699))

(declare-fun m!364701 () Bool)

(assert (=> b!368643 m!364701))

(declare-fun m!364703 () Bool)

(assert (=> b!368641 m!364703))

(declare-fun m!364705 () Bool)

(assert (=> b!368633 m!364705))

(declare-fun m!364707 () Bool)

(assert (=> b!368635 m!364707))

(check-sat (not b!368635) tp_is_empty!8641 (not b!368638) (not b!368633) (not b!368634) (not b_next!7993) (not mapNonEmpty!14526) (not b!368641) (not b!368632) (not b!368644) (not start!36852) b_and!15209)
(check-sat b_and!15209 (not b_next!7993))
