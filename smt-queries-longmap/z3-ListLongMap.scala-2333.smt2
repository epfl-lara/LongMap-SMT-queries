; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37446 () Bool)

(assert start!37446)

(declare-fun b_free!8587 () Bool)

(declare-fun b_next!8587 () Bool)

(assert (=> start!37446 (= b_free!8587 (not b_next!8587))))

(declare-fun tp!30476 () Bool)

(declare-fun b_and!15843 () Bool)

(assert (=> start!37446 (= tp!30476 b_and!15843)))

(declare-fun res!216874 () Bool)

(declare-fun e!231953 () Bool)

(assert (=> start!37446 (=> (not res!216874) (not e!231953))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37446 (= res!216874 (validMask!0 mask!970))))

(assert (=> start!37446 e!231953))

(declare-datatypes ((V!13419 0))(
  ( (V!13420 (val!4662 Int)) )
))
(declare-datatypes ((ValueCell!4274 0))(
  ( (ValueCellFull!4274 (v!6860 V!13419)) (EmptyCell!4274) )
))
(declare-datatypes ((array!22370 0))(
  ( (array!22371 (arr!10653 (Array (_ BitVec 32) ValueCell!4274)) (size!11005 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22370)

(declare-fun e!231952 () Bool)

(declare-fun array_inv!7888 (array!22370) Bool)

(assert (=> start!37446 (and (array_inv!7888 _values!506) e!231952)))

(assert (=> start!37446 tp!30476))

(assert (=> start!37446 true))

(declare-fun tp_is_empty!9235 () Bool)

(assert (=> start!37446 tp_is_empty!9235))

(declare-datatypes ((array!22372 0))(
  ( (array!22373 (arr!10654 (Array (_ BitVec 32) (_ BitVec 64))) (size!11006 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22372)

(declare-fun array_inv!7889 (array!22372) Bool)

(assert (=> start!37446 (array_inv!7889 _keys!658)))

(declare-fun mapIsEmpty!15417 () Bool)

(declare-fun mapRes!15417 () Bool)

(assert (=> mapIsEmpty!15417 mapRes!15417))

(declare-fun b!381555 () Bool)

(declare-fun e!231955 () Bool)

(assert (=> b!381555 (= e!231955 tp_is_empty!9235)))

(declare-fun b!381556 () Bool)

(declare-fun e!231954 () Bool)

(assert (=> b!381556 (= e!231954 true)))

(declare-datatypes ((tuple2!6140 0))(
  ( (tuple2!6141 (_1!3081 (_ BitVec 64)) (_2!3081 V!13419)) )
))
(declare-datatypes ((List!5975 0))(
  ( (Nil!5972) (Cons!5971 (h!6827 tuple2!6140) (t!11117 List!5975)) )
))
(declare-datatypes ((ListLongMap!5055 0))(
  ( (ListLongMap!5056 (toList!2543 List!5975)) )
))
(declare-fun lt!178912 () ListLongMap!5055)

(declare-fun lt!178910 () ListLongMap!5055)

(assert (=> b!381556 (= lt!178912 lt!178910)))

(declare-fun b!381557 () Bool)

(declare-fun res!216866 () Bool)

(assert (=> b!381557 (=> (not res!216866) (not e!231953))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!381557 (= res!216866 (validKeyInArray!0 k0!778))))

(declare-fun b!381558 () Bool)

(declare-fun res!216869 () Bool)

(assert (=> b!381558 (=> (not res!216869) (not e!231953))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22372 (_ BitVec 32)) Bool)

(assert (=> b!381558 (= res!216869 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!381559 () Bool)

(declare-fun res!216870 () Bool)

(assert (=> b!381559 (=> (not res!216870) (not e!231953))))

(declare-fun arrayContainsKey!0 (array!22372 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!381559 (= res!216870 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!381560 () Bool)

(declare-fun e!231956 () Bool)

(assert (=> b!381560 (= e!231956 (not e!231954))))

(declare-fun res!216867 () Bool)

(assert (=> b!381560 (=> res!216867 e!231954)))

(declare-fun lt!178904 () Bool)

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!381560 (= res!216867 (or (and (not lt!178904) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!178904) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!178904)))))

(assert (=> b!381560 (= lt!178904 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun lt!178908 () ListLongMap!5055)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13419)

(declare-fun minValue!472 () V!13419)

(declare-fun getCurrentListMap!1980 (array!22372 array!22370 (_ BitVec 32) (_ BitVec 32) V!13419 V!13419 (_ BitVec 32) Int) ListLongMap!5055)

(assert (=> b!381560 (= lt!178908 (getCurrentListMap!1980 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178907 () array!22372)

(declare-fun lt!178909 () array!22370)

(assert (=> b!381560 (= lt!178912 (getCurrentListMap!1980 lt!178907 lt!178909 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178905 () ListLongMap!5055)

(assert (=> b!381560 (and (= lt!178910 lt!178905) (= lt!178905 lt!178910))))

(declare-fun v!373 () V!13419)

(declare-fun lt!178906 () ListLongMap!5055)

(declare-fun +!938 (ListLongMap!5055 tuple2!6140) ListLongMap!5055)

(assert (=> b!381560 (= lt!178905 (+!938 lt!178906 (tuple2!6141 k0!778 v!373)))))

(declare-datatypes ((Unit!11755 0))(
  ( (Unit!11756) )
))
(declare-fun lt!178911 () Unit!11755)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!167 (array!22372 array!22370 (_ BitVec 32) (_ BitVec 32) V!13419 V!13419 (_ BitVec 32) (_ BitVec 64) V!13419 (_ BitVec 32) Int) Unit!11755)

(assert (=> b!381560 (= lt!178911 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!167 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!827 (array!22372 array!22370 (_ BitVec 32) (_ BitVec 32) V!13419 V!13419 (_ BitVec 32) Int) ListLongMap!5055)

(assert (=> b!381560 (= lt!178910 (getCurrentListMapNoExtraKeys!827 lt!178907 lt!178909 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!381560 (= lt!178909 (array!22371 (store (arr!10653 _values!506) i!548 (ValueCellFull!4274 v!373)) (size!11005 _values!506)))))

(assert (=> b!381560 (= lt!178906 (getCurrentListMapNoExtraKeys!827 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!381561 () Bool)

(declare-fun res!216871 () Bool)

(assert (=> b!381561 (=> (not res!216871) (not e!231956))))

(declare-datatypes ((List!5976 0))(
  ( (Nil!5973) (Cons!5972 (h!6828 (_ BitVec 64)) (t!11118 List!5976)) )
))
(declare-fun arrayNoDuplicates!0 (array!22372 (_ BitVec 32) List!5976) Bool)

(assert (=> b!381561 (= res!216871 (arrayNoDuplicates!0 lt!178907 #b00000000000000000000000000000000 Nil!5973))))

(declare-fun b!381562 () Bool)

(declare-fun res!216875 () Bool)

(assert (=> b!381562 (=> (not res!216875) (not e!231953))))

(assert (=> b!381562 (= res!216875 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11006 _keys!658))))))

(declare-fun b!381563 () Bool)

(assert (=> b!381563 (= e!231953 e!231956)))

(declare-fun res!216865 () Bool)

(assert (=> b!381563 (=> (not res!216865) (not e!231956))))

(assert (=> b!381563 (= res!216865 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178907 mask!970))))

(assert (=> b!381563 (= lt!178907 (array!22373 (store (arr!10654 _keys!658) i!548 k0!778) (size!11006 _keys!658)))))

(declare-fun mapNonEmpty!15417 () Bool)

(declare-fun tp!30477 () Bool)

(assert (=> mapNonEmpty!15417 (= mapRes!15417 (and tp!30477 e!231955))))

(declare-fun mapKey!15417 () (_ BitVec 32))

(declare-fun mapValue!15417 () ValueCell!4274)

(declare-fun mapRest!15417 () (Array (_ BitVec 32) ValueCell!4274))

(assert (=> mapNonEmpty!15417 (= (arr!10653 _values!506) (store mapRest!15417 mapKey!15417 mapValue!15417))))

(declare-fun b!381564 () Bool)

(declare-fun res!216873 () Bool)

(assert (=> b!381564 (=> (not res!216873) (not e!231953))))

(assert (=> b!381564 (= res!216873 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5973))))

(declare-fun b!381565 () Bool)

(declare-fun res!216868 () Bool)

(assert (=> b!381565 (=> (not res!216868) (not e!231953))))

(assert (=> b!381565 (= res!216868 (and (= (size!11005 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11006 _keys!658) (size!11005 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!381566 () Bool)

(declare-fun res!216872 () Bool)

(assert (=> b!381566 (=> (not res!216872) (not e!231953))))

(assert (=> b!381566 (= res!216872 (or (= (select (arr!10654 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10654 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!381567 () Bool)

(declare-fun e!231951 () Bool)

(assert (=> b!381567 (= e!231952 (and e!231951 mapRes!15417))))

(declare-fun condMapEmpty!15417 () Bool)

(declare-fun mapDefault!15417 () ValueCell!4274)

(assert (=> b!381567 (= condMapEmpty!15417 (= (arr!10653 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4274)) mapDefault!15417)))))

(declare-fun b!381568 () Bool)

(assert (=> b!381568 (= e!231951 tp_is_empty!9235)))

(assert (= (and start!37446 res!216874) b!381565))

(assert (= (and b!381565 res!216868) b!381558))

(assert (= (and b!381558 res!216869) b!381564))

(assert (= (and b!381564 res!216873) b!381562))

(assert (= (and b!381562 res!216875) b!381557))

(assert (= (and b!381557 res!216866) b!381566))

(assert (= (and b!381566 res!216872) b!381559))

(assert (= (and b!381559 res!216870) b!381563))

(assert (= (and b!381563 res!216865) b!381561))

(assert (= (and b!381561 res!216871) b!381560))

(assert (= (and b!381560 (not res!216867)) b!381556))

(assert (= (and b!381567 condMapEmpty!15417) mapIsEmpty!15417))

(assert (= (and b!381567 (not condMapEmpty!15417)) mapNonEmpty!15417))

(get-info :version)

(assert (= (and mapNonEmpty!15417 ((_ is ValueCellFull!4274) mapValue!15417)) b!381555))

(assert (= (and b!381567 ((_ is ValueCellFull!4274) mapDefault!15417)) b!381568))

(assert (= start!37446 b!381567))

(declare-fun m!378737 () Bool)

(assert (=> b!381564 m!378737))

(declare-fun m!378739 () Bool)

(assert (=> b!381559 m!378739))

(declare-fun m!378741 () Bool)

(assert (=> b!381558 m!378741))

(declare-fun m!378743 () Bool)

(assert (=> b!381557 m!378743))

(declare-fun m!378745 () Bool)

(assert (=> mapNonEmpty!15417 m!378745))

(declare-fun m!378747 () Bool)

(assert (=> b!381566 m!378747))

(declare-fun m!378749 () Bool)

(assert (=> b!381561 m!378749))

(declare-fun m!378751 () Bool)

(assert (=> start!37446 m!378751))

(declare-fun m!378753 () Bool)

(assert (=> start!37446 m!378753))

(declare-fun m!378755 () Bool)

(assert (=> start!37446 m!378755))

(declare-fun m!378757 () Bool)

(assert (=> b!381563 m!378757))

(declare-fun m!378759 () Bool)

(assert (=> b!381563 m!378759))

(declare-fun m!378761 () Bool)

(assert (=> b!381560 m!378761))

(declare-fun m!378763 () Bool)

(assert (=> b!381560 m!378763))

(declare-fun m!378765 () Bool)

(assert (=> b!381560 m!378765))

(declare-fun m!378767 () Bool)

(assert (=> b!381560 m!378767))

(declare-fun m!378769 () Bool)

(assert (=> b!381560 m!378769))

(declare-fun m!378771 () Bool)

(assert (=> b!381560 m!378771))

(declare-fun m!378773 () Bool)

(assert (=> b!381560 m!378773))

(check-sat (not mapNonEmpty!15417) (not b!381558) (not b!381557) b_and!15843 (not b!381563) (not b!381561) (not start!37446) (not b!381564) (not b!381559) tp_is_empty!9235 (not b!381560) (not b_next!8587))
(check-sat b_and!15843 (not b_next!8587))
