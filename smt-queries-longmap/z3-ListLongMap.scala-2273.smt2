; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37086 () Bool)

(assert start!37086)

(declare-fun b_free!8227 () Bool)

(declare-fun b_next!8227 () Bool)

(assert (=> start!37086 (= b_free!8227 (not b_next!8227))))

(declare-fun tp!29397 () Bool)

(declare-fun b_and!15443 () Bool)

(assert (=> start!37086 (= tp!29397 b_and!15443)))

(declare-fun b!373271 () Bool)

(declare-fun res!210306 () Bool)

(declare-fun e!227551 () Bool)

(assert (=> b!373271 (=> (not res!210306) (not e!227551))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!373271 (= res!210306 (validKeyInArray!0 k0!778))))

(declare-fun b!373272 () Bool)

(declare-fun res!210304 () Bool)

(declare-fun e!227552 () Bool)

(assert (=> b!373272 (=> (not res!210304) (not e!227552))))

(declare-datatypes ((array!21667 0))(
  ( (array!21668 (arr!10302 (Array (_ BitVec 32) (_ BitVec 64))) (size!10655 (_ BitVec 32))) )
))
(declare-fun lt!171374 () array!21667)

(declare-datatypes ((List!5757 0))(
  ( (Nil!5754) (Cons!5753 (h!6609 (_ BitVec 64)) (t!10898 List!5757)) )
))
(declare-fun arrayNoDuplicates!0 (array!21667 (_ BitVec 32) List!5757) Bool)

