; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36978 () Bool)

(assert start!36978)

(declare-fun b_free!8119 () Bool)

(declare-fun b_next!8119 () Bool)

(assert (=> start!36978 (= b_free!8119 (not b_next!8119))))

(declare-fun tp!29072 () Bool)

(declare-fun b_and!15335 () Bool)

(assert (=> start!36978 (= tp!29072 b_and!15335)))

(declare-fun b!371089 () Bool)

(declare-fun res!208606 () Bool)

(declare-fun e!226509 () Bool)

(assert (=> b!371089 (=> (not res!208606) (not e!226509))))

(declare-datatypes ((array!21459 0))(
  ( (array!21460 (arr!10198 (Array (_ BitVec 32) (_ BitVec 64))) (size!10551 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21459)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21459 (_ BitVec 32)) Bool)

(assert (=> b!371089 (= res!208606 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun res!208601 () Bool)

(assert (=> start!36978 (=> (not res!208601) (not e!226509))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36978 (= res!208601 (validMask!0 mask!970))))

(assert (=> start!36978 e!226509))

(declare-datatypes ((V!12795 0))(
  ( (V!12796 (val!4428 Int)) )
))
(declare-datatypes ((ValueCell!4040 0))(
  ( (ValueCellFull!4040 (v!6619 V!12795)) (EmptyCell!4040) )
))
(declare-datatypes ((array!21461 0))(
  ( (array!21462 (arr!10199 (Array (_ BitVec 32) ValueCell!4040)) (size!10552 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21461)

(declare-fun e!226508 () Bool)

(declare-fun array_inv!7542 (array!21461) Bool)

(assert (=> start!36978 (and (array_inv!7542 _values!506) e!226508)))

(assert (=> start!36978 tp!29072))

(assert (=> start!36978 true))

(declare-fun tp_is_empty!8767 () Bool)

(assert (=> start!36978 tp_is_empty!8767))

(declare-fun array_inv!7543 (array!21459) Bool)

(assert (=> start!36978 (array_inv!7543 _keys!658)))

(declare-fun b!371090 () Bool)

(declare-fun res!208608 () Bool)

(assert (=> b!371090 (=> (not res!208608) (not e!226509))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21459 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371090 (= res!208608 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371091 () Bool)

(declare-fun e!226506 () Bool)

(assert (=> b!371091 (= e!226506 tp_is_empty!8767)))

(declare-fun b!371092 () Bool)

(declare-fun res!208607 () Bool)

(assert (=> b!371092 (=> (not res!208607) (not e!226509))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!371092 (= res!208607 (and (= (size!10552 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10551 _keys!658) (size!10552 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371093 () Bool)

(declare-fun res!208610 () Bool)

(assert (=> b!371093 (=> (not res!208610) (not e!226509))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371093 (= res!208610 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10551 _keys!658))))))

(declare-fun b!371094 () Bool)

(declare-fun e!226511 () Bool)

(assert (=> b!371094 (= e!226509 e!226511)))

(declare-fun res!208605 () Bool)

(assert (=> b!371094 (=> (not res!208605) (not e!226511))))

(declare-fun lt!170022 () array!21459)

(assert (=> b!371094 (= res!208605 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170022 mask!970))))

(assert (=> b!371094 (= lt!170022 (array!21460 (store (arr!10198 _keys!658) i!548 k0!778) (size!10551 _keys!658)))))

(declare-fun mapIsEmpty!14715 () Bool)

(declare-fun mapRes!14715 () Bool)

(assert (=> mapIsEmpty!14715 mapRes!14715))

(declare-fun b!371095 () Bool)

(declare-fun e!226507 () Bool)

(assert (=> b!371095 (= e!226507 tp_is_empty!8767)))

(declare-fun b!371096 () Bool)

(declare-fun res!208603 () Bool)

(assert (=> b!371096 (=> (not res!208603) (not e!226509))))

(declare-datatypes ((List!5681 0))(
  ( (Nil!5678) (Cons!5677 (h!6533 (_ BitVec 64)) (t!10822 List!5681)) )
))
(declare-fun arrayNoDuplicates!0 (array!21459 (_ BitVec 32) List!5681) Bool)

(assert (=> b!371096 (= res!208603 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5678))))

(declare-fun b!371097 () Bool)

(assert (=> b!371097 (= e!226511 (not true))))

(declare-datatypes ((tuple2!5846 0))(
  ( (tuple2!5847 (_1!2934 (_ BitVec 64)) (_2!2934 V!12795)) )
))
(declare-datatypes ((List!5682 0))(
  ( (Nil!5679) (Cons!5678 (h!6534 tuple2!5846) (t!10823 List!5682)) )
))
(declare-datatypes ((ListLongMap!4749 0))(
  ( (ListLongMap!4750 (toList!2390 List!5682)) )
))
(declare-fun lt!170023 () ListLongMap!4749)

(declare-fun lt!170021 () ListLongMap!4749)

(assert (=> b!371097 (and (= lt!170023 lt!170021) (= lt!170021 lt!170023))))

(declare-fun v!373 () V!12795)

(declare-fun lt!170025 () ListLongMap!4749)

(declare-fun +!758 (ListLongMap!4749 tuple2!5846) ListLongMap!4749)

(assert (=> b!371097 (= lt!170021 (+!758 lt!170025 (tuple2!5847 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11392 0))(
  ( (Unit!11393) )
))
(declare-fun lt!170024 () Unit!11392)

(declare-fun zeroValue!472 () V!12795)

(declare-fun minValue!472 () V!12795)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!9 (array!21459 array!21461 (_ BitVec 32) (_ BitVec 32) V!12795 V!12795 (_ BitVec 32) (_ BitVec 64) V!12795 (_ BitVec 32) Int) Unit!11392)

(assert (=> b!371097 (= lt!170024 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!9 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!681 (array!21459 array!21461 (_ BitVec 32) (_ BitVec 32) V!12795 V!12795 (_ BitVec 32) Int) ListLongMap!4749)

(assert (=> b!371097 (= lt!170023 (getCurrentListMapNoExtraKeys!681 lt!170022 (array!21462 (store (arr!10199 _values!506) i!548 (ValueCellFull!4040 v!373)) (size!10552 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371097 (= lt!170025 (getCurrentListMapNoExtraKeys!681 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!371098 () Bool)

(declare-fun res!208609 () Bool)

(assert (=> b!371098 (=> (not res!208609) (not e!226511))))

(assert (=> b!371098 (= res!208609 (arrayNoDuplicates!0 lt!170022 #b00000000000000000000000000000000 Nil!5678))))

(declare-fun b!371099 () Bool)

(assert (=> b!371099 (= e!226508 (and e!226507 mapRes!14715))))

(declare-fun condMapEmpty!14715 () Bool)

(declare-fun mapDefault!14715 () ValueCell!4040)

(assert (=> b!371099 (= condMapEmpty!14715 (= (arr!10199 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4040)) mapDefault!14715)))))

(declare-fun b!371100 () Bool)

(declare-fun res!208604 () Bool)

(assert (=> b!371100 (=> (not res!208604) (not e!226509))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371100 (= res!208604 (validKeyInArray!0 k0!778))))

(declare-fun b!371101 () Bool)

(declare-fun res!208602 () Bool)

(assert (=> b!371101 (=> (not res!208602) (not e!226509))))

(assert (=> b!371101 (= res!208602 (or (= (select (arr!10198 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10198 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14715 () Bool)

(declare-fun tp!29073 () Bool)

(assert (=> mapNonEmpty!14715 (= mapRes!14715 (and tp!29073 e!226506))))

(declare-fun mapValue!14715 () ValueCell!4040)

(declare-fun mapKey!14715 () (_ BitVec 32))

(declare-fun mapRest!14715 () (Array (_ BitVec 32) ValueCell!4040))

(assert (=> mapNonEmpty!14715 (= (arr!10199 _values!506) (store mapRest!14715 mapKey!14715 mapValue!14715))))

(assert (= (and start!36978 res!208601) b!371092))

(assert (= (and b!371092 res!208607) b!371089))

(assert (= (and b!371089 res!208606) b!371096))

(assert (= (and b!371096 res!208603) b!371093))

(assert (= (and b!371093 res!208610) b!371100))

(assert (= (and b!371100 res!208604) b!371101))

(assert (= (and b!371101 res!208602) b!371090))

(assert (= (and b!371090 res!208608) b!371094))

(assert (= (and b!371094 res!208605) b!371098))

(assert (= (and b!371098 res!208609) b!371097))

(assert (= (and b!371099 condMapEmpty!14715) mapIsEmpty!14715))

(assert (= (and b!371099 (not condMapEmpty!14715)) mapNonEmpty!14715))

(get-info :version)

(assert (= (and mapNonEmpty!14715 ((_ is ValueCellFull!4040) mapValue!14715)) b!371091))

(assert (= (and b!371099 ((_ is ValueCellFull!4040) mapDefault!14715)) b!371095))

(assert (= start!36978 b!371099))

(declare-fun m!366617 () Bool)

(assert (=> b!371097 m!366617))

(declare-fun m!366619 () Bool)

(assert (=> b!371097 m!366619))

(declare-fun m!366621 () Bool)

(assert (=> b!371097 m!366621))

(declare-fun m!366623 () Bool)

(assert (=> b!371097 m!366623))

(declare-fun m!366625 () Bool)

(assert (=> b!371097 m!366625))

(declare-fun m!366627 () Bool)

(assert (=> b!371094 m!366627))

(declare-fun m!366629 () Bool)

(assert (=> b!371094 m!366629))

(declare-fun m!366631 () Bool)

(assert (=> b!371100 m!366631))

(declare-fun m!366633 () Bool)

(assert (=> mapNonEmpty!14715 m!366633))

(declare-fun m!366635 () Bool)

(assert (=> start!36978 m!366635))

(declare-fun m!366637 () Bool)

(assert (=> start!36978 m!366637))

(declare-fun m!366639 () Bool)

(assert (=> start!36978 m!366639))

(declare-fun m!366641 () Bool)

(assert (=> b!371098 m!366641))

(declare-fun m!366643 () Bool)

(assert (=> b!371096 m!366643))

(declare-fun m!366645 () Bool)

(assert (=> b!371090 m!366645))

(declare-fun m!366647 () Bool)

(assert (=> b!371101 m!366647))

(declare-fun m!366649 () Bool)

(assert (=> b!371089 m!366649))

(check-sat (not b!371097) (not b!371090) (not b!371094) tp_is_empty!8767 (not b!371098) b_and!15335 (not b!371089) (not b_next!8119) (not b!371100) (not mapNonEmpty!14715) (not start!36978) (not b!371096))
(check-sat b_and!15335 (not b_next!8119))
