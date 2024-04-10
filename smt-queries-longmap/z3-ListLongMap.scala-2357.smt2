; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37606 () Bool)

(assert start!37606)

(declare-fun b_free!8733 () Bool)

(declare-fun b_next!8733 () Bool)

(assert (=> start!37606 (= b_free!8733 (not b_next!8733))))

(declare-fun tp!30914 () Bool)

(declare-fun b_and!15975 () Bool)

(assert (=> start!37606 (= tp!30914 b_and!15975)))

(declare-fun b!384679 () Bool)

(declare-fun res!219286 () Bool)

(declare-fun e!233527 () Bool)

(assert (=> b!384679 (=> (not res!219286) (not e!233527))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!384679 (= res!219286 (validKeyInArray!0 k0!778))))

(declare-fun b!384680 () Bool)

(declare-fun res!219289 () Bool)

(declare-fun e!233528 () Bool)

(assert (=> b!384680 (=> (not res!219289) (not e!233528))))

(declare-datatypes ((array!22663 0))(
  ( (array!22664 (arr!10800 (Array (_ BitVec 32) (_ BitVec 64))) (size!11152 (_ BitVec 32))) )
))
(declare-fun lt!181080 () array!22663)

(declare-datatypes ((List!6209 0))(
  ( (Nil!6206) (Cons!6205 (h!7061 (_ BitVec 64)) (t!11359 List!6209)) )
))
(declare-fun arrayNoDuplicates!0 (array!22663 (_ BitVec 32) List!6209) Bool)

