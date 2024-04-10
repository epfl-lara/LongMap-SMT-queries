; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37390 () Bool)

(assert start!37390)

(declare-fun b_free!8517 () Bool)

(declare-fun b_next!8517 () Bool)

(assert (=> start!37390 (= b_free!8517 (not b_next!8517))))

(declare-fun tp!30267 () Bool)

(declare-fun b_and!15759 () Bool)

(assert (=> start!37390 (= tp!30267 b_and!15759)))

(declare-fun b!380085 () Bool)

(declare-fun res!215675 () Bool)

(declare-fun e!231202 () Bool)

(assert (=> b!380085 (=> (not res!215675) (not e!231202))))

(declare-datatypes ((array!22249 0))(
  ( (array!22250 (arr!10593 (Array (_ BitVec 32) (_ BitVec 64))) (size!10945 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22249)

(declare-datatypes ((List!6033 0))(
  ( (Nil!6030) (Cons!6029 (h!6885 (_ BitVec 64)) (t!11183 List!6033)) )
))
(declare-fun arrayNoDuplicates!0 (array!22249 (_ BitVec 32) List!6033) Bool)

(assert (=> b!380085 (= res!215675 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6030))))

(declare-fun b!380086 () Bool)

(declare-fun res!215670 () Bool)

(assert (=> b!380086 (=> (not res!215670) (not e!231202))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!22249 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380086 (= res!215670 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!380087 () Bool)

(declare-fun res!215665 () Bool)

(assert (=> b!380087 (=> (not res!215665) (not e!231202))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380087 (= res!215665 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10945 _keys!658))))))

(declare-fun b!380088 () Bool)

(declare-fun e!231205 () Bool)

(declare-fun e!231199 () Bool)

(declare-fun mapRes!15312 () Bool)

(assert (=> b!380088 (= e!231205 (and e!231199 mapRes!15312))))

(declare-fun condMapEmpty!15312 () Bool)

(declare-datatypes ((V!13325 0))(
  ( (V!13326 (val!4627 Int)) )
))
(declare-datatypes ((ValueCell!4239 0))(
  ( (ValueCellFull!4239 (v!6824 V!13325)) (EmptyCell!4239) )
))
(declare-datatypes ((array!22251 0))(
  ( (array!22252 (arr!10594 (Array (_ BitVec 32) ValueCell!4239)) (size!10946 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22251)

(declare-fun mapDefault!15312 () ValueCell!4239)

(assert (=> b!380088 (= condMapEmpty!15312 (= (arr!10594 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4239)) mapDefault!15312)))))

(declare-fun b!380089 () Bool)

(declare-fun res!215673 () Bool)

(assert (=> b!380089 (=> (not res!215673) (not e!231202))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!380089 (= res!215673 (and (= (size!10946 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10945 _keys!658) (size!10946 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380090 () Bool)

(declare-fun res!215674 () Bool)

(assert (=> b!380090 (=> (not res!215674) (not e!231202))))

(assert (=> b!380090 (= res!215674 (or (= (select (arr!10593 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10593 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun res!215667 () Bool)

(assert (=> start!37390 (=> (not res!215667) (not e!231202))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37390 (= res!215667 (validMask!0 mask!970))))

(assert (=> start!37390 e!231202))

(declare-fun array_inv!7800 (array!22251) Bool)

(assert (=> start!37390 (and (array_inv!7800 _values!506) e!231205)))

(assert (=> start!37390 tp!30267))

(assert (=> start!37390 true))

(declare-fun tp_is_empty!9165 () Bool)

(assert (=> start!37390 tp_is_empty!9165))

(declare-fun array_inv!7801 (array!22249) Bool)

(assert (=> start!37390 (array_inv!7801 _keys!658)))

(declare-fun b!380091 () Bool)

(declare-fun e!231201 () Bool)

(assert (=> b!380091 (= e!231202 e!231201)))

(declare-fun res!215669 () Bool)

(assert (=> b!380091 (=> (not res!215669) (not e!231201))))

(declare-fun lt!177747 () array!22249)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22249 (_ BitVec 32)) Bool)

(assert (=> b!380091 (= res!215669 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!177747 mask!970))))

(assert (=> b!380091 (= lt!177747 (array!22250 (store (arr!10593 _keys!658) i!548 k0!778) (size!10945 _keys!658)))))

(declare-fun b!380092 () Bool)

(declare-fun e!231200 () Bool)

(assert (=> b!380092 (= e!231200 true)))

(declare-datatypes ((tuple2!6198 0))(
  ( (tuple2!6199 (_1!3110 (_ BitVec 64)) (_2!3110 V!13325)) )
))
(declare-datatypes ((List!6034 0))(
  ( (Nil!6031) (Cons!6030 (h!6886 tuple2!6198) (t!11184 List!6034)) )
))
(declare-datatypes ((ListLongMap!5111 0))(
  ( (ListLongMap!5112 (toList!2571 List!6034)) )
))
(declare-fun lt!177753 () ListLongMap!5111)

(declare-fun lt!177748 () ListLongMap!5111)

(declare-fun lt!177751 () tuple2!6198)

(declare-fun +!917 (ListLongMap!5111 tuple2!6198) ListLongMap!5111)

(assert (=> b!380092 (= lt!177753 (+!917 lt!177748 lt!177751))))

(declare-fun v!373 () V!13325)

(declare-fun lt!177745 () ListLongMap!5111)

(declare-fun minValue!472 () V!13325)

(declare-datatypes ((Unit!11728 0))(
  ( (Unit!11729) )
))
(declare-fun lt!177744 () Unit!11728)

(declare-fun addCommutativeForDiffKeys!314 (ListLongMap!5111 (_ BitVec 64) V!13325 (_ BitVec 64) V!13325) Unit!11728)

(assert (=> b!380092 (= lt!177744 (addCommutativeForDiffKeys!314 lt!177745 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380093 () Bool)

(declare-fun res!215671 () Bool)

(assert (=> b!380093 (=> (not res!215671) (not e!231202))))

(assert (=> b!380093 (= res!215671 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15312 () Bool)

(assert (=> mapIsEmpty!15312 mapRes!15312))

(declare-fun b!380094 () Bool)

(declare-fun res!215672 () Bool)

(assert (=> b!380094 (=> (not res!215672) (not e!231201))))

(assert (=> b!380094 (= res!215672 (arrayNoDuplicates!0 lt!177747 #b00000000000000000000000000000000 Nil!6030))))

(declare-fun b!380095 () Bool)

(declare-fun e!231204 () Bool)

(assert (=> b!380095 (= e!231204 e!231200)))

(declare-fun res!215664 () Bool)

(assert (=> b!380095 (=> res!215664 e!231200)))

(assert (=> b!380095 (= res!215664 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!177746 () ListLongMap!5111)

(assert (=> b!380095 (= lt!177746 lt!177748)))

(declare-fun lt!177755 () tuple2!6198)

(assert (=> b!380095 (= lt!177748 (+!917 lt!177745 lt!177755))))

(declare-fun lt!177754 () ListLongMap!5111)

(assert (=> b!380095 (= lt!177754 lt!177753)))

(declare-fun lt!177752 () ListLongMap!5111)

(assert (=> b!380095 (= lt!177753 (+!917 lt!177752 lt!177755))))

(declare-fun lt!177749 () ListLongMap!5111)

(assert (=> b!380095 (= lt!177754 (+!917 lt!177749 lt!177755))))

(assert (=> b!380095 (= lt!177755 (tuple2!6199 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380096 () Bool)

(declare-fun res!215668 () Bool)

(assert (=> b!380096 (=> (not res!215668) (not e!231202))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380096 (= res!215668 (validKeyInArray!0 k0!778))))

(declare-fun b!380097 () Bool)

(assert (=> b!380097 (= e!231199 tp_is_empty!9165)))

(declare-fun b!380098 () Bool)

(declare-fun e!231203 () Bool)

(assert (=> b!380098 (= e!231203 tp_is_empty!9165)))

(declare-fun b!380099 () Bool)

(assert (=> b!380099 (= e!231201 (not e!231204))))

(declare-fun res!215666 () Bool)

(assert (=> b!380099 (=> res!215666 e!231204)))

(assert (=> b!380099 (= res!215666 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13325)

(declare-fun getCurrentListMap!1988 (array!22249 array!22251 (_ BitVec 32) (_ BitVec 32) V!13325 V!13325 (_ BitVec 32) Int) ListLongMap!5111)

(assert (=> b!380099 (= lt!177746 (getCurrentListMap!1988 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!177756 () array!22251)

(assert (=> b!380099 (= lt!177754 (getCurrentListMap!1988 lt!177747 lt!177756 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380099 (and (= lt!177749 lt!177752) (= lt!177752 lt!177749))))

(assert (=> b!380099 (= lt!177752 (+!917 lt!177745 lt!177751))))

(assert (=> b!380099 (= lt!177751 (tuple2!6199 k0!778 v!373))))

(declare-fun lt!177750 () Unit!11728)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!146 (array!22249 array!22251 (_ BitVec 32) (_ BitVec 32) V!13325 V!13325 (_ BitVec 32) (_ BitVec 64) V!13325 (_ BitVec 32) Int) Unit!11728)

(assert (=> b!380099 (= lt!177750 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!146 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!822 (array!22249 array!22251 (_ BitVec 32) (_ BitVec 32) V!13325 V!13325 (_ BitVec 32) Int) ListLongMap!5111)

(assert (=> b!380099 (= lt!177749 (getCurrentListMapNoExtraKeys!822 lt!177747 lt!177756 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380099 (= lt!177756 (array!22252 (store (arr!10594 _values!506) i!548 (ValueCellFull!4239 v!373)) (size!10946 _values!506)))))

(assert (=> b!380099 (= lt!177745 (getCurrentListMapNoExtraKeys!822 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun mapNonEmpty!15312 () Bool)

(declare-fun tp!30266 () Bool)

(assert (=> mapNonEmpty!15312 (= mapRes!15312 (and tp!30266 e!231203))))

(declare-fun mapValue!15312 () ValueCell!4239)

(declare-fun mapKey!15312 () (_ BitVec 32))

(declare-fun mapRest!15312 () (Array (_ BitVec 32) ValueCell!4239))

(assert (=> mapNonEmpty!15312 (= (arr!10594 _values!506) (store mapRest!15312 mapKey!15312 mapValue!15312))))

(assert (= (and start!37390 res!215667) b!380089))

(assert (= (and b!380089 res!215673) b!380093))

(assert (= (and b!380093 res!215671) b!380085))

(assert (= (and b!380085 res!215675) b!380087))

(assert (= (and b!380087 res!215665) b!380096))

(assert (= (and b!380096 res!215668) b!380090))

(assert (= (and b!380090 res!215674) b!380086))

(assert (= (and b!380086 res!215670) b!380091))

(assert (= (and b!380091 res!215669) b!380094))

(assert (= (and b!380094 res!215672) b!380099))

(assert (= (and b!380099 (not res!215666)) b!380095))

(assert (= (and b!380095 (not res!215664)) b!380092))

(assert (= (and b!380088 condMapEmpty!15312) mapIsEmpty!15312))

(assert (= (and b!380088 (not condMapEmpty!15312)) mapNonEmpty!15312))

(get-info :version)

(assert (= (and mapNonEmpty!15312 ((_ is ValueCellFull!4239) mapValue!15312)) b!380098))

(assert (= (and b!380088 ((_ is ValueCellFull!4239) mapDefault!15312)) b!380097))

(assert (= start!37390 b!380088))

(declare-fun m!377007 () Bool)

(assert (=> b!380086 m!377007))

(declare-fun m!377009 () Bool)

(assert (=> b!380095 m!377009))

(declare-fun m!377011 () Bool)

(assert (=> b!380095 m!377011))

(declare-fun m!377013 () Bool)

(assert (=> b!380095 m!377013))

(declare-fun m!377015 () Bool)

(assert (=> b!380093 m!377015))

(declare-fun m!377017 () Bool)

(assert (=> b!380099 m!377017))

(declare-fun m!377019 () Bool)

(assert (=> b!380099 m!377019))

(declare-fun m!377021 () Bool)

(assert (=> b!380099 m!377021))

(declare-fun m!377023 () Bool)

(assert (=> b!380099 m!377023))

(declare-fun m!377025 () Bool)

(assert (=> b!380099 m!377025))

(declare-fun m!377027 () Bool)

(assert (=> b!380099 m!377027))

(declare-fun m!377029 () Bool)

(assert (=> b!380099 m!377029))

(declare-fun m!377031 () Bool)

(assert (=> b!380092 m!377031))

(declare-fun m!377033 () Bool)

(assert (=> b!380092 m!377033))

(declare-fun m!377035 () Bool)

(assert (=> start!37390 m!377035))

(declare-fun m!377037 () Bool)

(assert (=> start!37390 m!377037))

(declare-fun m!377039 () Bool)

(assert (=> start!37390 m!377039))

(declare-fun m!377041 () Bool)

(assert (=> b!380094 m!377041))

(declare-fun m!377043 () Bool)

(assert (=> b!380085 m!377043))

(declare-fun m!377045 () Bool)

(assert (=> b!380090 m!377045))

(declare-fun m!377047 () Bool)

(assert (=> b!380096 m!377047))

(declare-fun m!377049 () Bool)

(assert (=> mapNonEmpty!15312 m!377049))

(declare-fun m!377051 () Bool)

(assert (=> b!380091 m!377051))

(declare-fun m!377053 () Bool)

(assert (=> b!380091 m!377053))

(check-sat (not b!380091) (not b!380096) (not start!37390) (not b!380099) (not b!380092) (not b_next!8517) b_and!15759 (not b!380086) (not mapNonEmpty!15312) (not b!380094) (not b!380085) (not b!380093) tp_is_empty!9165 (not b!380095))
(check-sat b_and!15759 (not b_next!8517))
