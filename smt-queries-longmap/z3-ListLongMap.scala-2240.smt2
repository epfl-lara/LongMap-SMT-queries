; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36888 () Bool)

(assert start!36888)

(declare-fun b_free!8029 () Bool)

(declare-fun b_next!8029 () Bool)

(assert (=> start!36888 (= b_free!8029 (not b_next!8029))))

(declare-fun tp!28802 () Bool)

(declare-fun b_and!15285 () Bool)

(assert (=> start!36888 (= tp!28802 b_and!15285)))

(declare-fun b!369556 () Bool)

(declare-fun res!207384 () Bool)

(declare-fun e!225838 () Bool)

(assert (=> b!369556 (=> (not res!207384) (not e!225838))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-datatypes ((V!12675 0))(
  ( (V!12676 (val!4383 Int)) )
))
(declare-datatypes ((ValueCell!3995 0))(
  ( (ValueCellFull!3995 (v!6581 V!12675)) (EmptyCell!3995) )
))
(declare-datatypes ((array!21286 0))(
  ( (array!21287 (arr!10111 (Array (_ BitVec 32) ValueCell!3995)) (size!10463 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21286)

(declare-datatypes ((array!21288 0))(
  ( (array!21289 (arr!10112 (Array (_ BitVec 32) (_ BitVec 64))) (size!10464 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21288)

(declare-fun mask!970 () (_ BitVec 32))

(assert (=> b!369556 (= res!207384 (and (= (size!10463 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10464 _keys!658) (size!10463 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369557 () Bool)

(declare-fun res!207377 () Bool)

(assert (=> b!369557 (=> (not res!207377) (not e!225838))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21288 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369557 (= res!207377 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun mapIsEmpty!14580 () Bool)

(declare-fun mapRes!14580 () Bool)

(assert (=> mapIsEmpty!14580 mapRes!14580))

(declare-fun b!369558 () Bool)

(declare-fun res!207381 () Bool)

(assert (=> b!369558 (=> (not res!207381) (not e!225838))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369558 (= res!207381 (validKeyInArray!0 k0!778))))

(declare-fun b!369559 () Bool)

(declare-fun e!225841 () Bool)

(declare-fun tp_is_empty!8677 () Bool)

(assert (=> b!369559 (= e!225841 tp_is_empty!8677)))

(declare-fun b!369560 () Bool)

(declare-fun e!225840 () Bool)

(assert (=> b!369560 (= e!225840 false)))

(declare-fun lt!169795 () array!21288)

(declare-fun defaultEntry!514 () Int)

(declare-fun v!373 () V!12675)

(declare-datatypes ((tuple2!5722 0))(
  ( (tuple2!5723 (_1!2872 (_ BitVec 64)) (_2!2872 V!12675)) )
))
(declare-datatypes ((List!5550 0))(
  ( (Nil!5547) (Cons!5546 (h!6402 tuple2!5722) (t!10692 List!5550)) )
))
(declare-datatypes ((ListLongMap!4637 0))(
  ( (ListLongMap!4638 (toList!2334 List!5550)) )
))
(declare-fun lt!169793 () ListLongMap!4637)

(declare-fun zeroValue!472 () V!12675)

(declare-fun i!548 () (_ BitVec 32))

(declare-fun minValue!472 () V!12675)

(declare-fun getCurrentListMapNoExtraKeys!643 (array!21288 array!21286 (_ BitVec 32) (_ BitVec 32) V!12675 V!12675 (_ BitVec 32) Int) ListLongMap!4637)

(assert (=> b!369560 (= lt!169793 (getCurrentListMapNoExtraKeys!643 lt!169795 (array!21287 (store (arr!10111 _values!506) i!548 (ValueCellFull!3995 v!373)) (size!10463 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169794 () ListLongMap!4637)

(assert (=> b!369560 (= lt!169794 (getCurrentListMapNoExtraKeys!643 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369561 () Bool)

(declare-fun e!225843 () Bool)

(assert (=> b!369561 (= e!225843 (and e!225841 mapRes!14580))))

(declare-fun condMapEmpty!14580 () Bool)

(declare-fun mapDefault!14580 () ValueCell!3995)

(assert (=> b!369561 (= condMapEmpty!14580 (= (arr!10111 _values!506) ((as const (Array (_ BitVec 32) ValueCell!3995)) mapDefault!14580)))))

(declare-fun mapNonEmpty!14580 () Bool)

(declare-fun tp!28803 () Bool)

(declare-fun e!225842 () Bool)

(assert (=> mapNonEmpty!14580 (= mapRes!14580 (and tp!28803 e!225842))))

(declare-fun mapRest!14580 () (Array (_ BitVec 32) ValueCell!3995))

(declare-fun mapValue!14580 () ValueCell!3995)

(declare-fun mapKey!14580 () (_ BitVec 32))

(assert (=> mapNonEmpty!14580 (= (arr!10111 _values!506) (store mapRest!14580 mapKey!14580 mapValue!14580))))

(declare-fun res!207386 () Bool)

(assert (=> start!36888 (=> (not res!207386) (not e!225838))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36888 (= res!207386 (validMask!0 mask!970))))

(assert (=> start!36888 e!225838))

(declare-fun array_inv!7502 (array!21286) Bool)

(assert (=> start!36888 (and (array_inv!7502 _values!506) e!225843)))

(assert (=> start!36888 tp!28802))

(assert (=> start!36888 true))

(assert (=> start!36888 tp_is_empty!8677))

(declare-fun array_inv!7503 (array!21288) Bool)

(assert (=> start!36888 (array_inv!7503 _keys!658)))

(declare-fun b!369562 () Bool)

(assert (=> b!369562 (= e!225838 e!225840)))

(declare-fun res!207378 () Bool)

(assert (=> b!369562 (=> (not res!207378) (not e!225840))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21288 (_ BitVec 32)) Bool)

(assert (=> b!369562 (= res!207378 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169795 mask!970))))

(assert (=> b!369562 (= lt!169795 (array!21289 (store (arr!10112 _keys!658) i!548 k0!778) (size!10464 _keys!658)))))

(declare-fun b!369563 () Bool)

(declare-fun res!207383 () Bool)

(assert (=> b!369563 (=> (not res!207383) (not e!225838))))

(assert (=> b!369563 (= res!207383 (or (= (select (arr!10112 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10112 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369564 () Bool)

(declare-fun res!207382 () Bool)

(assert (=> b!369564 (=> (not res!207382) (not e!225838))))

(assert (=> b!369564 (= res!207382 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369565 () Bool)

(assert (=> b!369565 (= e!225842 tp_is_empty!8677)))

(declare-fun b!369566 () Bool)

(declare-fun res!207380 () Bool)

(assert (=> b!369566 (=> (not res!207380) (not e!225838))))

(declare-datatypes ((List!5551 0))(
  ( (Nil!5548) (Cons!5547 (h!6403 (_ BitVec 64)) (t!10693 List!5551)) )
))
(declare-fun arrayNoDuplicates!0 (array!21288 (_ BitVec 32) List!5551) Bool)

(assert (=> b!369566 (= res!207380 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5548))))

(declare-fun b!369567 () Bool)

(declare-fun res!207379 () Bool)

(assert (=> b!369567 (=> (not res!207379) (not e!225840))))

(assert (=> b!369567 (= res!207379 (arrayNoDuplicates!0 lt!169795 #b00000000000000000000000000000000 Nil!5548))))

(declare-fun b!369568 () Bool)

(declare-fun res!207385 () Bool)

(assert (=> b!369568 (=> (not res!207385) (not e!225838))))

(assert (=> b!369568 (= res!207385 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10464 _keys!658))))))

(assert (= (and start!36888 res!207386) b!369556))

(assert (= (and b!369556 res!207384) b!369564))

(assert (= (and b!369564 res!207382) b!369566))

(assert (= (and b!369566 res!207380) b!369568))

(assert (= (and b!369568 res!207385) b!369558))

(assert (= (and b!369558 res!207381) b!369563))

(assert (= (and b!369563 res!207383) b!369557))

(assert (= (and b!369557 res!207377) b!369562))

(assert (= (and b!369562 res!207378) b!369567))

(assert (= (and b!369567 res!207379) b!369560))

(assert (= (and b!369561 condMapEmpty!14580) mapIsEmpty!14580))

(assert (= (and b!369561 (not condMapEmpty!14580)) mapNonEmpty!14580))

(get-info :version)

(assert (= (and mapNonEmpty!14580 ((_ is ValueCellFull!3995) mapValue!14580)) b!369565))

(assert (= (and b!369561 ((_ is ValueCellFull!3995) mapDefault!14580)) b!369559))

(assert (= start!36888 b!369561))

(declare-fun m!366173 () Bool)

(assert (=> b!369564 m!366173))

(declare-fun m!366175 () Bool)

(assert (=> b!369563 m!366175))

(declare-fun m!366177 () Bool)

(assert (=> b!369558 m!366177))

(declare-fun m!366179 () Bool)

(assert (=> b!369566 m!366179))

(declare-fun m!366181 () Bool)

(assert (=> b!369560 m!366181))

(declare-fun m!366183 () Bool)

(assert (=> b!369560 m!366183))

(declare-fun m!366185 () Bool)

(assert (=> b!369560 m!366185))

(declare-fun m!366187 () Bool)

(assert (=> b!369562 m!366187))

(declare-fun m!366189 () Bool)

(assert (=> b!369562 m!366189))

(declare-fun m!366191 () Bool)

(assert (=> start!36888 m!366191))

(declare-fun m!366193 () Bool)

(assert (=> start!36888 m!366193))

(declare-fun m!366195 () Bool)

(assert (=> start!36888 m!366195))

(declare-fun m!366197 () Bool)

(assert (=> b!369557 m!366197))

(declare-fun m!366199 () Bool)

(assert (=> mapNonEmpty!14580 m!366199))

(declare-fun m!366201 () Bool)

(assert (=> b!369567 m!366201))

(check-sat (not b!369557) (not b!369562) (not b!369564) b_and!15285 (not mapNonEmpty!14580) tp_is_empty!8677 (not start!36888) (not b!369566) (not b!369558) (not b!369560) (not b_next!8029) (not b!369567))
(check-sat b_and!15285 (not b_next!8029))
