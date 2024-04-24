; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108870 () Bool)

(assert start!108870)

(declare-fun b_free!28159 () Bool)

(declare-fun b_next!28159 () Bool)

(assert (=> start!108870 (= b_free!28159 (not b_next!28159))))

(declare-fun tp!99593 () Bool)

(declare-fun b_and!46227 () Bool)

(assert (=> start!108870 (= tp!99593 b_and!46227)))

(declare-fun b!1283750 () Bool)

(declare-fun res!852358 () Bool)

(declare-fun e!733601 () Bool)

(assert (=> b!1283750 (=> (not res!852358) (not e!733601))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!84699 0))(
  ( (array!84700 (arr!40847 (Array (_ BitVec 32) (_ BitVec 64))) (size!41398 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84699)

(assert (=> b!1283750 (= res!852358 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41398 _keys!1741))))))

(declare-fun b!1283751 () Bool)

(declare-fun e!733600 () Bool)

(declare-fun tp_is_empty!33799 () Bool)

(assert (=> b!1283751 (= e!733600 tp_is_empty!33799)))

(declare-fun b!1283752 () Bool)

(declare-fun e!733602 () Bool)

(assert (=> b!1283752 (= e!733602 tp_is_empty!33799)))

(declare-fun b!1283753 () Bool)

(declare-fun res!852360 () Bool)

(assert (=> b!1283753 (=> (not res!852360) (not e!733601))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50169 0))(
  ( (V!50170 (val!16974 Int)) )
))
(declare-datatypes ((ValueCell!16001 0))(
  ( (ValueCellFull!16001 (v!19571 V!50169)) (EmptyCell!16001) )
))
(declare-datatypes ((array!84701 0))(
  ( (array!84702 (arr!40848 (Array (_ BitVec 32) ValueCell!16001)) (size!41399 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84701)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1283753 (= res!852360 (and (= (size!41399 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41398 _keys!1741) (size!41399 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283754 () Bool)

(declare-fun res!852357 () Bool)

(assert (=> b!1283754 (=> (not res!852357) (not e!733601))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84699 (_ BitVec 32)) Bool)

(assert (=> b!1283754 (= res!852357 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapNonEmpty!52256 () Bool)

(declare-fun mapRes!52256 () Bool)

(declare-fun tp!99592 () Bool)

(assert (=> mapNonEmpty!52256 (= mapRes!52256 (and tp!99592 e!733602))))

(declare-fun mapKey!52256 () (_ BitVec 32))

(declare-fun mapRest!52256 () (Array (_ BitVec 32) ValueCell!16001))

(declare-fun mapValue!52256 () ValueCell!16001)

(assert (=> mapNonEmpty!52256 (= (arr!40848 _values!1445) (store mapRest!52256 mapKey!52256 mapValue!52256))))

(declare-fun res!852359 () Bool)

(assert (=> start!108870 (=> (not res!852359) (not e!733601))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108870 (= res!852359 (validMask!0 mask!2175))))

(assert (=> start!108870 e!733601))

(assert (=> start!108870 tp_is_empty!33799))

(assert (=> start!108870 true))

(declare-fun e!733598 () Bool)

(declare-fun array_inv!31199 (array!84701) Bool)

(assert (=> start!108870 (and (array_inv!31199 _values!1445) e!733598)))

(declare-fun array_inv!31200 (array!84699) Bool)

(assert (=> start!108870 (array_inv!31200 _keys!1741)))

(assert (=> start!108870 tp!99593))

(declare-fun b!1283755 () Bool)

(declare-fun res!852361 () Bool)

(assert (=> b!1283755 (=> (not res!852361) (not e!733601))))

(declare-datatypes ((List!28964 0))(
  ( (Nil!28961) (Cons!28960 (h!30178 (_ BitVec 64)) (t!42500 List!28964)) )
))
(declare-fun arrayNoDuplicates!0 (array!84699 (_ BitVec 32) List!28964) Bool)

(assert (=> b!1283755 (= res!852361 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28961))))

(declare-fun mapIsEmpty!52256 () Bool)

(assert (=> mapIsEmpty!52256 mapRes!52256))

(declare-fun b!1283756 () Bool)

(assert (=> b!1283756 (= e!733598 (and e!733600 mapRes!52256))))

(declare-fun condMapEmpty!52256 () Bool)

(declare-fun mapDefault!52256 () ValueCell!16001)

(assert (=> b!1283756 (= condMapEmpty!52256 (= (arr!40848 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16001)) mapDefault!52256)))))

(declare-fun b!1283757 () Bool)

(assert (=> b!1283757 (= e!733601 false)))

(declare-fun minValue!1387 () V!50169)

(declare-fun zeroValue!1387 () V!50169)

(declare-fun lt!577019 () Bool)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21750 0))(
  ( (tuple2!21751 (_1!10886 (_ BitVec 64)) (_2!10886 V!50169)) )
))
(declare-datatypes ((List!28965 0))(
  ( (Nil!28962) (Cons!28961 (h!30179 tuple2!21750) (t!42501 List!28965)) )
))
(declare-datatypes ((ListLongMap!19415 0))(
  ( (ListLongMap!19416 (toList!9723 List!28965)) )
))
(declare-fun contains!7854 (ListLongMap!19415 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4792 (array!84699 array!84701 (_ BitVec 32) (_ BitVec 32) V!50169 V!50169 (_ BitVec 32) Int) ListLongMap!19415)

(assert (=> b!1283757 (= lt!577019 (contains!7854 (getCurrentListMap!4792 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!108870 res!852359) b!1283753))

(assert (= (and b!1283753 res!852360) b!1283754))

(assert (= (and b!1283754 res!852357) b!1283755))

(assert (= (and b!1283755 res!852361) b!1283750))

(assert (= (and b!1283750 res!852358) b!1283757))

(assert (= (and b!1283756 condMapEmpty!52256) mapIsEmpty!52256))

(assert (= (and b!1283756 (not condMapEmpty!52256)) mapNonEmpty!52256))

(get-info :version)

(assert (= (and mapNonEmpty!52256 ((_ is ValueCellFull!16001) mapValue!52256)) b!1283752))

(assert (= (and b!1283756 ((_ is ValueCellFull!16001) mapDefault!52256)) b!1283751))

(assert (= start!108870 b!1283756))

(declare-fun m!1178257 () Bool)

(assert (=> mapNonEmpty!52256 m!1178257))

(declare-fun m!1178259 () Bool)

(assert (=> start!108870 m!1178259))

(declare-fun m!1178261 () Bool)

(assert (=> start!108870 m!1178261))

(declare-fun m!1178263 () Bool)

(assert (=> start!108870 m!1178263))

(declare-fun m!1178265 () Bool)

(assert (=> b!1283755 m!1178265))

(declare-fun m!1178267 () Bool)

(assert (=> b!1283754 m!1178267))

(declare-fun m!1178269 () Bool)

(assert (=> b!1283757 m!1178269))

(assert (=> b!1283757 m!1178269))

(declare-fun m!1178271 () Bool)

(assert (=> b!1283757 m!1178271))

(check-sat (not start!108870) (not mapNonEmpty!52256) (not b_next!28159) b_and!46227 tp_is_empty!33799 (not b!1283755) (not b!1283754) (not b!1283757))
(check-sat b_and!46227 (not b_next!28159))
