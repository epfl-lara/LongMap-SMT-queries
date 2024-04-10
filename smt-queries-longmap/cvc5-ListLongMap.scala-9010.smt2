; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108820 () Bool)

(assert start!108820)

(declare-fun b_free!28333 () Bool)

(declare-fun b_next!28333 () Bool)

(assert (=> start!108820 (= b_free!28333 (not b_next!28333))))

(declare-fun tp!100114 () Bool)

(declare-fun b_and!46399 () Bool)

(assert (=> start!108820 (= tp!100114 b_and!46399)))

(declare-fun mapNonEmpty!52517 () Bool)

(declare-fun mapRes!52517 () Bool)

(declare-fun tp!100115 () Bool)

(declare-fun e!734058 () Bool)

(assert (=> mapNonEmpty!52517 (= mapRes!52517 (and tp!100115 e!734058))))

(declare-datatypes ((V!50401 0))(
  ( (V!50402 (val!17061 Int)) )
))
(declare-datatypes ((ValueCell!16088 0))(
  ( (ValueCellFull!16088 (v!19663 V!50401)) (EmptyCell!16088) )
))
(declare-datatypes ((array!85004 0))(
  ( (array!85005 (arr!41004 (Array (_ BitVec 32) ValueCell!16088)) (size!41554 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85004)

(declare-fun mapKey!52517 () (_ BitVec 32))

(declare-fun mapValue!52517 () ValueCell!16088)

(declare-fun mapRest!52517 () (Array (_ BitVec 32) ValueCell!16088))

(assert (=> mapNonEmpty!52517 (= (arr!41004 _values!1445) (store mapRest!52517 mapKey!52517 mapValue!52517))))

(declare-fun b!1285127 () Bool)

(declare-fun e!734060 () Bool)

(assert (=> b!1285127 (= e!734060 false)))

(declare-fun minValue!1387 () V!50401)

(declare-fun zeroValue!1387 () V!50401)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576877 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85006 0))(
  ( (array!85007 (arr!41005 (Array (_ BitVec 32) (_ BitVec 64))) (size!41555 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85006)

(declare-datatypes ((tuple2!21864 0))(
  ( (tuple2!21865 (_1!10943 (_ BitVec 64)) (_2!10943 V!50401)) )
))
(declare-datatypes ((List!29057 0))(
  ( (Nil!29054) (Cons!29053 (h!30262 tuple2!21864) (t!42601 List!29057)) )
))
(declare-datatypes ((ListLongMap!19521 0))(
  ( (ListLongMap!19522 (toList!9776 List!29057)) )
))
(declare-fun contains!7893 (ListLongMap!19521 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4854 (array!85006 array!85004 (_ BitVec 32) (_ BitVec 32) V!50401 V!50401 (_ BitVec 32) Int) ListLongMap!19521)

(assert (=> b!1285127 (= lt!576877 (contains!7893 (getCurrentListMap!4854 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285128 () Bool)

(declare-fun e!734057 () Bool)

(declare-fun tp_is_empty!33973 () Bool)

(assert (=> b!1285128 (= e!734057 tp_is_empty!33973)))

(declare-fun b!1285129 () Bool)

(assert (=> b!1285129 (= e!734058 tp_is_empty!33973)))

(declare-fun b!1285130 () Bool)

(declare-fun res!853740 () Bool)

(assert (=> b!1285130 (=> (not res!853740) (not e!734060))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85006 (_ BitVec 32)) Bool)

(assert (=> b!1285130 (= res!853740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!853739 () Bool)

(assert (=> start!108820 (=> (not res!853739) (not e!734060))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108820 (= res!853739 (validMask!0 mask!2175))))

(assert (=> start!108820 e!734060))

(assert (=> start!108820 tp_is_empty!33973))

(assert (=> start!108820 true))

(declare-fun e!734059 () Bool)

(declare-fun array_inv!31099 (array!85004) Bool)

(assert (=> start!108820 (and (array_inv!31099 _values!1445) e!734059)))

(declare-fun array_inv!31100 (array!85006) Bool)

(assert (=> start!108820 (array_inv!31100 _keys!1741)))

(assert (=> start!108820 tp!100114))

(declare-fun b!1285131 () Bool)

(declare-fun res!853738 () Bool)

(assert (=> b!1285131 (=> (not res!853738) (not e!734060))))

(assert (=> b!1285131 (= res!853738 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41555 _keys!1741))))))

(declare-fun b!1285132 () Bool)

(declare-fun res!853736 () Bool)

(assert (=> b!1285132 (=> (not res!853736) (not e!734060))))

(declare-datatypes ((List!29058 0))(
  ( (Nil!29055) (Cons!29054 (h!30263 (_ BitVec 64)) (t!42602 List!29058)) )
))
(declare-fun arrayNoDuplicates!0 (array!85006 (_ BitVec 32) List!29058) Bool)

(assert (=> b!1285132 (= res!853736 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29055))))

(declare-fun b!1285133 () Bool)

(declare-fun res!853737 () Bool)

(assert (=> b!1285133 (=> (not res!853737) (not e!734060))))

(assert (=> b!1285133 (= res!853737 (and (= (size!41554 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41555 _keys!1741) (size!41554 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!52517 () Bool)

(assert (=> mapIsEmpty!52517 mapRes!52517))

(declare-fun b!1285134 () Bool)

(assert (=> b!1285134 (= e!734059 (and e!734057 mapRes!52517))))

(declare-fun condMapEmpty!52517 () Bool)

(declare-fun mapDefault!52517 () ValueCell!16088)

