; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36990 () Bool)

(assert start!36990)

(declare-fun b_free!8131 () Bool)

(declare-fun b_next!8131 () Bool)

(assert (=> start!36990 (= b_free!8131 (not b_next!8131))))

(declare-fun tp!29108 () Bool)

(declare-fun b_and!15347 () Bool)

(assert (=> start!36990 (= tp!29108 b_and!15347)))

(declare-fun b!371323 () Bool)

(declare-fun res!208788 () Bool)

(declare-fun e!226617 () Bool)

(assert (=> b!371323 (=> (not res!208788) (not e!226617))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12811 0))(
  ( (V!12812 (val!4434 Int)) )
))
(declare-datatypes ((ValueCell!4046 0))(
  ( (ValueCellFull!4046 (v!6625 V!12811)) (EmptyCell!4046) )
))
(declare-datatypes ((array!21483 0))(
  ( (array!21484 (arr!10210 (Array (_ BitVec 32) ValueCell!4046)) (size!10563 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21483)

(declare-datatypes ((array!21485 0))(
  ( (array!21486 (arr!10211 (Array (_ BitVec 32) (_ BitVec 64))) (size!10564 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21485)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!371323 (= res!208788 (and (= (size!10563 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10564 _keys!658) (size!10563 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!371324 () Bool)

(declare-fun e!226614 () Bool)

(declare-fun tp_is_empty!8779 () Bool)

(assert (=> b!371324 (= e!226614 tp_is_empty!8779)))

(declare-fun b!371325 () Bool)

(declare-fun res!208782 () Bool)

(assert (=> b!371325 (=> (not res!208782) (not e!226617))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!371325 (= res!208782 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10564 _keys!658))))))

(declare-fun b!371326 () Bool)

(declare-fun res!208781 () Bool)

(assert (=> b!371326 (=> (not res!208781) (not e!226617))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21485 (_ BitVec 32)) Bool)

(assert (=> b!371326 (= res!208781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!371327 () Bool)

(declare-fun e!226618 () Bool)

(assert (=> b!371327 (= e!226617 e!226618)))

(declare-fun res!208785 () Bool)

(assert (=> b!371327 (=> (not res!208785) (not e!226618))))

(declare-fun lt!170115 () array!21485)

(assert (=> b!371327 (= res!208785 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!170115 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!371327 (= lt!170115 (array!21486 (store (arr!10211 _keys!658) i!548 k0!778) (size!10564 _keys!658)))))

(declare-fun b!371328 () Bool)

(declare-fun res!208786 () Bool)

(assert (=> b!371328 (=> (not res!208786) (not e!226617))))

(declare-fun arrayContainsKey!0 (array!21485 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!371328 (= res!208786 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!371329 () Bool)

(declare-fun e!226616 () Bool)

(declare-fun e!226615 () Bool)

(declare-fun mapRes!14733 () Bool)

(assert (=> b!371329 (= e!226616 (and e!226615 mapRes!14733))))

(declare-fun condMapEmpty!14733 () Bool)

(declare-fun mapDefault!14733 () ValueCell!4046)

(assert (=> b!371329 (= condMapEmpty!14733 (= (arr!10210 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4046)) mapDefault!14733)))))

(declare-fun mapNonEmpty!14733 () Bool)

(declare-fun tp!29109 () Bool)

(assert (=> mapNonEmpty!14733 (= mapRes!14733 (and tp!29109 e!226614))))

(declare-fun mapRest!14733 () (Array (_ BitVec 32) ValueCell!4046))

(declare-fun mapValue!14733 () ValueCell!4046)

(declare-fun mapKey!14733 () (_ BitVec 32))

(assert (=> mapNonEmpty!14733 (= (arr!10210 _values!506) (store mapRest!14733 mapKey!14733 mapValue!14733))))

(declare-fun b!371330 () Bool)

(declare-fun res!208790 () Bool)

(assert (=> b!371330 (=> (not res!208790) (not e!226617))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!371330 (= res!208790 (validKeyInArray!0 k0!778))))

(declare-fun b!371331 () Bool)

(assert (=> b!371331 (= e!226618 (not true))))

(declare-datatypes ((tuple2!5854 0))(
  ( (tuple2!5855 (_1!2938 (_ BitVec 64)) (_2!2938 V!12811)) )
))
(declare-datatypes ((List!5690 0))(
  ( (Nil!5687) (Cons!5686 (h!6542 tuple2!5854) (t!10831 List!5690)) )
))
(declare-datatypes ((ListLongMap!4757 0))(
  ( (ListLongMap!4758 (toList!2394 List!5690)) )
))
(declare-fun lt!170114 () ListLongMap!4757)

(declare-fun lt!170112 () ListLongMap!4757)

(assert (=> b!371331 (and (= lt!170114 lt!170112) (= lt!170112 lt!170114))))

(declare-fun v!373 () V!12811)

(declare-fun lt!170113 () ListLongMap!4757)

(declare-fun +!762 (ListLongMap!4757 tuple2!5854) ListLongMap!4757)

(assert (=> b!371331 (= lt!170112 (+!762 lt!170113 (tuple2!5855 k0!778 v!373)))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((Unit!11400 0))(
  ( (Unit!11401) )
))
(declare-fun lt!170111 () Unit!11400)

(declare-fun zeroValue!472 () V!12811)

(declare-fun minValue!472 () V!12811)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!13 (array!21485 array!21483 (_ BitVec 32) (_ BitVec 32) V!12811 V!12811 (_ BitVec 32) (_ BitVec 64) V!12811 (_ BitVec 32) Int) Unit!11400)

(assert (=> b!371331 (= lt!170111 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!13 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!685 (array!21485 array!21483 (_ BitVec 32) (_ BitVec 32) V!12811 V!12811 (_ BitVec 32) Int) ListLongMap!4757)

(assert (=> b!371331 (= lt!170114 (getCurrentListMapNoExtraKeys!685 lt!170115 (array!21484 (store (arr!10210 _values!506) i!548 (ValueCellFull!4046 v!373)) (size!10563 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!371331 (= lt!170113 (getCurrentListMapNoExtraKeys!685 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapIsEmpty!14733 () Bool)

(assert (=> mapIsEmpty!14733 mapRes!14733))

(declare-fun res!208783 () Bool)

(assert (=> start!36990 (=> (not res!208783) (not e!226617))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36990 (= res!208783 (validMask!0 mask!970))))

(assert (=> start!36990 e!226617))

(declare-fun array_inv!7546 (array!21483) Bool)

(assert (=> start!36990 (and (array_inv!7546 _values!506) e!226616)))

(assert (=> start!36990 tp!29108))

(assert (=> start!36990 true))

(assert (=> start!36990 tp_is_empty!8779))

(declare-fun array_inv!7547 (array!21485) Bool)

(assert (=> start!36990 (array_inv!7547 _keys!658)))

(declare-fun b!371332 () Bool)

(assert (=> b!371332 (= e!226615 tp_is_empty!8779)))

(declare-fun b!371333 () Bool)

(declare-fun res!208787 () Bool)

(assert (=> b!371333 (=> (not res!208787) (not e!226618))))

(declare-datatypes ((List!5691 0))(
  ( (Nil!5688) (Cons!5687 (h!6543 (_ BitVec 64)) (t!10832 List!5691)) )
))
(declare-fun arrayNoDuplicates!0 (array!21485 (_ BitVec 32) List!5691) Bool)

(assert (=> b!371333 (= res!208787 (arrayNoDuplicates!0 lt!170115 #b00000000000000000000000000000000 Nil!5688))))

(declare-fun b!371334 () Bool)

(declare-fun res!208784 () Bool)

(assert (=> b!371334 (=> (not res!208784) (not e!226617))))

(assert (=> b!371334 (= res!208784 (or (= (select (arr!10211 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10211 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!371335 () Bool)

(declare-fun res!208789 () Bool)

(assert (=> b!371335 (=> (not res!208789) (not e!226617))))

(assert (=> b!371335 (= res!208789 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5688))))

(assert (= (and start!36990 res!208783) b!371323))

(assert (= (and b!371323 res!208788) b!371326))

(assert (= (and b!371326 res!208781) b!371335))

(assert (= (and b!371335 res!208789) b!371325))

(assert (= (and b!371325 res!208782) b!371330))

(assert (= (and b!371330 res!208790) b!371334))

(assert (= (and b!371334 res!208784) b!371328))

(assert (= (and b!371328 res!208786) b!371327))

(assert (= (and b!371327 res!208785) b!371333))

(assert (= (and b!371333 res!208787) b!371331))

(assert (= (and b!371329 condMapEmpty!14733) mapIsEmpty!14733))

(assert (= (and b!371329 (not condMapEmpty!14733)) mapNonEmpty!14733))

(get-info :version)

(assert (= (and mapNonEmpty!14733 ((_ is ValueCellFull!4046) mapValue!14733)) b!371324))

(assert (= (and b!371329 ((_ is ValueCellFull!4046) mapDefault!14733)) b!371332))

(assert (= start!36990 b!371329))

(declare-fun m!366821 () Bool)

(assert (=> b!371326 m!366821))

(declare-fun m!366823 () Bool)

(assert (=> b!371328 m!366823))

(declare-fun m!366825 () Bool)

(assert (=> b!371330 m!366825))

(declare-fun m!366827 () Bool)

(assert (=> start!36990 m!366827))

(declare-fun m!366829 () Bool)

(assert (=> start!36990 m!366829))

(declare-fun m!366831 () Bool)

(assert (=> start!36990 m!366831))

(declare-fun m!366833 () Bool)

(assert (=> b!371327 m!366833))

(declare-fun m!366835 () Bool)

(assert (=> b!371327 m!366835))

(declare-fun m!366837 () Bool)

(assert (=> b!371331 m!366837))

(declare-fun m!366839 () Bool)

(assert (=> b!371331 m!366839))

(declare-fun m!366841 () Bool)

(assert (=> b!371331 m!366841))

(declare-fun m!366843 () Bool)

(assert (=> b!371331 m!366843))

(declare-fun m!366845 () Bool)

(assert (=> b!371331 m!366845))

(declare-fun m!366847 () Bool)

(assert (=> b!371333 m!366847))

(declare-fun m!366849 () Bool)

(assert (=> mapNonEmpty!14733 m!366849))

(declare-fun m!366851 () Bool)

(assert (=> b!371335 m!366851))

(declare-fun m!366853 () Bool)

(assert (=> b!371334 m!366853))

(check-sat tp_is_empty!8779 (not b!371326) (not mapNonEmpty!14733) (not b!371333) (not b!371328) (not b!371327) (not start!36990) (not b!371330) b_and!15347 (not b_next!8131) (not b!371331) (not b!371335))
(check-sat b_and!15347 (not b_next!8131))
