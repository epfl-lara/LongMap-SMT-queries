; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!108742 () Bool)

(assert start!108742)

(declare-fun b_free!28255 () Bool)

(declare-fun b_next!28255 () Bool)

(assert (=> start!108742 (= b_free!28255 (not b_next!28255))))

(declare-fun tp!99882 () Bool)

(declare-fun b_and!46303 () Bool)

(assert (=> start!108742 (= tp!99882 b_and!46303)))

(declare-fun b!1283964 () Bool)

(declare-fun res!852961 () Bool)

(declare-fun e!733442 () Bool)

(assert (=> b!1283964 (=> (not res!852961) (not e!733442))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50297 0))(
  ( (V!50298 (val!17022 Int)) )
))
(declare-datatypes ((ValueCell!16049 0))(
  ( (ValueCellFull!16049 (v!19623 V!50297)) (EmptyCell!16049) )
))
(declare-datatypes ((array!84749 0))(
  ( (array!84750 (arr!40877 (Array (_ BitVec 32) ValueCell!16049)) (size!41429 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84749)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84751 0))(
  ( (array!84752 (arr!40878 (Array (_ BitVec 32) (_ BitVec 64))) (size!41430 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84751)

(assert (=> b!1283964 (= res!852961 (and (= (size!41429 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41430 _keys!1741) (size!41429 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283965 () Bool)

(declare-fun res!852969 () Bool)

(assert (=> b!1283965 (=> (not res!852969) (not e!733442))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!84751 (_ BitVec 32)) Bool)

(assert (=> b!1283965 (= res!852969 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!52400 () Bool)

(declare-fun mapRes!52400 () Bool)

(assert (=> mapIsEmpty!52400 mapRes!52400))

(declare-fun b!1283966 () Bool)

(declare-fun e!733444 () Bool)

(declare-fun e!733445 () Bool)

(assert (=> b!1283966 (= e!733444 (and e!733445 mapRes!52400))))

(declare-fun condMapEmpty!52400 () Bool)

(declare-fun mapDefault!52400 () ValueCell!16049)

(assert (=> b!1283966 (= condMapEmpty!52400 (= (arr!40877 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16049)) mapDefault!52400)))))

(declare-fun b!1283968 () Bool)

(declare-fun res!852963 () Bool)

(assert (=> b!1283968 (=> (not res!852963) (not e!733442))))

(declare-datatypes ((List!29061 0))(
  ( (Nil!29058) (Cons!29057 (h!30266 (_ BitVec 64)) (t!42597 List!29061)) )
))
(declare-fun arrayNoDuplicates!0 (array!84751 (_ BitVec 32) List!29061) Bool)

(assert (=> b!1283968 (= res!852963 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29058))))

(declare-fun b!1283969 () Bool)

(declare-fun res!852966 () Bool)

(assert (=> b!1283969 (=> (not res!852966) (not e!733442))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283969 (= res!852966 (validKeyInArray!0 (select (arr!40878 _keys!1741) from!2144)))))

(declare-fun b!1283970 () Bool)

(declare-fun res!852962 () Bool)

(assert (=> b!1283970 (=> (not res!852962) (not e!733442))))

(assert (=> b!1283970 (= res!852962 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41430 _keys!1741))))))

(declare-fun b!1283971 () Bool)

(declare-fun res!852968 () Bool)

(assert (=> b!1283971 (=> (not res!852968) (not e!733442))))

(declare-fun minValue!1387 () V!50297)

(declare-fun zeroValue!1387 () V!50297)

(declare-fun k0!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21878 0))(
  ( (tuple2!21879 (_1!10950 (_ BitVec 64)) (_2!10950 V!50297)) )
))
(declare-datatypes ((List!29062 0))(
  ( (Nil!29059) (Cons!29058 (h!30267 tuple2!21878) (t!42598 List!29062)) )
))
(declare-datatypes ((ListLongMap!19535 0))(
  ( (ListLongMap!19536 (toList!9783 List!29062)) )
))
(declare-fun contains!7830 (ListLongMap!19535 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4753 (array!84751 array!84749 (_ BitVec 32) (_ BitVec 32) V!50297 V!50297 (_ BitVec 32) Int) ListLongMap!19535)

(assert (=> b!1283971 (= res!852968 (contains!7830 (getCurrentListMap!4753 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapNonEmpty!52400 () Bool)

(declare-fun tp!99881 () Bool)

(declare-fun e!733446 () Bool)

(assert (=> mapNonEmpty!52400 (= mapRes!52400 (and tp!99881 e!733446))))

(declare-fun mapRest!52400 () (Array (_ BitVec 32) ValueCell!16049))

(declare-fun mapValue!52400 () ValueCell!16049)

(declare-fun mapKey!52400 () (_ BitVec 32))

(assert (=> mapNonEmpty!52400 (= (arr!40877 _values!1445) (store mapRest!52400 mapKey!52400 mapValue!52400))))

(declare-fun b!1283967 () Bool)

(declare-fun res!852965 () Bool)

(assert (=> b!1283967 (=> (not res!852965) (not e!733442))))

(assert (=> b!1283967 (= res!852965 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41430 _keys!1741))))))

(declare-fun res!852964 () Bool)

(assert (=> start!108742 (=> (not res!852964) (not e!733442))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108742 (= res!852964 (validMask!0 mask!2175))))

(assert (=> start!108742 e!733442))

(declare-fun tp_is_empty!33895 () Bool)

(assert (=> start!108742 tp_is_empty!33895))

(assert (=> start!108742 true))

(declare-fun array_inv!31165 (array!84749) Bool)

(assert (=> start!108742 (and (array_inv!31165 _values!1445) e!733444)))

(declare-fun array_inv!31166 (array!84751) Bool)

(assert (=> start!108742 (array_inv!31166 _keys!1741)))

(assert (=> start!108742 tp!99882))

(declare-fun b!1283972 () Bool)

(assert (=> b!1283972 (= e!733442 (not true))))

(declare-fun lt!576576 () ListLongMap!19535)

(assert (=> b!1283972 (contains!7830 lt!576576 k0!1205)))

(declare-datatypes ((Unit!42347 0))(
  ( (Unit!42348) )
))
(declare-fun lt!576575 () Unit!42347)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!24 ((_ BitVec 64) (_ BitVec 64) V!50297 ListLongMap!19535) Unit!42347)

(assert (=> b!1283972 (= lt!576575 (lemmaInListMapAfterAddingDiffThenInBefore!24 k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576576))))

(declare-fun +!4339 (ListLongMap!19535 tuple2!21878) ListLongMap!19535)

(declare-fun getCurrentListMapNoExtraKeys!5970 (array!84751 array!84749 (_ BitVec 32) (_ BitVec 32) V!50297 V!50297 (_ BitVec 32) Int) ListLongMap!19535)

(assert (=> b!1283972 (= lt!576576 (+!4339 (getCurrentListMapNoExtraKeys!5970 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21879 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1283973 () Bool)

(assert (=> b!1283973 (= e!733446 tp_is_empty!33895)))

(declare-fun b!1283974 () Bool)

(declare-fun res!852967 () Bool)

(assert (=> b!1283974 (=> (not res!852967) (not e!733442))))

(assert (=> b!1283974 (= res!852967 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1283975 () Bool)

(assert (=> b!1283975 (= e!733445 tp_is_empty!33895)))

(assert (= (and start!108742 res!852964) b!1283964))

(assert (= (and b!1283964 res!852961) b!1283965))

(assert (= (and b!1283965 res!852969) b!1283968))

(assert (= (and b!1283968 res!852963) b!1283970))

(assert (= (and b!1283970 res!852962) b!1283971))

(assert (= (and b!1283971 res!852968) b!1283967))

(assert (= (and b!1283967 res!852965) b!1283969))

(assert (= (and b!1283969 res!852966) b!1283974))

(assert (= (and b!1283974 res!852967) b!1283972))

(assert (= (and b!1283966 condMapEmpty!52400) mapIsEmpty!52400))

(assert (= (and b!1283966 (not condMapEmpty!52400)) mapNonEmpty!52400))

(get-info :version)

(assert (= (and mapNonEmpty!52400 ((_ is ValueCellFull!16049) mapValue!52400)) b!1283973))

(assert (= (and b!1283966 ((_ is ValueCellFull!16049) mapDefault!52400)) b!1283975))

(assert (= start!108742 b!1283966))

(declare-fun m!1177321 () Bool)

(assert (=> b!1283972 m!1177321))

(declare-fun m!1177323 () Bool)

(assert (=> b!1283972 m!1177323))

(declare-fun m!1177325 () Bool)

(assert (=> b!1283972 m!1177325))

(assert (=> b!1283972 m!1177325))

(declare-fun m!1177327 () Bool)

(assert (=> b!1283972 m!1177327))

(declare-fun m!1177329 () Bool)

(assert (=> b!1283968 m!1177329))

(declare-fun m!1177331 () Bool)

(assert (=> b!1283965 m!1177331))

(declare-fun m!1177333 () Bool)

(assert (=> mapNonEmpty!52400 m!1177333))

(declare-fun m!1177335 () Bool)

(assert (=> b!1283971 m!1177335))

(assert (=> b!1283971 m!1177335))

(declare-fun m!1177337 () Bool)

(assert (=> b!1283971 m!1177337))

(declare-fun m!1177339 () Bool)

(assert (=> b!1283969 m!1177339))

(assert (=> b!1283969 m!1177339))

(declare-fun m!1177341 () Bool)

(assert (=> b!1283969 m!1177341))

(declare-fun m!1177343 () Bool)

(assert (=> start!108742 m!1177343))

(declare-fun m!1177345 () Bool)

(assert (=> start!108742 m!1177345))

(declare-fun m!1177347 () Bool)

(assert (=> start!108742 m!1177347))

(check-sat (not b!1283969) (not start!108742) (not mapNonEmpty!52400) b_and!46303 tp_is_empty!33895 (not b!1283972) (not b_next!28255) (not b!1283968) (not b!1283971) (not b!1283965))
(check-sat b_and!46303 (not b_next!28255))