(assert (=> b!373272 (= res!210304 (arrayNoDuplicates!0 lt!171374 #b00000000000000000000000000000000 Nil!5754))))

(declare-fun res!210301 () Bool)

(assert (=> start!37086 (=> (not res!210301) (not e!227551))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37086 (= res!210301 (validMask!0 mask!970))))

(assert (=> start!37086 e!227551))

(declare-datatypes ((V!12939 0))(
  ( (V!12940 (val!4482 Int)) )
))
(declare-datatypes ((ValueCell!4094 0))(
  ( (ValueCellFull!4094 (v!6673 V!12939)) (EmptyCell!4094) )
))
(declare-datatypes ((array!21669 0))(
  ( (array!21670 (arr!10303 (Array (_ BitVec 32) ValueCell!4094)) (size!10656 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21669)

(declare-fun e!227545 () Bool)

(declare-fun array_inv!7602 (array!21669) Bool)

(assert (=> start!37086 (and (array_inv!7602 _values!506) e!227545)))

(assert (=> start!37086 tp!29397))

(assert (=> start!37086 true))

(declare-fun tp_is_empty!8875 () Bool)

(assert (=> start!37086 tp_is_empty!8875))

(declare-fun _keys!658 () array!21667)

(declare-fun array_inv!7603 (array!21667) Bool)

(assert (=> start!37086 (array_inv!7603 _keys!658)))

(declare-fun b!373273 () Bool)

(declare-fun e!227548 () Bool)

(assert (=> b!373273 (= e!227548 tp_is_empty!8875)))

(declare-fun b!373274 () Bool)

(declare-fun e!227547 () Bool)

(declare-fun mapRes!14877 () Bool)

(assert (=> b!373274 (= e!227545 (and e!227547 mapRes!14877))))

(declare-fun condMapEmpty!14877 () Bool)

(declare-fun mapDefault!14877 () ValueCell!4094)

(assert (=> b!373274 (= condMapEmpty!14877 (= (arr!10303 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4094)) mapDefault!14877)))))

(declare-fun mapIsEmpty!14877 () Bool)

(assert (=> mapIsEmpty!14877 mapRes!14877))

(declare-fun b!373275 () Bool)

(declare-fun e!227549 () Bool)

(declare-fun e!227550 () Bool)

(assert (=> b!373275 (= e!227549 e!227550)))

(declare-fun res!210297 () Bool)

(assert (=> b!373275 (=> res!210297 e!227550)))

(assert (=> b!373275 (= res!210297 (= k0!778 #b1000000000000000000000000000000000000000000000000000000000000000))))

(declare-datatypes ((tuple2!5920 0))(
  ( (tuple2!5921 (_1!2971 (_ BitVec 64)) (_2!2971 V!12939)) )
))
(declare-datatypes ((List!5758 0))(
  ( (Nil!5755) (Cons!5754 (h!6610 tuple2!5920) (t!10899 List!5758)) )
))
(declare-datatypes ((ListLongMap!4823 0))(
  ( (ListLongMap!4824 (toList!2427 List!5758)) )
))
(declare-fun lt!171365 () ListLongMap!4823)

(declare-fun lt!171367 () ListLongMap!4823)

(assert (=> b!373275 (= lt!171365 lt!171367)))

(declare-fun lt!171361 () ListLongMap!4823)

(declare-fun lt!171366 () tuple2!5920)

(declare-fun +!795 (ListLongMap!4823 tuple2!5920) ListLongMap!4823)

(assert (=> b!373275 (= lt!171367 (+!795 lt!171361 lt!171366))))

(declare-fun v!373 () V!12939)

(declare-datatypes ((Unit!11462 0))(
  ( (Unit!11463) )
))
(declare-fun lt!171370 () Unit!11462)

(declare-fun lt!171369 () ListLongMap!4823)

(declare-fun zeroValue!472 () V!12939)

(declare-fun addCommutativeForDiffKeys!215 (ListLongMap!4823 (_ BitVec 64) V!12939 (_ BitVec 64) V!12939) Unit!11462)

(assert (=> b!373275 (= lt!171370 (addCommutativeForDiffKeys!215 lt!171369 k0!778 v!373 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun lt!171373 () ListLongMap!4823)

(declare-fun lt!171362 () tuple2!5920)

(assert (=> b!373275 (= lt!171373 (+!795 lt!171365 lt!171362))))

(declare-fun lt!171359 () ListLongMap!4823)

(declare-fun lt!171364 () tuple2!5920)

(assert (=> b!373275 (= lt!171365 (+!795 lt!171359 lt!171364))))

(declare-fun lt!171368 () ListLongMap!4823)

(declare-fun lt!171363 () ListLongMap!4823)

(assert (=> b!373275 (= lt!171368 lt!171363)))

(assert (=> b!373275 (= lt!171363 (+!795 lt!171361 lt!171362))))

(assert (=> b!373275 (= lt!171361 (+!795 lt!171369 lt!171364))))

(declare-fun lt!171360 () ListLongMap!4823)

(assert (=> b!373275 (= lt!171373 (+!795 (+!795 lt!171360 lt!171364) lt!171362))))

(declare-fun minValue!472 () V!12939)

(assert (=> b!373275 (= lt!171362 (tuple2!5921 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(assert (=> b!373275 (= lt!171364 (tuple2!5921 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!472))))

(declare-fun b!373276 () Bool)

(assert (=> b!373276 (= e!227551 e!227552)))

(declare-fun res!210299 () Bool)

(assert (=> b!373276 (=> (not res!210299) (not e!227552))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21667 (_ BitVec 32)) Bool)

(assert (=> b!373276 (= res!210299 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!171374 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!373276 (= lt!171374 (array!21668 (store (arr!10302 _keys!658) i!548 k0!778) (size!10655 _keys!658)))))

(declare-fun b!373277 () Bool)

(declare-fun res!210298 () Bool)

(assert (=> b!373277 (=> (not res!210298) (not e!227551))))

(assert (=> b!373277 (= res!210298 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!373278 () Bool)

(declare-fun res!210307 () Bool)

(assert (=> b!373278 (=> (not res!210307) (not e!227551))))

(assert (=> b!373278 (= res!210307 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5754))))

(declare-fun b!373279 () Bool)

(declare-fun res!210300 () Bool)

(assert (=> b!373279 (=> (not res!210300) (not e!227551))))

(assert (=> b!373279 (= res!210300 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10655 _keys!658))))))

(declare-fun b!373280 () Bool)

(assert (=> b!373280 (= e!227547 tp_is_empty!8875)))

(declare-fun b!373281 () Bool)

(assert (=> b!373281 (= e!227552 (not e!227549))))

(declare-fun res!210303 () Bool)

(assert (=> b!373281 (=> res!210303 e!227549)))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!373281 (= res!210303 (or (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun defaultEntry!514 () Int)

(declare-fun getCurrentListMap!1849 (array!21667 array!21669 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) Int) ListLongMap!4823)

(assert (=> b!373281 (= lt!171368 (getCurrentListMap!1849 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!171375 () array!21669)

(assert (=> b!373281 (= lt!171373 (getCurrentListMap!1849 lt!171374 lt!171375 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373281 (and (= lt!171360 lt!171359) (= lt!171359 lt!171360))))

(assert (=> b!373281 (= lt!171359 (+!795 lt!171369 lt!171366))))

(assert (=> b!373281 (= lt!171366 (tuple2!5921 k0!778 v!373))))

(declare-fun lt!171372 () Unit!11462)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!42 (array!21667 array!21669 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) (_ BitVec 64) V!12939 (_ BitVec 32) Int) Unit!11462)

(assert (=> b!373281 (= lt!171372 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!42 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!714 (array!21667 array!21669 (_ BitVec 32) (_ BitVec 32) V!12939 V!12939 (_ BitVec 32) Int) ListLongMap!4823)

(assert (=> b!373281 (= lt!171360 (getCurrentListMapNoExtraKeys!714 lt!171374 lt!171375 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!373281 (= lt!171375 (array!21670 (store (arr!10303 _values!506) i!548 (ValueCellFull!4094 v!373)) (size!10656 _values!506)))))

(assert (=> b!373281 (= lt!171369 (getCurrentListMapNoExtraKeys!714 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!373282 () Bool)

(assert (=> b!373282 (= e!227550 true)))

(assert (=> b!373282 (= (+!795 lt!171367 lt!171362) (+!795 lt!171363 lt!171366))))

(declare-fun lt!171371 () Unit!11462)

(assert (=> b!373282 (= lt!171371 (addCommutativeForDiffKeys!215 lt!171361 k0!778 v!373 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!472))))

(declare-fun b!373283 () Bool)

(declare-fun res!210305 () Bool)

(assert (=> b!373283 (=> (not res!210305) (not e!227551))))

(assert (=> b!373283 (= res!210305 (and (= (size!10656 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10655 _keys!658) (size!10656 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!373284 () Bool)

(declare-fun res!210308 () Bool)

(assert (=> b!373284 (=> (not res!210308) (not e!227551))))

(assert (=> b!373284 (= res!210308 (or (= (select (arr!10302 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10302 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!373285 () Bool)

(declare-fun res!210302 () Bool)

(assert (=> b!373285 (=> (not res!210302) (not e!227551))))

(declare-fun arrayContainsKey!0 (array!21667 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!373285 (= res!210302 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapNonEmpty!14877 () Bool)

(declare-fun tp!29396 () Bool)

(assert (=> mapNonEmpty!14877 (= mapRes!14877 (and tp!29396 e!227548))))

(declare-fun mapKey!14877 () (_ BitVec 32))

(declare-fun mapValue!14877 () ValueCell!4094)

(declare-fun mapRest!14877 () (Array (_ BitVec 32) ValueCell!4094))

(assert (=> mapNonEmpty!14877 (= (arr!10303 _values!506) (store mapRest!14877 mapKey!14877 mapValue!14877))))

(assert (= (and start!37086 res!210301) b!373283))

(assert (= (and b!373283 res!210305) b!373277))

(assert (= (and b!373277 res!210298) b!373278))

(assert (= (and b!373278 res!210307) b!373279))

(assert (= (and b!373279 res!210300) b!373271))

(assert (= (and b!373271 res!210306) b!373284))

(assert (= (and b!373284 res!210308) b!373285))

(assert (= (and b!373285 res!210302) b!373276))

(assert (= (and b!373276 res!210299) b!373272))

(assert (= (and b!373272 res!210304) b!373281))

(assert (= (and b!373281 (not res!210303)) b!373275))

(assert (= (and b!373275 (not res!210297)) b!373282))

(assert (= (and b!373274 condMapEmpty!14877) mapIsEmpty!14877))

(assert (= (and b!373274 (not condMapEmpty!14877)) mapNonEmpty!14877))

(get-info :version)

(assert (= (and mapNonEmpty!14877 ((_ is ValueCellFull!4094) mapValue!14877)) b!373273))

(assert (= (and b!373274 ((_ is ValueCellFull!4094) mapDefault!14877)) b!373280))

(assert (= start!37086 b!373274))

(declare-fun m!368771 () Bool)

(assert (=> b!373282 m!368771))

(declare-fun m!368773 () Bool)

(assert (=> b!373282 m!368773))

(declare-fun m!368775 () Bool)

(assert (=> b!373282 m!368775))

(declare-fun m!368777 () Bool)

(assert (=> b!373271 m!368777))

(declare-fun m!368779 () Bool)

(assert (=> b!373272 m!368779))

(declare-fun m!368781 () Bool)

(assert (=> mapNonEmpty!14877 m!368781))

(declare-fun m!368783 () Bool)

(assert (=> start!37086 m!368783))

(declare-fun m!368785 () Bool)

(assert (=> start!37086 m!368785))

(declare-fun m!368787 () Bool)

(assert (=> start!37086 m!368787))

(declare-fun m!368789 () Bool)

(assert (=> b!373284 m!368789))

(declare-fun m!368791 () Bool)

(assert (=> b!373278 m!368791))

(declare-fun m!368793 () Bool)

(assert (=> b!373276 m!368793))

(declare-fun m!368795 () Bool)

(assert (=> b!373276 m!368795))

(declare-fun m!368797 () Bool)

(assert (=> b!373277 m!368797))

(declare-fun m!368799 () Bool)

(assert (=> b!373285 m!368799))

(declare-fun m!368801 () Bool)

(assert (=> b!373275 m!368801))

(declare-fun m!368803 () Bool)

(assert (=> b!373275 m!368803))

(declare-fun m!368805 () Bool)

(assert (=> b!373275 m!368805))

(declare-fun m!368807 () Bool)

(assert (=> b!373275 m!368807))

(declare-fun m!368809 () Bool)

(assert (=> b!373275 m!368809))

(declare-fun m!368811 () Bool)

(assert (=> b!373275 m!368811))

(declare-fun m!368813 () Bool)

(assert (=> b!373275 m!368813))

(assert (=> b!373275 m!368801))

(declare-fun m!368815 () Bool)

(assert (=> b!373275 m!368815))

(declare-fun m!368817 () Bool)

(assert (=> b!373281 m!368817))

(declare-fun m!368819 () Bool)

(assert (=> b!373281 m!368819))

(declare-fun m!368821 () Bool)

(assert (=> b!373281 m!368821))

(declare-fun m!368823 () Bool)

(assert (=> b!373281 m!368823))

(declare-fun m!368825 () Bool)

(assert (=> b!373281 m!368825))

(declare-fun m!368827 () Bool)

(assert (=> b!373281 m!368827))

(declare-fun m!368829 () Bool)

(assert (=> b!373281 m!368829))

(check-sat (not b!373285) (not b!373272) (not mapNonEmpty!14877) (not start!37086) (not b!373276) tp_is_empty!8875 (not b!373277) (not b!373271) (not b!373278) b_and!15443 (not b!373281) (not b_next!8227) (not b!373275) (not b!373282))
(check-sat b_and!15443 (not b_next!8227))
