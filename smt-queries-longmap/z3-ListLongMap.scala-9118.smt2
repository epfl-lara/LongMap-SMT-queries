; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109492 () Bool)

(assert start!109492)

(declare-fun b_free!28981 () Bool)

(declare-fun b_next!28981 () Bool)

(assert (=> start!109492 (= b_free!28981 (not b_next!28981))))

(declare-fun tp!102062 () Bool)

(declare-fun b_and!47053 () Bool)

(assert (=> start!109492 (= tp!102062 b_and!47053)))

(declare-fun b!1296736 () Bool)

(declare-fun res!861818 () Bool)

(declare-fun e!739803 () Bool)

(assert (=> b!1296736 (=> (not res!861818) (not e!739803))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86151 0))(
  ( (array!86152 (arr!41577 (Array (_ BitVec 32) (_ BitVec 64))) (size!42129 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86151)

(assert (=> b!1296736 (= res!861818 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42129 _keys!1741))))))

(declare-fun b!1296737 () Bool)

(declare-fun res!861816 () Bool)

(assert (=> b!1296737 (=> (not res!861816) (not e!739803))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51265 0))(
  ( (V!51266 (val!17385 Int)) )
))
(declare-datatypes ((ValueCell!16412 0))(
  ( (ValueCellFull!16412 (v!19987 V!51265)) (EmptyCell!16412) )
))
(declare-datatypes ((array!86153 0))(
  ( (array!86154 (arr!41578 (Array (_ BitVec 32) ValueCell!16412)) (size!42130 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86153)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1296737 (= res!861816 (and (= (size!42130 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42129 _keys!1741) (size!42130 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun res!861815 () Bool)

(assert (=> start!109492 (=> (not res!861815) (not e!739803))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109492 (= res!861815 (validMask!0 mask!2175))))

(assert (=> start!109492 e!739803))

(declare-fun tp_is_empty!34621 () Bool)

(assert (=> start!109492 tp_is_empty!34621))

(assert (=> start!109492 true))

(declare-fun e!739802 () Bool)

(declare-fun array_inv!31637 (array!86153) Bool)

(assert (=> start!109492 (and (array_inv!31637 _values!1445) e!739802)))

(declare-fun array_inv!31638 (array!86151) Bool)

(assert (=> start!109492 (array_inv!31638 _keys!1741)))

(assert (=> start!109492 tp!102062))

(declare-fun b!1296738 () Bool)

(declare-fun e!739799 () Bool)

(assert (=> b!1296738 (= e!739799 tp_is_empty!34621)))

(declare-fun b!1296739 () Bool)

(declare-fun res!861817 () Bool)

(assert (=> b!1296739 (=> (not res!861817) (not e!739803))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86151 (_ BitVec 32)) Bool)

(assert (=> b!1296739 (= res!861817 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1296740 () Bool)

(declare-fun res!861814 () Bool)

(assert (=> b!1296740 (=> (not res!861814) (not e!739803))))

(declare-datatypes ((List!29580 0))(
  ( (Nil!29577) (Cons!29576 (h!30785 (_ BitVec 64)) (t!43136 List!29580)) )
))
(declare-fun arrayNoDuplicates!0 (array!86151 (_ BitVec 32) List!29580) Bool)

(assert (=> b!1296740 (= res!861814 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29577))))

(declare-fun b!1296741 () Bool)

(assert (=> b!1296741 (= e!739803 (bvslt (bvsub (size!42129 _keys!1741) from!2144) #b00000000000000000000000000000000))))

(declare-fun b!1296742 () Bool)

(declare-fun e!739800 () Bool)

(assert (=> b!1296742 (= e!739800 tp_is_empty!34621)))

(declare-fun mapNonEmpty!53492 () Bool)

(declare-fun mapRes!53492 () Bool)

(declare-fun tp!102063 () Bool)

(assert (=> mapNonEmpty!53492 (= mapRes!53492 (and tp!102063 e!739800))))

(declare-fun mapRest!53492 () (Array (_ BitVec 32) ValueCell!16412))

(declare-fun mapValue!53492 () ValueCell!16412)

(declare-fun mapKey!53492 () (_ BitVec 32))

(assert (=> mapNonEmpty!53492 (= (arr!41578 _values!1445) (store mapRest!53492 mapKey!53492 mapValue!53492))))

(declare-fun b!1296743 () Bool)

(assert (=> b!1296743 (= e!739802 (and e!739799 mapRes!53492))))

(declare-fun condMapEmpty!53492 () Bool)

(declare-fun mapDefault!53492 () ValueCell!16412)

(assert (=> b!1296743 (= condMapEmpty!53492 (= (arr!41578 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16412)) mapDefault!53492)))))

(declare-fun mapIsEmpty!53492 () Bool)

(assert (=> mapIsEmpty!53492 mapRes!53492))

(declare-fun b!1296744 () Bool)

(declare-fun res!861819 () Bool)

(assert (=> b!1296744 (=> (not res!861819) (not e!739803))))

(declare-fun minValue!1387 () V!51265)

(declare-fun zeroValue!1387 () V!51265)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22456 0))(
  ( (tuple2!22457 (_1!11239 (_ BitVec 64)) (_2!11239 V!51265)) )
))
(declare-datatypes ((List!29581 0))(
  ( (Nil!29578) (Cons!29577 (h!30786 tuple2!22456) (t!43137 List!29581)) )
))
(declare-datatypes ((ListLongMap!20113 0))(
  ( (ListLongMap!20114 (toList!10072 List!29581)) )
))
(declare-fun contains!8120 (ListLongMap!20113 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4988 (array!86151 array!86153 (_ BitVec 32) (_ BitVec 32) V!51265 V!51265 (_ BitVec 32) Int) ListLongMap!20113)

(assert (=> b!1296744 (= res!861819 (contains!8120 (getCurrentListMap!4988 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(assert (= (and start!109492 res!861815) b!1296737))

(assert (= (and b!1296737 res!861816) b!1296739))

(assert (= (and b!1296739 res!861817) b!1296740))

(assert (= (and b!1296740 res!861814) b!1296736))

(assert (= (and b!1296736 res!861818) b!1296744))

(assert (= (and b!1296744 res!861819) b!1296741))

(assert (= (and b!1296743 condMapEmpty!53492) mapIsEmpty!53492))

(assert (= (and b!1296743 (not condMapEmpty!53492)) mapNonEmpty!53492))

(get-info :version)

(assert (= (and mapNonEmpty!53492 ((_ is ValueCellFull!16412) mapValue!53492)) b!1296742))

(assert (= (and b!1296743 ((_ is ValueCellFull!16412) mapDefault!53492)) b!1296738))

(assert (= start!109492 b!1296743))

(declare-fun m!1188111 () Bool)

(assert (=> b!1296740 m!1188111))

(declare-fun m!1188113 () Bool)

(assert (=> b!1296739 m!1188113))

(declare-fun m!1188115 () Bool)

(assert (=> start!109492 m!1188115))

(declare-fun m!1188117 () Bool)

(assert (=> start!109492 m!1188117))

(declare-fun m!1188119 () Bool)

(assert (=> start!109492 m!1188119))

(declare-fun m!1188121 () Bool)

(assert (=> b!1296744 m!1188121))

(assert (=> b!1296744 m!1188121))

(declare-fun m!1188123 () Bool)

(assert (=> b!1296744 m!1188123))

(declare-fun m!1188125 () Bool)

(assert (=> mapNonEmpty!53492 m!1188125))

(check-sat b_and!47053 (not b!1296740) (not b!1296739) (not mapNonEmpty!53492) (not b_next!28981) tp_is_empty!34621 (not start!109492) (not b!1296744))
(check-sat b_and!47053 (not b_next!28981))
