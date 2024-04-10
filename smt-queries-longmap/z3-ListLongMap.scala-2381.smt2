; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37750 () Bool)

(assert start!37750)

(declare-fun b_free!8853 () Bool)

(declare-fun b_next!8853 () Bool)

(assert (=> start!37750 (= b_free!8853 (not b_next!8853))))

(declare-fun tp!31311 () Bool)

(declare-fun b_and!16095 () Bool)

(assert (=> start!37750 (= tp!31311 b_and!16095)))

(declare-fun b!387338 () Bool)

(declare-fun e!234847 () Bool)

(declare-fun tp_is_empty!9525 () Bool)

(assert (=> b!387338 (= e!234847 tp_is_empty!9525)))

(declare-fun b!387339 () Bool)

(declare-fun res!221304 () Bool)

(declare-fun e!234846 () Bool)

(assert (=> b!387339 (=> (not res!221304) (not e!234846))))

(declare-datatypes ((array!22943 0))(
  ( (array!22944 (arr!10940 (Array (_ BitVec 32) (_ BitVec 64))) (size!11292 (_ BitVec 32))) )
))
(declare-fun lt!182016 () array!22943)

(declare-datatypes ((List!6312 0))(
  ( (Nil!6309) (Cons!6308 (h!7164 (_ BitVec 64)) (t!11462 List!6312)) )
))
(declare-fun arrayNoDuplicates!0 (array!22943 (_ BitVec 32) List!6312) Bool)

