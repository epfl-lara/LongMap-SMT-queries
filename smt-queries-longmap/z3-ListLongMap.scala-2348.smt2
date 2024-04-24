; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!37536 () Bool)

(assert start!37536)

(declare-fun b_free!8677 () Bool)

(declare-fun b_next!8677 () Bool)

(assert (=> start!37536 (= b_free!8677 (not b_next!8677))))

(declare-fun tp!30747 () Bool)

(declare-fun b_and!15933 () Bool)

(assert (=> start!37536 (= tp!30747 b_and!15933)))

(declare-fun mapIsEmpty!15552 () Bool)

(declare-fun mapRes!15552 () Bool)

(assert (=> mapIsEmpty!15552 mapRes!15552))

(declare-fun b!383445 () Bool)

(declare-fun res!218352 () Bool)

(declare-fun e!232898 () Bool)

(assert (=> b!383445 (=> (not res!218352) (not e!232898))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22546 0))(
  ( (array!22547 (arr!10741 (Array (_ BitVec 32) (_ BitVec 64))) (size!11093 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22546)

(assert (=> b!383445 (= res!218352 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11093 _keys!658))))))

(declare-fun b!383446 () Bool)

(declare-fun res!218350 () Bool)

(assert (=> b!383446 (=> (not res!218350) (not e!232898))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!13539 0))(
  ( (V!13540 (val!4707 Int)) )
))
(declare-datatypes ((ValueCell!4319 0))(
  ( (ValueCellFull!4319 (v!6905 V!13539)) (EmptyCell!4319) )
))
(declare-datatypes ((array!22548 0))(
  ( (array!22549 (arr!10742 (Array (_ BitVec 32) ValueCell!4319)) (size!11094 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22548)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!383446 (= res!218350 (and (= (size!11094 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11093 _keys!658) (size!11094 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!383447 () Bool)

(declare-fun e!232899 () Bool)

(declare-fun e!232897 () Bool)

(assert (=> b!383447 (= e!232899 (not e!232897))))

(declare-fun res!218353 () Bool)

(assert (=> b!383447 (=> res!218353 e!232897)))

(declare-fun lt!180186 () Bool)

(assert (=> b!383447 (= res!218353 (or (and (not lt!180186) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!180186) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!180186)))))

(assert (=> b!383447 (= lt!180186 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!13539)

(declare-datatypes ((tuple2!6210 0))(
  ( (tuple2!6211 (_1!3116 (_ BitVec 64)) (_2!3116 V!13539)) )
))
(declare-datatypes ((List!6047 0))(
  ( (Nil!6044) (Cons!6043 (h!6899 tuple2!6210) (t!11189 List!6047)) )
))
(declare-datatypes ((ListLongMap!5125 0))(
  ( (ListLongMap!5126 (toList!2578 List!6047)) )
))
(declare-fun lt!180185 () ListLongMap!5125)

(declare-fun minValue!472 () V!13539)

(declare-fun getCurrentListMap!2011 (array!22546 array!22548 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) Int) ListLongMap!5125)

(assert (=> b!383447 (= lt!180185 (getCurrentListMap!2011 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180187 () ListLongMap!5125)

(declare-fun lt!180182 () array!22546)

(declare-fun lt!180183 () array!22548)

(assert (=> b!383447 (= lt!180187 (getCurrentListMap!2011 lt!180182 lt!180183 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!180184 () ListLongMap!5125)

(declare-fun lt!180178 () ListLongMap!5125)

(assert (=> b!383447 (and (= lt!180184 lt!180178) (= lt!180178 lt!180184))))

(declare-fun lt!180181 () ListLongMap!5125)

(declare-fun lt!180180 () tuple2!6210)

(declare-fun +!970 (ListLongMap!5125 tuple2!6210) ListLongMap!5125)

(assert (=> b!383447 (= lt!180178 (+!970 lt!180181 lt!180180))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun v!373 () V!13539)

(assert (=> b!383447 (= lt!180180 (tuple2!6211 k0!778 v!373))))

(declare-datatypes ((Unit!11817 0))(
  ( (Unit!11818) )
))
(declare-fun lt!180179 () Unit!11817)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!198 (array!22546 array!22548 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) (_ BitVec 64) V!13539 (_ BitVec 32) Int) Unit!11817)

(assert (=> b!383447 (= lt!180179 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!198 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k0!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!858 (array!22546 array!22548 (_ BitVec 32) (_ BitVec 32) V!13539 V!13539 (_ BitVec 32) Int) ListLongMap!5125)

(assert (=> b!383447 (= lt!180184 (getCurrentListMapNoExtraKeys!858 lt!180182 lt!180183 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!383447 (= lt!180183 (array!22549 (store (arr!10742 _values!506) i!548 (ValueCellFull!4319 v!373)) (size!11094 _values!506)))))

(assert (=> b!383447 (= lt!180181 (getCurrentListMapNoExtraKeys!858 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun res!218357 () Bool)

(assert (=> start!37536 (=> (not res!218357) (not e!232898))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37536 (= res!218357 (validMask!0 mask!970))))

(assert (=> start!37536 e!232898))

(declare-fun e!232900 () Bool)

(declare-fun array_inv!7950 (array!22548) Bool)

(assert (=> start!37536 (and (array_inv!7950 _values!506) e!232900)))

(assert (=> start!37536 tp!30747))

(assert (=> start!37536 true))

(declare-fun tp_is_empty!9325 () Bool)

(assert (=> start!37536 tp_is_empty!9325))

(declare-fun array_inv!7951 (array!22546) Bool)

(assert (=> start!37536 (array_inv!7951 _keys!658)))

(declare-fun b!383448 () Bool)

(declare-fun e!232896 () Bool)

(assert (=> b!383448 (= e!232896 tp_is_empty!9325)))

(declare-fun mapNonEmpty!15552 () Bool)

(declare-fun tp!30746 () Bool)

(assert (=> mapNonEmpty!15552 (= mapRes!15552 (and tp!30746 e!232896))))

(declare-fun mapKey!15552 () (_ BitVec 32))

(declare-fun mapValue!15552 () ValueCell!4319)

(declare-fun mapRest!15552 () (Array (_ BitVec 32) ValueCell!4319))

(assert (=> mapNonEmpty!15552 (= (arr!10742 _values!506) (store mapRest!15552 mapKey!15552 mapValue!15552))))

(declare-fun b!383449 () Bool)

(declare-fun res!218351 () Bool)

(assert (=> b!383449 (=> (not res!218351) (not e!232898))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!383449 (= res!218351 (validKeyInArray!0 k0!778))))

(declare-fun b!383450 () Bool)

(declare-fun res!218358 () Bool)

(assert (=> b!383450 (=> (not res!218358) (not e!232898))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22546 (_ BitVec 32)) Bool)

(assert (=> b!383450 (= res!218358 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!383451 () Bool)

(assert (=> b!383451 (= e!232898 e!232899)))

(declare-fun res!218356 () Bool)

(assert (=> b!383451 (=> (not res!218356) (not e!232899))))

(assert (=> b!383451 (= res!218356 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!180182 mask!970))))

(assert (=> b!383451 (= lt!180182 (array!22547 (store (arr!10741 _keys!658) i!548 k0!778) (size!11093 _keys!658)))))

(declare-fun b!383452 () Bool)

(declare-fun res!218355 () Bool)

(assert (=> b!383452 (=> (not res!218355) (not e!232898))))

(declare-fun arrayContainsKey!0 (array!22546 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!383452 (= res!218355 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!383453 () Bool)

(declare-fun e!232901 () Bool)

(assert (=> b!383453 (= e!232900 (and e!232901 mapRes!15552))))

(declare-fun condMapEmpty!15552 () Bool)

(declare-fun mapDefault!15552 () ValueCell!4319)

(assert (=> b!383453 (= condMapEmpty!15552 (= (arr!10742 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4319)) mapDefault!15552)))))

(declare-fun b!383454 () Bool)

(assert (=> b!383454 (= e!232901 tp_is_empty!9325)))

(declare-fun b!383455 () Bool)

(declare-fun res!218359 () Bool)

(assert (=> b!383455 (=> (not res!218359) (not e!232899))))

(declare-datatypes ((List!6048 0))(
  ( (Nil!6045) (Cons!6044 (h!6900 (_ BitVec 64)) (t!11190 List!6048)) )
))
(declare-fun arrayNoDuplicates!0 (array!22546 (_ BitVec 32) List!6048) Bool)

(assert (=> b!383455 (= res!218359 (arrayNoDuplicates!0 lt!180182 #b00000000000000000000000000000000 Nil!6045))))

(declare-fun b!383456 () Bool)

(declare-fun res!218360 () Bool)

(assert (=> b!383456 (=> (not res!218360) (not e!232898))))

(assert (=> b!383456 (= res!218360 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6045))))

(declare-fun b!383457 () Bool)

(assert (=> b!383457 (= e!232897 true)))

(declare-fun lt!180177 () ListLongMap!5125)

(assert (=> b!383457 (= lt!180177 (+!970 lt!180185 lt!180180))))

(assert (=> b!383457 (= lt!180187 lt!180184)))

(declare-fun b!383458 () Bool)

(declare-fun res!218354 () Bool)

(assert (=> b!383458 (=> (not res!218354) (not e!232898))))

(assert (=> b!383458 (= res!218354 (or (= (select (arr!10741 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10741 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(assert (= (and start!37536 res!218357) b!383446))

(assert (= (and b!383446 res!218350) b!383450))

(assert (= (and b!383450 res!218358) b!383456))

(assert (= (and b!383456 res!218360) b!383445))

(assert (= (and b!383445 res!218352) b!383449))

(assert (= (and b!383449 res!218351) b!383458))

(assert (= (and b!383458 res!218354) b!383452))

(assert (= (and b!383452 res!218355) b!383451))

(assert (= (and b!383451 res!218356) b!383455))

(assert (= (and b!383455 res!218359) b!383447))

(assert (= (and b!383447 (not res!218353)) b!383457))

(assert (= (and b!383453 condMapEmpty!15552) mapIsEmpty!15552))

(assert (= (and b!383453 (not condMapEmpty!15552)) mapNonEmpty!15552))

(get-info :version)

(assert (= (and mapNonEmpty!15552 ((_ is ValueCellFull!4319) mapValue!15552)) b!383448))

(assert (= (and b!383453 ((_ is ValueCellFull!4319) mapDefault!15552)) b!383454))

(assert (= start!37536 b!383453))

(declare-fun m!380465 () Bool)

(assert (=> mapNonEmpty!15552 m!380465))

(declare-fun m!380467 () Bool)

(assert (=> b!383452 m!380467))

(declare-fun m!380469 () Bool)

(assert (=> b!383451 m!380469))

(declare-fun m!380471 () Bool)

(assert (=> b!383451 m!380471))

(declare-fun m!380473 () Bool)

(assert (=> b!383456 m!380473))

(declare-fun m!380475 () Bool)

(assert (=> start!37536 m!380475))

(declare-fun m!380477 () Bool)

(assert (=> start!37536 m!380477))

(declare-fun m!380479 () Bool)

(assert (=> start!37536 m!380479))

(declare-fun m!380481 () Bool)

(assert (=> b!383447 m!380481))

(declare-fun m!380483 () Bool)

(assert (=> b!383447 m!380483))

(declare-fun m!380485 () Bool)

(assert (=> b!383447 m!380485))

(declare-fun m!380487 () Bool)

(assert (=> b!383447 m!380487))

(declare-fun m!380489 () Bool)

(assert (=> b!383447 m!380489))

(declare-fun m!380491 () Bool)

(assert (=> b!383447 m!380491))

(declare-fun m!380493 () Bool)

(assert (=> b!383447 m!380493))

(declare-fun m!380495 () Bool)

(assert (=> b!383449 m!380495))

(declare-fun m!380497 () Bool)

(assert (=> b!383458 m!380497))

(declare-fun m!380499 () Bool)

(assert (=> b!383455 m!380499))

(declare-fun m!380501 () Bool)

(assert (=> b!383450 m!380501))

(declare-fun m!380503 () Bool)

(assert (=> b!383457 m!380503))

(check-sat (not b!383457) (not mapNonEmpty!15552) (not b!383452) (not b!383447) (not b!383451) (not b_next!8677) tp_is_empty!9325 (not b!383449) (not b!383450) (not b!383455) (not b!383456) (not start!37536) b_and!15933)
(check-sat b_and!15933 (not b_next!8677))
