; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37006 () Bool)

(assert start!37006)

(declare-fun b_free!8133 () Bool)

(declare-fun b_next!8133 () Bool)

(assert (=> start!37006 (= b_free!8133 (not b_next!8133))))

(declare-fun tp!29115 () Bool)

(declare-fun b_and!15375 () Bool)

(assert (=> start!37006 (= tp!29115 b_and!15375)))

(declare-fun res!208941 () Bool)

(declare-fun e!226810 () Bool)

(assert (=> start!37006 (=> (not res!208941) (not e!226810))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37006 (= res!208941 (validMask!0 mask!970))))

(assert (=> start!37006 e!226810))

(declare-datatypes ((V!12813 0))(
  ( (V!12814 (val!4435 Int)) )
))
(declare-datatypes ((ValueCell!4047 0))(
  ( (ValueCellFull!4047 (v!6632 V!12813)) (EmptyCell!4047) )
))
(declare-datatypes ((array!21503 0))(
  ( (array!21504 (arr!10220 (Array (_ BitVec 32) ValueCell!4047)) (size!10572 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21503)

(declare-fun e!226806 () Bool)

(declare-fun array_inv!7544 (array!21503) Bool)

(assert (=> start!37006 (and (array_inv!7544 _values!506) e!226806)))

(assert (=> start!37006 tp!29115))

(assert (=> start!37006 true))

(declare-fun tp_is_empty!8781 () Bool)

(assert (=> start!37006 tp_is_empty!8781))

(declare-datatypes ((array!21505 0))(
  ( (array!21506 (arr!10221 (Array (_ BitVec 32) (_ BitVec 64))) (size!10573 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21505)

(declare-fun array_inv!7545 (array!21505) Bool)

(assert (=> start!37006 (array_inv!7545 _keys!658)))

(declare-fun mapIsEmpty!14736 () Bool)

(declare-fun mapRes!14736 () Bool)

(assert (=> mapIsEmpty!14736 mapRes!14736))

(declare-fun b!371633 () Bool)

(declare-fun res!208949 () Bool)

(assert (=> b!371633 (=> (not res!208949) (not e!226810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21505 (_ BitVec 32)) Bool)

(assert (=> b!371633 (= res!208949 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371634 () Bool)

(declare-fun res!208943 () Bool)

(assert (=> b!371634 (=> (not res!208943) (not e!226810))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21505 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371634 (= res!208943 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371635 () Bool)

(declare-fun e!226808 () Bool)

(assert (=> b!371635 (= e!226808 tp_is_empty!8781)))

(declare-fun b!371636 () Bool)

(declare-fun res!208948 () Bool)

(declare-fun e!226809 () Bool)

(assert (=> b!371636 (=> (not res!208948) (not e!226809))))

(declare-fun lt!170364 () array!21505)

(declare-datatypes ((List!5724 0))(
  ( (Nil!5721) (Cons!5720 (h!6576 (_ BitVec 64)) (t!10874 List!5724)) )
))
(declare-fun arrayNoDuplicates!0 (array!21505 (_ BitVec 32) List!5724) Bool)

(assert (=> b!371636 (= res!208948 (arrayNoDuplicates!0 lt!170364 #b00000000000000000000000000000000 Nil!5721))))

(declare-fun b!371637 () Bool)

(assert (=> b!371637 (= e!226810 e!226809)))

(declare-fun res!208945 () Bool)

(assert (=> b!371637 (=> (not res!208945) (not e!226809))))

(assert (=> b!371637 (= res!208945 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170364 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371637 (= lt!170364 (array!21506 (store (arr!10221 _keys!658) i!548 k0!778) (size!10573 _keys!658)))))

(declare-fun mapNonEmpty!14736 () Bool)

(declare-fun tp!29114 () Bool)

(declare-fun e!226807 () Bool)

(assert (=> mapNonEmpty!14736 (= mapRes!14736 (and tp!29114 e!226807))))

(declare-fun mapValue!14736 () ValueCell!4047)

(declare-fun mapKey!14736 () (_ BitVec 32))

(declare-fun mapRest!14736 () (Array (_ BitVec 32) ValueCell!4047))

(assert (=> mapNonEmpty!14736 (= (arr!10220 _values!506) (store mapRest!14736 mapKey!14736 mapValue!14736))))

(declare-fun b!371638 () Bool)

(declare-fun res!208944 () Bool)

(assert (=> b!371638 (=> (not res!208944) (not e!226810))))

(assert (=> b!371638 (= res!208944 (or (= (select (arr!10221 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10221 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371639 () Bool)

(declare-fun res!208940 () Bool)

(assert (=> b!371639 (=> (not res!208940) (not e!226810))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371639 (= res!208940 (validKeyInArray!0 k0!778))))

(declare-fun b!371640 () Bool)

(assert (=> b!371640 (= e!226806 (and e!226808 mapRes!14736))))

(declare-fun condMapEmpty!14736 () Bool)

(declare-fun mapDefault!14736 () ValueCell!4047)

(assert (=> b!371640 (= condMapEmpty!14736 (= (arr!10220 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4047)) mapDefault!14736)))))

(declare-fun b!371641 () Bool)

(assert (=> b!371641 (= e!226809 (not true))))

(declare-datatypes ((tuple2!5884 0))(
  ( (tuple2!5885 (_1!2953 (_ BitVec 64)) (_2!2953 V!12813)) )
))
(declare-datatypes ((List!5725 0))(
  ( (Nil!5722) (Cons!5721 (h!6577 tuple2!5884) (t!10875 List!5725)) )
))
(declare-datatypes ((ListLongMap!4797 0))(
  ( (ListLongMap!4798 (toList!2414 List!5725)) )
))
(declare-fun lt!170361 () ListLongMap!4797)

(declare-fun lt!170363 () ListLongMap!4797)

(assert (=> b!371641 (and (= lt!170361 lt!170363) (= lt!170363 lt!170361))))

(declare-fun lt!170360 () ListLongMap!4797)

(declare-fun v!373 () V!12813)

(declare-fun +!760 (ListLongMap!4797 tuple2!5884) ListLongMap!4797)

(assert (=> b!371641 (= lt!170363 (+!760 lt!170360 (tuple2!5885 k0!778 v!373)))))

(declare-datatypes ((Unit!11426 0))(
  ( (Unit!11427) )
))
(declare-fun lt!170362 () Unit!11426)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12813)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun minValue!472 () V!12813)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!15 (array!21505 array!21503 (_ BitVec 32) (_ BitVec 32) V!12813 V!12813 (_ BitVec 32) (_ BitVec 64) V!12813 (_ BitVec 32) Int) Unit!11426)

(assert (=> b!371641 (= lt!170362 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!15 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!691 (array!21505 array!21503 (_ BitVec 32) (_ BitVec 32) V!12813 V!12813 (_ BitVec 32) Int) ListLongMap!4797)

(assert (=> b!371641 (= lt!170361 (getCurrentListMapNoExtraKeys!691 lt!170364 (array!21504 (store (arr!10220 _values!506) i!548 (ValueCellFull!4047 v!373)) (size!10572 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371641 (= lt!170360 (getCurrentListMapNoExtraKeys!691 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371642 () Bool)

(declare-fun res!208946 () Bool)

(assert (=> b!371642 (=> (not res!208946) (not e!226810))))

(assert (=> b!371642 (= res!208946 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5721))))

(declare-fun b!371643 () Bool)

(declare-fun res!208942 () Bool)

(assert (=> b!371643 (=> (not res!208942) (not e!226810))))

(assert (=> b!371643 (= res!208942 (and (= (size!10572 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10573 _keys!658) (size!10572 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371644 () Bool)

(declare-fun res!208947 () Bool)

(assert (=> b!371644 (=> (not res!208947) (not e!226810))))

(assert (=> b!371644 (= res!208947 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10573 _keys!658))))))

(declare-fun b!371645 () Bool)

(assert (=> b!371645 (= e!226807 tp_is_empty!8781)))

(assert (= (and start!37006 res!208941) b!371643))

(assert (= (and b!371643 res!208942) b!371633))

(assert (= (and b!371633 res!208949) b!371642))

(assert (= (and b!371642 res!208946) b!371644))

(assert (= (and b!371644 res!208947) b!371639))

(assert (= (and b!371639 res!208940) b!371638))

(assert (= (and b!371638 res!208944) b!371634))

(assert (= (and b!371634 res!208943) b!371637))

(assert (= (and b!371637 res!208945) b!371636))

(assert (= (and b!371636 res!208948) b!371641))

(assert (= (and b!371640 condMapEmpty!14736) mapIsEmpty!14736))

(assert (= (and b!371640 (not condMapEmpty!14736)) mapNonEmpty!14736))

(get-info :version)

(assert (= (and mapNonEmpty!14736 ((_ is ValueCellFull!4047) mapValue!14736)) b!371645))

(assert (= (and b!371640 ((_ is ValueCellFull!4047) mapDefault!14736)) b!371635))

(assert (= start!37006 b!371640))

(declare-fun m!367579 () Bool)

(assert (=> b!371637 m!367579))

(declare-fun m!367581 () Bool)

(assert (=> b!371637 m!367581))

(declare-fun m!367583 () Bool)

(assert (=> b!371634 m!367583))

(declare-fun m!367585 () Bool)

(assert (=> b!371636 m!367585))

(declare-fun m!367587 () Bool)

(assert (=> start!37006 m!367587))

(declare-fun m!367589 () Bool)

(assert (=> start!37006 m!367589))

(declare-fun m!367591 () Bool)

(assert (=> start!37006 m!367591))

(declare-fun m!367593 () Bool)

(assert (=> b!371638 m!367593))

(declare-fun m!367595 () Bool)

(assert (=> b!371641 m!367595))

(declare-fun m!367597 () Bool)

(assert (=> b!371641 m!367597))

(declare-fun m!367599 () Bool)

(assert (=> b!371641 m!367599))

(declare-fun m!367601 () Bool)

(assert (=> b!371641 m!367601))

(declare-fun m!367603 () Bool)

(assert (=> b!371641 m!367603))

(declare-fun m!367605 () Bool)

(assert (=> b!371639 m!367605))

(declare-fun m!367607 () Bool)

(assert (=> mapNonEmpty!14736 m!367607))

(declare-fun m!367609 () Bool)

(assert (=> b!371633 m!367609))

(declare-fun m!367611 () Bool)

(assert (=> b!371642 m!367611))

(check-sat (not mapNonEmpty!14736) (not b!371633) (not start!37006) (not b!371636) (not b!371641) (not b!371637) (not b_next!8133) tp_is_empty!8781 (not b!371642) b_and!15375 (not b!371639) (not b!371634))
(check-sat b_and!15375 (not b_next!8133))
