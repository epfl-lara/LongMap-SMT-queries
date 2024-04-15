; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36900 () Bool)

(assert start!36900)

(declare-fun b_free!8041 () Bool)

(declare-fun b_next!8041 () Bool)

(assert (=> start!36900 (= b_free!8041 (not b_next!8041))))

(declare-fun tp!28838 () Bool)

(declare-fun b_and!15257 () Bool)

(assert (=> start!36900 (= tp!28838 b_and!15257)))

(declare-fun b!369568 () Bool)

(declare-fun e!225807 () Bool)

(declare-fun e!225804 () Bool)

(declare-fun mapRes!14598 () Bool)

(assert (=> b!369568 (= e!225807 (and e!225804 mapRes!14598))))

(declare-fun condMapEmpty!14598 () Bool)

(declare-datatypes ((V!12691 0))(
  ( (V!12692 (val!4389 Int)) )
))
(declare-datatypes ((ValueCell!4001 0))(
  ( (ValueCellFull!4001 (v!6580 V!12691)) (EmptyCell!4001) )
))
(declare-datatypes ((array!21313 0))(
  ( (array!21314 (arr!10125 (Array (_ BitVec 32) ValueCell!4001)) (size!10478 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21313)

(declare-fun mapDefault!14598 () ValueCell!4001)

(assert (=> b!369568 (= condMapEmpty!14598 (= (arr!10125 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4001)) mapDefault!14598)))))

(declare-fun b!369569 () Bool)

(declare-fun res!207435 () Bool)

(declare-fun e!225808 () Bool)

(assert (=> b!369569 (=> (not res!207435) (not e!225808))))

(declare-datatypes ((array!21315 0))(
  ( (array!21316 (arr!10126 (Array (_ BitVec 32) (_ BitVec 64))) (size!10479 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21315)

(declare-datatypes ((List!5623 0))(
  ( (Nil!5620) (Cons!5619 (h!6475 (_ BitVec 64)) (t!10764 List!5623)) )
))
(declare-fun arrayNoDuplicates!0 (array!21315 (_ BitVec 32) List!5623) Bool)

(assert (=> b!369569 (= res!207435 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5620))))

(declare-fun mapNonEmpty!14598 () Bool)

(declare-fun tp!28839 () Bool)

(declare-fun e!225809 () Bool)

(assert (=> mapNonEmpty!14598 (= mapRes!14598 (and tp!28839 e!225809))))

(declare-fun mapKey!14598 () (_ BitVec 32))

(declare-fun mapRest!14598 () (Array (_ BitVec 32) ValueCell!4001))

(declare-fun mapValue!14598 () ValueCell!4001)

(assert (=> mapNonEmpty!14598 (= (arr!10125 _values!506) (store mapRest!14598 mapKey!14598 mapValue!14598))))

(declare-fun mapIsEmpty!14598 () Bool)

(assert (=> mapIsEmpty!14598 mapRes!14598))

(declare-fun b!369570 () Bool)

(declare-fun res!207439 () Bool)

(assert (=> b!369570 (=> (not res!207439) (not e!225808))))

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369570 (= res!207439 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10479 _keys!658))))))

(declare-fun res!207437 () Bool)

(assert (=> start!36900 (=> (not res!207437) (not e!225808))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36900 (= res!207437 (validMask!0 mask!970))))

(assert (=> start!36900 e!225808))

(declare-fun array_inv!7492 (array!21313) Bool)

(assert (=> start!36900 (and (array_inv!7492 _values!506) e!225807)))

(assert (=> start!36900 tp!28838))

(assert (=> start!36900 true))

(declare-fun tp_is_empty!8689 () Bool)

(assert (=> start!36900 tp_is_empty!8689))

(declare-fun array_inv!7493 (array!21315) Bool)

(assert (=> start!36900 (array_inv!7493 _keys!658)))

(declare-fun b!369571 () Bool)

(declare-fun e!225805 () Bool)

(assert (=> b!369571 (= e!225808 e!225805)))

(declare-fun res!207436 () Bool)

(assert (=> b!369571 (=> (not res!207436) (not e!225805))))

(declare-fun lt!169596 () array!21315)

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21315 (_ BitVec 32)) Bool)

(assert (=> b!369571 (= res!207436 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169596 mask!970))))

(declare-fun k0!778 () (_ BitVec 64))

(assert (=> b!369571 (= lt!169596 (array!21316 (store (arr!10126 _keys!658) i!548 k0!778) (size!10479 _keys!658)))))

(declare-fun b!369572 () Bool)

(assert (=> b!369572 (= e!225809 tp_is_empty!8689)))

(declare-fun b!369573 () Bool)

(declare-fun res!207438 () Bool)

(assert (=> b!369573 (=> (not res!207438) (not e!225808))))

