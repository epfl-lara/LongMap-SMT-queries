; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!38130 () Bool)

(assert start!38130)

(declare-fun b_free!9025 () Bool)

(declare-fun b_next!9025 () Bool)

(assert (=> start!38130 (= b_free!9025 (not b_next!9025))))

(declare-fun tp!31857 () Bool)

(declare-fun b_and!16361 () Bool)

(assert (=> start!38130 (= tp!31857 b_and!16361)))

(declare-fun b!392803 () Bool)

(declare-fun e!237845 () Bool)

(declare-fun tp_is_empty!9697 () Bool)

(assert (=> b!392803 (= e!237845 tp_is_empty!9697)))

(declare-fun b!392804 () Bool)

(declare-fun res!225012 () Bool)

(declare-fun e!237843 () Bool)

(assert (=> b!392804 (=> (not res!225012) (not e!237843))))

(declare-datatypes ((array!23283 0))(
  ( (array!23284 (arr!11100 (Array (_ BitVec 32) (_ BitVec 64))) (size!11453 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!23283)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!392804 (= res!225012 (or (= (select (arr!11100 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!11100 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!392805 () Bool)

(declare-fun res!225014 () Bool)

(declare-fun e!237842 () Bool)

(assert (=> b!392805 (=> (not res!225014) (not e!237842))))

(declare-fun lt!185683 () array!23283)

(declare-datatypes ((List!6412 0))(
  ( (Nil!6409) (Cons!6408 (h!7264 (_ BitVec 64)) (t!11573 List!6412)) )
))
(declare-fun arrayNoDuplicates!0 (array!23283 (_ BitVec 32) List!6412) Bool)

(assert (=> b!392805 (= res!225014 (arrayNoDuplicates!0 lt!185683 #b00000000000000000000000000000000 Nil!6409))))

(declare-fun res!225015 () Bool)

(assert (=> start!38130 (=> (not res!225015) (not e!237843))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!38130 (= res!225015 (validMask!0 mask!970))))

(assert (=> start!38130 e!237843))

(declare-datatypes ((V!14035 0))(
  ( (V!14036 (val!4893 Int)) )
))
(declare-datatypes ((ValueCell!4505 0))(
  ( (ValueCellFull!4505 (v!7124 V!14035)) (EmptyCell!4505) )
))
(declare-datatypes ((array!23285 0))(
  ( (array!23286 (arr!11101 (Array (_ BitVec 32) ValueCell!4505)) (size!11454 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!23285)

(declare-fun e!237841 () Bool)

(declare-fun array_inv!8152 (array!23285) Bool)

(assert (=> start!38130 (and (array_inv!8152 _values!506) e!237841)))

(assert (=> start!38130 tp!31857))

(assert (=> start!38130 true))

(assert (=> start!38130 tp_is_empty!9697))

(declare-fun array_inv!8153 (array!23283) Bool)

(assert (=> start!38130 (array_inv!8153 _keys!658)))

(declare-fun b!392806 () Bool)

(declare-fun e!237840 () Bool)

(assert (=> b!392806 (= e!237840 tp_is_empty!9697)))

(declare-fun b!392807 () Bool)

(declare-fun e!237847 () Bool)

(declare-fun e!237846 () Bool)

(assert (=> b!392807 (= e!237847 e!237846)))

(declare-fun res!225016 () Bool)

(assert (=> b!392807 (=> res!225016 e!237846)))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!392807 (= res!225016 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!6570 0))(
  ( (tuple2!6571 (_1!3296 (_ BitVec 64)) (_2!3296 V!14035)) )
))
(declare-datatypes ((List!6413 0))(
  ( (Nil!6410) (Cons!6409 (h!7265 tuple2!6570) (t!11574 List!6413)) )
))
(declare-datatypes ((ListLongMap!5473 0))(
  ( (ListLongMap!5474 (toList!2752 List!6413)) )
))
(declare-fun lt!185686 () ListLongMap!5473)

(declare-fun lt!185680 () ListLongMap!5473)

(assert (=> b!392807 (= lt!185686 lt!185680)))

(declare-fun lt!185684 () ListLongMap!5473)

(declare-fun lt!185679 () tuple2!6570)

(declare-fun +!1072 (ListLongMap!5473 tuple2!6570) ListLongMap!5473)

(assert (=> b!392807 (= lt!185680 (+!1072 lt!185684 lt!185679))))

(declare-fun lt!185676 () ListLongMap!5473)

(declare-fun lt!185677 () ListLongMap!5473)

(assert (=> b!392807 (= lt!185676 lt!185677)))

(declare-fun lt!185674 () ListLongMap!5473)

(assert (=> b!392807 (= lt!185677 (+!1072 lt!185674 lt!185679))))

(declare-fun lt!185682 () ListLongMap!5473)

(assert (=> b!392807 (= lt!185676 (+!1072 lt!185682 lt!185679))))

(declare-fun minValue!472 () V!14035)

(assert (=> b!392807 (= lt!185679 (tuple2!6571 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392808 () Bool)

(declare-fun res!225010 () Bool)

(assert (=> b!392808 (=> (not res!225010) (not e!237843))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!23283 (_ BitVec 32)) Bool)

(assert (=> b!392808 (= res!225010 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!16140 () Bool)

(declare-fun mapRes!16140 () Bool)

(declare-fun tp!31856 () Bool)

(assert (=> mapNonEmpty!16140 (= mapRes!16140 (and tp!31856 e!237840))))

(declare-fun mapKey!16140 () (_ BitVec 32))

(declare-fun mapValue!16140 () ValueCell!4505)

(declare-fun mapRest!16140 () (Array (_ BitVec 32) ValueCell!4505))

(assert (=> mapNonEmpty!16140 (= (arr!11101 _values!506) (store mapRest!16140 mapKey!16140 mapValue!16140))))

(declare-fun b!392809 () Bool)

(assert (=> b!392809 (= e!237842 (not e!237847))))

(declare-fun res!225021 () Bool)

(assert (=> b!392809 (=> res!225021 e!237847)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!392809 (= res!225021 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!14035)

(declare-fun getCurrentListMap!2070 (array!23283 array!23285 (_ BitVec 32) (_ BitVec 32) V!14035 V!14035 (_ BitVec 32) Int) ListLongMap!5473)

(assert (=> b!392809 (= lt!185686 (getCurrentListMap!2070 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!185675 () array!23285)

(assert (=> b!392809 (= lt!185676 (getCurrentListMap!2070 lt!185683 lt!185675 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392809 (and (= lt!185682 lt!185674) (= lt!185674 lt!185682))))

(declare-fun lt!185681 () tuple2!6570)

(assert (=> b!392809 (= lt!185674 (+!1072 lt!185684 lt!185681))))

(declare-fun v!373 () V!14035)

(assert (=> b!392809 (= lt!185681 (tuple2!6571 k0!778 v!373))))

(declare-datatypes ((Unit!11992 0))(
  ( (Unit!11993) )
))
(declare-fun lt!185685 () Unit!11992)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!271 (array!23283 array!23285 (_ BitVec 32) (_ BitVec 32) V!14035 V!14035 (_ BitVec 32) (_ BitVec 64) V!14035 (_ BitVec 32) Int) Unit!11992)

(assert (=> b!392809 (= lt!185685 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!271 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!980 (array!23283 array!23285 (_ BitVec 32) (_ BitVec 32) V!14035 V!14035 (_ BitVec 32) Int) ListLongMap!5473)

(assert (=> b!392809 (= lt!185682 (getCurrentListMapNoExtraKeys!980 lt!185683 lt!185675 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!392809 (= lt!185675 (array!23286 (store (arr!11101 _values!506) i!548 (ValueCellFull!4505 v!373)) (size!11454 _values!506)))))

(assert (=> b!392809 (= lt!185684 (getCurrentListMapNoExtraKeys!980 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!392810 () Bool)

(declare-fun res!225019 () Bool)

(assert (=> b!392810 (=> (not res!225019) (not e!237843))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!392810 (= res!225019 (validKeyInArray!0 k0!778))))

(declare-fun mapIsEmpty!16140 () Bool)

(assert (=> mapIsEmpty!16140 mapRes!16140))

(declare-fun b!392811 () Bool)

(assert (=> b!392811 (= e!237841 (and e!237845 mapRes!16140))))

(declare-fun condMapEmpty!16140 () Bool)

(declare-fun mapDefault!16140 () ValueCell!4505)

(assert (=> b!392811 (= condMapEmpty!16140 (= (arr!11101 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4505)) mapDefault!16140)))))

(declare-fun b!392812 () Bool)

(declare-fun res!225011 () Bool)

(assert (=> b!392812 (=> (not res!225011) (not e!237843))))

(assert (=> b!392812 (= res!225011 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6409))))

(declare-fun b!392813 () Bool)

(assert (=> b!392813 (= e!237846 (bvslt i!548 (size!11454 _values!506)))))

(assert (=> b!392813 (= lt!185677 (+!1072 lt!185680 lt!185681))))

(declare-fun lt!185678 () Unit!11992)

(declare-fun addCommutativeForDiffKeys!341 (ListLongMap!5473 (_ BitVec 64) V!14035 (_ BitVec 64) V!14035) Unit!11992)

(assert (=> b!392813 (= lt!185678 (addCommutativeForDiffKeys!341 lt!185684 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!392814 () Bool)

(declare-fun res!225013 () Bool)

(assert (=> b!392814 (=> (not res!225013) (not e!237843))))

(declare-fun arrayContainsKey!0 (array!23283 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!392814 (= res!225013 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!392815 () Bool)

(assert (=> b!392815 (= e!237843 e!237842)))

(declare-fun res!225020 () Bool)

(assert (=> b!392815 (=> (not res!225020) (not e!237842))))

(assert (=> b!392815 (= res!225020 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!185683 mask!970))))

(assert (=> b!392815 (= lt!185683 (array!23284 (store (arr!11100 _keys!658) i!548 k0!778) (size!11453 _keys!658)))))

(declare-fun b!392816 () Bool)

(declare-fun res!225018 () Bool)

(assert (=> b!392816 (=> (not res!225018) (not e!237843))))

(assert (=> b!392816 (= res!225018 (and (= (size!11454 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11453 _keys!658) (size!11454 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!392817 () Bool)

(declare-fun res!225017 () Bool)

(assert (=> b!392817 (=> (not res!225017) (not e!237843))))

(assert (=> b!392817 (= res!225017 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11453 _keys!658))))))

(assert (= (and start!38130 res!225015) b!392816))

(assert (= (and b!392816 res!225018) b!392808))

(assert (= (and b!392808 res!225010) b!392812))

(assert (= (and b!392812 res!225011) b!392817))

(assert (= (and b!392817 res!225017) b!392810))

(assert (= (and b!392810 res!225019) b!392804))

(assert (= (and b!392804 res!225012) b!392814))

(assert (= (and b!392814 res!225013) b!392815))

(assert (= (and b!392815 res!225020) b!392805))

(assert (= (and b!392805 res!225014) b!392809))

(assert (= (and b!392809 (not res!225021)) b!392807))

(assert (= (and b!392807 (not res!225016)) b!392813))

(assert (= (and b!392811 condMapEmpty!16140) mapIsEmpty!16140))

(assert (= (and b!392811 (not condMapEmpty!16140)) mapNonEmpty!16140))

(get-info :version)

(assert (= (and mapNonEmpty!16140 ((_ is ValueCellFull!4505) mapValue!16140)) b!392806))

(assert (= (and b!392811 ((_ is ValueCellFull!4505) mapDefault!16140)) b!392803))

(assert (= start!38130 b!392811))

(declare-fun m!388795 () Bool)

(assert (=> b!392814 m!388795))

(declare-fun m!388797 () Bool)

(assert (=> b!392805 m!388797))

(declare-fun m!388799 () Bool)

(assert (=> start!38130 m!388799))

(declare-fun m!388801 () Bool)

(assert (=> start!38130 m!388801))

(declare-fun m!388803 () Bool)

(assert (=> start!38130 m!388803))

(declare-fun m!388805 () Bool)

(assert (=> b!392808 m!388805))

(declare-fun m!388807 () Bool)

(assert (=> b!392807 m!388807))

(declare-fun m!388809 () Bool)

(assert (=> b!392807 m!388809))

(declare-fun m!388811 () Bool)

(assert (=> b!392807 m!388811))

(declare-fun m!388813 () Bool)

(assert (=> mapNonEmpty!16140 m!388813))

(declare-fun m!388815 () Bool)

(assert (=> b!392813 m!388815))

(declare-fun m!388817 () Bool)

(assert (=> b!392813 m!388817))

(declare-fun m!388819 () Bool)

(assert (=> b!392804 m!388819))

(declare-fun m!388821 () Bool)

(assert (=> b!392810 m!388821))

(declare-fun m!388823 () Bool)

(assert (=> b!392812 m!388823))

(declare-fun m!388825 () Bool)

(assert (=> b!392809 m!388825))

(declare-fun m!388827 () Bool)

(assert (=> b!392809 m!388827))

(declare-fun m!388829 () Bool)

(assert (=> b!392809 m!388829))

(declare-fun m!388831 () Bool)

(assert (=> b!392809 m!388831))

(declare-fun m!388833 () Bool)

(assert (=> b!392809 m!388833))

(declare-fun m!388835 () Bool)

(assert (=> b!392809 m!388835))

(declare-fun m!388837 () Bool)

(assert (=> b!392809 m!388837))

(declare-fun m!388839 () Bool)

(assert (=> b!392815 m!388839))

(declare-fun m!388841 () Bool)

(assert (=> b!392815 m!388841))

(check-sat (not b_next!9025) (not start!38130) (not b!392810) (not b!392812) (not b!392808) tp_is_empty!9697 (not b!392815) (not b!392805) (not b!392813) (not b!392807) (not b!392809) b_and!16361 (not mapNonEmpty!16140) (not b!392814))
(check-sat b_and!16361 (not b_next!9025))
