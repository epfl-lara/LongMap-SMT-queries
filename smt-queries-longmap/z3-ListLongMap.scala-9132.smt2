; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109576 () Bool)

(assert start!109576)

(declare-fun b_free!29065 () Bool)

(declare-fun b_next!29065 () Bool)

(assert (=> start!109576 (= b_free!29065 (not b_next!29065))))

(declare-fun tp!102314 () Bool)

(declare-fun b_and!47137 () Bool)

(assert (=> start!109576 (= tp!102314 b_and!47137)))

(declare-fun b!1297773 () Bool)

(declare-fun res!862479 () Bool)

(declare-fun e!740429 () Bool)

(assert (=> b!1297773 (=> (not res!862479) (not e!740429))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51377 0))(
  ( (V!51378 (val!17427 Int)) )
))
(declare-datatypes ((ValueCell!16454 0))(
  ( (ValueCellFull!16454 (v!20029 V!51377)) (EmptyCell!16454) )
))
(declare-datatypes ((array!86311 0))(
  ( (array!86312 (arr!41657 (Array (_ BitVec 32) ValueCell!16454)) (size!42209 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86311)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86313 0))(
  ( (array!86314 (arr!41658 (Array (_ BitVec 32) (_ BitVec 64))) (size!42210 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86313)

(assert (=> b!1297773 (= res!862479 (and (= (size!42209 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42210 _keys!1741) (size!42209 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!862476 () Bool)

(assert (=> start!109576 (=> (not res!862476) (not e!740429))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109576 (= res!862476 (validMask!0 mask!2175))))

(assert (=> start!109576 e!740429))

(declare-fun tp_is_empty!34705 () Bool)

(assert (=> start!109576 tp_is_empty!34705))

(assert (=> start!109576 true))

(declare-fun e!740432 () Bool)

(declare-fun array_inv!31691 (array!86311) Bool)

(assert (=> start!109576 (and (array_inv!31691 _values!1445) e!740432)))

(declare-fun array_inv!31692 (array!86313) Bool)

(assert (=> start!109576 (array_inv!31692 _keys!1741)))

(assert (=> start!109576 tp!102314))

(declare-fun b!1297774 () Bool)

(assert (=> b!1297774 (= e!740429 (not true))))

(declare-fun minValue!1387 () V!51377)

(declare-fun zeroValue!1387 () V!51377)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22512 0))(
  ( (tuple2!22513 (_1!11267 (_ BitVec 64)) (_2!11267 V!51377)) )
))
(declare-datatypes ((List!29636 0))(
  ( (Nil!29633) (Cons!29632 (h!30841 tuple2!22512) (t!43192 List!29636)) )
))
(declare-datatypes ((ListLongMap!20169 0))(
  ( (ListLongMap!20170 (toList!10100 List!29636)) )
))
(declare-fun contains!8148 (ListLongMap!20169 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5016 (array!86313 array!86311 (_ BitVec 32) (_ BitVec 32) V!51377 V!51377 (_ BitVec 32) Int) ListLongMap!20169)

(assert (=> b!1297774 (contains!8148 (getCurrentListMap!5016 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k0!1205)))

(declare-datatypes ((Unit!42810 0))(
  ( (Unit!42811) )
))
(declare-fun lt!580465 () Unit!42810)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!30 (array!86313 array!86311 (_ BitVec 32) (_ BitVec 32) V!51377 V!51377 (_ BitVec 64) (_ BitVec 32) Int) Unit!42810)

(assert (=> b!1297774 (= lt!580465 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!30 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k0!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1297775 () Bool)

(declare-fun res!862475 () Bool)

(assert (=> b!1297775 (=> (not res!862475) (not e!740429))))

(assert (=> b!1297775 (= res!862475 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42210 _keys!1741)) (not (= (select (arr!41658 _keys!1741) from!2144) k0!1205))))))

(declare-fun b!1297776 () Bool)

(declare-fun res!862473 () Bool)

(assert (=> b!1297776 (=> (not res!862473) (not e!740429))))

(assert (=> b!1297776 (= res!862473 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42210 _keys!1741))))))

(declare-fun b!1297777 () Bool)

(declare-fun res!862478 () Bool)

(assert (=> b!1297777 (=> (not res!862478) (not e!740429))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86313 (_ BitVec 32)) Bool)

(assert (=> b!1297777 (= res!862478 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297778 () Bool)

(declare-fun e!740430 () Bool)

(assert (=> b!1297778 (= e!740430 tp_is_empty!34705)))

(declare-fun b!1297779 () Bool)

(declare-fun e!740433 () Bool)

(declare-fun mapRes!53618 () Bool)

(assert (=> b!1297779 (= e!740432 (and e!740433 mapRes!53618))))

(declare-fun condMapEmpty!53618 () Bool)

(declare-fun mapDefault!53618 () ValueCell!16454)

(assert (=> b!1297779 (= condMapEmpty!53618 (= (arr!41657 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16454)) mapDefault!53618)))))

(declare-fun b!1297780 () Bool)

(declare-fun res!862474 () Bool)

(assert (=> b!1297780 (=> (not res!862474) (not e!740429))))

(assert (=> b!1297780 (= res!862474 (contains!8148 (getCurrentListMap!5016 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!53618 () Bool)

(assert (=> mapIsEmpty!53618 mapRes!53618))

(declare-fun mapNonEmpty!53618 () Bool)

(declare-fun tp!102315 () Bool)

(assert (=> mapNonEmpty!53618 (= mapRes!53618 (and tp!102315 e!740430))))

(declare-fun mapKey!53618 () (_ BitVec 32))

(declare-fun mapRest!53618 () (Array (_ BitVec 32) ValueCell!16454))

(declare-fun mapValue!53618 () ValueCell!16454)

(assert (=> mapNonEmpty!53618 (= (arr!41657 _values!1445) (store mapRest!53618 mapKey!53618 mapValue!53618))))

(declare-fun b!1297781 () Bool)

(assert (=> b!1297781 (= e!740433 tp_is_empty!34705)))

(declare-fun b!1297782 () Bool)

(declare-fun res!862477 () Bool)

(assert (=> b!1297782 (=> (not res!862477) (not e!740429))))

(declare-datatypes ((List!29637 0))(
  ( (Nil!29634) (Cons!29633 (h!30842 (_ BitVec 64)) (t!43193 List!29637)) )
))
(declare-fun arrayNoDuplicates!0 (array!86313 (_ BitVec 32) List!29637) Bool)

(assert (=> b!1297782 (= res!862477 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29634))))

(assert (= (and start!109576 res!862476) b!1297773))

(assert (= (and b!1297773 res!862479) b!1297777))

(assert (= (and b!1297777 res!862478) b!1297782))

(assert (= (and b!1297782 res!862477) b!1297776))

(assert (= (and b!1297776 res!862473) b!1297780))

(assert (= (and b!1297780 res!862474) b!1297775))

(assert (= (and b!1297775 res!862475) b!1297774))

(assert (= (and b!1297779 condMapEmpty!53618) mapIsEmpty!53618))

(assert (= (and b!1297779 (not condMapEmpty!53618)) mapNonEmpty!53618))

(get-info :version)

(assert (= (and mapNonEmpty!53618 ((_ is ValueCellFull!16454) mapValue!53618)) b!1297778))

(assert (= (and b!1297779 ((_ is ValueCellFull!16454) mapDefault!53618)) b!1297781))

(assert (= start!109576 b!1297779))

(declare-fun m!1188807 () Bool)

(assert (=> b!1297777 m!1188807))

(declare-fun m!1188809 () Bool)

(assert (=> b!1297774 m!1188809))

(assert (=> b!1297774 m!1188809))

(declare-fun m!1188811 () Bool)

(assert (=> b!1297774 m!1188811))

(declare-fun m!1188813 () Bool)

(assert (=> b!1297774 m!1188813))

(declare-fun m!1188815 () Bool)

(assert (=> b!1297775 m!1188815))

(declare-fun m!1188817 () Bool)

(assert (=> b!1297780 m!1188817))

(assert (=> b!1297780 m!1188817))

(declare-fun m!1188819 () Bool)

(assert (=> b!1297780 m!1188819))

(declare-fun m!1188821 () Bool)

(assert (=> start!109576 m!1188821))

(declare-fun m!1188823 () Bool)

(assert (=> start!109576 m!1188823))

(declare-fun m!1188825 () Bool)

(assert (=> start!109576 m!1188825))

(declare-fun m!1188827 () Bool)

(assert (=> mapNonEmpty!53618 m!1188827))

(declare-fun m!1188829 () Bool)

(assert (=> b!1297782 m!1188829))

(check-sat b_and!47137 (not start!109576) (not mapNonEmpty!53618) (not b!1297777) (not b!1297780) tp_is_empty!34705 (not b!1297782) (not b_next!29065) (not b!1297774))
(check-sat b_and!47137 (not b_next!29065))