(assert (=> b!384680 (= res!219289 (arrayNoDuplicates!0 lt!181080 #b00000000000000000000000000000000 Nil!6206))))

(declare-fun b!384681 () Bool)

(declare-fun res!219295 () Bool)

(assert (=> b!384681 (=> (not res!219295) (not e!233527))))

(declare-fun _keys!658 () array!22663)

(assert (=> b!384681 (= res!219295 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6206))))

(declare-fun b!384682 () Bool)

(assert (=> b!384682 (= e!233527 e!233528)))

(declare-fun res!219288 () Bool)

(assert (=> b!384682 (=> (not res!219288) (not e!233528))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22663 (_ BitVec 32)) Bool)

(assert (=> b!384682 (= res!219288 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!181080 mask!970))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!384682 (= lt!181080 (array!22664 (store (arr!10800 _keys!658) i!548 k0!778) (size!11152 _keys!658)))))

(declare-fun b!384683 () Bool)

(declare-fun e!233530 () Bool)

(declare-fun tp_is_empty!9381 () Bool)

(assert (=> b!384683 (= e!233530 tp_is_empty!9381)))

(declare-fun b!384684 () Bool)

(declare-fun e!233529 () Bool)

(declare-fun e!233531 () Bool)

(declare-fun mapRes!15636 () Bool)

(assert (=> b!384684 (= e!233529 (and e!233531 mapRes!15636))))

(declare-fun condMapEmpty!15636 () Bool)

(declare-datatypes ((V!13613 0))(
  ( (V!13614 (val!4735 Int)) )
))
(declare-datatypes ((ValueCell!4347 0))(
  ( (ValueCellFull!4347 (v!6932 V!13613)) (EmptyCell!4347) )
))
(declare-datatypes ((array!22665 0))(
  ( (array!22666 (arr!10801 (Array (_ BitVec 32) ValueCell!4347)) (size!11153 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22665)

(declare-fun mapDefault!15636 () ValueCell!4347)

(assert (=> b!384684 (= condMapEmpty!15636 (= (arr!10801 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4347)) mapDefault!15636)))))

(declare-fun res!219294 () Bool)

(assert (=> start!37606 (=> (not res!219294) (not e!233527))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37606 (= res!219294 (validMask!0 mask!970))))

(assert (=> start!37606 e!233527))

(declare-fun array_inv!7950 (array!22665) Bool)

(assert (=> start!37606 (and (array_inv!7950 _values!506) e!233529)))

(assert (=> start!37606 tp!30914))

(assert (=> start!37606 true))

(assert (=> start!37606 tp_is_empty!9381))

(declare-fun array_inv!7951 (array!22663) Bool)

(assert (=> start!37606 (array_inv!7951 _keys!658)))

(declare-fun b!384685 () Bool)

(declare-fun res!219296 () Bool)

(assert (=> b!384685 (=> (not res!219296) (not e!233527))))

(assert (=> b!384685 (= res!219296 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11152 _keys!658))))))

(declare-fun b!384686 () Bool)

(declare-fun res!219291 () Bool)

(assert (=> b!384686 (=> (not res!219291) (not e!233527))))

(assert (=> b!384686 (= res!219291 (or (= (select (arr!10800 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10800 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun mapIsEmpty!15636 () Bool)

(assert (=> mapIsEmpty!15636 mapRes!15636))

(declare-fun b!384687 () Bool)

(declare-fun res!219293 () Bool)

(assert (=> b!384687 (=> (not res!219293) (not e!233527))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!384687 (= res!219293 (and (= (size!11153 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11152 _keys!658) (size!11153 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!384688 () Bool)

(declare-fun res!219290 () Bool)

(assert (=> b!384688 (=> (not res!219290) (not e!233527))))

(assert (=> b!384688 (= res!219290 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun mapNonEmpty!15636 () Bool)

(declare-fun tp!30915 () Bool)

(assert (=> mapNonEmpty!15636 (= mapRes!15636 (and tp!30915 e!233530))))

(declare-fun mapValue!15636 () ValueCell!4347)

(declare-fun mapRest!15636 () (Array (_ BitVec 32) ValueCell!4347))

(declare-fun mapKey!15636 () (_ BitVec 32))

(assert (=> mapNonEmpty!15636 (= (arr!10801 _values!506) (store mapRest!15636 mapKey!15636 mapValue!15636))))

(declare-fun b!384689 () Bool)

(declare-fun res!219292 () Bool)

(assert (=> b!384689 (=> (not res!219292) (not e!233527))))

(declare-fun arrayContainsKey!0 (array!22663 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!384689 (= res!219292 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!384690 () Bool)

(assert (=> b!384690 (= e!233531 tp_is_empty!9381)))

(declare-fun b!384691 () Bool)

(declare-fun e!233526 () Bool)

(assert (=> b!384691 (= e!233528 (not e!233526))))

(declare-fun res!219287 () Bool)

(assert (=> b!384691 (=> res!219287 e!233526)))

(declare-fun lt!181075 () Bool)

(assert (=> b!384691 (= res!219287 (or (and (not lt!181075) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!181075) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!181075)))))

(assert (=> b!384691 (= lt!181075 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13613)

(declare-datatypes ((tuple2!6374 0))(
  ( (tuple2!6375 (_1!3198 (_ BitVec 64)) (_2!3198 V!13613)) )
))
(declare-datatypes ((List!6210 0))(
  ( (Nil!6207) (Cons!6206 (h!7062 tuple2!6374) (t!11360 List!6210)) )
))
(declare-datatypes ((ListLongMap!5287 0))(
  ( (ListLongMap!5288 (toList!2659 List!6210)) )
))
(declare-fun lt!181083 () ListLongMap!5287)

(declare-fun minValue!472 () V!13613)

(declare-fun getCurrentListMap!2058 (array!22663 array!22665 (_ BitVec 32) (_ BitVec 32) V!13613 V!13613 (_ BitVec 32) Int) ListLongMap!5287)

(assert (=> b!384691 (= lt!181083 (getCurrentListMap!2058 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181082 () ListLongMap!5287)

(declare-fun lt!181079 () array!22665)

(assert (=> b!384691 (= lt!181082 (getCurrentListMap!2058 lt!181080 lt!181079 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!181077 () ListLongMap!5287)

(declare-fun lt!181081 () ListLongMap!5287)

(assert (=> b!384691 (and (= lt!181077 lt!181081) (= lt!181081 lt!181077))))

(declare-fun lt!181076 () ListLongMap!5287)

(declare-fun lt!181074 () tuple2!6374)

(declare-fun +!994 (ListLongMap!5287 tuple2!6374) ListLongMap!5287)

(assert (=> b!384691 (= lt!181081 (+!994 lt!181076 lt!181074))))

(declare-fun v!373 () V!13613)

(assert (=> b!384691 (= lt!181074 (tuple2!6375 k0!778 v!373))))

(declare-datatypes ((Unit!11870 0))(
  ( (Unit!11871) )
))
(declare-fun lt!181078 () Unit!11870)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!216 (array!22663 array!22665 (_ BitVec 32) (_ BitVec 32) V!13613 V!13613 (_ BitVec 32) (_ BitVec 64) V!13613 (_ BitVec 32) Int) Unit!11870)

(assert (=> b!384691 (= lt!181078 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!216 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!892 (array!22663 array!22665 (_ BitVec 32) (_ BitVec 32) V!13613 V!13613 (_ BitVec 32) Int) ListLongMap!5287)

(assert (=> b!384691 (= lt!181077 (getCurrentListMapNoExtraKeys!892 lt!181080 lt!181079 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!384691 (= lt!181079 (array!22666 (store (arr!10801 _values!506) i!548 (ValueCellFull!4347 v!373)) (size!11153 _values!506)))))

(assert (=> b!384691 (= lt!181076 (getCurrentListMapNoExtraKeys!892 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!384692 () Bool)

(assert (=> b!384692 (= e!233526 true)))

(declare-fun lt!181073 () ListLongMap!5287)

(assert (=> b!384692 (= lt!181073 (+!994 lt!181083 lt!181074))))

(assert (=> b!384692 (= lt!181082 lt!181077)))

(assert (= (and start!37606 res!219294) b!384687))

(assert (= (and b!384687 res!219293) b!384688))

(assert (= (and b!384688 res!219290) b!384681))

(assert (= (and b!384681 res!219295) b!384685))

(assert (= (and b!384685 res!219296) b!384679))

(assert (= (and b!384679 res!219286) b!384686))

(assert (= (and b!384686 res!219291) b!384689))

(assert (= (and b!384689 res!219292) b!384682))

(assert (= (and b!384682 res!219288) b!384680))

(assert (= (and b!384680 res!219289) b!384691))

(assert (= (and b!384691 (not res!219287)) b!384692))

(assert (= (and b!384684 condMapEmpty!15636) mapIsEmpty!15636))

(assert (= (and b!384684 (not condMapEmpty!15636)) mapNonEmpty!15636))

(get-info :version)

(assert (= (and mapNonEmpty!15636 ((_ is ValueCellFull!4347) mapValue!15636)) b!384683))

(assert (= (and b!384684 ((_ is ValueCellFull!4347) mapDefault!15636)) b!384690))

(assert (= start!37606 b!384684))

(declare-fun m!381355 () Bool)

(assert (=> b!384686 m!381355))

(declare-fun m!381357 () Bool)

(assert (=> start!37606 m!381357))

(declare-fun m!381359 () Bool)

(assert (=> start!37606 m!381359))

(declare-fun m!381361 () Bool)

(assert (=> start!37606 m!381361))

(declare-fun m!381363 () Bool)

(assert (=> b!384692 m!381363))

(declare-fun m!381365 () Bool)

(assert (=> b!384679 m!381365))

(declare-fun m!381367 () Bool)

(assert (=> b!384680 m!381367))

(declare-fun m!381369 () Bool)

(assert (=> b!384681 m!381369))

(declare-fun m!381371 () Bool)

(assert (=> b!384688 m!381371))

(declare-fun m!381373 () Bool)

(assert (=> mapNonEmpty!15636 m!381373))

(declare-fun m!381375 () Bool)

(assert (=> b!384682 m!381375))

(declare-fun m!381377 () Bool)

(assert (=> b!384682 m!381377))

(declare-fun m!381379 () Bool)

(assert (=> b!384691 m!381379))

(declare-fun m!381381 () Bool)

(assert (=> b!384691 m!381381))

(declare-fun m!381383 () Bool)

(assert (=> b!384691 m!381383))

(declare-fun m!381385 () Bool)

(assert (=> b!384691 m!381385))

(declare-fun m!381387 () Bool)

(assert (=> b!384691 m!381387))

(declare-fun m!381389 () Bool)

(assert (=> b!384691 m!381389))

(declare-fun m!381391 () Bool)

(assert (=> b!384691 m!381391))

(declare-fun m!381393 () Bool)

(assert (=> b!384689 m!381393))

(check-sat (not b!384681) (not b!384688) (not start!37606) (not b!384692) (not b!384689) (not b!384679) (not mapNonEmpty!15636) b_and!15975 (not b!384691) (not b!384682) (not b_next!8733) tp_is_empty!9381 (not b!384680))
(check-sat b_and!15975 (not b_next!8733))
