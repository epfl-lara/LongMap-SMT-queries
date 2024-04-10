; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!43548 () Bool)

(assert start!43548)

(declare-fun b_free!12327 () Bool)

(declare-fun b_next!12327 () Bool)

(assert (=> start!43548 (= b_free!12327 (not b_next!12327))))

(declare-fun tp!43263 () Bool)

(declare-fun b_and!21087 () Bool)

(assert (=> start!43548 (= tp!43263 b_and!21087)))

(declare-fun b!482545 () Bool)

(declare-fun e!283971 () Bool)

(declare-fun k0!1332 () (_ BitVec 64))

(declare-fun extraKeys!1437 () (_ BitVec 32))

(assert (=> b!482545 (= e!283971 (ite (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1437 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!482546 () Bool)

(declare-fun res!287643 () Bool)

(declare-fun e!283974 () Bool)

(assert (=> b!482546 (=> (not res!287643) (not e!283974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!482546 (= res!287643 (validKeyInArray!0 k0!1332))))

(declare-fun b!482547 () Bool)

(declare-fun e!283972 () Bool)

(declare-fun e!283970 () Bool)

(declare-fun mapRes!22468 () Bool)

(assert (=> b!482547 (= e!283972 (and e!283970 mapRes!22468))))

(declare-fun condMapEmpty!22468 () Bool)

(declare-datatypes ((V!19523 0))(
  ( (V!19524 (val!6967 Int)) )
))
(declare-datatypes ((ValueCell!6558 0))(
  ( (ValueCellFull!6558 (v!9260 V!19523)) (EmptyCell!6558) )
))
(declare-datatypes ((array!31335 0))(
  ( (array!31336 (arr!15070 (Array (_ BitVec 32) ValueCell!6558)) (size!15428 (_ BitVec 32))) )
))
(declare-fun _values!1516 () array!31335)

(declare-fun mapDefault!22468 () ValueCell!6558)

(assert (=> b!482547 (= condMapEmpty!22468 (= (arr!15070 _values!1516) ((as const (Array (_ BitVec 32) ValueCell!6558)) mapDefault!22468)))))

(declare-fun b!482548 () Bool)

(declare-fun res!287644 () Bool)

(assert (=> b!482548 (=> (not res!287644) (not e!283974))))

(declare-datatypes ((array!31337 0))(
  ( (array!31338 (arr!15071 (Array (_ BitVec 32) (_ BitVec 64))) (size!15429 (_ BitVec 32))) )
))
(declare-fun _keys!1874 () array!31337)

(declare-fun mask!2352 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!31337 (_ BitVec 32)) Bool)

(assert (=> b!482548 (= res!287644 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1874 mask!2352))))

(declare-fun b!482549 () Bool)

(declare-fun arrayContainsKey!0 (array!31337 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!482549 (= e!283971 (arrayContainsKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(declare-fun b!482550 () Bool)

(declare-fun tp_is_empty!13839 () Bool)

(assert (=> b!482550 (= e!283970 tp_is_empty!13839)))

(declare-fun b!482551 () Bool)

(declare-fun res!287647 () Bool)

(assert (=> b!482551 (=> (not res!287647) (not e!283974))))

(assert (=> b!482551 (= res!287647 (and (= (size!15428 _values!1516) (bvadd #b00000000000000000000000000000001 mask!2352)) (= (size!15429 _keys!1874) (size!15428 _values!1516)) (bvsge mask!2352 #b00000000000000000000000000000000) (bvsge extraKeys!1437 #b00000000000000000000000000000000) (bvsle extraKeys!1437 #b00000000000000000000000000000011)))))

(declare-fun res!287642 () Bool)

(assert (=> start!43548 (=> (not res!287642) (not e!283974))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!43548 (= res!287642 (validMask!0 mask!2352))))

(assert (=> start!43548 e!283974))

(assert (=> start!43548 true))

(assert (=> start!43548 tp_is_empty!13839))

(declare-fun array_inv!10874 (array!31335) Bool)

(assert (=> start!43548 (and (array_inv!10874 _values!1516) e!283972)))

(assert (=> start!43548 tp!43263))

(declare-fun array_inv!10875 (array!31337) Bool)

(assert (=> start!43548 (array_inv!10875 _keys!1874)))

(declare-fun b!482552 () Bool)

(declare-fun res!287646 () Bool)

(assert (=> b!482552 (=> (not res!287646) (not e!283974))))

(declare-datatypes ((List!9225 0))(
  ( (Nil!9222) (Cons!9221 (h!10077 (_ BitVec 64)) (t!15439 List!9225)) )
))
(declare-fun arrayNoDuplicates!0 (array!31337 (_ BitVec 32) List!9225) Bool)

(assert (=> b!482552 (= res!287646 (arrayNoDuplicates!0 _keys!1874 #b00000000000000000000000000000000 Nil!9222))))

(declare-fun b!482553 () Bool)

(declare-fun res!287645 () Bool)

(assert (=> b!482553 (=> (not res!287645) (not e!283974))))

(declare-fun minValue!1458 () V!19523)

(declare-fun zeroValue!1458 () V!19523)

(declare-fun defaultEntry!1519 () Int)

(declare-datatypes ((tuple2!9146 0))(
  ( (tuple2!9147 (_1!4584 (_ BitVec 64)) (_2!4584 V!19523)) )
))
(declare-datatypes ((List!9226 0))(
  ( (Nil!9223) (Cons!9222 (h!10078 tuple2!9146) (t!15440 List!9226)) )
))
(declare-datatypes ((ListLongMap!8059 0))(
  ( (ListLongMap!8060 (toList!4045 List!9226)) )
))
(declare-fun contains!2659 (ListLongMap!8059 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!2364 (array!31337 array!31335 (_ BitVec 32) (_ BitVec 32) V!19523 V!19523 (_ BitVec 32) Int) ListLongMap!8059)

(assert (=> b!482553 (= res!287645 (contains!2659 (getCurrentListMap!2364 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 #b00000000000000000000000000000000 defaultEntry!1519) k0!1332))))

(declare-fun b!482554 () Bool)

(declare-fun e!283969 () Bool)

(assert (=> b!482554 (= e!283969 tp_is_empty!13839)))

(declare-fun mapNonEmpty!22468 () Bool)

(declare-fun tp!43264 () Bool)

(assert (=> mapNonEmpty!22468 (= mapRes!22468 (and tp!43264 e!283969))))

(declare-fun mapValue!22468 () ValueCell!6558)

(declare-fun mapRest!22468 () (Array (_ BitVec 32) ValueCell!6558))

(declare-fun mapKey!22468 () (_ BitVec 32))

(assert (=> mapNonEmpty!22468 (= (arr!15070 _values!1516) (store mapRest!22468 mapKey!22468 mapValue!22468))))

(declare-fun mapIsEmpty!22468 () Bool)

(assert (=> mapIsEmpty!22468 mapRes!22468))

(declare-fun b!482555 () Bool)

(assert (=> b!482555 (= e!283974 (not (= (size!15429 _keys!1874) (bvadd #b00000000000000000000000000000001 mask!2352))))))

(declare-fun lt!218742 () (_ BitVec 32))

(declare-fun arrayScanForKey!0 (array!31337 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!482555 (= lt!218742 (arrayScanForKey!0 _keys!1874 k0!1332 #b00000000000000000000000000000000))))

(assert (=> b!482555 e!283971))

(declare-fun c!57963 () Bool)

(assert (=> b!482555 (= c!57963 (and (not (= k0!1332 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1332 #b1000000000000000000000000000000000000000000000000000000000000000))))))

(declare-datatypes ((Unit!14146 0))(
  ( (Unit!14147) )
))
(declare-fun lt!218743 () Unit!14146)

(declare-fun lemmaKeyInListMapIsInArray!144 (array!31337 array!31335 (_ BitVec 32) (_ BitVec 32) V!19523 V!19523 (_ BitVec 64) Int) Unit!14146)

(assert (=> b!482555 (= lt!218743 (lemmaKeyInListMapIsInArray!144 _keys!1874 _values!1516 mask!2352 extraKeys!1437 zeroValue!1458 minValue!1458 k0!1332 defaultEntry!1519))))

(assert (= (and start!43548 res!287642) b!482551))

(assert (= (and b!482551 res!287647) b!482548))

(assert (= (and b!482548 res!287644) b!482552))

(assert (= (and b!482552 res!287646) b!482553))

(assert (= (and b!482553 res!287645) b!482546))

(assert (= (and b!482546 res!287643) b!482555))

(assert (= (and b!482555 c!57963) b!482549))

(assert (= (and b!482555 (not c!57963)) b!482545))

(assert (= (and b!482547 condMapEmpty!22468) mapIsEmpty!22468))

(assert (= (and b!482547 (not condMapEmpty!22468)) mapNonEmpty!22468))

(get-info :version)

(assert (= (and mapNonEmpty!22468 ((_ is ValueCellFull!6558) mapValue!22468)) b!482554))

(assert (= (and b!482547 ((_ is ValueCellFull!6558) mapDefault!22468)) b!482550))

(assert (= start!43548 b!482547))

(declare-fun m!463763 () Bool)

(assert (=> b!482546 m!463763))

(declare-fun m!463765 () Bool)

(assert (=> start!43548 m!463765))

(declare-fun m!463767 () Bool)

(assert (=> start!43548 m!463767))

(declare-fun m!463769 () Bool)

(assert (=> start!43548 m!463769))

(declare-fun m!463771 () Bool)

(assert (=> mapNonEmpty!22468 m!463771))

(declare-fun m!463773 () Bool)

(assert (=> b!482555 m!463773))

(declare-fun m!463775 () Bool)

(assert (=> b!482555 m!463775))

(declare-fun m!463777 () Bool)

(assert (=> b!482552 m!463777))

(declare-fun m!463779 () Bool)

(assert (=> b!482549 m!463779))

(declare-fun m!463781 () Bool)

(assert (=> b!482553 m!463781))

(assert (=> b!482553 m!463781))

(declare-fun m!463783 () Bool)

(assert (=> b!482553 m!463783))

(declare-fun m!463785 () Bool)

(assert (=> b!482548 m!463785))

(check-sat (not b!482552) (not b!482546) (not b!482555) (not mapNonEmpty!22468) (not b!482548) b_and!21087 (not start!43548) (not b_next!12327) (not b!482553) tp_is_empty!13839 (not b!482549))
(check-sat b_and!21087 (not b_next!12327))