(assert (=> b!369573 (= res!207438 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369574 () Bool)

(declare-fun res!207431 () Bool)

(assert (=> b!369574 (=> (not res!207431) (not e!225808))))

(declare-fun extraKeys!453 () (_ BitVec 32))

(assert (=> b!369574 (= res!207431 (and (= (size!10478 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10479 _keys!658) (size!10478 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369575 () Bool)

(assert (=> b!369575 (= e!225804 tp_is_empty!8689)))

(declare-fun b!369576 () Bool)

(declare-fun res!207434 () Bool)

(assert (=> b!369576 (=> (not res!207434) (not e!225808))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369576 (= res!207434 (validKeyInArray!0 k0!778))))

(declare-fun b!369577 () Bool)

(declare-fun res!207440 () Bool)

(assert (=> b!369577 (=> (not res!207440) (not e!225808))))

(assert (=> b!369577 (= res!207440 (or (= (select (arr!10126 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10126 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369578 () Bool)

(declare-fun res!207432 () Bool)

(assert (=> b!369578 (=> (not res!207432) (not e!225808))))

(declare-fun arrayContainsKey!0 (array!21315 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369578 (= res!207432 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun b!369579 () Bool)

(declare-fun res!207433 () Bool)

(assert (=> b!369579 (=> (not res!207433) (not e!225805))))

(assert (=> b!369579 (= res!207433 (arrayNoDuplicates!0 lt!169596 #b00000000000000000000000000000000 Nil!5620))))

(declare-fun b!369580 () Bool)

(assert (=> b!369580 (= e!225805 false)))

(declare-datatypes ((tuple2!5792 0))(
  ( (tuple2!5793 (_1!2907 (_ BitVec 64)) (_2!2907 V!12691)) )
))
(declare-datatypes ((List!5624 0))(
  ( (Nil!5621) (Cons!5620 (h!6476 tuple2!5792) (t!10765 List!5624)) )
))
(declare-datatypes ((ListLongMap!4695 0))(
  ( (ListLongMap!4696 (toList!2363 List!5624)) )
))
(declare-fun lt!169595 () ListLongMap!4695)

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12691)

(declare-fun v!373 () V!12691)

(declare-fun minValue!472 () V!12691)

(declare-fun getCurrentListMapNoExtraKeys!654 (array!21315 array!21313 (_ BitVec 32) (_ BitVec 32) V!12691 V!12691 (_ BitVec 32) Int) ListLongMap!4695)

(assert (=> b!369580 (= lt!169595 (getCurrentListMapNoExtraKeys!654 lt!169596 (array!21314 (store (arr!10125 _values!506) i!548 (ValueCellFull!4001 v!373)) (size!10478 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169594 () ListLongMap!4695)

(assert (=> b!369580 (= lt!169594 (getCurrentListMapNoExtraKeys!654 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(assert (= (and start!36900 res!207437) b!369574))

(assert (= (and b!369574 res!207431) b!369573))

(assert (= (and b!369573 res!207438) b!369569))

(assert (= (and b!369569 res!207435) b!369570))

(assert (= (and b!369570 res!207439) b!369576))

(assert (= (and b!369576 res!207434) b!369577))

(assert (= (and b!369577 res!207440) b!369578))

(assert (= (and b!369578 res!207432) b!369571))

(assert (= (and b!369571 res!207436) b!369579))

(assert (= (and b!369579 res!207433) b!369580))

(assert (= (and b!369568 condMapEmpty!14598) mapIsEmpty!14598))

(assert (= (and b!369568 (not condMapEmpty!14598)) mapNonEmpty!14598))

(get-info :version)

(assert (= (and mapNonEmpty!14598 ((_ is ValueCellFull!4001) mapValue!14598)) b!369572))

(assert (= (and b!369568 ((_ is ValueCellFull!4001) mapDefault!14598)) b!369575))

(assert (= start!36900 b!369568))

(declare-fun m!365399 () Bool)

(assert (=> b!369580 m!365399))

(declare-fun m!365401 () Bool)

(assert (=> b!369580 m!365401))

(declare-fun m!365403 () Bool)

(assert (=> b!369580 m!365403))

(declare-fun m!365405 () Bool)

(assert (=> b!369573 m!365405))

(declare-fun m!365407 () Bool)

(assert (=> b!369578 m!365407))

(declare-fun m!365409 () Bool)

(assert (=> b!369569 m!365409))

(declare-fun m!365411 () Bool)

(assert (=> mapNonEmpty!14598 m!365411))

(declare-fun m!365413 () Bool)

(assert (=> b!369577 m!365413))

(declare-fun m!365415 () Bool)

(assert (=> b!369571 m!365415))

(declare-fun m!365417 () Bool)

(assert (=> b!369571 m!365417))

(declare-fun m!365419 () Bool)

(assert (=> start!36900 m!365419))

(declare-fun m!365421 () Bool)

(assert (=> start!36900 m!365421))

(declare-fun m!365423 () Bool)

(assert (=> start!36900 m!365423))

(declare-fun m!365425 () Bool)

(assert (=> b!369576 m!365425))

(declare-fun m!365427 () Bool)

(assert (=> b!369579 m!365427))

(check-sat tp_is_empty!8689 (not b!369580) (not start!36900) (not b!369579) (not b_next!8041) (not b!369571) (not b!369569) (not mapNonEmpty!14598) b_and!15257 (not b!369576) (not b!369578) (not b!369573))
(check-sat b_and!15257 (not b_next!8041))
