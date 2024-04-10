; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109078 () Bool)

(assert start!109078)

(declare-fun b_free!28567 () Bool)

(declare-fun b_next!28567 () Bool)

(assert (=> start!109078 (= b_free!28567 (not b_next!28567))))

(declare-fun tp!100820 () Bool)

(declare-fun b_and!46657 () Bool)

(assert (=> start!109078 (= tp!100820 b_and!46657)))

(declare-fun b!1289489 () Bool)

(declare-fun e!736239 () Bool)

(declare-fun tp_is_empty!34207 () Bool)

(assert (=> b!1289489 (= e!736239 tp_is_empty!34207)))

(declare-fun b!1289490 () Bool)

(declare-fun res!856556 () Bool)

(declare-fun e!736244 () Bool)

(assert (=> b!1289490 (=> (not res!856556) (not e!736244))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85456 0))(
  ( (array!85457 (arr!41229 (Array (_ BitVec 32) (_ BitVec 64))) (size!41779 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85456)

(assert (=> b!1289490 (= res!856556 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41779 _keys!1741))))))

(declare-fun b!1289491 () Bool)

(declare-fun res!856561 () Bool)

(assert (=> b!1289491 (=> (not res!856561) (not e!736244))))

(declare-datatypes ((V!50713 0))(
  ( (V!50714 (val!17178 Int)) )
))
(declare-fun minValue!1387 () V!50713)

(declare-fun zeroValue!1387 () V!50713)

(declare-datatypes ((ValueCell!16205 0))(
  ( (ValueCellFull!16205 (v!19781 V!50713)) (EmptyCell!16205) )
))
(declare-datatypes ((array!85458 0))(
  ( (array!85459 (arr!41230 (Array (_ BitVec 32) ValueCell!16205)) (size!41780 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85458)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22064 0))(
  ( (tuple2!22065 (_1!11043 (_ BitVec 64)) (_2!11043 V!50713)) )
))
(declare-datatypes ((List!29233 0))(
  ( (Nil!29230) (Cons!29229 (h!30438 tuple2!22064) (t!42797 List!29233)) )
))
(declare-datatypes ((ListLongMap!19721 0))(
  ( (ListLongMap!19722 (toList!9876 List!29233)) )
))
(declare-fun contains!7994 (ListLongMap!19721 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4936 (array!85456 array!85458 (_ BitVec 32) (_ BitVec 32) V!50713 V!50713 (_ BitVec 32) Int) ListLongMap!19721)

(assert (=> b!1289491 (= res!856561 (contains!7994 (getCurrentListMap!4936 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289492 () Bool)

(declare-fun res!856560 () Bool)

(assert (=> b!1289492 (=> (not res!856560) (not e!736244))))

(assert (=> b!1289492 (= res!856560 (and (= (size!41780 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41779 _keys!1741) (size!41780 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1289493 () Bool)

(declare-fun res!856557 () Bool)

(assert (=> b!1289493 (=> (not res!856557) (not e!736244))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289493 (= res!856557 (not (validKeyInArray!0 (select (arr!41229 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!52871 () Bool)

(declare-fun mapRes!52871 () Bool)

(assert (=> mapIsEmpty!52871 mapRes!52871))

(declare-fun b!1289494 () Bool)

(declare-fun e!736241 () Bool)

(assert (=> b!1289494 (= e!736244 (not e!736241))))

(declare-fun res!856555 () Bool)

(assert (=> b!1289494 (=> res!856555 e!736241)))

(assert (=> b!1289494 (= res!856555 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1289494 (not (contains!7994 (ListLongMap!19722 Nil!29230) k!1205))))

(declare-datatypes ((Unit!42670 0))(
  ( (Unit!42671) )
))
(declare-fun lt!578274 () Unit!42670)

(declare-fun emptyContainsNothing!63 ((_ BitVec 64)) Unit!42670)

(assert (=> b!1289494 (= lt!578274 (emptyContainsNothing!63 k!1205))))

(declare-fun b!1289495 () Bool)

(declare-fun res!856563 () Bool)

(assert (=> b!1289495 (=> (not res!856563) (not e!736244))))

(assert (=> b!1289495 (= res!856563 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41779 _keys!1741))))))

(declare-fun mapNonEmpty!52871 () Bool)

(declare-fun tp!100819 () Bool)

(assert (=> mapNonEmpty!52871 (= mapRes!52871 (and tp!100819 e!736239))))

(declare-fun mapRest!52871 () (Array (_ BitVec 32) ValueCell!16205))

(declare-fun mapKey!52871 () (_ BitVec 32))

(declare-fun mapValue!52871 () ValueCell!16205)

(assert (=> mapNonEmpty!52871 (= (arr!41230 _values!1445) (store mapRest!52871 mapKey!52871 mapValue!52871))))

(declare-fun b!1289496 () Bool)

(assert (=> b!1289496 (= e!736241 true)))

(declare-fun lt!578276 () ListLongMap!19721)

(declare-fun +!4348 (ListLongMap!19721 tuple2!22064) ListLongMap!19721)

(assert (=> b!1289496 (not (contains!7994 (+!4348 lt!578276 (tuple2!22065 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578273 () Unit!42670)

(declare-fun addStillNotContains!366 (ListLongMap!19721 (_ BitVec 64) V!50713 (_ BitVec 64)) Unit!42670)

(assert (=> b!1289496 (= lt!578273 (addStillNotContains!366 lt!578276 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1289496 (not (contains!7994 (+!4348 lt!578276 (tuple2!22065 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578275 () Unit!42670)

(assert (=> b!1289496 (= lt!578275 (addStillNotContains!366 lt!578276 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5979 (array!85456 array!85458 (_ BitVec 32) (_ BitVec 32) V!50713 V!50713 (_ BitVec 32) Int) ListLongMap!19721)

(assert (=> b!1289496 (= lt!578276 (getCurrentListMapNoExtraKeys!5979 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun res!856562 () Bool)

(assert (=> start!109078 (=> (not res!856562) (not e!736244))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109078 (= res!856562 (validMask!0 mask!2175))))

(assert (=> start!109078 e!736244))

(assert (=> start!109078 tp_is_empty!34207))

(assert (=> start!109078 true))

(declare-fun e!736243 () Bool)

(declare-fun array_inv!31251 (array!85458) Bool)

(assert (=> start!109078 (and (array_inv!31251 _values!1445) e!736243)))

(declare-fun array_inv!31252 (array!85456) Bool)

(assert (=> start!109078 (array_inv!31252 _keys!1741)))

(assert (=> start!109078 tp!100820))

(declare-fun b!1289497 () Bool)

(declare-fun res!856559 () Bool)

(assert (=> b!1289497 (=> (not res!856559) (not e!736244))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85456 (_ BitVec 32)) Bool)

(assert (=> b!1289497 (= res!856559 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289498 () Bool)

(declare-fun e!736242 () Bool)

(assert (=> b!1289498 (= e!736243 (and e!736242 mapRes!52871))))

(declare-fun condMapEmpty!52871 () Bool)

(declare-fun mapDefault!52871 () ValueCell!16205)

