; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37446 () Bool)

(assert start!37446)

(declare-fun b_free!8587 () Bool)

(declare-fun b_next!8587 () Bool)

(assert (=> start!37446 (= b_free!8587 (not b_next!8587))))

(declare-fun tp!30477 () Bool)

(declare-fun b_and!15803 () Bool)

(assert (=> start!37446 (= tp!30477 b_and!15803)))

(declare-fun res!216749 () Bool)

(declare-fun e!231810 () Bool)

(assert (=> start!37446 (=> (not res!216749) (not e!231810))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37446 (= res!216749 (validMask!0 mask!970))))

(assert (=> start!37446 e!231810))

(declare-datatypes ((V!13419 0))(
  ( (V!13420 (val!4662 Int)) )
))
(declare-datatypes ((ValueCell!4274 0))(
  ( (ValueCellFull!4274 (v!6853 V!13419)) (EmptyCell!4274) )
))
(declare-datatypes ((array!22365 0))(
  ( (array!22366 (arr!10651 (Array (_ BitVec 32) ValueCell!4274)) (size!11004 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22365)

(declare-fun e!231813 () Bool)

(declare-fun array_inv!7842 (array!22365) Bool)

(assert (=> start!37446 (and (array_inv!7842 _values!506) e!231813)))

(assert (=> start!37446 tp!30477))

(assert (=> start!37446 true))

(declare-fun tp_is_empty!9235 () Bool)

(assert (=> start!37446 tp_is_empty!9235))

(declare-datatypes ((array!22367 0))(
  ( (array!22368 (arr!10652 (Array (_ BitVec 32) (_ BitVec 64))) (size!11005 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22367)

(declare-fun array_inv!7843 (array!22367) Bool)

(assert (=> start!37446 (array_inv!7843 _keys!658)))

(declare-fun b!381333 () Bool)

(declare-fun e!231815 () Bool)

(assert (=> b!381333 (= e!231815 tp_is_empty!9235)))

(declare-fun b!381334 () Bool)

(declare-fun res!216741 () Bool)

(assert (=> b!381334 (=> (not res!216741) (not e!231810))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22367 (_ BitVec 32)) Bool)

(assert (=> b!381334 (= res!216741 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381335 () Bool)

(declare-fun res!216743 () Bool)

(assert (=> b!381335 (=> (not res!216743) (not e!231810))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381335 (= res!216743 (validKeyInArray!0 k0!778))))

(declare-fun mapNonEmpty!15417 () Bool)

(declare-fun mapRes!15417 () Bool)

(declare-fun tp!30476 () Bool)

(declare-fun e!231809 () Bool)

(assert (=> mapNonEmpty!15417 (= mapRes!15417 (and tp!30476 e!231809))))

(declare-fun mapValue!15417 () ValueCell!4274)

(declare-fun mapKey!15417 () (_ BitVec 32))

(declare-fun mapRest!15417 () (Array (_ BitVec 32) ValueCell!4274))

(assert (=> mapNonEmpty!15417 (= (arr!10651 _values!506) (store mapRest!15417 mapKey!15417 mapValue!15417))))

(declare-fun b!381336 () Bool)

(declare-fun res!216748 () Bool)

(assert (=> b!381336 (=> (not res!216748) (not e!231810))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381336 (= res!216748 (and (= (size!11004 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11005 _keys!658) (size!11004 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!15417 () Bool)

(assert (=> mapIsEmpty!15417 mapRes!15417))

(declare-fun b!381337 () Bool)

(declare-fun e!231811 () Bool)

(assert (=> b!381337 (= e!231811 true)))

(declare-datatypes ((tuple2!6232 0))(
  ( (tuple2!6233 (_1!3127 (_ BitVec 64)) (_2!3127 V!13419)) )
))
(declare-datatypes ((List!6059 0))(
  ( (Nil!6056) (Cons!6055 (h!6911 tuple2!6232) (t!11200 List!6059)) )
))
(declare-datatypes ((ListLongMap!5135 0))(
  ( (ListLongMap!5136 (toList!2583 List!6059)) )
))
(declare-fun lt!178657 () ListLongMap!5135)

(declare-fun lt!178651 () ListLongMap!5135)

(assert (=> b!381337 (= lt!178657 lt!178651)))

(declare-fun b!381338 () Bool)

(declare-fun res!216744 () Bool)

(assert (=> b!381338 (=> (not res!216744) (not e!231810))))

(declare-datatypes ((List!6060 0))(
  ( (Nil!6057) (Cons!6056 (h!6912 (_ BitVec 64)) (t!11201 List!6060)) )
))
(declare-fun arrayNoDuplicates!0 (array!22367 (_ BitVec 32) List!6060) Bool)

(assert (=> b!381338 (= res!216744 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6057))))

(declare-fun b!381339 () Bool)

(declare-fun res!216745 () Bool)

(declare-fun e!231814 () Bool)

(assert (=> b!381339 (=> (not res!216745) (not e!231814))))

(declare-fun lt!178653 () array!22367)

(assert (=> b!381339 (= res!216745 (arrayNoDuplicates!0 lt!178653 #b00000000000000000000000000000000 Nil!6057))))

(declare-fun b!381340 () Bool)

(assert (=> b!381340 (= e!231814 (not e!231811))))

(declare-fun res!216742 () Bool)

(assert (=> b!381340 (=> res!216742 e!231811)))

(declare-fun lt!178652 () Bool)

(assert (=> b!381340 (= res!216742 (or (and (not lt!178652) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178652) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178652)))))

(assert (=> b!381340 (= lt!178652 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun lt!178659 () ListLongMap!5135)

(declare-fun zeroValue!472 () V!13419)

(declare-fun minValue!472 () V!13419)

(declare-fun getCurrentListMap!1972 (array!22367 array!22365 (_ BitVec 32) (_ BitVec 32) V!13419 V!13419 (_ BitVec 32) Int) ListLongMap!5135)

(assert (=> b!381340 (= lt!178659 (getCurrentListMap!1972 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178654 () array!22365)

(assert (=> b!381340 (= lt!178657 (getCurrentListMap!1972 lt!178653 lt!178654 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178656 () ListLongMap!5135)

(assert (=> b!381340 (and (= lt!178651 lt!178656) (= lt!178656 lt!178651))))

(declare-fun v!373 () V!13419)

(declare-fun lt!178658 () ListLongMap!5135)

(declare-fun +!946 (ListLongMap!5135 tuple2!6232) ListLongMap!5135)

(assert (=> b!381340 (= lt!178656 (+!946 lt!178658 (tuple2!6233 k0!778 v!373)))))

(declare-datatypes ((Unit!11750 0))(
  ( (Unit!11751) )
))
(declare-fun lt!178655 () Unit!11750)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!165 (array!22367 array!22365 (_ BitVec 32) (_ BitVec 32) V!13419 V!13419 (_ BitVec 32) (_ BitVec 64) V!13419 (_ BitVec 32) Int) Unit!11750)

(assert (=> b!381340 (= lt!178655 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!165 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!837 (array!22367 array!22365 (_ BitVec 32) (_ BitVec 32) V!13419 V!13419 (_ BitVec 32) Int) ListLongMap!5135)

(assert (=> b!381340 (= lt!178651 (getCurrentListMapNoExtraKeys!837 lt!178653 lt!178654 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381340 (= lt!178654 (array!22366 (store (arr!10651 _values!506) i!548 (ValueCellFull!4274 v!373)) (size!11004 _values!506)))))

(assert (=> b!381340 (= lt!178658 (getCurrentListMapNoExtraKeys!837 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381341 () Bool)

(declare-fun res!216747 () Bool)

(assert (=> b!381341 (=> (not res!216747) (not e!231810))))

(assert (=> b!381341 (= res!216747 (or (= (select (arr!10652 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10652 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381342 () Bool)

(assert (=> b!381342 (= e!231813 (and e!231815 mapRes!15417))))

(declare-fun condMapEmpty!15417 () Bool)

(declare-fun mapDefault!15417 () ValueCell!4274)

(assert (=> b!381342 (= condMapEmpty!15417 (= (arr!10651 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4274)) mapDefault!15417)))))

(declare-fun b!381343 () Bool)

(declare-fun res!216739 () Bool)

(assert (=> b!381343 (=> (not res!216739) (not e!231810))))

(declare-fun arrayContainsKey!0 (array!22367 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381343 (= res!216739 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381344 () Bool)

(declare-fun res!216740 () Bool)

(assert (=> b!381344 (=> (not res!216740) (not e!231810))))

(assert (=> b!381344 (= res!216740 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11005 _keys!658))))))

(declare-fun b!381345 () Bool)

(assert (=> b!381345 (= e!231810 e!231814)))

(declare-fun res!216746 () Bool)

(assert (=> b!381345 (=> (not res!216746) (not e!231814))))

(assert (=> b!381345 (= res!216746 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178653 mask!970))))

(assert (=> b!381345 (= lt!178653 (array!22368 (store (arr!10652 _keys!658) i!548 k0!778) (size!11005 _keys!658)))))

(declare-fun b!381346 () Bool)

(assert (=> b!381346 (= e!231809 tp_is_empty!9235)))

(assert (= (and start!37446 res!216749) b!381336))

(assert (= (and b!381336 res!216748) b!381334))

(assert (= (and b!381334 res!216741) b!381338))

(assert (= (and b!381338 res!216744) b!381344))

(assert (= (and b!381344 res!216740) b!381335))

(assert (= (and b!381335 res!216743) b!381341))

(assert (= (and b!381341 res!216747) b!381343))

(assert (= (and b!381343 res!216739) b!381345))

(assert (= (and b!381345 res!216746) b!381339))

(assert (= (and b!381339 res!216745) b!381340))

(assert (= (and b!381340 (not res!216742)) b!381337))

(assert (= (and b!381342 condMapEmpty!15417) mapIsEmpty!15417))

(assert (= (and b!381342 (not condMapEmpty!15417)) mapNonEmpty!15417))

(get-info :version)

(assert (= (and mapNonEmpty!15417 ((_ is ValueCellFull!4274) mapValue!15417)) b!381346))

(assert (= (and b!381342 ((_ is ValueCellFull!4274) mapDefault!15417)) b!381333))

(assert (= start!37446 b!381342))

(declare-fun m!377783 () Bool)

(assert (=> b!381339 m!377783))

(declare-fun m!377785 () Bool)

(assert (=> b!381343 m!377785))

(declare-fun m!377787 () Bool)

(assert (=> b!381335 m!377787))

(declare-fun m!377789 () Bool)

(assert (=> b!381341 m!377789))

(declare-fun m!377791 () Bool)

(assert (=> start!37446 m!377791))

(declare-fun m!377793 () Bool)

(assert (=> start!37446 m!377793))

(declare-fun m!377795 () Bool)

(assert (=> start!37446 m!377795))

(declare-fun m!377797 () Bool)

(assert (=> b!381338 m!377797))

(declare-fun m!377799 () Bool)

(assert (=> b!381340 m!377799))

(declare-fun m!377801 () Bool)

(assert (=> b!381340 m!377801))

(declare-fun m!377803 () Bool)

(assert (=> b!381340 m!377803))

(declare-fun m!377805 () Bool)

(assert (=> b!381340 m!377805))

(declare-fun m!377807 () Bool)

(assert (=> b!381340 m!377807))

(declare-fun m!377809 () Bool)

(assert (=> b!381340 m!377809))

(declare-fun m!377811 () Bool)

(assert (=> b!381340 m!377811))

(declare-fun m!377813 () Bool)

(assert (=> b!381345 m!377813))

(declare-fun m!377815 () Bool)

(assert (=> b!381345 m!377815))

(declare-fun m!377817 () Bool)

(assert (=> b!381334 m!377817))

(declare-fun m!377819 () Bool)

(assert (=> mapNonEmpty!15417 m!377819))

(check-sat (not b!381338) (not mapNonEmpty!15417) tp_is_empty!9235 (not b!381340) (not b!381334) b_and!15803 (not b!381335) (not b!381343) (not start!37446) (not b_next!8587) (not b!381345) (not b!381339))
(check-sat b_and!15803 (not b_next!8587))
