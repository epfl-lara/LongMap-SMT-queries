; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43520 () Bool)

(assert start!43520)

(declare-fun b_free!12313 () Bool)

(declare-fun b_next!12313 () Bool)

(assert (=> start!43520 (= b_free!12313 (not b_next!12313))))

(declare-fun tp!43222 () Bool)

(declare-fun b_and!21083 () Bool)

(assert (=> start!43520 (= tp!43222 b_and!21083)))

(declare-fun mapIsEmpty!22447 () Bool)

(declare-fun mapRes!22447 () Bool)

(assert (=> mapIsEmpty!22447 mapRes!22447))

(declare-fun b!482281 () Bool)

(declare-fun e!283813 () Bool)

(declare-fun tp_is_empty!13825 () Bool)

(assert (=> b!482281 (= e!283813 tp_is_empty!13825)))

(declare-fun b!482282 () Bool)

(declare-fun e!283812 () Bool)

(assert (=> b!482282 (= e!283812 tp_is_empty!13825)))

(declare-fun res!287525 () Bool)

(declare-fun e!283815 () Bool)

(assert (=> start!43520 (=> (not res!287525) (not e!283815))))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43520 (= res!287525 (validMask!0 mask!2352))))

(assert (=> start!43520 e!283815))

(assert (=> start!43520 true))

(assert (=> start!43520 tp_is_empty!13825))

(declare-datatypes ((V!19505 0))(
  ( (V!19506 (val!6960 Int)) )
))
(declare-datatypes ((ValueCell!6551 0))(
  ( (ValueCellFull!6551 (v!9254 V!19505)) (EmptyCell!6551) )
))
(declare-datatypes ((array!31296 0))(
  ( (array!31297 (arr!15050 (Array (_ BitVec 32) ValueCell!6551)) (size!15408 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31296)

(declare-fun e!283811 () Bool)

(declare-fun array_inv!10928 (array!31296) Bool)

(assert (=> start!43520 (and (array_inv!10928 _values!1516) e!283811)))

(assert (=> start!43520 tp!43222))

(declare-datatypes ((array!31298 0))(
  ( (array!31299 (arr!15051 (Array (_ BitVec 32) (_ BitVec 64))) (size!15409 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31298)

(declare-fun array_inv!10929 (array!31298) Bool)

(assert (=> start!43520 (array_inv!10929 _keys!1874)))

(declare-fun b!482283 () Bool)

(assert (=> b!482283 (= e!283811 (and e!283812 mapRes!22447))))

(declare-fun condMapEmpty!22447 () Bool)

(declare-fun mapDefault!22447 () ValueCell!6551)

(assert (=> b!482283 (= condMapEmpty!22447 (= (arr!15050 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6551)) mapDefault!22447)))))

(declare-fun b!482284 () Bool)

(assert (=> b!482284 (= e!283815 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun lt!218719 () Bool)

(declare-fun minValue!1458 () V!19505)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19505)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9052 0))(
  ( (tuple2!9053 (_1!4537 (_ BitVec 64)) (_2!4537 V!19505)) )
))
(declare-datatypes ((List!9120 0))(
  ( (Nil!9117) (Cons!9116 (h!9972 tuple2!9052) (t!15326 List!9120)) )
))
(declare-datatypes ((ListLongMap!7967 0))(
  ( (ListLongMap!7968 (toList!3999 List!9120)) )
))
(declare-fun contains!2631 (ListLongMap!7967 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2313 (array!31298 array!31296 (_ BitVec 32) (_ BitVec 32) V!19505 V!19505 (_ BitVec 32) Int) ListLongMap!7967)

(assert (=> b!482284 (= lt!218719 (contains!2631 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482285 () Bool)

(declare-fun res!287523 () Bool)

(assert (=> b!482285 (=> (not res!287523) (not e!283815))))

(declare-datatypes ((List!9121 0))(
  ( (Nil!9118) (Cons!9117 (h!9973 (_ BitVec 64)) (t!15327 List!9121)) )
))
(declare-fun arrayNoDuplicates!0 (array!31298 (_ BitVec 32) List!9121) Bool)

(assert (=> b!482285 (= res!287523 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9118))))

(declare-fun b!482286 () Bool)

(declare-fun res!287526 () Bool)

(assert (=> b!482286 (=> (not res!287526) (not e!283815))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31298 (_ BitVec 32)) Bool)

(assert (=> b!482286 (= res!287526 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482287 () Bool)

(declare-fun res!287524 () Bool)

(assert (=> b!482287 (=> (not res!287524) (not e!283815))))

(assert (=> b!482287 (= res!287524 (and (= (size!15408 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15409 _keys!1874) (size!15408 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22447 () Bool)

(declare-fun tp!43221 () Bool)

(assert (=> mapNonEmpty!22447 (= mapRes!22447 (and tp!43221 e!283813))))

(declare-fun mapValue!22447 () ValueCell!6551)

(declare-fun mapKey!22447 () (_ BitVec 32))

(declare-fun mapRest!22447 () (Array (_ BitVec 32) ValueCell!6551))

(assert (=> mapNonEmpty!22447 (= (arr!15050 _values!1516) (store mapRest!22447 mapKey!22447 mapValue!22447))))

(assert (= (and start!43520 res!287525) b!482287))

(assert (= (and b!482287 res!287524) b!482286))

(assert (= (and b!482286 res!287526) b!482285))

(assert (= (and b!482285 res!287523) b!482284))

(assert (= (and b!482283 condMapEmpty!22447) mapIsEmpty!22447))

(assert (= (and b!482283 (not condMapEmpty!22447)) mapNonEmpty!22447))

(get-info :version)

(assert (= (and mapNonEmpty!22447 ((_ is ValueCellFull!6551) mapValue!22447)) b!482281))

(assert (= (and b!482283 ((_ is ValueCellFull!6551) mapDefault!22447)) b!482282))

(assert (= start!43520 b!482283))

(declare-fun m!463801 () Bool)

(assert (=> b!482284 m!463801))

(assert (=> b!482284 m!463801))

(declare-fun m!463803 () Bool)

(assert (=> b!482284 m!463803))

(declare-fun m!463805 () Bool)

(assert (=> mapNonEmpty!22447 m!463805))

(declare-fun m!463807 () Bool)

(assert (=> b!482285 m!463807))

(declare-fun m!463809 () Bool)

(assert (=> start!43520 m!463809))

(declare-fun m!463811 () Bool)

(assert (=> start!43520 m!463811))

(declare-fun m!463813 () Bool)

(assert (=> start!43520 m!463813))

(declare-fun m!463815 () Bool)

(assert (=> b!482286 m!463815))

(check-sat (not start!43520) (not b!482286) (not b!482285) tp_is_empty!13825 (not mapNonEmpty!22447) (not b_next!12313) (not b!482284) b_and!21083)
(check-sat b_and!21083 (not b_next!12313))