(assert (=> b!387339 (= res!221304 (arrayNoDuplicates!0 lt!182016 #b00000000000000000000000000000000 Nil!6309))))

(declare-fun mapNonEmpty!15852 () Bool)

(declare-fun mapRes!15852 () Bool)

(declare-fun tp!31310 () Bool)

(declare-fun e!234844 () Bool)

(assert (=> mapNonEmpty!15852 (= mapRes!15852 (and tp!31310 e!234844))))

(declare-datatypes ((V!13805 0))(
  ( (V!13806 (val!4807 Int)) )
))
(declare-datatypes ((ValueCell!4419 0))(
  ( (ValueCellFull!4419 (v!7004 V!13805)) (EmptyCell!4419) )
))
(declare-datatypes ((array!22945 0))(
  ( (array!22946 (arr!10941 (Array (_ BitVec 32) ValueCell!4419)) (size!11293 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22945)

(declare-fun mapValue!15852 () ValueCell!4419)

(declare-fun mapRest!15852 () (Array (_ BitVec 32) ValueCell!4419))

(declare-fun mapKey!15852 () (_ BitVec 32))

(assert (=> mapNonEmpty!15852 (= (arr!10941 _values!506) (store mapRest!15852 mapKey!15852 mapValue!15852))))

(declare-fun b!387340 () Bool)

(declare-fun res!221298 () Bool)

(declare-fun e!234848 () Bool)

(assert (=> b!387340 (=> (not res!221298) (not e!234848))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387340 (= res!221298 (validKeyInArray!0 k0!778))))

(declare-fun b!387341 () Bool)

(declare-fun res!221299 () Bool)

(assert (=> b!387341 (=> (not res!221299) (not e!234848))))

(declare-fun _keys!658 () array!22943)

(declare-fun arrayContainsKey!0 (array!22943 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387341 (= res!221299 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387342 () Bool)

(declare-fun res!221303 () Bool)

(assert (=> b!387342 (=> (not res!221303) (not e!234848))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387342 (= res!221303 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11292 _keys!658))))))

(declare-fun res!221306 () Bool)

(assert (=> start!37750 (=> (not res!221306) (not e!234848))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37750 (= res!221306 (validMask!0 mask!970))))

(assert (=> start!37750 e!234848))

(declare-fun e!234843 () Bool)

(declare-fun array_inv!8050 (array!22945) Bool)

(assert (=> start!37750 (and (array_inv!8050 _values!506) e!234843)))

(assert (=> start!37750 tp!31311))

(assert (=> start!37750 true))

(assert (=> start!37750 tp_is_empty!9525))

(declare-fun array_inv!8051 (array!22943) Bool)

(assert (=> start!37750 (array_inv!8051 _keys!658)))

(declare-fun b!387343 () Bool)

(declare-fun res!221301 () Bool)

(assert (=> b!387343 (=> (not res!221301) (not e!234848))))

(assert (=> b!387343 (= res!221301 (or (= (select (arr!10940 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10940 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387344 () Bool)

(declare-fun res!221300 () Bool)

(assert (=> b!387344 (=> (not res!221300) (not e!234848))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22943 (_ BitVec 32)) Bool)

(assert (=> b!387344 (= res!221300 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapIsEmpty!15852 () Bool)

(assert (=> mapIsEmpty!15852 mapRes!15852))

(declare-fun b!387345 () Bool)

(declare-fun res!221305 () Bool)

(assert (=> b!387345 (=> (not res!221305) (not e!234848))))

(assert (=> b!387345 (= res!221305 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6309))))

(declare-fun b!387346 () Bool)

(assert (=> b!387346 (= e!234843 (and e!234847 mapRes!15852))))

(declare-fun condMapEmpty!15852 () Bool)

(declare-fun mapDefault!15852 () ValueCell!4419)

(assert (=> b!387346 (= condMapEmpty!15852 (= (arr!10941 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4419)) mapDefault!15852)))))

(declare-fun b!387347 () Bool)

(assert (=> b!387347 (= e!234846 false)))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6462 0))(
  ( (tuple2!6463 (_1!3242 (_ BitVec 64)) (_2!3242 V!13805)) )
))
(declare-datatypes ((List!6313 0))(
  ( (Nil!6310) (Cons!6309 (h!7165 tuple2!6462) (t!11463 List!6313)) )
))
(declare-datatypes ((ListLongMap!5375 0))(
  ( (ListLongMap!5376 (toList!2703 List!6313)) )
))
(declare-fun lt!182015 () ListLongMap!5375)

(declare-fun zeroValue!472 () V!13805)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!13805)

(declare-fun minValue!472 () V!13805)

(declare-fun getCurrentListMapNoExtraKeys!932 (array!22943 array!22945 (_ BitVec 32) (_ BitVec 32) V!13805 V!13805 (_ BitVec 32) Int) ListLongMap!5375)

(assert (=> b!387347 (= lt!182015 (getCurrentListMapNoExtraKeys!932 lt!182016 (array!22946 (store (arr!10941 _values!506) i!548 (ValueCellFull!4419 v!373)) (size!11293 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182014 () ListLongMap!5375)

(assert (=> b!387347 (= lt!182014 (getCurrentListMapNoExtraKeys!932 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!387348 () Bool)

(assert (=> b!387348 (= e!234844 tp_is_empty!9525)))

(declare-fun b!387349 () Bool)

(assert (=> b!387349 (= e!234848 e!234846)))

(declare-fun res!221302 () Bool)

(assert (=> b!387349 (=> (not res!221302) (not e!234846))))

(assert (=> b!387349 (= res!221302 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182016 mask!970))))

(assert (=> b!387349 (= lt!182016 (array!22944 (store (arr!10940 _keys!658) i!548 k0!778) (size!11292 _keys!658)))))

(declare-fun b!387350 () Bool)

(declare-fun res!221297 () Bool)

(assert (=> b!387350 (=> (not res!221297) (not e!234848))))

(assert (=> b!387350 (= res!221297 (and (= (size!11293 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11292 _keys!658) (size!11293 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(assert (= (and start!37750 res!221306) b!387350))

(assert (= (and b!387350 res!221297) b!387344))

(assert (= (and b!387344 res!221300) b!387345))

(assert (= (and b!387345 res!221305) b!387342))

(assert (= (and b!387342 res!221303) b!387340))

(assert (= (and b!387340 res!221298) b!387343))

(assert (= (and b!387343 res!221301) b!387341))

(assert (= (and b!387341 res!221299) b!387349))

(assert (= (and b!387349 res!221302) b!387339))

(assert (= (and b!387339 res!221304) b!387347))

(assert (= (and b!387346 condMapEmpty!15852) mapIsEmpty!15852))

(assert (= (and b!387346 (not condMapEmpty!15852)) mapNonEmpty!15852))

(get-info :version)

(assert (= (and mapNonEmpty!15852 ((_ is ValueCellFull!4419) mapValue!15852)) b!387348))

(assert (= (and b!387346 ((_ is ValueCellFull!4419) mapDefault!15852)) b!387338))

(assert (= start!37750 b!387346))

(declare-fun m!383475 () Bool)

(assert (=> b!387340 m!383475))

(declare-fun m!383477 () Bool)

(assert (=> b!387341 m!383477))

(declare-fun m!383479 () Bool)

(assert (=> b!387339 m!383479))

(declare-fun m!383481 () Bool)

(assert (=> b!387345 m!383481))

(declare-fun m!383483 () Bool)

(assert (=> b!387343 m!383483))

(declare-fun m!383485 () Bool)

(assert (=> mapNonEmpty!15852 m!383485))

(declare-fun m!383487 () Bool)

(assert (=> start!37750 m!383487))

(declare-fun m!383489 () Bool)

(assert (=> start!37750 m!383489))

(declare-fun m!383491 () Bool)

(assert (=> start!37750 m!383491))

(declare-fun m!383493 () Bool)

(assert (=> b!387347 m!383493))

(declare-fun m!383495 () Bool)

(assert (=> b!387347 m!383495))

(declare-fun m!383497 () Bool)

(assert (=> b!387347 m!383497))

(declare-fun m!383499 () Bool)

(assert (=> b!387344 m!383499))

(declare-fun m!383501 () Bool)

(assert (=> b!387349 m!383501))

(declare-fun m!383503 () Bool)

(assert (=> b!387349 m!383503))

(check-sat b_and!16095 (not b!387347) (not b!387344) (not b!387339) (not b_next!8853) (not start!37750) (not b!387341) (not b!387349) (not b!387345) (not b!387340) tp_is_empty!9525 (not mapNonEmpty!15852))
(check-sat b_and!16095 (not b_next!8853))
