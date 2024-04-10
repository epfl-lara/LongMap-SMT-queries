; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!3920 () Bool)

(assert start!3920)

(declare-fun b_free!825 () Bool)

(declare-fun b_next!825 () Bool)

(assert (=> start!3920 (= b_free!825 (not b_next!825))))

(declare-fun tp!3895 () Bool)

(declare-fun b_and!1635 () Bool)

(assert (=> start!3920 (= tp!3895 b_and!1635)))

(declare-fun b!27756 () Bool)

(declare-fun e!18036 () Bool)

(declare-fun tp_is_empty!1179 () Bool)

(assert (=> b!27756 (= e!18036 tp_is_empty!1179)))

(declare-fun res!16463 () Bool)

(declare-fun e!18037 () Bool)

(assert (=> start!3920 (=> (not res!16463) (not e!18037))))

(declare-fun mask!2294 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!3920 (= res!16463 (validMask!0 mask!2294))))

(assert (=> start!3920 e!18037))

(assert (=> start!3920 true))

(assert (=> start!3920 tp!3895))

(declare-datatypes ((V!1397 0))(
  ( (V!1398 (val!616 Int)) )
))
(declare-datatypes ((ValueCell!390 0))(
  ( (ValueCellFull!390 (v!1705 V!1397)) (EmptyCell!390) )
))
(declare-datatypes ((array!1599 0))(
  ( (array!1600 (arr!753 (Array (_ BitVec 32) ValueCell!390)) (size!854 (_ BitVec 32))) )
))
(declare-fun _values!1501 () array!1599)

(declare-fun e!18038 () Bool)

(declare-fun array_inv!517 (array!1599) Bool)

(assert (=> start!3920 (and (array_inv!517 _values!1501) e!18038)))

(declare-datatypes ((array!1601 0))(
  ( (array!1602 (arr!754 (Array (_ BitVec 32) (_ BitVec 64))) (size!855 (_ BitVec 32))) )
))
(declare-fun _keys!1833 () array!1601)

(declare-fun array_inv!518 (array!1601) Bool)

(assert (=> start!3920 (array_inv!518 _keys!1833)))

(assert (=> start!3920 tp_is_empty!1179))

(declare-fun b!27757 () Bool)

(declare-fun e!18034 () Bool)

(declare-fun mapRes!1297 () Bool)

(assert (=> b!27757 (= e!18038 (and e!18034 mapRes!1297))))

(declare-fun condMapEmpty!1297 () Bool)

(declare-fun mapDefault!1297 () ValueCell!390)

(assert (=> b!27757 (= condMapEmpty!1297 (= (arr!753 _values!1501) ((as const (Array (_ BitVec 32) ValueCell!390)) mapDefault!1297)))))

(declare-fun b!27758 () Bool)

(assert (=> b!27758 (= e!18037 false)))

(declare-fun lt!10712 () (_ BitVec 32))

(declare-fun k0!1304 () (_ BitVec 64))

(declare-fun arrayScanForKey!0 (array!1601 (_ BitVec 64) (_ BitVec 32)) (_ BitVec 32))

