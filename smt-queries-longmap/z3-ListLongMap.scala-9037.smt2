; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!109006 () Bool)

(assert start!109006)

(declare-fun b_free!28495 () Bool)

(declare-fun b_next!28495 () Bool)

(assert (=> start!109006 (= b_free!28495 (not b_next!28495))))

(declare-fun tp!100605 () Bool)

(declare-fun b_and!46567 () Bool)

(assert (=> start!109006 (= tp!100605 b_and!46567)))

(declare-fun b!1288129 () Bool)

(declare-fun res!855564 () Bool)

(declare-fun e!735567 () Bool)

(assert (=> b!1288129 (=> (not res!855564) (not e!735567))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k0!1205 () (_ BitVec 64))

(declare-datatypes ((array!85207 0))(
  ( (array!85208 (arr!41105 (Array (_ BitVec 32) (_ BitVec 64))) (size!41657 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85207)

(assert (=> b!1288129 (= res!855564 (and (not (= k0!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k0!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41657 _keys!1741))))))

(declare-fun b!1288130 () Bool)

(declare-fun e!735564 () Bool)

(declare-fun tp_is_empty!34135 () Bool)

(assert (=> b!1288130 (= e!735564 tp_is_empty!34135)))

(declare-fun mapNonEmpty!52763 () Bool)

(declare-fun mapRes!52763 () Bool)

(declare-fun tp!100604 () Bool)

(declare-fun e!735566 () Bool)

(assert (=> mapNonEmpty!52763 (= mapRes!52763 (and tp!100604 e!735566))))

(declare-datatypes ((V!50617 0))(
  ( (V!50618 (val!17142 Int)) )
))
(declare-datatypes ((ValueCell!16169 0))(
  ( (ValueCellFull!16169 (v!19744 V!50617)) (EmptyCell!16169) )
))
(declare-fun mapRest!52763 () (Array (_ BitVec 32) ValueCell!16169))

(declare-fun mapKey!52763 () (_ BitVec 32))

(declare-datatypes ((array!85209 0))(
  ( (array!85210 (arr!41106 (Array (_ BitVec 32) ValueCell!16169)) (size!41658 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85209)

(declare-fun mapValue!52763 () ValueCell!16169)

(assert (=> mapNonEmpty!52763 (= (arr!41106 _values!1445) (store mapRest!52763 mapKey!52763 mapValue!52763))))

(declare-fun res!855556 () Bool)

(assert (=> start!109006 (=> (not res!855556) (not e!735567))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109006 (= res!855556 (validMask!0 mask!2175))))

(assert (=> start!109006 e!735567))

(assert (=> start!109006 tp_is_empty!34135))

(assert (=> start!109006 true))

(declare-fun e!735565 () Bool)

(declare-fun array_inv!31327 (array!85209) Bool)

(assert (=> start!109006 (and (array_inv!31327 _values!1445) e!735565)))

(declare-fun array_inv!31328 (array!85207) Bool)

(assert (=> start!109006 (array_inv!31328 _keys!1741)))

(assert (=> start!109006 tp!100605))

(declare-fun b!1288131 () Bool)

(declare-fun res!855557 () Bool)

(assert (=> b!1288131 (=> (not res!855557) (not e!735567))))

(declare-datatypes ((List!29229 0))(
  ( (Nil!29226) (Cons!29225 (h!30434 (_ BitVec 64)) (t!42785 List!29229)) )
))
(declare-fun arrayNoDuplicates!0 (array!85207 (_ BitVec 32) List!29229) Bool)

(assert (=> b!1288131 (= res!855557 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29226))))

(declare-fun b!1288132 () Bool)

(declare-fun e!735562 () Bool)

(assert (=> b!1288132 (= e!735562 true)))

(declare-fun minValue!1387 () V!50617)

(declare-fun zeroValue!1387 () V!50617)

(declare-fun lt!577758 () Bool)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22058 0))(
  ( (tuple2!22059 (_1!11040 (_ BitVec 64)) (_2!11040 V!50617)) )
))
(declare-datatypes ((List!29230 0))(
  ( (Nil!29227) (Cons!29226 (h!30435 tuple2!22058) (t!42786 List!29230)) )
))
(declare-datatypes ((ListLongMap!19715 0))(
  ( (ListLongMap!19716 (toList!9873 List!29230)) )
))
(declare-fun contains!7921 (ListLongMap!19715 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!5994 (array!85207 array!85209 (_ BitVec 32) (_ BitVec 32) V!50617 V!50617 (_ BitVec 32) Int) ListLongMap!19715)

(assert (=> b!1288132 (= lt!577758 (contains!7921 (getCurrentListMapNoExtraKeys!5994 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun b!1288133 () Bool)

(declare-fun res!855563 () Bool)

(assert (=> b!1288133 (=> (not res!855563) (not e!735567))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85207 (_ BitVec 32)) Bool)

(assert (=> b!1288133 (= res!855563 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1288134 () Bool)

(assert (=> b!1288134 (= e!735567 (not e!735562))))

(declare-fun res!855562 () Bool)

(assert (=> b!1288134 (=> res!855562 e!735562)))

(assert (=> b!1288134 (= res!855562 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288134 (not (contains!7921 (ListLongMap!19716 Nil!29227) k0!1205))))

(declare-datatypes ((Unit!42450 0))(
  ( (Unit!42451) )
))
(declare-fun lt!577759 () Unit!42450)

(declare-fun emptyContainsNothing!32 ((_ BitVec 64)) Unit!42450)

(assert (=> b!1288134 (= lt!577759 (emptyContainsNothing!32 k0!1205))))

(declare-fun b!1288135 () Bool)

(assert (=> b!1288135 (= e!735565 (and e!735564 mapRes!52763))))

(declare-fun condMapEmpty!52763 () Bool)

(declare-fun mapDefault!52763 () ValueCell!16169)

(assert (=> b!1288135 (= condMapEmpty!52763 (= (arr!41106 _values!1445) ((as const (Array (_ BitVec 32) ValueCell!16169)) mapDefault!52763)))))

(declare-fun b!1288136 () Bool)

(declare-fun res!855559 () Bool)

(assert (=> b!1288136 (=> (not res!855559) (not e!735567))))

(assert (=> b!1288136 (= res!855559 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41657 _keys!1741))))))

(declare-fun b!1288137 () Bool)

(declare-fun res!855558 () Bool)

(assert (=> b!1288137 (=> (not res!855558) (not e!735567))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288137 (= res!855558 (not (validKeyInArray!0 (select (arr!41105 _keys!1741) from!2144))))))

(declare-fun b!1288138 () Bool)

(declare-fun res!855561 () Bool)

(assert (=> b!1288138 (=> (not res!855561) (not e!735567))))

(declare-fun getCurrentListMap!4832 (array!85207 array!85209 (_ BitVec 32) (_ BitVec 32) V!50617 V!50617 (_ BitVec 32) Int) ListLongMap!19715)

(assert (=> b!1288138 (= res!855561 (contains!7921 (getCurrentListMap!4832 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k0!1205))))

(declare-fun mapIsEmpty!52763 () Bool)

(assert (=> mapIsEmpty!52763 mapRes!52763))

(declare-fun b!1288139 () Bool)

(declare-fun res!855560 () Bool)

(assert (=> b!1288139 (=> (not res!855560) (not e!735567))))

(assert (=> b!1288139 (= res!855560 (and (= (size!41658 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41657 _keys!1741) (size!41658 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1288140 () Bool)

(assert (=> b!1288140 (= e!735566 tp_is_empty!34135)))

(assert (= (and start!109006 res!855556) b!1288139))

(assert (= (and b!1288139 res!855560) b!1288133))

(assert (= (and b!1288133 res!855563) b!1288131))

(assert (= (and b!1288131 res!855557) b!1288136))

(assert (= (and b!1288136 res!855559) b!1288138))

(assert (= (and b!1288138 res!855561) b!1288129))

(assert (= (and b!1288129 res!855564) b!1288137))

(assert (= (and b!1288137 res!855558) b!1288134))

(assert (= (and b!1288134 (not res!855562)) b!1288132))

(assert (= (and b!1288135 condMapEmpty!52763) mapIsEmpty!52763))

(assert (= (and b!1288135 (not condMapEmpty!52763)) mapNonEmpty!52763))

(get-info :version)

(assert (= (and mapNonEmpty!52763 ((_ is ValueCellFull!16169) mapValue!52763)) b!1288140))

(assert (= (and b!1288135 ((_ is ValueCellFull!16169) mapDefault!52763)) b!1288130))

(assert (= start!109006 b!1288135))

(declare-fun m!1180347 () Bool)

(assert (=> b!1288132 m!1180347))

(assert (=> b!1288132 m!1180347))

(declare-fun m!1180349 () Bool)

(assert (=> b!1288132 m!1180349))

(declare-fun m!1180351 () Bool)

(assert (=> b!1288131 m!1180351))

(declare-fun m!1180353 () Bool)

(assert (=> b!1288138 m!1180353))

(assert (=> b!1288138 m!1180353))

(declare-fun m!1180355 () Bool)

(assert (=> b!1288138 m!1180355))

(declare-fun m!1180357 () Bool)

(assert (=> b!1288137 m!1180357))

(assert (=> b!1288137 m!1180357))

(declare-fun m!1180359 () Bool)

(assert (=> b!1288137 m!1180359))

(declare-fun m!1180361 () Bool)

(assert (=> b!1288133 m!1180361))

(declare-fun m!1180363 () Bool)

(assert (=> b!1288134 m!1180363))

(declare-fun m!1180365 () Bool)

(assert (=> b!1288134 m!1180365))

(declare-fun m!1180367 () Bool)

(assert (=> mapNonEmpty!52763 m!1180367))

(declare-fun m!1180369 () Bool)

(assert (=> start!109006 m!1180369))

(declare-fun m!1180371 () Bool)

(assert (=> start!109006 m!1180371))

(declare-fun m!1180373 () Bool)

(assert (=> start!109006 m!1180373))

(check-sat (not b!1288134) b_and!46567 (not b!1288138) tp_is_empty!34135 (not mapNonEmpty!52763) (not b!1288131) (not b!1288132) (not b!1288133) (not start!109006) (not b!1288137) (not b_next!28495))
(check-sat b_and!46567 (not b_next!28495))
