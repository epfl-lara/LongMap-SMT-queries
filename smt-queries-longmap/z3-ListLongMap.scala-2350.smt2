; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37548 () Bool)

(assert start!37548)

(declare-fun b_free!8689 () Bool)

(declare-fun b_next!8689 () Bool)

(assert (=> start!37548 (= b_free!8689 (not b_next!8689))))

(declare-fun tp!30782 () Bool)

(declare-fun b_and!15945 () Bool)

(assert (=> start!37548 (= tp!30782 b_and!15945)))

(declare-fun b!383697 () Bool)

(declare-fun res!218558 () Bool)

(declare-fun e!233024 () Bool)

(assert (=> b!383697 (=> (not res!218558) (not e!233024))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13555 0))(
  ( (V!13556 (val!4713 Int)) )
))
(declare-datatypes ((ValueCell!4325 0))(
  ( (ValueCellFull!4325 (v!6911 V!13555)) (EmptyCell!4325) )
))
(declare-datatypes ((array!22568 0))(
  ( (array!22569 (arr!10752 (Array (_ BitVec 32) ValueCell!4325)) (size!11104 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22568)

(declare-datatypes ((array!22570 0))(
  ( (array!22571 (arr!10753 (Array (_ BitVec 32) (_ BitVec 64))) (size!11105 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22570)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383697 (= res!218558 (and (= (size!11104 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11105 _keys!658) (size!11104 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383698 () Bool)

(declare-fun res!218555 () Bool)

(assert (=> b!383698 (=> (not res!218555) (not e!233024))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22570 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383698 (= res!218555 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383699 () Bool)

(declare-fun res!218553 () Bool)

(assert (=> b!383699 (=> (not res!218553) (not e!233024))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383699 (= res!218553 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11105 _keys!658))))))

(declare-fun res!218556 () Bool)

(assert (=> start!37548 (=> (not res!218556) (not e!233024))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37548 (= res!218556 (validMask!0 mask!970))))

(assert (=> start!37548 e!233024))

(declare-fun e!233025 () Bool)

(declare-fun array_inv!7956 (array!22568) Bool)

(assert (=> start!37548 (and (array_inv!7956 _values!506) e!233025)))

(assert (=> start!37548 tp!30782))

(assert (=> start!37548 true))

(declare-fun tp_is_empty!9337 () Bool)

(assert (=> start!37548 tp_is_empty!9337))

(declare-fun array_inv!7957 (array!22570) Bool)

(assert (=> start!37548 (array_inv!7957 _keys!658)))

(declare-fun b!383700 () Bool)

(declare-fun e!233023 () Bool)

(assert (=> b!383700 (= e!233024 e!233023)))

(declare-fun res!218551 () Bool)

(assert (=> b!383700 (=> (not res!218551) (not e!233023))))

(declare-fun lt!180381 () array!22570)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22570 (_ BitVec 32)) Bool)

(assert (=> b!383700 (= res!218551 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180381 mask!970))))

(assert (=> b!383700 (= lt!180381 (array!22571 (store (arr!10753 _keys!658) i!548 k0!778) (size!11105 _keys!658)))))

(declare-fun b!383701 () Bool)

(declare-fun res!218549 () Bool)

(assert (=> b!383701 (=> (not res!218549) (not e!233024))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383701 (= res!218549 (validKeyInArray!0 k0!778))))

(declare-fun b!383702 () Bool)

(declare-fun res!218554 () Bool)

(assert (=> b!383702 (=> (not res!218554) (not e!233024))))

(declare-datatypes ((List!6055 0))(
  ( (Nil!6052) (Cons!6051 (h!6907 (_ BitVec 64)) (t!11197 List!6055)) )
))
(declare-fun arrayNoDuplicates!0 (array!22570 (_ BitVec 32) List!6055) Bool)

(assert (=> b!383702 (= res!218554 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6052))))

(declare-fun mapNonEmpty!15570 () Bool)

(declare-fun mapRes!15570 () Bool)

(declare-fun tp!30783 () Bool)

(declare-fun e!233026 () Bool)

(assert (=> mapNonEmpty!15570 (= mapRes!15570 (and tp!30783 e!233026))))

(declare-fun mapValue!15570 () ValueCell!4325)

(declare-fun mapKey!15570 () (_ BitVec 32))

(declare-fun mapRest!15570 () (Array (_ BitVec 32) ValueCell!4325))

(assert (=> mapNonEmpty!15570 (= (arr!10752 _values!506) (store mapRest!15570 mapKey!15570 mapValue!15570))))

(declare-fun b!383703 () Bool)

(assert (=> b!383703 (= e!233026 tp_is_empty!9337)))

(declare-fun b!383704 () Bool)

(declare-fun e!233027 () Bool)

(assert (=> b!383704 (= e!233027 tp_is_empty!9337)))

(declare-fun b!383705 () Bool)

(declare-fun e!233022 () Bool)

(assert (=> b!383705 (= e!233023 (not e!233022))))

(declare-fun res!218548 () Bool)

(assert (=> b!383705 (=> res!218548 e!233022)))

(declare-fun lt!180384 () Bool)

(assert (=> b!383705 (= res!218548 (or (and (not lt!180384) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180384) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180384)))))

(assert (=> b!383705 (= lt!180384 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-datatypes ((tuple2!6218 0))(
  ( (tuple2!6219 (_1!3120 (_ BitVec 64)) (_2!3120 V!13555)) )
))
(declare-datatypes ((List!6056 0))(
  ( (Nil!6053) (Cons!6052 (h!6908 tuple2!6218) (t!11198 List!6056)) )
))
(declare-datatypes ((ListLongMap!5133 0))(
  ( (ListLongMap!5134 (toList!2582 List!6056)) )
))
(declare-fun lt!180377 () ListLongMap!5133)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13555)

(declare-fun minValue!472 () V!13555)

(declare-fun getCurrentListMap!2014 (array!22570 array!22568 (_ BitVec 32) (_ BitVec 32) V!13555 V!13555 (_ BitVec 32) Int) ListLongMap!5133)

(assert (=> b!383705 (= lt!180377 (getCurrentListMap!2014 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180380 () array!22568)

(declare-fun lt!180382 () ListLongMap!5133)

(assert (=> b!383705 (= lt!180382 (getCurrentListMap!2014 lt!180381 lt!180380 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180378 () ListLongMap!5133)

(declare-fun lt!180376 () ListLongMap!5133)

(assert (=> b!383705 (and (= lt!180378 lt!180376) (= lt!180376 lt!180378))))

(declare-fun lt!180375 () ListLongMap!5133)

(declare-fun lt!180379 () tuple2!6218)

(declare-fun +!974 (ListLongMap!5133 tuple2!6218) ListLongMap!5133)

(assert (=> b!383705 (= lt!180376 (+!974 lt!180375 lt!180379))))

(declare-fun v!373 () V!13555)

(assert (=> b!383705 (= lt!180379 (tuple2!6219 k0!778 v!373))))

(declare-datatypes ((Unit!11823 0))(
  ( (Unit!11824) )
))
(declare-fun lt!180385 () Unit!11823)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!201 (array!22570 array!22568 (_ BitVec 32) (_ BitVec 32) V!13555 V!13555 (_ BitVec 32) (_ BitVec 64) V!13555 (_ BitVec 32) Int) Unit!11823)

(assert (=> b!383705 (= lt!180385 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!201 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!861 (array!22570 array!22568 (_ BitVec 32) (_ BitVec 32) V!13555 V!13555 (_ BitVec 32) Int) ListLongMap!5133)

(assert (=> b!383705 (= lt!180378 (getCurrentListMapNoExtraKeys!861 lt!180381 lt!180380 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383705 (= lt!180380 (array!22569 (store (arr!10752 _values!506) i!548 (ValueCellFull!4325 v!373)) (size!11104 _values!506)))))

(assert (=> b!383705 (= lt!180375 (getCurrentListMapNoExtraKeys!861 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383706 () Bool)

(declare-fun res!218550 () Bool)

(assert (=> b!383706 (=> (not res!218550) (not e!233024))))

(assert (=> b!383706 (= res!218550 (or (= (select (arr!10753 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10753 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!383707 () Bool)

(assert (=> b!383707 (= e!233025 (and e!233027 mapRes!15570))))

(declare-fun condMapEmpty!15570 () Bool)

(declare-fun mapDefault!15570 () ValueCell!4325)

(assert (=> b!383707 (= condMapEmpty!15570 (= (arr!10752 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4325)) mapDefault!15570)))))

(declare-fun b!383708 () Bool)

(declare-fun res!218557 () Bool)

(assert (=> b!383708 (=> (not res!218557) (not e!233023))))

(assert (=> b!383708 (= res!218557 (arrayNoDuplicates!0 lt!180381 #b00000000000000000000000000000000 Nil!6052))))

(declare-fun b!383709 () Bool)

(declare-fun res!218552 () Bool)

(assert (=> b!383709 (=> (not res!218552) (not e!233024))))

(assert (=> b!383709 (= res!218552 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15570 () Bool)

(assert (=> mapIsEmpty!15570 mapRes!15570))

(declare-fun b!383710 () Bool)

(assert (=> b!383710 (= e!233022 true)))

(declare-fun lt!180383 () ListLongMap!5133)

(assert (=> b!383710 (= lt!180383 (+!974 lt!180377 lt!180379))))

(assert (=> b!383710 (= lt!180382 lt!180378)))

(assert (= (and start!37548 res!218556) b!383697))

(assert (= (and b!383697 res!218558) b!383709))

(assert (= (and b!383709 res!218552) b!383702))

(assert (= (and b!383702 res!218554) b!383699))

(assert (= (and b!383699 res!218553) b!383701))

(assert (= (and b!383701 res!218549) b!383706))

(assert (= (and b!383706 res!218550) b!383698))

(assert (= (and b!383698 res!218555) b!383700))

(assert (= (and b!383700 res!218551) b!383708))

(assert (= (and b!383708 res!218557) b!383705))

(assert (= (and b!383705 (not res!218548)) b!383710))

(assert (= (and b!383707 condMapEmpty!15570) mapIsEmpty!15570))

(assert (= (and b!383707 (not condMapEmpty!15570)) mapNonEmpty!15570))

(get-info :version)

(assert (= (and mapNonEmpty!15570 ((_ is ValueCellFull!4325) mapValue!15570)) b!383703))

(assert (= (and b!383707 ((_ is ValueCellFull!4325) mapDefault!15570)) b!383704))

(assert (= start!37548 b!383707))

(declare-fun m!380705 () Bool)

(assert (=> b!383709 m!380705))

(declare-fun m!380707 () Bool)

(assert (=> b!383705 m!380707))

(declare-fun m!380709 () Bool)

(assert (=> b!383705 m!380709))

(declare-fun m!380711 () Bool)

(assert (=> b!383705 m!380711))

(declare-fun m!380713 () Bool)

(assert (=> b!383705 m!380713))

(declare-fun m!380715 () Bool)

(assert (=> b!383705 m!380715))

(declare-fun m!380717 () Bool)

(assert (=> b!383705 m!380717))

(declare-fun m!380719 () Bool)

(assert (=> b!383705 m!380719))

(declare-fun m!380721 () Bool)

(assert (=> b!383700 m!380721))

(declare-fun m!380723 () Bool)

(assert (=> b!383700 m!380723))

(declare-fun m!380725 () Bool)

(assert (=> mapNonEmpty!15570 m!380725))

(declare-fun m!380727 () Bool)

(assert (=> b!383702 m!380727))

(declare-fun m!380729 () Bool)

(assert (=> b!383706 m!380729))

(declare-fun m!380731 () Bool)

(assert (=> b!383698 m!380731))

(declare-fun m!380733 () Bool)

(assert (=> b!383701 m!380733))

(declare-fun m!380735 () Bool)

(assert (=> b!383710 m!380735))

(declare-fun m!380737 () Bool)

(assert (=> b!383708 m!380737))

(declare-fun m!380739 () Bool)

(assert (=> start!37548 m!380739))

(declare-fun m!380741 () Bool)

(assert (=> start!37548 m!380741))

(declare-fun m!380743 () Bool)

(assert (=> start!37548 m!380743))

(check-sat tp_is_empty!9337 (not b!383702) (not mapNonEmpty!15570) (not b!383708) (not start!37548) (not b!383709) (not b!383700) b_and!15945 (not b!383710) (not b!383705) (not b!383701) (not b_next!8689) (not b!383698))
(check-sat b_and!15945 (not b_next!8689))
