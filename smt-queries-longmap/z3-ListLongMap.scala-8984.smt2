; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108888 () Bool)

(assert start!108888)

(declare-fun b_free!28177 () Bool)

(declare-fun b_next!28177 () Bool)

(assert (=> start!108888 (= b_free!28177 (not b_next!28177))))

(declare-fun tp!99646 () Bool)

(declare-fun b_and!46245 () Bool)

(assert (=> start!108888 (= tp!99646 b_and!46245)))

(declare-fun b!1283966 () Bool)

(declare-fun e!733734 () Bool)

(assert (=> b!1283966 (= e!733734 false)))

(declare-datatypes ((V!50193 0))(
  ( (V!50194 (val!16983 Int)) )
))
(declare-fun minValue!1387 () V!50193)

(declare-fun zeroValue!1387 () V!50193)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!577046 () Bool)

(declare-datatypes ((ValueCell!16010 0))(
  ( (ValueCellFull!16010 (v!19580 V!50193)) (EmptyCell!16010) )
))
(declare-datatypes ((array!84733 0))(
  ( (array!84734 (arr!40864 (Array (_ BitVec 32) ValueCell!16010)) (size!41415 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84733)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84735 0))(
  ( (array!84736 (arr!40865 (Array (_ BitVec 32) (_ BitVec 64))) (size!41416 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84735)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21764 0))(
  ( (tuple2!21765 (_1!10893 (_ BitVec 64)) (_2!10893 V!50193)) )
))
(declare-datatypes ((List!28976 0))(
  ( (Nil!28973) (Cons!28972 (h!30190 tuple2!21764) (t!42512 List!28976)) )
))
(declare-datatypes ((ListLongMap!19429 0))(
  ( (ListLongMap!19430 (toList!9730 List!28976)) )
))
(declare-fun contains!7861 (ListLongMap!19429 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4799 (array!84735 array!84733 (_ BitVec 32) (_ BitVec 32) V!50193 V!50193 (_ BitVec 32) Int) ListLongMap!19429)

(assert (=> b!1283966 (= lt!577046 (contains!7861 (getCurrentListMap!4799 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1283967 () Bool)

(declare-fun res!852496 () Bool)

(assert (=> b!1283967 (=> (not res!852496) (not e!733734))))

(assert (=> b!1283967 (= res!852496 (and (= (size!41415 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41416 _keys!1741) (size!41415 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52283 () Bool)

(declare-fun mapRes!52283 () Bool)

(assert (=> mapIsEmpty!52283 mapRes!52283))

(declare-fun res!852494 () Bool)

(assert (=> start!108888 (=> (not res!852494) (not e!733734))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108888 (= res!852494 (validMask!0 mask!2175))))

(assert (=> start!108888 e!733734))

(declare-fun tp_is_empty!33817 () Bool)

(assert (=> start!108888 tp_is_empty!33817))

(assert (=> start!108888 true))

(declare-fun e!733737 () Bool)

(declare-fun array_inv!31211 (array!84733) Bool)

(assert (=> start!108888 (and (array_inv!31211 _values!1445) e!733737)))

(declare-fun array_inv!31212 (array!84735) Bool)

(assert (=> start!108888 (array_inv!31212 _keys!1741)))

(assert (=> start!108888 tp!99646))

(declare-fun b!1283968 () Bool)

(declare-fun e!733733 () Bool)

(assert (=> b!1283968 (= e!733737 (and e!733733 mapRes!52283))))

(declare-fun condMapEmpty!52283 () Bool)

(declare-fun mapDefault!52283 () ValueCell!16010)

(assert (=> b!1283968 (= condMapEmpty!52283 (= (arr!40864 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16010)) mapDefault!52283)))))

(declare-fun mapNonEmpty!52283 () Bool)

(declare-fun tp!99647 () Bool)

(declare-fun e!733735 () Bool)

(assert (=> mapNonEmpty!52283 (= mapRes!52283 (and tp!99647 e!733735))))

(declare-fun mapKey!52283 () (_ BitVec 32))

(declare-fun mapValue!52283 () ValueCell!16010)

(declare-fun mapRest!52283 () (Array (_ BitVec 32) ValueCell!16010))

(assert (=> mapNonEmpty!52283 (= (arr!40864 _values!1445) (store mapRest!52283 mapKey!52283 mapValue!52283))))

(declare-fun b!1283969 () Bool)

(assert (=> b!1283969 (= e!733733 tp_is_empty!33817)))

(declare-fun b!1283970 () Bool)

(assert (=> b!1283970 (= e!733735 tp_is_empty!33817)))

(declare-fun b!1283971 () Bool)

(declare-fun res!852493 () Bool)

(assert (=> b!1283971 (=> (not res!852493) (not e!733734))))

(declare-datatypes ((List!28977 0))(
  ( (Nil!28974) (Cons!28973 (h!30191 (_ BitVec 64)) (t!42513 List!28977)) )
))
(declare-fun arrayNoDuplicates!0 (array!84735 (_ BitVec 32) List!28977) Bool)

(assert (=> b!1283971 (= res!852493 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28974))))

(declare-fun b!1283972 () Bool)

(declare-fun res!852492 () Bool)

(assert (=> b!1283972 (=> (not res!852492) (not e!733734))))

(assert (=> b!1283972 (= res!852492 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41416 _keys!1741))))))

(declare-fun b!1283973 () Bool)

(declare-fun res!852495 () Bool)

(assert (=> b!1283973 (=> (not res!852495) (not e!733734))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84735 (_ BitVec 32)) Bool)

(assert (=> b!1283973 (= res!852495 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(assert (= (and start!108888 res!852494) b!1283967))

(assert (= (and b!1283967 res!852496) b!1283973))

(assert (= (and b!1283973 res!852495) b!1283971))

(assert (= (and b!1283971 res!852493) b!1283972))

(assert (= (and b!1283972 res!852492) b!1283966))

(assert (= (and b!1283968 condMapEmpty!52283) mapIsEmpty!52283))

(assert (= (and b!1283968 (not condMapEmpty!52283)) mapNonEmpty!52283))

(get-info :version)

(assert (= (and mapNonEmpty!52283 ((_ is ValueCellFull!16010) mapValue!52283)) b!1283970))

(assert (= (and b!1283968 ((_ is ValueCellFull!16010) mapDefault!52283)) b!1283969))

(assert (= start!108888 b!1283968))

(declare-fun m!1178401 () Bool)

(assert (=> b!1283966 m!1178401))

(assert (=> b!1283966 m!1178401))

(declare-fun m!1178403 () Bool)

(assert (=> b!1283966 m!1178403))

(declare-fun m!1178405 () Bool)

(assert (=> b!1283973 m!1178405))

(declare-fun m!1178407 () Bool)

(assert (=> start!108888 m!1178407))

(declare-fun m!1178409 () Bool)

(assert (=> start!108888 m!1178409))

(declare-fun m!1178411 () Bool)

(assert (=> start!108888 m!1178411))

(declare-fun m!1178413 () Bool)

(assert (=> b!1283971 m!1178413))

(declare-fun m!1178415 () Bool)

(assert (=> mapNonEmpty!52283 m!1178415))

(check-sat (not start!108888) (not b!1283971) (not b!1283966) (not b_next!28177) (not mapNonEmpty!52283) tp_is_empty!33817 b_and!46245 (not b!1283973))
(check-sat b_and!46245 (not b_next!28177))
