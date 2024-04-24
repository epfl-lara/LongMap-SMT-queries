; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37746 () Bool)

(assert start!37746)

(declare-fun b_free!8863 () Bool)

(declare-fun b_next!8863 () Bool)

(assert (=> start!37746 (= b_free!8863 (not b_next!8863))))

(declare-fun tp!31340 () Bool)

(declare-fun b_and!16119 () Bool)

(assert (=> start!37746 (= tp!31340 b_and!16119)))

(declare-fun b!387484 () Bool)

(declare-fun res!221448 () Bool)

(declare-fun e!234905 () Bool)

(assert (=> b!387484 (=> (not res!221448) (not e!234905))))

(declare-datatypes ((array!22954 0))(
  ( (array!22955 (arr!10945 (Array (_ BitVec 32) (_ BitVec 64))) (size!11297 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22954)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!387484 (= res!221448 (or (= (select (arr!10945 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10945 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!387485 () Bool)

(declare-fun res!221446 () Bool)

(assert (=> b!387485 (=> (not res!221446) (not e!234905))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13819 0))(
  ( (V!13820 (val!4812 Int)) )
))
(declare-datatypes ((ValueCell!4424 0))(
  ( (ValueCellFull!4424 (v!7010 V!13819)) (EmptyCell!4424) )
))
(declare-datatypes ((array!22956 0))(
  ( (array!22957 (arr!10946 (Array (_ BitVec 32) ValueCell!4424)) (size!11298 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22956)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!387485 (= res!221446 (and (= (size!11298 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11297 _keys!658) (size!11298 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!387486 () Bool)

(declare-fun e!234902 () Bool)

(assert (=> b!387486 (= e!234905 e!234902)))

(declare-fun res!221449 () Bool)

(assert (=> b!387486 (=> (not res!221449) (not e!234902))))

(declare-fun lt!182078 () array!22954)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22954 (_ BitVec 32)) Bool)

(assert (=> b!387486 (= res!221449 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!182078 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!387486 (= lt!182078 (array!22955 (store (arr!10945 _keys!658) i!548 k0!778) (size!11297 _keys!658)))))

(declare-fun b!387487 () Bool)

(declare-fun e!234903 () Bool)

(declare-fun tp_is_empty!9535 () Bool)

(assert (=> b!387487 (= e!234903 tp_is_empty!9535)))

(declare-fun res!221444 () Bool)

(assert (=> start!37746 (=> (not res!221444) (not e!234905))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37746 (= res!221444 (validMask!0 mask!970))))

(assert (=> start!37746 e!234905))

(declare-fun e!234904 () Bool)

(declare-fun array_inv!8088 (array!22956) Bool)

(assert (=> start!37746 (and (array_inv!8088 _values!506) e!234904)))

(assert (=> start!37746 tp!31340))

(assert (=> start!37746 true))

(assert (=> start!37746 tp_is_empty!9535))

(declare-fun array_inv!8089 (array!22954) Bool)

(assert (=> start!37746 (array_inv!8089 _keys!658)))

(declare-fun mapNonEmpty!15867 () Bool)

(declare-fun mapRes!15867 () Bool)

(declare-fun tp!31341 () Bool)

(declare-fun e!234906 () Bool)

(assert (=> mapNonEmpty!15867 (= mapRes!15867 (and tp!31341 e!234906))))

(declare-fun mapValue!15867 () ValueCell!4424)

(declare-fun mapRest!15867 () (Array (_ BitVec 32) ValueCell!4424))

(declare-fun mapKey!15867 () (_ BitVec 32))

(assert (=> mapNonEmpty!15867 (= (arr!10946 _values!506) (store mapRest!15867 mapKey!15867 mapValue!15867))))

(declare-fun b!387488 () Bool)

(assert (=> b!387488 (= e!234904 (and e!234903 mapRes!15867))))

(declare-fun condMapEmpty!15867 () Bool)

(declare-fun mapDefault!15867 () ValueCell!4424)

(assert (=> b!387488 (= condMapEmpty!15867 (= (arr!10946 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4424)) mapDefault!15867)))))

(declare-fun b!387489 () Bool)

(declare-fun res!221447 () Bool)

(assert (=> b!387489 (=> (not res!221447) (not e!234902))))

(declare-datatypes ((List!6183 0))(
  ( (Nil!6180) (Cons!6179 (h!7035 (_ BitVec 64)) (t!11325 List!6183)) )
))
(declare-fun arrayNoDuplicates!0 (array!22954 (_ BitVec 32) List!6183) Bool)

(assert (=> b!387489 (= res!221447 (arrayNoDuplicates!0 lt!182078 #b00000000000000000000000000000000 Nil!6180))))

(declare-fun b!387490 () Bool)

(declare-fun res!221445 () Bool)

(assert (=> b!387490 (=> (not res!221445) (not e!234905))))

(assert (=> b!387490 (= res!221445 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!387491 () Bool)

(declare-fun res!221450 () Bool)

(assert (=> b!387491 (=> (not res!221450) (not e!234905))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!387491 (= res!221450 (validKeyInArray!0 k0!778))))

(declare-fun b!387492 () Bool)

(assert (=> b!387492 (= e!234906 tp_is_empty!9535)))

(declare-fun b!387493 () Bool)

(declare-fun res!221453 () Bool)

(assert (=> b!387493 (=> (not res!221453) (not e!234905))))

(assert (=> b!387493 (= res!221453 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11297 _keys!658))))))

(declare-fun mapIsEmpty!15867 () Bool)

(assert (=> mapIsEmpty!15867 mapRes!15867))

(declare-fun b!387494 () Bool)

(declare-fun res!221451 () Bool)

(assert (=> b!387494 (=> (not res!221451) (not e!234905))))

(assert (=> b!387494 (= res!221451 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6180))))

(declare-fun b!387495 () Bool)

(declare-fun res!221452 () Bool)

(assert (=> b!387495 (=> (not res!221452) (not e!234905))))

(declare-fun arrayContainsKey!0 (array!22954 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!387495 (= res!221452 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!387496 () Bool)

(assert (=> b!387496 (= e!234902 false)))

(declare-datatypes ((tuple2!6332 0))(
  ( (tuple2!6333 (_1!3177 (_ BitVec 64)) (_2!3177 V!13819)) )
))
(declare-datatypes ((List!6184 0))(
  ( (Nil!6181) (Cons!6180 (h!7036 tuple2!6332) (t!11326 List!6184)) )
))
(declare-datatypes ((ListLongMap!5247 0))(
  ( (ListLongMap!5248 (toList!2639 List!6184)) )
))
(declare-fun lt!182080 () ListLongMap!5247)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13819)

(declare-fun v!373 () V!13819)

(declare-fun minValue!472 () V!13819)

(declare-fun getCurrentListMapNoExtraKeys!914 (array!22954 array!22956 (_ BitVec 32) (_ BitVec 32) V!13819 V!13819 (_ BitVec 32) Int) ListLongMap!5247)

(assert (=> b!387496 (= lt!182080 (getCurrentListMapNoExtraKeys!914 lt!182078 (array!22957 (store (arr!10946 _values!506) i!548 (ValueCellFull!4424 v!373)) (size!11298 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!182079 () ListLongMap!5247)

(assert (=> b!387496 (= lt!182079 (getCurrentListMapNoExtraKeys!914 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!37746 res!221444) b!387485))

(assert (= (and b!387485 res!221446) b!387490))

(assert (= (and b!387490 res!221445) b!387494))

(assert (= (and b!387494 res!221451) b!387493))

(assert (= (and b!387493 res!221453) b!387491))

(assert (= (and b!387491 res!221450) b!387484))

(assert (= (and b!387484 res!221448) b!387495))

(assert (= (and b!387495 res!221452) b!387486))

(assert (= (and b!387486 res!221449) b!387489))

(assert (= (and b!387489 res!221447) b!387496))

(assert (= (and b!387488 condMapEmpty!15867) mapIsEmpty!15867))

(assert (= (and b!387488 (not condMapEmpty!15867)) mapNonEmpty!15867))

(get-info :version)

(assert (= (and mapNonEmpty!15867 ((_ is ValueCellFull!4424) mapValue!15867)) b!387492))

(assert (= (and b!387488 ((_ is ValueCellFull!4424) mapDefault!15867)) b!387487))

(assert (= start!37746 b!387488))

(declare-fun m!383855 () Bool)

(assert (=> b!387494 m!383855))

(declare-fun m!383857 () Bool)

(assert (=> start!37746 m!383857))

(declare-fun m!383859 () Bool)

(assert (=> start!37746 m!383859))

(declare-fun m!383861 () Bool)

(assert (=> start!37746 m!383861))

(declare-fun m!383863 () Bool)

(assert (=> b!387486 m!383863))

(declare-fun m!383865 () Bool)

(assert (=> b!387486 m!383865))

(declare-fun m!383867 () Bool)

(assert (=> b!387490 m!383867))

(declare-fun m!383869 () Bool)

(assert (=> b!387491 m!383869))

(declare-fun m!383871 () Bool)

(assert (=> b!387496 m!383871))

(declare-fun m!383873 () Bool)

(assert (=> b!387496 m!383873))

(declare-fun m!383875 () Bool)

(assert (=> b!387496 m!383875))

(declare-fun m!383877 () Bool)

(assert (=> b!387484 m!383877))

(declare-fun m!383879 () Bool)

(assert (=> b!387495 m!383879))

(declare-fun m!383881 () Bool)

(assert (=> mapNonEmpty!15867 m!383881))

(declare-fun m!383883 () Bool)

(assert (=> b!387489 m!383883))

(check-sat (not b_next!8863) (not b!387495) tp_is_empty!9535 (not b!387496) (not mapNonEmpty!15867) (not b!387486) (not start!37746) (not b!387490) (not b!387491) b_and!16119 (not b!387489) (not b!387494))
(check-sat b_and!16119 (not b_next!8863))
