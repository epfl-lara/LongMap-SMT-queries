; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108964 () Bool)

(assert start!108964)

(declare-fun b_free!28453 () Bool)

(declare-fun b_next!28453 () Bool)

(assert (=> start!108964 (= b_free!28453 (not b_next!28453))))

(declare-fun tp!100479 () Bool)

(declare-fun b_and!46525 () Bool)

(assert (=> start!108964 (= tp!100479 b_and!46525)))

(declare-fun mapNonEmpty!52700 () Bool)

(declare-fun mapRes!52700 () Bool)

(declare-fun tp!100478 () Bool)

(declare-fun e!735247 () Bool)

(assert (=> mapNonEmpty!52700 (= mapRes!52700 (and tp!100478 e!735247))))

(declare-fun mapKey!52700 () (_ BitVec 32))

(declare-datatypes ((V!50561 0))(
  ( (V!50562 (val!17121 Int)) )
))
(declare-datatypes ((ValueCell!16148 0))(
  ( (ValueCellFull!16148 (v!19723 V!50561)) (EmptyCell!16148) )
))
(declare-fun mapRest!52700 () (Array (_ BitVec 32) ValueCell!16148))

(declare-fun mapValue!52700 () ValueCell!16148)

(declare-datatypes ((array!85125 0))(
  ( (array!85126 (arr!41064 (Array (_ BitVec 32) ValueCell!16148)) (size!41616 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85125)

(assert (=> mapNonEmpty!52700 (= (arr!41064 _values!1445) (store mapRest!52700 mapKey!52700 mapValue!52700))))

(declare-fun b!1287434 () Bool)

(declare-fun e!735246 () Bool)

(declare-fun e!735248 () Bool)

(assert (=> b!1287434 (= e!735246 (and e!735248 mapRes!52700))))

(declare-fun condMapEmpty!52700 () Bool)

(declare-fun mapDefault!52700 () ValueCell!16148)

(assert (=> b!1287434 (= condMapEmpty!52700 (= (arr!41064 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16148)) mapDefault!52700)))))

(declare-fun b!1287435 () Bool)

(declare-fun res!855050 () Bool)

(declare-fun e!735245 () Bool)

(assert (=> b!1287435 (=> (not res!855050) (not e!735245))))

(declare-datatypes ((array!85127 0))(
  ( (array!85128 (arr!41065 (Array (_ BitVec 32) (_ BitVec 64))) (size!41617 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85127)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287435 (= res!855050 (not (validKeyInArray!0 (select (arr!41065 _keys!1741) from!2144))))))

(declare-fun b!1287436 () Bool)

(declare-fun res!855054 () Bool)

(assert (=> b!1287436 (=> (not res!855054) (not e!735245))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85127 (_ BitVec 32)) Bool)

(assert (=> b!1287436 (= res!855054 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1287437 () Bool)

(declare-fun res!855055 () Bool)

(assert (=> b!1287437 (=> (not res!855055) (not e!735245))))

(declare-datatypes ((List!29197 0))(
  ( (Nil!29194) (Cons!29193 (h!30402 (_ BitVec 64)) (t!42753 List!29197)) )
))
(declare-fun arrayNoDuplicates!0 (array!85127 (_ BitVec 32) List!29197) Bool)

(assert (=> b!1287437 (= res!855055 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29194))))

(declare-fun b!1287438 () Bool)

(declare-fun res!855057 () Bool)

(assert (=> b!1287438 (=> (not res!855057) (not e!735245))))

(assert (=> b!1287438 (= res!855057 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41617 _keys!1741))))))

(declare-fun b!1287439 () Bool)

(declare-fun res!855053 () Bool)

(assert (=> b!1287439 (=> (not res!855053) (not e!735245))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287439 (= res!855053 (and (= (size!41616 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41617 _keys!1741) (size!41616 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1287440 () Bool)

(declare-fun tp_is_empty!34093 () Bool)

(assert (=> b!1287440 (= e!735247 tp_is_empty!34093)))

(declare-fun b!1287441 () Bool)

(assert (=> b!1287441 (= e!735248 tp_is_empty!34093)))

(declare-fun b!1287442 () Bool)

(assert (=> b!1287442 (= e!735245 (not true))))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22024 0))(
  ( (tuple2!22025 (_1!11023 (_ BitVec 64)) (_2!11023 V!50561)) )
))
(declare-datatypes ((List!29198 0))(
  ( (Nil!29195) (Cons!29194 (h!30403 tuple2!22024) (t!42754 List!29198)) )
))
(declare-datatypes ((ListLongMap!19681 0))(
  ( (ListLongMap!19682 (toList!9856 List!29198)) )
))
(declare-fun contains!7904 (ListLongMap!19681 (_ BitVec 64)) Bool)

(assert (=> b!1287442 (not (contains!7904 (ListLongMap!19682 Nil!29195) k0!1205))))

(declare-datatypes ((Unit!42420 0))(
  ( (Unit!42421) )
))
(declare-fun lt!577693 () Unit!42420)

(declare-fun emptyContainsNothing!17 ((_ BitVec 64)) Unit!42420)

(assert (=> b!1287442 (= lt!577693 (emptyContainsNothing!17 k0!1205))))

(declare-fun res!855051 () Bool)

(assert (=> start!108964 (=> (not res!855051) (not e!735245))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108964 (= res!855051 (validMask!0 mask!2175))))

(assert (=> start!108964 e!735245))

(assert (=> start!108964 tp_is_empty!34093))

(assert (=> start!108964 true))

(declare-fun array_inv!31295 (array!85125) Bool)

(assert (=> start!108964 (and (array_inv!31295 _values!1445) e!735246)))

(declare-fun array_inv!31296 (array!85127) Bool)

(assert (=> start!108964 (array_inv!31296 _keys!1741)))

(assert (=> start!108964 tp!100479))

(declare-fun b!1287443 () Bool)

(declare-fun res!855052 () Bool)

(assert (=> b!1287443 (=> (not res!855052) (not e!735245))))

(declare-fun minValue!1387 () V!50561)

(declare-fun zeroValue!1387 () V!50561)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!4819 (array!85127 array!85125 (_ BitVec 32) (_ BitVec 32) V!50561 V!50561 (_ BitVec 32) Int) ListLongMap!19681)

(assert (=> b!1287443 (= res!855052 (contains!7904 (getCurrentListMap!4819 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52700 () Bool)

(assert (=> mapIsEmpty!52700 mapRes!52700))

(declare-fun b!1287444 () Bool)

(declare-fun res!855056 () Bool)

(assert (=> b!1287444 (=> (not res!855056) (not e!735245))))

(assert (=> b!1287444 (= res!855056 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41617 _keys!1741))))))

(assert (= (and start!108964 res!855051) b!1287439))

(assert (= (and b!1287439 res!855053) b!1287436))

(assert (= (and b!1287436 res!855054) b!1287437))

(assert (= (and b!1287437 res!855055) b!1287438))

(assert (= (and b!1287438 res!855057) b!1287443))

(assert (= (and b!1287443 res!855052) b!1287444))

(assert (= (and b!1287444 res!855056) b!1287435))

(assert (= (and b!1287435 res!855050) b!1287442))

(assert (= (and b!1287434 condMapEmpty!52700) mapIsEmpty!52700))

(assert (= (and b!1287434 (not condMapEmpty!52700)) mapNonEmpty!52700))

(get-info :version)

(assert (= (and mapNonEmpty!52700 ((_ is ValueCellFull!16148) mapValue!52700)) b!1287440))

(assert (= (and b!1287434 ((_ is ValueCellFull!16148) mapDefault!52700)) b!1287441))

(assert (= start!108964 b!1287434))

(declare-fun m!1179843 () Bool)

(assert (=> b!1287437 m!1179843))

(declare-fun m!1179845 () Bool)

(assert (=> b!1287443 m!1179845))

(assert (=> b!1287443 m!1179845))

(declare-fun m!1179847 () Bool)

(assert (=> b!1287443 m!1179847))

(declare-fun m!1179849 () Bool)

(assert (=> start!108964 m!1179849))

(declare-fun m!1179851 () Bool)

(assert (=> start!108964 m!1179851))

(declare-fun m!1179853 () Bool)

(assert (=> start!108964 m!1179853))

(declare-fun m!1179855 () Bool)

(assert (=> b!1287436 m!1179855))

(declare-fun m!1179857 () Bool)

(assert (=> mapNonEmpty!52700 m!1179857))

(declare-fun m!1179859 () Bool)

(assert (=> b!1287442 m!1179859))

(declare-fun m!1179861 () Bool)

(assert (=> b!1287442 m!1179861))

(declare-fun m!1179863 () Bool)

(assert (=> b!1287435 m!1179863))

(assert (=> b!1287435 m!1179863))

(declare-fun m!1179865 () Bool)

(assert (=> b!1287435 m!1179865))

(check-sat (not b!1287442) (not b!1287436) tp_is_empty!34093 (not start!108964) (not mapNonEmpty!52700) (not b!1287435) (not b!1287443) (not b_next!28453) (not b!1287437) b_and!46525)
(check-sat b_and!46525 (not b_next!28453))
