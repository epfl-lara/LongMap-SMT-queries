; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43524 () Bool)

(assert start!43524)

(declare-fun b_free!12303 () Bool)

(declare-fun b_next!12303 () Bool)

(assert (=> start!43524 (= b_free!12303 (not b_next!12303))))

(declare-fun tp!43191 () Bool)

(declare-fun b_and!21063 () Bool)

(assert (=> start!43524 (= tp!43191 b_and!21063)))

(declare-fun b!482237 () Bool)

(declare-fun e!283778 () Bool)

(declare-fun tp_is_empty!13815 () Bool)

(assert (=> b!482237 (= e!283778 tp_is_empty!13815)))

(declare-fun mapIsEmpty!22432 () Bool)

(declare-fun mapRes!22432 () Bool)

(assert (=> mapIsEmpty!22432 mapRes!22432))

(declare-fun b!482239 () Bool)

(declare-fun e!283776 () Bool)

(declare-fun e!283775 () Bool)

(assert (=> b!482239 (= e!283776 (and e!283775 mapRes!22432))))

(declare-fun condMapEmpty!22432 () Bool)

(declare-datatypes ((V!19491 0))(
  ( (V!19492 (val!6955 Int)) )
))
(declare-datatypes ((ValueCell!6546 0))(
  ( (ValueCellFull!6546 (v!9248 V!19491)) (EmptyCell!6546) )
))
(declare-datatypes ((array!31289 0))(
  ( (array!31290 (arr!15047 (Array (_ BitVec 32) ValueCell!6546)) (size!15405 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31289)

(declare-fun mapDefault!22432 () ValueCell!6546)

(assert (=> b!482239 (= condMapEmpty!22432 (= (arr!15047 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6546)) mapDefault!22432)))))

(declare-fun b!482240 () Bool)

(assert (=> b!482240 (= e!283775 tp_is_empty!13815)))

(declare-fun b!482241 () Bool)

(declare-fun e!283777 () Bool)

(assert (=> b!482241 (= e!283777 false)))

(declare-fun minValue!1458 () V!19491)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun zeroValue!1458 () V!19491)

(declare-fun lt!218692 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((array!31291 0))(
  ( (array!31292 (arr!15048 (Array (_ BitVec 32) (_ BitVec 64))) (size!15406 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31291)

(declare-datatypes ((tuple2!9128 0))(
  ( (tuple2!9129 (_1!4575 (_ BitVec 64)) (_2!4575 V!19491)) )
))
(declare-datatypes ((List!9208 0))(
  ( (Nil!9205) (Cons!9204 (h!10060 tuple2!9128) (t!15422 List!9208)) )
))
(declare-datatypes ((ListLongMap!8041 0))(
  ( (ListLongMap!8042 (toList!4036 List!9208)) )
))
(declare-fun contains!2650 (ListLongMap!8041 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2355 (array!31291 array!31289 (_ BitVec 32) (_ BitVec 32) V!19491 V!19491 (_ BitVec 32) Int) ListLongMap!8041)

(assert (=> b!482241 (= lt!218692 (contains!2650 (getCurrentListMap!2355 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482242 () Bool)

(declare-fun res!287473 () Bool)

(assert (=> b!482242 (=> (not res!287473) (not e!283777))))

(assert (=> b!482242 (= res!287473 (and (= (size!15405 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15406 _keys!1874) (size!15405 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482238 () Bool)

(declare-fun res!287470 () Bool)

(assert (=> b!482238 (=> (not res!287470) (not e!283777))))

(declare-datatypes ((List!9209 0))(
  ( (Nil!9206) (Cons!9205 (h!10061 (_ BitVec 64)) (t!15423 List!9209)) )
))
(declare-fun arrayNoDuplicates!0 (array!31291 (_ BitVec 32) List!9209) Bool)

(assert (=> b!482238 (= res!287470 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9206))))

(declare-fun res!287471 () Bool)

(assert (=> start!43524 (=> (not res!287471) (not e!283777))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43524 (= res!287471 (validMask!0 mask!2352))))

(assert (=> start!43524 e!283777))

(assert (=> start!43524 true))

(assert (=> start!43524 tp_is_empty!13815))

(declare-fun array_inv!10856 (array!31289) Bool)

(assert (=> start!43524 (and (array_inv!10856 _values!1516) e!283776)))

(assert (=> start!43524 tp!43191))

(declare-fun array_inv!10857 (array!31291) Bool)

(assert (=> start!43524 (array_inv!10857 _keys!1874)))

(declare-fun mapNonEmpty!22432 () Bool)

(declare-fun tp!43192 () Bool)

(assert (=> mapNonEmpty!22432 (= mapRes!22432 (and tp!43192 e!283778))))

(declare-fun mapKey!22432 () (_ BitVec 32))

(declare-fun mapRest!22432 () (Array (_ BitVec 32) ValueCell!6546))

(declare-fun mapValue!22432 () ValueCell!6546)

(assert (=> mapNonEmpty!22432 (= (arr!15047 _values!1516) (store mapRest!22432 mapKey!22432 mapValue!22432))))

(declare-fun b!482243 () Bool)

(declare-fun res!287472 () Bool)

(assert (=> b!482243 (=> (not res!287472) (not e!283777))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31291 (_ BitVec 32)) Bool)

(assert (=> b!482243 (= res!287472 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(assert (= (and start!43524 res!287471) b!482242))

(assert (= (and b!482242 res!287473) b!482243))

(assert (= (and b!482243 res!287472) b!482238))

(assert (= (and b!482238 res!287470) b!482241))

(assert (= (and b!482239 condMapEmpty!22432) mapIsEmpty!22432))

(assert (= (and b!482239 (not condMapEmpty!22432)) mapNonEmpty!22432))

(get-info :version)

(assert (= (and mapNonEmpty!22432 ((_ is ValueCellFull!6546) mapValue!22432)) b!482237))

(assert (= (and b!482239 ((_ is ValueCellFull!6546) mapDefault!22432)) b!482240))

(assert (= start!43524 b!482239))

(declare-fun m!463539 () Bool)

(assert (=> mapNonEmpty!22432 m!463539))

(declare-fun m!463541 () Bool)

(assert (=> b!482243 m!463541))

(declare-fun m!463543 () Bool)

(assert (=> b!482238 m!463543))

(declare-fun m!463545 () Bool)

(assert (=> start!43524 m!463545))

(declare-fun m!463547 () Bool)

(assert (=> start!43524 m!463547))

(declare-fun m!463549 () Bool)

(assert (=> start!43524 m!463549))

(declare-fun m!463551 () Bool)

(assert (=> b!482241 m!463551))

(assert (=> b!482241 m!463551))

(declare-fun m!463553 () Bool)

(assert (=> b!482241 m!463553))

(check-sat (not b!482243) (not b!482238) b_and!21063 tp_is_empty!13815 (not b!482241) (not mapNonEmpty!22432) (not start!43524) (not b_next!12303))
(check-sat b_and!21063 (not b_next!12303))
