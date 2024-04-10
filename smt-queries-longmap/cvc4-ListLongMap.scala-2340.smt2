; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!37506 () Bool)

(assert start!37506)

(declare-fun b_free!8633 () Bool)

(declare-fun b_next!8633 () Bool)

(assert (=> start!37506 (= b_free!8633 (not b_next!8633))))

(declare-fun tp!30614 () Bool)

(declare-fun b_and!15875 () Bool)

(assert (=> start!37506 (= tp!30614 b_and!15875)))

(declare-fun b!382570 () Bool)

(declare-fun res!217628 () Bool)

(declare-fun e!232468 () Bool)

(assert (=> b!382570 (=> (not res!217628) (not e!232468))))

(declare-fun i!548 () (_ BitVec 32))

(declare-datatypes ((array!22471 0))(
  ( (array!22472 (arr!10704 (Array (_ BitVec 32) (_ BitVec 64))) (size!11056 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!22471)

(assert (=> b!382570 (= res!217628 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!11056 _keys!658))))))

(declare-fun b!382571 () Bool)

(declare-fun e!232469 () Bool)

(assert (=> b!382571 (= e!232468 e!232469)))

(declare-fun res!217635 () Bool)

(assert (=> b!382571 (=> (not res!217635) (not e!232469))))

(declare-fun lt!179508 () array!22471)

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!22471 (_ BitVec 32)) Bool)

(assert (=> b!382571 (= res!217635 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!179508 mask!970))))

(declare-fun k!778 () (_ BitVec 64))

(assert (=> b!382571 (= lt!179508 (array!22472 (store (arr!10704 _keys!658) i!548 k!778) (size!11056 _keys!658)))))

(declare-fun b!382572 () Bool)

(declare-fun res!217630 () Bool)

(assert (=> b!382572 (=> (not res!217630) (not e!232468))))

