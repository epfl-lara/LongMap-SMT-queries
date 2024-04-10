; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37576 () Bool)

(assert start!37576)

(declare-fun b_free!8703 () Bool)

(declare-fun b_next!8703 () Bool)

(assert (=> start!37576 (= b_free!8703 (not b_next!8703))))

(declare-fun tp!30824 () Bool)

(declare-fun b_and!15945 () Bool)

(assert (=> start!37576 (= tp!30824 b_and!15945)))

(declare-fun b!384040 () Bool)

(declare-fun res!218790 () Bool)

(declare-fun e!233202 () Bool)

(assert (=> b!384040 (=> (not res!218790) (not e!233202))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384040 (= res!218790 (validKeyInArray!0 k0!778))))

(declare-fun b!384041 () Bool)

(declare-fun e!233206 () Bool)

(declare-fun e!233203 () Bool)

(declare-fun mapRes!15591 () Bool)

(assert (=> b!384041 (= e!233206 (and e!233203 mapRes!15591))))

(declare-fun condMapEmpty!15591 () Bool)

(declare-datatypes ((V!13573 0))(
  ( (V!13574 (val!4720 Int)) )
))
(declare-datatypes ((ValueCell!4332 0))(
  ( (ValueCellFull!4332 (v!6917 V!13573)) (EmptyCell!4332) )
))
(declare-datatypes ((array!22607 0))(
  ( (array!22608 (arr!10772 (Array (_ BitVec 32) ValueCell!4332)) (size!11124 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22607)

(declare-fun mapDefault!15591 () ValueCell!4332)

(assert (=> b!384041 (= condMapEmpty!15591 (= (arr!10772 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4332)) mapDefault!15591)))))

(declare-fun res!218783 () Bool)

(assert (=> start!37576 (=> (not res!218783) (not e!233202))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37576 (= res!218783 (validMask!0 mask!970))))

(assert (=> start!37576 e!233202))

(declare-fun array_inv!7928 (array!22607) Bool)

(assert (=> start!37576 (and (array_inv!7928 _values!506) e!233206)))

(assert (=> start!37576 tp!30824))

(assert (=> start!37576 true))

(declare-fun tp_is_empty!9351 () Bool)

(assert (=> start!37576 tp_is_empty!9351))

(declare-datatypes ((array!22609 0))(
  ( (array!22610 (arr!10773 (Array (_ BitVec 32) (_ BitVec 64))) (size!11125 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22609)

(declare-fun array_inv!7929 (array!22609) Bool)

(assert (=> start!37576 (array_inv!7929 _keys!658)))

(declare-fun b!384042 () Bool)

(declare-fun res!218786 () Bool)

(assert (=> b!384042 (=> (not res!218786) (not e!233202))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384042 (= res!218786 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11125 _keys!658))))))

(declare-fun b!384043 () Bool)

(declare-fun res!218782 () Bool)

(assert (=> b!384043 (=> (not res!218782) (not e!233202))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384043 (= res!218782 (and (= (size!11124 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11125 _keys!658) (size!11124 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384044 () Bool)

(assert (=> b!384044 (= e!233203 tp_is_empty!9351)))

(declare-fun b!384045 () Bool)

(declare-fun res!218785 () Bool)

(assert (=> b!384045 (=> (not res!218785) (not e!233202))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22609 (_ BitVec 32)) Bool)

(assert (=> b!384045 (= res!218785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15591 () Bool)

(declare-fun tp!30825 () Bool)

(declare-fun e!233201 () Bool)

(assert (=> mapNonEmpty!15591 (= mapRes!15591 (and tp!30825 e!233201))))

(declare-fun mapRest!15591 () (Array (_ BitVec 32) ValueCell!4332))

(declare-fun mapKey!15591 () (_ BitVec 32))

(declare-fun mapValue!15591 () ValueCell!4332)

(assert (=> mapNonEmpty!15591 (= (arr!10772 _values!506) (store mapRest!15591 mapKey!15591 mapValue!15591))))

(declare-fun b!384046 () Bool)

(declare-fun res!218787 () Bool)

(declare-fun e!233205 () Bool)

(assert (=> b!384046 (=> (not res!218787) (not e!233205))))

(declare-fun lt!180594 () array!22609)

(declare-datatypes ((List!6186 0))(
  ( (Nil!6183) (Cons!6182 (h!7038 (_ BitVec 64)) (t!11336 List!6186)) )
))
(declare-fun arrayNoDuplicates!0 (array!22609 (_ BitVec 32) List!6186) Bool)

(assert (=> b!384046 (= res!218787 (arrayNoDuplicates!0 lt!180594 #b00000000000000000000000000000000 Nil!6183))))

(declare-fun b!384047 () Bool)

(declare-fun res!218792 () Bool)

(assert (=> b!384047 (=> (not res!218792) (not e!233202))))

(assert (=> b!384047 (= res!218792 (or (= (select (arr!10773 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10773 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!384048 () Bool)

(declare-fun res!218784 () Bool)

(assert (=> b!384048 (=> (not res!218784) (not e!233202))))

(assert (=> b!384048 (= res!218784 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6183))))

(declare-fun b!384049 () Bool)

(declare-fun e!233204 () Bool)

(assert (=> b!384049 (= e!233205 (not e!233204))))

(declare-fun res!218788 () Bool)

(assert (=> b!384049 (=> res!218788 e!233204)))

(declare-fun lt!180596 () Bool)

(assert (=> b!384049 (= res!218788 (or (and (not lt!180596) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180596) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180596)))))

(assert (=> b!384049 (= lt!180596 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13573)

(declare-datatypes ((tuple2!6350 0))(
  ( (tuple2!6351 (_1!3186 (_ BitVec 64)) (_2!3186 V!13573)) )
))
(declare-datatypes ((List!6187 0))(
  ( (Nil!6184) (Cons!6183 (h!7039 tuple2!6350) (t!11337 List!6187)) )
))
(declare-datatypes ((ListLongMap!5263 0))(
  ( (ListLongMap!5264 (toList!2647 List!6187)) )
))
(declare-fun lt!180589 () ListLongMap!5263)

(declare-fun minValue!472 () V!13573)

(declare-fun getCurrentListMap!2050 (array!22609 array!22607 (_ BitVec 32) (_ BitVec 32) V!13573 V!13573 (_ BitVec 32) Int) ListLongMap!5263)

(assert (=> b!384049 (= lt!180589 (getCurrentListMap!2050 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180593 () ListLongMap!5263)

(declare-fun lt!180591 () array!22607)

(assert (=> b!384049 (= lt!180593 (getCurrentListMap!2050 lt!180594 lt!180591 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180592 () ListLongMap!5263)

(declare-fun lt!180595 () ListLongMap!5263)

(assert (=> b!384049 (and (= lt!180592 lt!180595) (= lt!180595 lt!180592))))

(declare-fun lt!180587 () ListLongMap!5263)

(declare-fun lt!180590 () tuple2!6350)

(declare-fun +!982 (ListLongMap!5263 tuple2!6350) ListLongMap!5263)

(assert (=> b!384049 (= lt!180595 (+!982 lt!180587 lt!180590))))

(declare-fun v!373 () V!13573)

(assert (=> b!384049 (= lt!180590 (tuple2!6351 k0!778 v!373))))

(declare-datatypes ((Unit!11854 0))(
  ( (Unit!11855) )
))
(declare-fun lt!180588 () Unit!11854)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!208 (array!22609 array!22607 (_ BitVec 32) (_ BitVec 32) V!13573 V!13573 (_ BitVec 32) (_ BitVec 64) V!13573 (_ BitVec 32) Int) Unit!11854)

(assert (=> b!384049 (= lt!180588 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!208 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!884 (array!22609 array!22607 (_ BitVec 32) (_ BitVec 32) V!13573 V!13573 (_ BitVec 32) Int) ListLongMap!5263)

(assert (=> b!384049 (= lt!180592 (getCurrentListMapNoExtraKeys!884 lt!180594 lt!180591 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384049 (= lt!180591 (array!22608 (store (arr!10772 _values!506) i!548 (ValueCellFull!4332 v!373)) (size!11124 _values!506)))))

(assert (=> b!384049 (= lt!180587 (getCurrentListMapNoExtraKeys!884 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!15591 () Bool)

(assert (=> mapIsEmpty!15591 mapRes!15591))

(declare-fun b!384050 () Bool)

(assert (=> b!384050 (= e!233202 e!233205)))

(declare-fun res!218789 () Bool)

(assert (=> b!384050 (=> (not res!218789) (not e!233205))))

(assert (=> b!384050 (= res!218789 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180594 mask!970))))

(assert (=> b!384050 (= lt!180594 (array!22610 (store (arr!10773 _keys!658) i!548 k0!778) (size!11125 _keys!658)))))

(declare-fun b!384051 () Bool)

(assert (=> b!384051 (= e!233201 tp_is_empty!9351)))

(declare-fun b!384052 () Bool)

(assert (=> b!384052 (= e!233204 true)))

(declare-fun lt!180597 () ListLongMap!5263)

(assert (=> b!384052 (= lt!180597 (+!982 lt!180589 lt!180590))))

(assert (=> b!384052 (= lt!180593 lt!180592)))

(declare-fun b!384053 () Bool)

(declare-fun res!218791 () Bool)

(assert (=> b!384053 (=> (not res!218791) (not e!233202))))

(declare-fun arrayContainsKey!0 (array!22609 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384053 (= res!218791 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(assert (= (and start!37576 res!218783) b!384043))

(assert (= (and b!384043 res!218782) b!384045))

(assert (= (and b!384045 res!218785) b!384048))

(assert (= (and b!384048 res!218784) b!384042))

(assert (= (and b!384042 res!218786) b!384040))

(assert (= (and b!384040 res!218790) b!384047))

(assert (= (and b!384047 res!218792) b!384053))

(assert (= (and b!384053 res!218791) b!384050))

(assert (= (and b!384050 res!218789) b!384046))

(assert (= (and b!384046 res!218787) b!384049))

(assert (= (and b!384049 (not res!218788)) b!384052))

(assert (= (and b!384041 condMapEmpty!15591) mapIsEmpty!15591))

(assert (= (and b!384041 (not condMapEmpty!15591)) mapNonEmpty!15591))

(get-info :version)

(assert (= (and mapNonEmpty!15591 ((_ is ValueCellFull!4332) mapValue!15591)) b!384051))

(assert (= (and b!384041 ((_ is ValueCellFull!4332) mapDefault!15591)) b!384044))

(assert (= start!37576 b!384041))

(declare-fun m!380755 () Bool)

(assert (=> mapNonEmpty!15591 m!380755))

(declare-fun m!380757 () Bool)

(assert (=> b!384040 m!380757))

(declare-fun m!380759 () Bool)

(assert (=> b!384046 m!380759))

(declare-fun m!380761 () Bool)

(assert (=> start!37576 m!380761))

(declare-fun m!380763 () Bool)

(assert (=> start!37576 m!380763))

(declare-fun m!380765 () Bool)

(assert (=> start!37576 m!380765))

(declare-fun m!380767 () Bool)

(assert (=> b!384052 m!380767))

(declare-fun m!380769 () Bool)

(assert (=> b!384049 m!380769))

(declare-fun m!380771 () Bool)

(assert (=> b!384049 m!380771))

(declare-fun m!380773 () Bool)

(assert (=> b!384049 m!380773))

(declare-fun m!380775 () Bool)

(assert (=> b!384049 m!380775))

(declare-fun m!380777 () Bool)

(assert (=> b!384049 m!380777))

(declare-fun m!380779 () Bool)

(assert (=> b!384049 m!380779))

(declare-fun m!380781 () Bool)

(assert (=> b!384049 m!380781))

(declare-fun m!380783 () Bool)

(assert (=> b!384045 m!380783))

(declare-fun m!380785 () Bool)

(assert (=> b!384053 m!380785))

(declare-fun m!380787 () Bool)

(assert (=> b!384050 m!380787))

(declare-fun m!380789 () Bool)

(assert (=> b!384050 m!380789))

(declare-fun m!380791 () Bool)

(assert (=> b!384048 m!380791))

(declare-fun m!380793 () Bool)

(assert (=> b!384047 m!380793))

(check-sat (not b!384050) (not b!384052) (not mapNonEmpty!15591) (not b!384049) (not b!384045) b_and!15945 tp_is_empty!9351 (not b!384046) (not b!384048) (not b!384053) (not start!37576) (not b!384040) (not b_next!8703))
(check-sat b_and!15945 (not b_next!8703))
