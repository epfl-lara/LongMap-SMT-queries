; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37398 () Bool)

(assert start!37398)

(declare-fun b_free!8539 () Bool)

(declare-fun b_next!8539 () Bool)

(assert (=> start!37398 (= b_free!8539 (not b_next!8539))))

(declare-fun tp!30333 () Bool)

(declare-fun b_and!15795 () Bool)

(assert (=> start!37398 (= tp!30333 b_and!15795)))

(declare-fun b!380531 () Bool)

(declare-fun e!231438 () Bool)

(assert (=> b!380531 (= e!231438 true)))

(declare-datatypes ((V!13355 0))(
  ( (V!13356 (val!4638 Int)) )
))
(declare-datatypes ((tuple2!6098 0))(
  ( (tuple2!6099 (_1!3060 (_ BitVec 64)) (_2!3060 V!13355)) )
))
(declare-datatypes ((List!5936 0))(
  ( (Nil!5933) (Cons!5932 (h!6788 tuple2!6098) (t!11078 List!5936)) )
))
(declare-datatypes ((ListLongMap!5013 0))(
  ( (ListLongMap!5014 (toList!2522 List!5936)) )
))
(declare-fun lt!178197 () ListLongMap!5013)

(declare-fun lt!178202 () ListLongMap!5013)

(declare-fun lt!178200 () tuple2!6098)

(declare-fun +!918 (ListLongMap!5013 tuple2!6098) ListLongMap!5013)

(assert (=> b!380531 (= lt!178197 (+!918 lt!178202 lt!178200))))

(declare-fun v!373 () V!13355)

(declare-fun k0!778 () (_ BitVec 64))

(declare-datatypes ((Unit!11717 0))(
  ( (Unit!11718) )
))
(declare-fun lt!178196 () Unit!11717)

(declare-fun lt!178201 () ListLongMap!5013)

(declare-fun minValue!472 () V!13355)

(declare-fun addCommutativeForDiffKeys!328 (ListLongMap!5013 (_ BitVec 64) V!13355 (_ BitVec 64) V!13355) Unit!11717)