(assert (=> b!382572 (= res!217630 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!382573 () Bool)

(declare-fun res!217636 () Bool)

(assert (=> b!382573 (=> (not res!217636) (not e!232468))))

(declare-datatypes ((List!6131 0))(
  ( (Nil!6128) (Cons!6127 (h!6983 (_ BitVec 64)) (t!11281 List!6131)) )
))
(declare-fun arrayNoDuplicates!0 (array!22471 (_ BitVec 32) List!6131) Bool)

(assert (=> b!382573 (= res!217636 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!6128))))

(declare-fun mapIsEmpty!15486 () Bool)

(declare-fun mapRes!15486 () Bool)

(assert (=> mapIsEmpty!15486 mapRes!15486))

(declare-fun b!382575 () Bool)

(declare-fun res!217629 () Bool)

(assert (=> b!382575 (=> (not res!217629) (not e!232468))))

(assert (=> b!382575 (= res!217629 (or (= (select (arr!10704 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10704 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!382576 () Bool)

(declare-fun res!217632 () Bool)

(assert (=> b!382576 (=> (not res!217632) (not e!232469))))

(assert (=> b!382576 (= res!217632 (arrayNoDuplicates!0 lt!179508 #b00000000000000000000000000000000 Nil!6128))))

(declare-fun mapNonEmpty!15486 () Bool)

(declare-fun tp!30615 () Bool)

(declare-fun e!232472 () Bool)

(assert (=> mapNonEmpty!15486 (= mapRes!15486 (and tp!30615 e!232472))))

(declare-datatypes ((V!13479 0))(
  ( (V!13480 (val!4685 Int)) )
))
(declare-datatypes ((ValueCell!4297 0))(
  ( (ValueCellFull!4297 (v!6882 V!13479)) (EmptyCell!4297) )
))
(declare-fun mapRest!15486 () (Array (_ BitVec 32) ValueCell!4297))

(declare-datatypes ((array!22473 0))(
  ( (array!22474 (arr!10705 (Array (_ BitVec 32) ValueCell!4297)) (size!11057 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!22473)

(declare-fun mapKey!15486 () (_ BitVec 32))

(declare-fun mapValue!15486 () ValueCell!4297)

(assert (=> mapNonEmpty!15486 (= (arr!10705 _values!506) (store mapRest!15486 mapKey!15486 mapValue!15486))))

(declare-fun b!382577 () Bool)

(declare-fun res!217631 () Bool)

(assert (=> b!382577 (=> (not res!217631) (not e!232468))))

(declare-fun arrayContainsKey!0 (array!22471 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!382577 (= res!217631 (not (arrayContainsKey!0 _keys!658 k!778 #b00000000000000000000000000000000)))))

(declare-fun b!382578 () Bool)

(declare-fun res!217627 () Bool)

(assert (=> b!382578 (=> (not res!217627) (not e!232468))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!382578 (= res!217627 (and (= (size!11057 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!11056 _keys!658) (size!11057 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!382579 () Bool)

(declare-fun e!232471 () Bool)

(assert (=> b!382579 (= e!232469 (not e!232471))))

(declare-fun res!217634 () Bool)

(assert (=> b!382579 (=> res!217634 e!232471)))

(declare-fun lt!179512 () Bool)

(assert (=> b!382579 (= res!217634 (or (and (not lt!179512) (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000))) (and (not lt!179512) (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (and (not (= (bvand extraKeys!453 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) lt!179512)))))

(assert (=> b!382579 (= lt!179512 (= (bvand extraKeys!453 #b00000000000000000000000000000001) #b00000000000000000000000000000000))))

(declare-fun defaultEntry!514 () Int)

(declare-datatypes ((tuple2!6300 0))(
  ( (tuple2!6301 (_1!3161 (_ BitVec 64)) (_2!3161 V!13479)) )
))
(declare-datatypes ((List!6132 0))(
  ( (Nil!6129) (Cons!6128 (h!6984 tuple2!6300) (t!11282 List!6132)) )
))
(declare-datatypes ((ListLongMap!5213 0))(
  ( (ListLongMap!5214 (toList!2622 List!6132)) )
))
(declare-fun lt!179506 () ListLongMap!5213)

(declare-fun zeroValue!472 () V!13479)

(declare-fun minValue!472 () V!13479)

(declare-fun getCurrentListMap!2027 (array!22471 array!22473 (_ BitVec 32) (_ BitVec 32) V!13479 V!13479 (_ BitVec 32) Int) ListLongMap!5213)

(assert (=> b!382579 (= lt!179506 (getCurrentListMap!2027 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179514 () ListLongMap!5213)

(declare-fun lt!179509 () array!22473)

(assert (=> b!382579 (= lt!179514 (getCurrentListMap!2027 lt!179508 lt!179509 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!179511 () ListLongMap!5213)

(declare-fun lt!179513 () ListLongMap!5213)

(assert (=> b!382579 (and (= lt!179511 lt!179513) (= lt!179513 lt!179511))))

(declare-fun v!373 () V!13479)

(declare-fun lt!179507 () ListLongMap!5213)

(declare-fun +!957 (ListLongMap!5213 tuple2!6300) ListLongMap!5213)

(assert (=> b!382579 (= lt!179513 (+!957 lt!179507 (tuple2!6301 k!778 v!373)))))

(declare-datatypes ((Unit!11808 0))(
  ( (Unit!11809) )
))
(declare-fun lt!179510 () Unit!11808)

(declare-fun lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!185 (array!22471 array!22473 (_ BitVec 32) (_ BitVec 32) V!13479 V!13479 (_ BitVec 32) (_ BitVec 64) V!13479 (_ BitVec 32) Int) Unit!11808)

(assert (=> b!382579 (= lt!179510 (lemmaAddValidKeyToArrayThenMapNoExtrasAddPair!185 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 i!548 k!778 v!373 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun getCurrentListMapNoExtraKeys!861 (array!22471 array!22473 (_ BitVec 32) (_ BitVec 32) V!13479 V!13479 (_ BitVec 32) Int) ListLongMap!5213)

(assert (=> b!382579 (= lt!179511 (getCurrentListMapNoExtraKeys!861 lt!179508 lt!179509 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (=> b!382579 (= lt!179509 (array!22474 (store (arr!10705 _values!506) i!548 (ValueCellFull!4297 v!373)) (size!11057 _values!506)))))

(assert (=> b!382579 (= lt!179507 (getCurrentListMapNoExtraKeys!861 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!382580 () Bool)

(declare-fun e!232470 () Bool)

(declare-fun tp_is_empty!9281 () Bool)

(assert (=> b!382580 (= e!232470 tp_is_empty!9281)))

(declare-fun b!382581 () Bool)

(assert (=> b!382581 (= e!232471 true)))

(assert (=> b!382581 (= lt!179514 lt!179511)))

(declare-fun res!217633 () Bool)

(assert (=> start!37506 (=> (not res!217633) (not e!232468))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!37506 (= res!217633 (validMask!0 mask!970))))

(assert (=> start!37506 e!232468))

(declare-fun e!232466 () Bool)

(declare-fun array_inv!7882 (array!22473) Bool)

(assert (=> start!37506 (and (array_inv!7882 _values!506) e!232466)))

(assert (=> start!37506 tp!30614))

(assert (=> start!37506 true))

(assert (=> start!37506 tp_is_empty!9281))

(declare-fun array_inv!7883 (array!22471) Bool)

(assert (=> start!37506 (array_inv!7883 _keys!658)))

(declare-fun b!382574 () Bool)

(declare-fun res!217637 () Bool)

(assert (=> b!382574 (=> (not res!217637) (not e!232468))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!382574 (= res!217637 (validKeyInArray!0 k!778))))

(declare-fun b!382582 () Bool)

(assert (=> b!382582 (= e!232466 (and e!232470 mapRes!15486))))

(declare-fun condMapEmpty!15486 () Bool)

(declare-fun mapDefault!15486 () ValueCell!4297)

