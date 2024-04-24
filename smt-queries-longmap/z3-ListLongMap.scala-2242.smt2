; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!36900 () Bool)

(assert start!36900)

(declare-fun b_free!8041 () Bool)

(declare-fun b_next!8041 () Bool)

(assert (=> start!36900 (= b_free!8041 (not b_next!8041))))

(declare-fun tp!28838 () Bool)

(declare-fun b_and!15297 () Bool)

(assert (=> start!36900 (= tp!28838 b_and!15297)))

(declare-fun b!369790 () Bool)

(declare-fun e!225950 () Bool)

(declare-fun tp_is_empty!8689 () Bool)

(assert (=> b!369790 (= e!225950 tp_is_empty!8689)))

(declare-fun b!369791 () Bool)

(declare-fun res!207561 () Bool)

(declare-fun e!225947 () Bool)

(assert (=> b!369791 (=> (not res!207561) (not e!225947))))

(declare-datatypes ((array!21308 0))(
  ( (array!21309 (arr!10122 (Array (_ BitVec 32) (_ BitVec 64))) (size!10474 (_ BitVec 32))) )
))
(declare-fun _keys!658 () array!21308)

(declare-fun i!548 () (_ BitVec 32))

(assert (=> b!369791 (= res!207561 (or (= (select (arr!10122 _keys!658) i!548) #b1000000000000000000000000000000000000000000000000000000000000000) (= (select (arr!10122 _keys!658) i!548) #b0000000000000000000000000000000000000000000000000000000000000000)))))

(declare-fun b!369792 () Bool)

(declare-fun res!207564 () Bool)

(assert (=> b!369792 (=> (not res!207564) (not e!225947))))

(declare-fun k0!778 () (_ BitVec 64))

(declare-fun arrayContainsKey!0 (array!21308 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!369792 (= res!207564 (not (arrayContainsKey!0 _keys!658 k0!778 #b00000000000000000000000000000000)))))

(declare-fun res!207558 () Bool)

(assert (=> start!36900 (=> (not res!207558) (not e!225947))))

(declare-fun mask!970 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!36900 (= res!207558 (validMask!0 mask!970))))

(assert (=> start!36900 e!225947))

(declare-datatypes ((V!12691 0))(
  ( (V!12692 (val!4389 Int)) )
))
(declare-datatypes ((ValueCell!4001 0))(
  ( (ValueCellFull!4001 (v!6587 V!12691)) (EmptyCell!4001) )
))
(declare-datatypes ((array!21310 0))(
  ( (array!21311 (arr!10123 (Array (_ BitVec 32) ValueCell!4001)) (size!10475 (_ BitVec 32))) )
))
(declare-fun _values!506 () array!21310)

(declare-fun e!225946 () Bool)

(declare-fun array_inv!7512 (array!21310) Bool)

(assert (=> start!36900 (and (array_inv!7512 _values!506) e!225946)))

(assert (=> start!36900 tp!28838))

(assert (=> start!36900 true))

(assert (=> start!36900 tp_is_empty!8689))

(declare-fun array_inv!7513 (array!21308) Bool)

(assert (=> start!36900 (array_inv!7513 _keys!658)))

(declare-fun b!369793 () Bool)

(declare-fun e!225951 () Bool)

(assert (=> b!369793 (= e!225951 false)))

(declare-fun defaultEntry!514 () Int)

(declare-fun zeroValue!472 () V!12691)

(declare-fun lt!169848 () array!21308)

(declare-datatypes ((tuple2!5728 0))(
  ( (tuple2!5729 (_1!2875 (_ BitVec 64)) (_2!2875 V!12691)) )
))
(declare-datatypes ((List!5556 0))(
  ( (Nil!5553) (Cons!5552 (h!6408 tuple2!5728) (t!10698 List!5556)) )
))
(declare-datatypes ((ListLongMap!4643 0))(
  ( (ListLongMap!4644 (toList!2337 List!5556)) )
))
(declare-fun lt!169847 () ListLongMap!4643)

(declare-fun extraKeys!453 () (_ BitVec 32))

(declare-fun v!373 () V!12691)

(declare-fun minValue!472 () V!12691)

(declare-fun getCurrentListMapNoExtraKeys!646 (array!21308 array!21310 (_ BitVec 32) (_ BitVec 32) V!12691 V!12691 (_ BitVec 32) Int) ListLongMap!4643)

(assert (=> b!369793 (= lt!169847 (getCurrentListMapNoExtraKeys!646 lt!169848 (array!21311 (store (arr!10123 _values!506) i!548 (ValueCellFull!4001 v!373)) (size!10475 _values!506)) mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun lt!169849 () ListLongMap!4643)

(assert (=> b!369793 (= lt!169849 (getCurrentListMapNoExtraKeys!646 _keys!658 _values!506 mask!970 extraKeys!453 zeroValue!472 minValue!472 #b00000000000000000000000000000000 defaultEntry!514))))

(declare-fun b!369794 () Bool)

(declare-fun res!207557 () Bool)

(assert (=> b!369794 (=> (not res!207557) (not e!225947))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!369794 (= res!207557 (validKeyInArray!0 k0!778))))

(declare-fun b!369795 () Bool)

(declare-fun res!207562 () Bool)

(assert (=> b!369795 (=> (not res!207562) (not e!225947))))

(assert (=> b!369795 (= res!207562 (and (bvsge i!548 #b00000000000000000000000000000000) (bvslt i!548 (size!10474 _keys!658))))))

(declare-fun mapIsEmpty!14598 () Bool)

(declare-fun mapRes!14598 () Bool)

(assert (=> mapIsEmpty!14598 mapRes!14598))

(declare-fun b!369796 () Bool)

(declare-fun res!207566 () Bool)

(assert (=> b!369796 (=> (not res!207566) (not e!225947))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!21308 (_ BitVec 32)) Bool)

(assert (=> b!369796 (= res!207566 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!658 mask!970))))

(declare-fun b!369797 () Bool)

(declare-fun e!225948 () Bool)

(assert (=> b!369797 (= e!225948 tp_is_empty!8689)))

(declare-fun b!369798 () Bool)

(declare-fun res!207565 () Bool)

(assert (=> b!369798 (=> (not res!207565) (not e!225947))))

(declare-datatypes ((List!5557 0))(
  ( (Nil!5554) (Cons!5553 (h!6409 (_ BitVec 64)) (t!10699 List!5557)) )
))
(declare-fun arrayNoDuplicates!0 (array!21308 (_ BitVec 32) List!5557) Bool)

(assert (=> b!369798 (= res!207565 (arrayNoDuplicates!0 _keys!658 #b00000000000000000000000000000000 Nil!5554))))

(declare-fun b!369799 () Bool)

(declare-fun res!207559 () Bool)

(assert (=> b!369799 (=> (not res!207559) (not e!225947))))

(assert (=> b!369799 (= res!207559 (and (= (size!10475 _values!506) (bvadd #b00000000000000000000000000000001 mask!970)) (= (size!10474 _keys!658) (size!10475 _values!506)) (bvsge mask!970 #b00000000000000000000000000000000) (bvsge extraKeys!453 #b00000000000000000000000000000000) (bvsle extraKeys!453 #b00000000000000000000000000000011)))))

(declare-fun b!369800 () Bool)

(declare-fun res!207560 () Bool)

(assert (=> b!369800 (=> (not res!207560) (not e!225951))))

(assert (=> b!369800 (= res!207560 (arrayNoDuplicates!0 lt!169848 #b00000000000000000000000000000000 Nil!5554))))

(declare-fun b!369801 () Bool)

(assert (=> b!369801 (= e!225947 e!225951)))

(declare-fun res!207563 () Bool)

(assert (=> b!369801 (=> (not res!207563) (not e!225951))))

(assert (=> b!369801 (= res!207563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 lt!169848 mask!970))))

(assert (=> b!369801 (= lt!169848 (array!21309 (store (arr!10122 _keys!658) i!548 k0!778) (size!10474 _keys!658)))))

(declare-fun b!369802 () Bool)

(assert (=> b!369802 (= e!225946 (and e!225950 mapRes!14598))))

(declare-fun condMapEmpty!14598 () Bool)

(declare-fun mapDefault!14598 () ValueCell!4001)

(assert (=> b!369802 (= condMapEmpty!14598 (= (arr!10123 _values!506) ((as const (Array (_ BitVec 32) ValueCell!4001)) mapDefault!14598)))))

(declare-fun mapNonEmpty!14598 () Bool)

(declare-fun tp!28839 () Bool)

(assert (=> mapNonEmpty!14598 (= mapRes!14598 (and tp!28839 e!225948))))

(declare-fun mapValue!14598 () ValueCell!4001)

(declare-fun mapKey!14598 () (_ BitVec 32))

(declare-fun mapRest!14598 () (Array (_ BitVec 32) ValueCell!4001))

(assert (=> mapNonEmpty!14598 (= (arr!10123 _values!506) (store mapRest!14598 mapKey!14598 mapValue!14598))))

(assert (= (and start!36900 res!207558) b!369799))

(assert (= (and b!369799 res!207559) b!369796))

(assert (= (and b!369796 res!207566) b!369798))

(assert (= (and b!369798 res!207565) b!369795))

(assert (= (and b!369795 res!207562) b!369794))

(assert (= (and b!369794 res!207557) b!369791))

(assert (= (and b!369791 res!207561) b!369792))

(assert (= (and b!369792 res!207564) b!369801))

(assert (= (and b!369801 res!207563) b!369800))

(assert (= (and b!369800 res!207560) b!369793))

(assert (= (and b!369802 condMapEmpty!14598) mapIsEmpty!14598))

(assert (= (and b!369802 (not condMapEmpty!14598)) mapNonEmpty!14598))

(get-info :version)

(assert (= (and mapNonEmpty!14598 ((_ is ValueCellFull!4001) mapValue!14598)) b!369797))

(assert (= (and b!369802 ((_ is ValueCellFull!4001) mapDefault!14598)) b!369790))

(assert (= start!36900 b!369802))

(declare-fun m!366353 () Bool)

(assert (=> b!369798 m!366353))

(declare-fun m!366355 () Bool)

(assert (=> b!369794 m!366355))

(declare-fun m!366357 () Bool)

(assert (=> b!369792 m!366357))

(declare-fun m!366359 () Bool)

(assert (=> mapNonEmpty!14598 m!366359))

(declare-fun m!366361 () Bool)

(assert (=> b!369800 m!366361))

(declare-fun m!366363 () Bool)

(assert (=> b!369796 m!366363))

(declare-fun m!366365 () Bool)

(assert (=> start!36900 m!366365))

(declare-fun m!366367 () Bool)

(assert (=> start!36900 m!366367))

(declare-fun m!366369 () Bool)

(assert (=> start!36900 m!366369))

(declare-fun m!366371 () Bool)

(assert (=> b!369791 m!366371))

(declare-fun m!366373 () Bool)

(assert (=> b!369793 m!366373))

(declare-fun m!366375 () Bool)

(assert (=> b!369793 m!366375))

(declare-fun m!366377 () Bool)

(assert (=> b!369793 m!366377))

(declare-fun m!366379 () Bool)

(assert (=> b!369801 m!366379))

(declare-fun m!366381 () Bool)

(assert (=> b!369801 m!366381))

(check-sat (not b!369792) (not b!369793) (not b!369800) (not b_next!8041) b_and!15297 (not mapNonEmpty!14598) (not b!369798) tp_is_empty!8689 (not b!369801) (not b!369794) (not b!369796) (not start!36900))
(check-sat b_and!15297 (not b_next!8041))