(assert (=> b!380531 (= lt!178196 (addCommutativeForDiffKeys!328 lt!178201 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380532 () Bool)

(declare-fun res!216060 () Bool)

(declare-fun e!231437 () Bool)

(assert (=> b!380532 (=> (not res!216060) (not e!231437))))

(declare-datatypes ((array!22276 0))(
  ( (array!22277 (arr!10606 (Array (_ BitVec 32) (_ BitVec 64))) (size!10958 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22276)

(declare-fun arrayContainsKey!0 (array!22276 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!380532 (= res!216060 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15345 () Bool)

(declare-fun mapRes!15345 () Bool)

(assert (=> mapIsEmpty!15345 mapRes!15345))

(declare-fun b!380533 () Bool)

(declare-fun e!231432 () Bool)

(assert (=> b!380533 (= e!231437 e!231432)))

(declare-fun res!216066 () Bool)

(assert (=> b!380533 (=> (not res!216066) (not e!231432))))

(declare-fun lt!178194 () array!22276)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22276 (_ BitVec 32)) Bool)

(assert (=> b!380533 (= res!216066 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!178194 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!380533 (= lt!178194 (array!22277 (store (arr!10606 _keys!658) i!548 k0!778) (size!10958 _keys!658)))))

(declare-fun res!216064 () Bool)

(assert (=> start!37398 (=> (not res!216064) (not e!231437))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37398 (= res!216064 (validMask!0 mask!970))))

(assert (=> start!37398 e!231437))

(declare-datatypes ((ValueCell!4250 0))(
  ( (ValueCellFull!4250 (v!6836 V!13355)) (EmptyCell!4250) )
))
(declare-datatypes ((array!22278 0))(
  ( (array!22279 (arr!10607 (Array (_ BitVec 32) ValueCell!4250)) (size!10959 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22278)

(declare-fun e!231436 () Bool)

(declare-fun array_inv!7852 (array!22278) Bool)

(assert (=> start!37398 (and (array_inv!7852 _values!506) e!231436)))

(assert (=> start!37398 tp!30333))

(assert (=> start!37398 true))

(declare-fun tp_is_empty!9187 () Bool)

(assert (=> start!37398 tp_is_empty!9187))

(declare-fun array_inv!7853 (array!22276) Bool)

(assert (=> start!37398 (array_inv!7853 _keys!658)))

(declare-fun b!380534 () Bool)

(declare-fun e!231435 () Bool)

(assert (=> b!380534 (= e!231435 e!231438)))

(declare-fun res!216065 () Bool)

(assert (=> b!380534 (=> res!216065 e!231438)))

(assert (=> b!380534 (= res!216065 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-fun lt!178192 () ListLongMap!5013)

(assert (=> b!380534 (= lt!178192 lt!178202)))

(declare-fun lt!178195 () tuple2!6098)

(assert (=> b!380534 (= lt!178202 (+!918 lt!178201 lt!178195))))

(declare-fun lt!178193 () ListLongMap!5013)

(assert (=> b!380534 (= lt!178193 lt!178197)))

(declare-fun lt!178199 () ListLongMap!5013)

(assert (=> b!380534 (= lt!178197 (+!918 lt!178199 lt!178195))))

(declare-fun lt!178204 () ListLongMap!5013)

(assert (=> b!380534 (= lt!178193 (+!918 lt!178204 lt!178195))))

(assert (=> b!380534 (= lt!178195 (tuple2!6099 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!380535 () Bool)

(declare-fun res!216059 () Bool)

(assert (=> b!380535 (=> (not res!216059) (not e!231437))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!380535 (= res!216059 (and (= (size!10959 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10958 _keys!658) (size!10959 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!380536 () Bool)

(declare-fun res!216061 () Bool)

(assert (=> b!380536 (=> (not res!216061) (not e!231437))))

(declare-datatypes ((List!5937 0))(
  ( (Nil!5934) (Cons!5933 (h!6789 (_ BitVec 64)) (t!11079 List!5937)) )
))
(declare-fun arrayNoDuplicates!0 (array!22276 (_ BitVec 32) List!5937) Bool)

(assert (=> b!380536 (= res!216061 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5934))))

(declare-fun b!380537 () Bool)

(assert (=> b!380537 (= e!231432 (not e!231435))))

(declare-fun res!216068 () Bool)

(assert (=> b!380537 (=> res!216068 e!231435)))

(assert (=> b!380537 (= res!216068 (or (not (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13355)

(declare-fun getCurrentListMap!1961 (array!22276 array!22278 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) Int) ListLongMap!5013)

(assert (=> b!380537 (= lt!178192 (getCurrentListMap!1961 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!178198 () array!22278)

(assert (=> b!380537 (= lt!178193 (getCurrentListMap!1961 lt!178194 lt!178198 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380537 (and (= lt!178204 lt!178199) (= lt!178199 lt!178204))))

(assert (=> b!380537 (= lt!178199 (+!918 lt!178201 lt!178200))))

(assert (=> b!380537 (= lt!178200 (tuple2!6099 k0!778 v!373))))

(declare-fun lt!178203 () Unit!11717)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!148 (array!22276 array!22278 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) (_ BitVec 64) V!13355 (_ BitVec 32) Int) Unit!11717)

(assert (=> b!380537 (= lt!178203 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!148 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!808 (array!22276 array!22278 (_ BitVec 32) (_ BitVec 32) V!13355 V!13355 (_ BitVec 32) Int) ListLongMap!5013)

(assert (=> b!380537 (= lt!178204 (getCurrentListMapNoExtraKeys!808 lt!178194 lt!178198 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!380537 (= lt!178198 (array!22279 (store (arr!10607 _values!506) i!548 (ValueCellFull!4250 v!373)) (size!10959 _values!506)))))

(assert (=> b!380537 (= lt!178201 (getCurrentListMapNoExtraKeys!808 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!380538 () Bool)

(declare-fun e!231431 () Bool)

(assert (=> b!380538 (= e!231431 tp_is_empty!9187)))

(declare-fun b!380539 () Bool)

(assert (=> b!380539 (= e!231436 (and e!231431 mapRes!15345))))

(declare-fun condMapEmpty!15345 () Bool)

(declare-fun mapDefault!15345 () ValueCell!4250)

(assert (=> b!380539 (= condMapEmpty!15345 (= (arr!10607 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4250)) mapDefault!15345)))))

(declare-fun b!380540 () Bool)

(declare-fun res!216062 () Bool)

(assert (=> b!380540 (=> (not res!216062) (not e!231437))))

(assert (=> b!380540 (= res!216062 (or (= (select (arr!10606 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10606 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!380541 () Bool)

(declare-fun res!216058 () Bool)

(assert (=> b!380541 (=> (not res!216058) (not e!231432))))

(assert (=> b!380541 (= res!216058 (arrayNoDuplicates!0 lt!178194 #b00000000000000000000000000000000 Nil!5934))))

(declare-fun b!380542 () Bool)

(declare-fun e!231434 () Bool)

(assert (=> b!380542 (= e!231434 tp_is_empty!9187)))

(declare-fun mapNonEmpty!15345 () Bool)

(declare-fun tp!30332 () Bool)

(assert (=> mapNonEmpty!15345 (= mapRes!15345 (and tp!30332 e!231434))))

(declare-fun mapRest!15345 () (Array (_ BitVec 32) ValueCell!4250))

(declare-fun mapKey!15345 () (_ BitVec 32))

(declare-fun mapValue!15345 () ValueCell!4250)

(assert (=> mapNonEmpty!15345 (= (arr!10607 _values!506) (store mapRest!15345 mapKey!15345 mapValue!15345))))

(declare-fun b!380543 () Bool)

(declare-fun res!216057 () Bool)

(assert (=> b!380543 (=> (not res!216057) (not e!231437))))

(assert (=> b!380543 (= res!216057 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!380544 () Bool)

(declare-fun res!216063 () Bool)

(assert (=> b!380544 (=> (not res!216063) (not e!231437))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!380544 (= res!216063 (validKeyInArray!0 k0!778))))

(declare-fun b!380545 () Bool)

(declare-fun res!216067 () Bool)

(assert (=> b!380545 (=> (not res!216067) (not e!231437))))

(assert (=> b!380545 (= res!216067 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10958 _keys!658))))))

(assert (= (and start!37398 res!216064) b!380535))

(assert (= (and b!380535 res!216059) b!380543))

(assert (= (and b!380543 res!216057) b!380536))

(assert (= (and b!380536 res!216061) b!380545))

(assert (= (and b!380545 res!216067) b!380544))

(assert (= (and b!380544 res!216063) b!380540))

(assert (= (and b!380540 res!216062) b!380532))

(assert (= (and b!380532 res!216060) b!380533))

(assert (= (and b!380533 res!216066) b!380541))

(assert (= (and b!380541 res!216058) b!380537))

(assert (= (and b!380537 (not res!216068)) b!380534))

(assert (= (and b!380534 (not res!216065)) b!380531))

(assert (= (and b!380539 condMapEmpty!15345) mapIsEmpty!15345))

(assert (= (and b!380539 (not condMapEmpty!15345)) mapNonEmpty!15345))

(get-info :version)

(assert (= (and mapNonEmpty!15345 ((_ is ValueCellFull!4250) mapValue!15345)) b!380542))

(assert (= (and b!380539 ((_ is ValueCellFull!4250) mapDefault!15345)) b!380538))

(assert (= start!37398 b!380539))

(declare-fun m!377765 () Bool)

(assert (=> b!380536 m!377765))

(declare-fun m!377767 () Bool)

(assert (=> mapNonEmpty!15345 m!377767))

(declare-fun m!377769 () Bool)

(assert (=> b!380537 m!377769))

(declare-fun m!377771 () Bool)

(assert (=> b!380537 m!377771))

(declare-fun m!377773 () Bool)

(assert (=> b!380537 m!377773))

(declare-fun m!377775 () Bool)

(assert (=> b!380537 m!377775))

(declare-fun m!377777 () Bool)

(assert (=> b!380537 m!377777))

(declare-fun m!377779 () Bool)

(assert (=> b!380537 m!377779))

(declare-fun m!377781 () Bool)

(assert (=> b!380537 m!377781))

(declare-fun m!377783 () Bool)

(assert (=> start!37398 m!377783))

(declare-fun m!377785 () Bool)

(assert (=> start!37398 m!377785))

(declare-fun m!377787 () Bool)

(assert (=> start!37398 m!377787))

(declare-fun m!377789 () Bool)

(assert (=> b!380531 m!377789))

(declare-fun m!377791 () Bool)

(assert (=> b!380531 m!377791))

(declare-fun m!377793 () Bool)

(assert (=> b!380541 m!377793))

(declare-fun m!377795 () Bool)

(assert (=> b!380543 m!377795))

(declare-fun m!377797 () Bool)

(assert (=> b!380534 m!377797))

(declare-fun m!377799 () Bool)

(assert (=> b!380534 m!377799))

(declare-fun m!377801 () Bool)

(assert (=> b!380534 m!377801))

(declare-fun m!377803 () Bool)

(assert (=> b!380540 m!377803))

(declare-fun m!377805 () Bool)

(assert (=> b!380544 m!377805))

(declare-fun m!377807 () Bool)

(assert (=> b!380532 m!377807))

(declare-fun m!377809 () Bool)

(assert (=> b!380533 m!377809))

(declare-fun m!377811 () Bool)

(assert (=> b!380533 m!377811))

(check-sat tp_is_empty!9187 (not b!380536) (not b!380537) (not b_next!8539) (not b!380544) (not b!380531) (not b!380533) (not b!380532) (not b!380541) (not b!380534) (not mapNonEmpty!15345) b_and!15795 (not start!37398) (not b!380543))
(check-sat b_and!15795 (not b_next!8539))
