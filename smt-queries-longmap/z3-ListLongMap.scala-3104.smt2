; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43594 () Bool)

(assert start!43594)

(declare-fun b_free!12343 () Bool)

(declare-fun b_next!12343 () Bool)

(assert (=> start!43594 (= b_free!12343 (not b_next!12343))))

(declare-fun tp!43318 () Bool)

(declare-fun b_and!21081 () Bool)

(assert (=> start!43594 (= tp!43318 b_and!21081)))

(declare-fun b!482792 () Bool)

(declare-fun res!287761 () Bool)

(declare-fun e!284108 () Bool)

(assert (=> b!482792 (=> (not res!287761) (not e!284108))))

(declare-datatypes ((array!31365 0))(
  ( (array!31366 (arr!15083 (Array (_ BitVec 32) (_ BitVec 64))) (size!15442 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31365)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31365 (_ BitVec 32)) Bool)

(assert (=> b!482792 (= res!287761 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482793 () Bool)

(declare-fun e!284111 () Bool)

(declare-fun e!284112 () Bool)

(declare-fun mapRes!22498 () Bool)

(assert (=> b!482793 (= e!284111 (and e!284112 mapRes!22498))))

(declare-fun condMapEmpty!22498 () Bool)

(declare-datatypes ((V!19545 0))(
  ( (V!19546 (val!6975 Int)) )
))
(declare-datatypes ((ValueCell!6566 0))(
  ( (ValueCellFull!6566 (v!9264 V!19545)) (EmptyCell!6566) )
))
(declare-datatypes ((array!31367 0))(
  ( (array!31368 (arr!15084 (Array (_ BitVec 32) ValueCell!6566)) (size!15443 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31367)

(declare-fun mapDefault!22498 () ValueCell!6566)

(assert (=> b!482793 (= condMapEmpty!22498 (= (arr!15084 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6566)) mapDefault!22498)))))

(declare-fun b!482794 () Bool)

(declare-fun res!287760 () Bool)

(assert (=> b!482794 (=> (not res!287760) (not e!284108))))

(declare-datatypes ((List!9271 0))(
  ( (Nil!9268) (Cons!9267 (h!10123 (_ BitVec 64)) (t!15480 List!9271)) )
))
(declare-fun arrayNoDuplicates!0 (array!31365 (_ BitVec 32) List!9271) Bool)

(assert (=> b!482794 (= res!287760 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9268))))

(declare-fun b!482795 () Bool)

(declare-fun res!287762 () Bool)

(assert (=> b!482795 (=> (not res!287762) (not e!284108))))

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482795 (= res!287762 (validKeyInArray!0 k0!1332))))

(declare-fun mapIsEmpty!22498 () Bool)

(assert (=> mapIsEmpty!22498 mapRes!22498))

(declare-fun b!482797 () Bool)

(declare-fun e!284109 () Bool)

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482797 (= e!284109 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482798 () Bool)

(declare-fun e!284110 () Bool)

(declare-fun tp_is_empty!13855 () Bool)

(assert (=> b!482798 (= e!284110 tp_is_empty!13855)))

(declare-fun b!482799 () Bool)

(assert (=> b!482799 (= e!284108 (not true))))

(declare-fun lt!218742 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31365 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482799 (= lt!218742 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!482799 e!284109))

(declare-fun c!57982 () Bool)

(assert (=> b!482799 (= c!57982 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-fun minValue!1458 () V!19545)

(declare-datatypes ((Unit!14144 0))(
  ( (Unit!14145) )
))
(declare-fun lt!218743 () Unit!14144)

(declare-fun zeroValue!1458 () V!19545)

(declare-fun defaultEntry!1519 () Int)

(declare-fun lemmaKeyInListMapIsInArray!157 (array!31365 array!31367 (_ BitVec 32) (_ BitVec 32) V!19545 V!19545 (_ BitVec 64) Int) Unit!14144)

(assert (=> b!482799 (= lt!218743 (lemmaKeyInListMapIsInArray!157 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(declare-fun b!482800 () Bool)

(declare-fun res!287759 () Bool)

(assert (=> b!482800 (=> (not res!287759) (not e!284108))))

(assert (=> b!482800 (= res!287759 (and (= (size!15443 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15442 _keys!1874) (size!15443 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!22498 () Bool)

(declare-fun tp!43317 () Bool)

(assert (=> mapNonEmpty!22498 (= mapRes!22498 (and tp!43317 e!284110))))

(declare-fun mapKey!22498 () (_ BitVec 32))

(declare-fun mapValue!22498 () ValueCell!6566)

(declare-fun mapRest!22498 () (Array (_ BitVec 32) ValueCell!6566))

(assert (=> mapNonEmpty!22498 (= (arr!15084 _values!1516) (store mapRest!22498 mapKey!22498 mapValue!22498))))

(declare-fun res!287764 () Bool)

(assert (=> start!43594 (=> (not res!287764) (not e!284108))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43594 (= res!287764 (validMask!0 mask!2352))))

(assert (=> start!43594 e!284108))

(assert (=> start!43594 true))

(assert (=> start!43594 tp_is_empty!13855))

(declare-fun array_inv!10968 (array!31367) Bool)

(assert (=> start!43594 (and (array_inv!10968 _values!1516) e!284111)))

(assert (=> start!43594 tp!43318))

(declare-fun array_inv!10969 (array!31365) Bool)

(assert (=> start!43594 (array_inv!10969 _keys!1874)))

(declare-fun b!482796 () Bool)

(declare-fun arrayContainsKey!0 (array!31365 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482796 (= e!284109 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482801 () Bool)

(assert (=> b!482801 (= e!284112 tp_is_empty!13855)))

(declare-fun b!482802 () Bool)

(declare-fun res!287763 () Bool)

(assert (=> b!482802 (=> (not res!287763) (not e!284108))))

(declare-datatypes ((tuple2!9206 0))(
  ( (tuple2!9207 (_1!4614 (_ BitVec 64)) (_2!4614 V!19545)) )
))
(declare-datatypes ((List!9272 0))(
  ( (Nil!9269) (Cons!9268 (h!10124 tuple2!9206) (t!15481 List!9272)) )
))
(declare-datatypes ((ListLongMap!8109 0))(
  ( (ListLongMap!8110 (toList!4070 List!9272)) )
))
(declare-fun contains!2651 (ListLongMap!8109 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2323 (array!31365 array!31367 (_ BitVec 32) (_ BitVec 32) V!19545 V!19545 (_ BitVec 32) Int) ListLongMap!8109)

(assert (=> b!482802 (= res!287763 (contains!2651 (getCurrentListMap!2323 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(assert (= (and start!43594 res!287764) b!482800))

(assert (= (and b!482800 res!287759) b!482792))

(assert (= (and b!482792 res!287761) b!482794))

(assert (= (and b!482794 res!287760) b!482802))

(assert (= (and b!482802 res!287763) b!482795))

(assert (= (and b!482795 res!287762) b!482799))

(assert (= (and b!482799 c!57982) b!482796))

(assert (= (and b!482799 (not c!57982)) b!482797))

(assert (= (and b!482793 condMapEmpty!22498) mapIsEmpty!22498))

(assert (= (and b!482793 (not condMapEmpty!22498)) mapNonEmpty!22498))

(get-info :version)

(assert (= (and mapNonEmpty!22498 ((_ is ValueCellFull!6566) mapValue!22498)) b!482798))

(assert (= (and b!482793 ((_ is ValueCellFull!6566) mapDefault!22498)) b!482801))

(assert (= start!43594 b!482793))

(declare-fun m!463397 () Bool)

(assert (=> b!482796 m!463397))

(declare-fun m!463399 () Bool)

(assert (=> b!482792 m!463399))

(declare-fun m!463401 () Bool)

(assert (=> b!482794 m!463401))

(declare-fun m!463403 () Bool)

(assert (=> start!43594 m!463403))

(declare-fun m!463405 () Bool)

(assert (=> start!43594 m!463405))

(declare-fun m!463407 () Bool)

(assert (=> start!43594 m!463407))

(declare-fun m!463409 () Bool)

(assert (=> b!482802 m!463409))

(assert (=> b!482802 m!463409))

(declare-fun m!463411 () Bool)

(assert (=> b!482802 m!463411))

(declare-fun m!463413 () Bool)

(assert (=> mapNonEmpty!22498 m!463413))

(declare-fun m!463415 () Bool)

(assert (=> b!482799 m!463415))

(declare-fun m!463417 () Bool)

(assert (=> b!482799 m!463417))

(declare-fun m!463419 () Bool)

(assert (=> b!482795 m!463419))

(check-sat (not b!482799) (not b!482796) (not b!482802) (not b!482792) (not b!482794) b_and!21081 (not mapNonEmpty!22498) tp_is_empty!13855 (not start!43594) (not b_next!12343) (not b!482795))
(check-sat b_and!21081 (not b_next!12343))