(assert (=> b!27758 (= lt!10712 (arrayScanForKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun mapNonEmpty!1297 () Bool)

(declare-fun tp!3894 () Bool)

(assert (=> mapNonEmpty!1297 (= mapRes!1297 (and tp!3894 e!18036))))

(declare-fun mapValue!1297 () ValueCell!390)

(declare-fun mapRest!1297 () (Array (_ BitVec 32) ValueCell!390))

(declare-fun mapKey!1297 () (_ BitVec 32))

(assert (=> mapNonEmpty!1297 (= (arr!753 _values!1501) (store mapRest!1297 mapKey!1297 mapValue!1297))))

(declare-fun mapIsEmpty!1297 () Bool)

(assert (=> mapIsEmpty!1297 mapRes!1297))

(declare-fun b!27759 () Bool)

(declare-fun res!16466 () Bool)

(assert (=> b!27759 (=> (not res!16466) (not e!18037))))

(declare-datatypes ((List!633 0))(
  ( (Nil!630) (Cons!629 (h!1196 (_ BitVec 64)) (t!3326 List!633)) )
))
(declare-fun arrayNoDuplicates!0 (array!1601 (_ BitVec 32) List!633) Bool)

(assert (=> b!27759 (= res!16466 (arrayNoDuplicates!0 _keys!1833 #b00000000000000000000000000000000 Nil!630))))

(declare-fun b!27760 () Bool)

(declare-fun res!16462 () Bool)

(assert (=> b!27760 (=> (not res!16462) (not e!18037))))

(declare-fun defaultEntry!1504 () Int)

(declare-fun extraKeys!1422 () (_ BitVec 32))

(declare-fun zeroValue!1443 () V!1397)

(declare-fun minValue!1443 () V!1397)

(declare-datatypes ((tuple2!1032 0))(
  ( (tuple2!1033 (_1!527 (_ BitVec 64)) (_2!527 V!1397)) )
))
(declare-datatypes ((List!634 0))(
  ( (Nil!631) (Cons!630 (h!1197 tuple2!1032) (t!3327 List!634)) )
))
(declare-datatypes ((ListLongMap!609 0))(
  ( (ListLongMap!610 (toList!320 List!634)) )
))
(declare-fun contains!260 (ListLongMap!609 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!150 (array!1601 array!1599 (_ BitVec 32) (_ BitVec 32) V!1397 V!1397 (_ BitVec 32) Int) ListLongMap!609)

(assert (=> b!27760 (= res!16462 (not (contains!260 (getCurrentListMap!150 _keys!1833 _values!1501 mask!2294 extraKeys!1422 zeroValue!1443 minValue!1443 #b00000000000000000000000000000000 defaultEntry!1504) k0!1304)))))

(declare-fun b!27761 () Bool)

(declare-fun res!16465 () Bool)

(assert (=> b!27761 (=> (not res!16465) (not e!18037))))

(declare-fun arrayContainsKey!0 (array!1601 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!27761 (= res!16465 (arrayContainsKey!0 _keys!1833 k0!1304 #b00000000000000000000000000000000))))

(declare-fun b!27762 () Bool)

(declare-fun res!16467 () Bool)

(assert (=> b!27762 (=> (not res!16467) (not e!18037))))

(assert (=> b!27762 (= res!16467 (and (= (size!854 _values!1501) (bvadd #b00000000000000000000000000000001 mask!2294)) (= (size!855 _keys!1833) (size!854 _values!1501)) (bvsge mask!2294 #b00000000000000000000000000000000) (bvsge extraKeys!1422 #b00000000000000000000000000000000) (bvsle extraKeys!1422 #b00000000000000000000000000000011)))))

(declare-fun b!27763 () Bool)

(assert (=> b!27763 (= e!18034 tp_is_empty!1179)))

(declare-fun b!27764 () Bool)

(declare-fun res!16464 () Bool)

(assert (=> b!27764 (=> (not res!16464) (not e!18037))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!1601 (_ BitVec 32)) Bool)

(assert (=> b!27764 (= res!16464 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1833 mask!2294))))

(declare-fun b!27765 () Bool)

(declare-fun res!16461 () Bool)

(assert (=> b!27765 (=> (not res!16461) (not e!18037))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!27765 (= res!16461 (validKeyInArray!0 k0!1304))))

(assert (= (and start!3920 res!16463) b!27762))

(assert (= (and b!27762 res!16467) b!27764))

(assert (= (and b!27764 res!16464) b!27759))

(assert (= (and b!27759 res!16466) b!27765))

(assert (= (and b!27765 res!16461) b!27760))

(assert (= (and b!27760 res!16462) b!27761))

(assert (= (and b!27761 res!16465) b!27758))

(assert (= (and b!27757 condMapEmpty!1297) mapIsEmpty!1297))

(assert (= (and b!27757 (not condMapEmpty!1297)) mapNonEmpty!1297))

(get-info :version)

(assert (= (and mapNonEmpty!1297 ((_ is ValueCellFull!390) mapValue!1297)) b!27756))

(assert (= (and b!27757 ((_ is ValueCellFull!390) mapDefault!1297)) b!27763))

(assert (= start!3920 b!27757))

(declare-fun m!22127 () Bool)

(assert (=> b!27760 m!22127))

(assert (=> b!27760 m!22127))

(declare-fun m!22129 () Bool)

(assert (=> b!27760 m!22129))

(declare-fun m!22131 () Bool)

(assert (=> b!27764 m!22131))

(declare-fun m!22133 () Bool)

(assert (=> b!27761 m!22133))

(declare-fun m!22135 () Bool)

(assert (=> b!27765 m!22135))

(declare-fun m!22137 () Bool)

(assert (=> b!27758 m!22137))

(declare-fun m!22139 () Bool)

(assert (=> b!27759 m!22139))

(declare-fun m!22141 () Bool)

(assert (=> start!3920 m!22141))

(declare-fun m!22143 () Bool)

(assert (=> start!3920 m!22143))

(declare-fun m!22145 () Bool)

(assert (=> start!3920 m!22145))

(declare-fun m!22147 () Bool)

(assert (=> mapNonEmpty!1297 m!22147))

(check-sat (not b!27764) (not b!27761) (not b_next!825) (not start!3920) (not b!27759) b_and!1635 (not b!27760) (not mapNonEmpty!1297) (not b!27765) tp_is_empty!1179 (not b!27758))
(check-sat b_and!1635 (not b_next!825))
