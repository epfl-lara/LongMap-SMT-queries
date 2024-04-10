; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37570 () Bool)

(assert start!37570)

(declare-fun b_free!8697 () Bool)

(declare-fun b_next!8697 () Bool)

(assert (=> start!37570 (= b_free!8697 (not b_next!8697))))

(declare-fun tp!30806 () Bool)

(declare-fun b_and!15939 () Bool)

(assert (=> start!37570 (= tp!30806 b_and!15939)))

(declare-fun b!383914 () Bool)

(declare-fun res!218683 () Bool)

(declare-fun e!233142 () Bool)

(assert (=> b!383914 (=> (not res!218683) (not e!233142))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383914 (= res!218683 (validKeyInArray!0 k0!778))))

(declare-fun b!383915 () Bool)

(declare-fun res!218691 () Bool)

(assert (=> b!383915 (=> (not res!218691) (not e!233142))))

(declare-datatypes ((array!22595 0))(
  ( (array!22596 (arr!10766 (Array (_ BitVec 32) (_ BitVec 64))) (size!11118 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22595)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!383915 (= res!218691 (or (= (select (arr!10766 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10766 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!218687 () Bool)

(assert (=> start!37570 (=> (not res!218687) (not e!233142))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37570 (= res!218687 (validMask!0 mask!970))))

(assert (=> start!37570 e!233142))

(declare-datatypes ((V!13565 0))(
  ( (V!13566 (val!4717 Int)) )
))
(declare-datatypes ((ValueCell!4329 0))(
  ( (ValueCellFull!4329 (v!6914 V!13565)) (EmptyCell!4329) )
))
(declare-datatypes ((array!22597 0))(
  ( (array!22598 (arr!10767 (Array (_ BitVec 32) ValueCell!4329)) (size!11119 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22597)

(declare-fun e!233140 () Bool)

(declare-fun array_inv!7922 (array!22597) Bool)

(assert (=> start!37570 (and (array_inv!7922 _values!506) e!233140)))

(assert (=> start!37570 tp!30806))

(assert (=> start!37570 true))

(declare-fun tp_is_empty!9345 () Bool)

(assert (=> start!37570 tp_is_empty!9345))

(declare-fun array_inv!7923 (array!22595) Bool)

(assert (=> start!37570 (array_inv!7923 _keys!658)))

(declare-fun b!383916 () Bool)

(declare-fun res!218688 () Bool)

(assert (=> b!383916 (=> (not res!218688) (not e!233142))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!383916 (= res!218688 (and (= (size!11119 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11118 _keys!658) (size!11119 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383917 () Bool)

(declare-fun e!233141 () Bool)

(assert (=> b!383917 (= e!233142 e!233141)))

(declare-fun res!218693 () Bool)

(assert (=> b!383917 (=> (not res!218693) (not e!233141))))

(declare-fun lt!180493 () array!22595)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22595 (_ BitVec 32)) Bool)

(assert (=> b!383917 (= res!218693 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180493 mask!970))))

(assert (=> b!383917 (= lt!180493 (array!22596 (store (arr!10766 _keys!658) i!548 k0!778) (size!11118 _keys!658)))))

(declare-fun b!383918 () Bool)

(declare-fun res!218684 () Bool)

(assert (=> b!383918 (=> (not res!218684) (not e!233142))))

(assert (=> b!383918 (= res!218684 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383919 () Bool)

(declare-fun e!233144 () Bool)

(assert (=> b!383919 (= e!233141 (not e!233144))))

(declare-fun res!218689 () Bool)

(assert (=> b!383919 (=> res!218689 e!233144)))

(declare-fun lt!180498 () Bool)

(assert (=> b!383919 (= res!218689 (or (and (not lt!180498) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180498) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180498)))))

(assert (=> b!383919 (= lt!180498 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6346 0))(
  ( (tuple2!6347 (_1!3184 (_ BitVec 64)) (_2!3184 V!13565)) )
))
(declare-datatypes ((List!6182 0))(
  ( (Nil!6179) (Cons!6178 (h!7034 tuple2!6346) (t!11332 List!6182)) )
))
(declare-datatypes ((ListLongMap!5259 0))(
  ( (ListLongMap!5260 (toList!2645 List!6182)) )
))
(declare-fun lt!180491 () ListLongMap!5259)

(declare-fun zeroValue!472 () V!13565)

(declare-fun minValue!472 () V!13565)

(declare-fun getCurrentListMap!2048 (array!22595 array!22597 (_ BitVec 32) (_ BitVec 32) V!13565 V!13565 (_ BitVec 32) Int) ListLongMap!5259)

(assert (=> b!383919 (= lt!180491 (getCurrentListMap!2048 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180497 () array!22597)

(declare-fun lt!180494 () ListLongMap!5259)

(assert (=> b!383919 (= lt!180494 (getCurrentListMap!2048 lt!180493 lt!180497 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180495 () ListLongMap!5259)

(declare-fun lt!180489 () ListLongMap!5259)

(assert (=> b!383919 (and (= lt!180495 lt!180489) (= lt!180489 lt!180495))))

(declare-fun lt!180492 () ListLongMap!5259)

(declare-fun lt!180496 () tuple2!6346)

(declare-fun +!980 (ListLongMap!5259 tuple2!6346) ListLongMap!5259)

(assert (=> b!383919 (= lt!180489 (+!980 lt!180492 lt!180496))))

(declare-fun v!373 () V!13565)

(assert (=> b!383919 (= lt!180496 (tuple2!6347 k0!778 v!373))))

(declare-datatypes ((Unit!11850 0))(
  ( (Unit!11851) )
))
(declare-fun lt!180488 () Unit!11850)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!206 (array!22595 array!22597 (_ BitVec 32) (_ BitVec 32) V!13565 V!13565 (_ BitVec 32) (_ BitVec 64) V!13565 (_ BitVec 32) Int) Unit!11850)

(assert (=> b!383919 (= lt!180488 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!206 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!882 (array!22595 array!22597 (_ BitVec 32) (_ BitVec 32) V!13565 V!13565 (_ BitVec 32) Int) ListLongMap!5259)

(assert (=> b!383919 (= lt!180495 (getCurrentListMapNoExtraKeys!882 lt!180493 lt!180497 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383919 (= lt!180497 (array!22598 (store (arr!10767 _values!506) i!548 (ValueCellFull!4329 v!373)) (size!11119 _values!506)))))

(assert (=> b!383919 (= lt!180492 (getCurrentListMapNoExtraKeys!882 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!383920 () Bool)

(declare-fun res!218690 () Bool)

(assert (=> b!383920 (=> (not res!218690) (not e!233141))))

(declare-datatypes ((List!6183 0))(
  ( (Nil!6180) (Cons!6179 (h!7035 (_ BitVec 64)) (t!11333 List!6183)) )
))
(declare-fun arrayNoDuplicates!0 (array!22595 (_ BitVec 32) List!6183) Bool)

(assert (=> b!383920 (= res!218690 (arrayNoDuplicates!0 lt!180493 #b00000000000000000000000000000000 Nil!6180))))

(declare-fun b!383921 () Bool)

(declare-fun res!218686 () Bool)

(assert (=> b!383921 (=> (not res!218686) (not e!233142))))

(declare-fun arrayContainsKey!0 (array!22595 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383921 (= res!218686 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383922 () Bool)

(declare-fun e!233139 () Bool)

(assert (=> b!383922 (= e!233139 tp_is_empty!9345)))

(declare-fun b!383923 () Bool)

(declare-fun res!218692 () Bool)

(assert (=> b!383923 (=> (not res!218692) (not e!233142))))

(assert (=> b!383923 (= res!218692 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11118 _keys!658))))))

(declare-fun mapIsEmpty!15582 () Bool)

(declare-fun mapRes!15582 () Bool)

(assert (=> mapIsEmpty!15582 mapRes!15582))

(declare-fun mapNonEmpty!15582 () Bool)

(declare-fun tp!30807 () Bool)

(declare-fun e!233143 () Bool)

(assert (=> mapNonEmpty!15582 (= mapRes!15582 (and tp!30807 e!233143))))

(declare-fun mapValue!15582 () ValueCell!4329)

(declare-fun mapRest!15582 () (Array (_ BitVec 32) ValueCell!4329))

(declare-fun mapKey!15582 () (_ BitVec 32))

(assert (=> mapNonEmpty!15582 (= (arr!10767 _values!506) (store mapRest!15582 mapKey!15582 mapValue!15582))))

(declare-fun b!383924 () Bool)

(assert (=> b!383924 (= e!233144 true)))

(declare-fun lt!180490 () ListLongMap!5259)

(assert (=> b!383924 (= lt!180490 (+!980 lt!180491 lt!180496))))

(assert (=> b!383924 (= lt!180494 lt!180495)))

(declare-fun b!383925 () Bool)

(declare-fun res!218685 () Bool)

(assert (=> b!383925 (=> (not res!218685) (not e!233142))))

(assert (=> b!383925 (= res!218685 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6180))))

(declare-fun b!383926 () Bool)

(assert (=> b!383926 (= e!233140 (and e!233139 mapRes!15582))))

(declare-fun condMapEmpty!15582 () Bool)

(declare-fun mapDefault!15582 () ValueCell!4329)

(assert (=> b!383926 (= condMapEmpty!15582 (= (arr!10767 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4329)) mapDefault!15582)))))

(declare-fun b!383927 () Bool)

(assert (=> b!383927 (= e!233143 tp_is_empty!9345)))

(assert (= (and start!37570 res!218687) b!383916))

(assert (= (and b!383916 res!218688) b!383918))

(assert (= (and b!383918 res!218684) b!383925))

(assert (= (and b!383925 res!218685) b!383923))

(assert (= (and b!383923 res!218692) b!383914))

(assert (= (and b!383914 res!218683) b!383915))

(assert (= (and b!383915 res!218691) b!383921))

(assert (= (and b!383921 res!218686) b!383917))

(assert (= (and b!383917 res!218693) b!383920))

(assert (= (and b!383920 res!218690) b!383919))

(assert (= (and b!383919 (not res!218689)) b!383924))

(assert (= (and b!383926 condMapEmpty!15582) mapIsEmpty!15582))

(assert (= (and b!383926 (not condMapEmpty!15582)) mapNonEmpty!15582))

(get-info :version)

(assert (= (and mapNonEmpty!15582 ((_ is ValueCellFull!4329) mapValue!15582)) b!383927))

(assert (= (and b!383926 ((_ is ValueCellFull!4329) mapDefault!15582)) b!383922))

(assert (= start!37570 b!383926))

(declare-fun m!380635 () Bool)

(assert (=> start!37570 m!380635))

(declare-fun m!380637 () Bool)

(assert (=> start!37570 m!380637))

(declare-fun m!380639 () Bool)

(assert (=> start!37570 m!380639))

(declare-fun m!380641 () Bool)

(assert (=> b!383917 m!380641))

(declare-fun m!380643 () Bool)

(assert (=> b!383917 m!380643))

(declare-fun m!380645 () Bool)

(assert (=> mapNonEmpty!15582 m!380645))

(declare-fun m!380647 () Bool)

(assert (=> b!383921 m!380647))

(declare-fun m!380649 () Bool)

(assert (=> b!383924 m!380649))

(declare-fun m!380651 () Bool)

(assert (=> b!383919 m!380651))

(declare-fun m!380653 () Bool)

(assert (=> b!383919 m!380653))

(declare-fun m!380655 () Bool)

(assert (=> b!383919 m!380655))

(declare-fun m!380657 () Bool)

(assert (=> b!383919 m!380657))

(declare-fun m!380659 () Bool)

(assert (=> b!383919 m!380659))

(declare-fun m!380661 () Bool)

(assert (=> b!383919 m!380661))

(declare-fun m!380663 () Bool)

(assert (=> b!383919 m!380663))

(declare-fun m!380665 () Bool)

(assert (=> b!383918 m!380665))

(declare-fun m!380667 () Bool)

(assert (=> b!383920 m!380667))

(declare-fun m!380669 () Bool)

(assert (=> b!383925 m!380669))

(declare-fun m!380671 () Bool)

(assert (=> b!383914 m!380671))

(declare-fun m!380673 () Bool)

(assert (=> b!383915 m!380673))

(check-sat (not b!383921) (not b!383914) (not start!37570) (not b!383925) (not b!383917) tp_is_empty!9345 b_and!15939 (not b!383918) (not b_next!8697) (not mapNonEmpty!15582) (not b!383920) (not b!383924) (not b!383919))
(check-sat b_and!15939 (not b_next!8697))
