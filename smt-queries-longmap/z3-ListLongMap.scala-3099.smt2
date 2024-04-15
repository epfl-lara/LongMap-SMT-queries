; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43520 () Bool)

(assert start!43520)

(declare-fun b_free!12313 () Bool)

(declare-fun b_next!12313 () Bool)

(assert (=> start!43520 (= b_free!12313 (not b_next!12313))))

(declare-fun tp!43222 () Bool)

(declare-fun b_and!21047 () Bool)

(assert (=> start!43520 (= tp!43222 b_and!21047)))

(declare-fun b!482072 () Bool)

(declare-fun e!283680 () Bool)

(declare-fun tp_is_empty!13825 () Bool)

(assert (=> b!482072 (= e!283680 tp_is_empty!13825)))

(declare-fun b!482073 () Bool)

(declare-fun res!287401 () Bool)

(declare-fun e!283677 () Bool)

(assert (=> b!482073 (=> (not res!287401) (not e!283677))))

(declare-datatypes ((array!31301 0))(
  ( (array!31302 (arr!15053 (Array (_ BitVec 32) (_ BitVec 64))) (size!15412 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31301)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31301 (_ BitVec 32)) Bool)

(assert (=> b!482073 (= res!287401 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482074 () Bool)

(assert (=> b!482074 (= e!283677 false)))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-datatypes ((V!19505 0))(
  ( (V!19506 (val!6960 Int)) )
))
(declare-fun minValue!1458 () V!19505)

(declare-fun zeroValue!1458 () V!19505)

(declare-datatypes ((ValueCell!6551 0))(
  ( (ValueCellFull!6551 (v!9247 V!19505)) (EmptyCell!6551) )
))
(declare-datatypes ((array!31303 0))(
  ( (array!31304 (arr!15054 (Array (_ BitVec 32) ValueCell!6551)) (size!15413 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31303)

(declare-fun defaultEntry!1519 () Int)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(declare-fun lt!218473 () Bool)

(declare-datatypes ((tuple2!9186 0))(
  ( (tuple2!9187 (_1!4604 (_ BitVec 64)) (_2!4604 V!19505)) )
))
(declare-datatypes ((List!9251 0))(
  ( (Nil!9248) (Cons!9247 (h!10103 tuple2!9186) (t!15456 List!9251)) )
))
(declare-datatypes ((ListLongMap!8089 0))(
  ( (ListLongMap!8090 (toList!4060 List!9251)) )
))
(declare-fun contains!2639 (ListLongMap!8089 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2313 (array!31301 array!31303 (_ BitVec 32) (_ BitVec 32) V!19505 V!19505 (_ BitVec 32) Int) ListLongMap!8089)

(assert (=> b!482074 (= lt!218473 (contains!2639 (getCurrentListMap!2313 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482075 () Bool)

(declare-fun res!287404 () Bool)

(assert (=> b!482075 (=> (not res!287404) (not e!283677))))

(assert (=> b!482075 (= res!287404 (and (= (size!15413 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15412 _keys!1874) (size!15413 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun b!482076 () Bool)

(declare-fun res!287403 () Bool)

(assert (=> b!482076 (=> (not res!287403) (not e!283677))))

(declare-datatypes ((List!9252 0))(
  ( (Nil!9249) (Cons!9248 (h!10104 (_ BitVec 64)) (t!15457 List!9252)) )
))
(declare-fun arrayNoDuplicates!0 (array!31301 (_ BitVec 32) List!9252) Bool)

(assert (=> b!482076 (= res!287403 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9249))))

(declare-fun mapIsEmpty!22447 () Bool)

(declare-fun mapRes!22447 () Bool)

(assert (=> mapIsEmpty!22447 mapRes!22447))

(declare-fun b!482077 () Bool)

(declare-fun e!283678 () Bool)

(assert (=> b!482077 (= e!283678 tp_is_empty!13825)))

(declare-fun mapNonEmpty!22447 () Bool)

(declare-fun tp!43221 () Bool)

(assert (=> mapNonEmpty!22447 (= mapRes!22447 (and tp!43221 e!283680))))

(declare-fun mapRest!22447 () (Array (_ BitVec 32) ValueCell!6551))

(declare-fun mapKey!22447 () (_ BitVec 32))

(declare-fun mapValue!22447 () ValueCell!6551)

(assert (=> mapNonEmpty!22447 (= (arr!15054 _values!1516) (store mapRest!22447 mapKey!22447 mapValue!22447))))

(declare-fun res!287402 () Bool)

(assert (=> start!43520 (=> (not res!287402) (not e!283677))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43520 (= res!287402 (validMask!0 mask!2352))))

(assert (=> start!43520 e!283677))

(assert (=> start!43520 true))

(assert (=> start!43520 tp_is_empty!13825))

(declare-fun e!283676 () Bool)

(declare-fun array_inv!10948 (array!31303) Bool)

(assert (=> start!43520 (and (array_inv!10948 _values!1516) e!283676)))

(assert (=> start!43520 tp!43222))

(declare-fun array_inv!10949 (array!31301) Bool)

(assert (=> start!43520 (array_inv!10949 _keys!1874)))

(declare-fun b!482071 () Bool)

(assert (=> b!482071 (= e!283676 (and e!283678 mapRes!22447))))

(declare-fun condMapEmpty!22447 () Bool)

(declare-fun mapDefault!22447 () ValueCell!6551)

(assert (=> b!482071 (= condMapEmpty!22447 (= (arr!15054 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6551)) mapDefault!22447)))))

(assert (= (and start!43520 res!287402) b!482075))

(assert (= (and b!482075 res!287404) b!482073))

(assert (= (and b!482073 res!287401) b!482076))

(assert (= (and b!482076 res!287403) b!482074))

(assert (= (and b!482071 condMapEmpty!22447) mapIsEmpty!22447))

(assert (= (and b!482071 (not condMapEmpty!22447)) mapNonEmpty!22447))

(get-info :version)

(assert (= (and mapNonEmpty!22447 ((_ is ValueCellFull!6551) mapValue!22447)) b!482072))

(assert (= (and b!482071 ((_ is ValueCellFull!6551) mapDefault!22447)) b!482077))

(assert (= start!43520 b!482071))

(declare-fun m!462885 () Bool)

(assert (=> b!482073 m!462885))

(declare-fun m!462887 () Bool)

(assert (=> start!43520 m!462887))

(declare-fun m!462889 () Bool)

(assert (=> start!43520 m!462889))

(declare-fun m!462891 () Bool)

(assert (=> start!43520 m!462891))

(declare-fun m!462893 () Bool)

(assert (=> b!482076 m!462893))

(declare-fun m!462895 () Bool)

(assert (=> b!482074 m!462895))

(assert (=> b!482074 m!462895))

(declare-fun m!462897 () Bool)

(assert (=> b!482074 m!462897))

(declare-fun m!462899 () Bool)

(assert (=> mapNonEmpty!22447 m!462899))

(check-sat (not b!482076) tp_is_empty!13825 (not start!43520) (not b!482073) b_and!21047 (not mapNonEmpty!22447) (not b!482074) (not b_next!12313))
(check-sat b_and!21047 (not b_next!12313))
