; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108964 () Bool)

(assert start!108964)

(declare-fun b_free!28453 () Bool)

(declare-fun b_next!28453 () Bool)

(assert (=> start!108964 (= b_free!28453 (not b_next!28453))))

(declare-fun tp!100478 () Bool)

(declare-fun b_and!46543 () Bool)

(assert (=> start!108964 (= tp!100478 b_and!46543)))

(declare-fun b!1287498 () Bool)

(declare-fun res!855083 () Bool)

(declare-fun e!735274 () Bool)

(assert (=> b!1287498 (=> (not res!855083) (not e!735274))))

(declare-datatypes ((array!85236 0))(
  ( (array!85237 (arr!41119 (Array (_ BitVec 32) (_ BitVec 64))) (size!41669 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85236)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1287498 (= res!855083 (not (validKeyInArray!0 (select (arr!41119 _keys!1741) from!2144))))))

(declare-fun b!1287499 () Bool)

(declare-fun e!735278 () Bool)

(declare-fun tp_is_empty!34093 () Bool)

(assert (=> b!1287499 (= e!735278 tp_is_empty!34093)))

(declare-fun mapIsEmpty!52700 () Bool)

(declare-fun mapRes!52700 () Bool)

(assert (=> mapIsEmpty!52700 mapRes!52700))

(declare-fun b!1287500 () Bool)

(declare-fun res!855079 () Bool)

(assert (=> b!1287500 (=> (not res!855079) (not e!735274))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50561 0))(
  ( (V!50562 (val!17121 Int)) )
))
(declare-datatypes ((ValueCell!16148 0))(
  ( (ValueCellFull!16148 (v!19724 V!50561)) (EmptyCell!16148) )
))
(declare-datatypes ((array!85238 0))(
  ( (array!85239 (arr!41120 (Array (_ BitVec 32) ValueCell!16148)) (size!41670 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85238)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1287500 (= res!855079 (and (= (size!41670 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41669 _keys!1741) (size!41670 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!52700 () Bool)

(declare-fun tp!100477 () Bool)

(declare-fun e!735276 () Bool)

(assert (=> mapNonEmpty!52700 (= mapRes!52700 (and tp!100477 e!735276))))

(declare-fun mapValue!52700 () ValueCell!16148)

(declare-fun mapRest!52700 () (Array (_ BitVec 32) ValueCell!16148))

(declare-fun mapKey!52700 () (_ BitVec 32))

(assert (=> mapNonEmpty!52700 (= (arr!41120 _values!1445) (store mapRest!52700 mapKey!52700 mapValue!52700))))

(declare-fun b!1287501 () Bool)

(declare-fun res!855077 () Bool)

(assert (=> b!1287501 (=> (not res!855077) (not e!735274))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85236 (_ BitVec 32)) Bool)

(assert (=> b!1287501 (= res!855077 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!855081 () Bool)

(assert (=> start!108964 (=> (not res!855081) (not e!735274))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108964 (= res!855081 (validMask!0 mask!2175))))

(assert (=> start!108964 e!735274))

(assert (=> start!108964 tp_is_empty!34093))

(assert (=> start!108964 true))

(declare-fun e!735277 () Bool)

(declare-fun array_inv!31183 (array!85238) Bool)

(assert (=> start!108964 (and (array_inv!31183 _values!1445) e!735277)))

(declare-fun array_inv!31184 (array!85236) Bool)

(assert (=> start!108964 (array_inv!31184 _keys!1741)))

(assert (=> start!108964 tp!100478))

(declare-fun b!1287502 () Bool)

(declare-fun res!855080 () Bool)

(assert (=> b!1287502 (=> (not res!855080) (not e!735274))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1287502 (= res!855080 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41669 _keys!1741))))))

(declare-fun b!1287503 () Bool)

(declare-fun res!855082 () Bool)

(assert (=> b!1287503 (=> (not res!855082) (not e!735274))))

(declare-datatypes ((List!29146 0))(
  ( (Nil!29143) (Cons!29142 (h!30351 (_ BitVec 64)) (t!42710 List!29146)) )
))
(declare-fun arrayNoDuplicates!0 (array!85236 (_ BitVec 32) List!29146) Bool)

(assert (=> b!1287503 (= res!855082 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29143))))

(declare-fun b!1287504 () Bool)

(declare-fun res!855078 () Bool)

(assert (=> b!1287504 (=> (not res!855078) (not e!735274))))

(assert (=> b!1287504 (= res!855078 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41669 _keys!1741))))))

(declare-fun b!1287505 () Bool)

(assert (=> b!1287505 (= e!735276 tp_is_empty!34093)))

(declare-fun b!1287506 () Bool)

(declare-fun res!855084 () Bool)

(assert (=> b!1287506 (=> (not res!855084) (not e!735274))))

(declare-fun minValue!1387 () V!50561)

(declare-fun zeroValue!1387 () V!50561)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!21966 0))(
  ( (tuple2!21967 (_1!10994 (_ BitVec 64)) (_2!10994 V!50561)) )
))
(declare-datatypes ((List!29147 0))(
  ( (Nil!29144) (Cons!29143 (h!30352 tuple2!21966) (t!42711 List!29147)) )
))
(declare-datatypes ((ListLongMap!19623 0))(
  ( (ListLongMap!19624 (toList!9827 List!29147)) )
))
(declare-fun contains!7945 (ListLongMap!19623 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4901 (array!85236 array!85238 (_ BitVec 32) (_ BitVec 32) V!50561 V!50561 (_ BitVec 32) Int) ListLongMap!19623)

(assert (=> b!1287506 (= res!855084 (contains!7945 (getCurrentListMap!4901 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1287507 () Bool)

(assert (=> b!1287507 (= e!735277 (and e!735278 mapRes!52700))))

(declare-fun condMapEmpty!52700 () Bool)

(declare-fun mapDefault!52700 () ValueCell!16148)

