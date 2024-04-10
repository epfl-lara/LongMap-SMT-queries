; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109190 () Bool)

(assert start!109190)

(declare-fun b_free!28679 () Bool)

(declare-fun b_next!28679 () Bool)

(assert (=> start!109190 (= b_free!28679 (not b_next!28679))))

(declare-fun tp!101156 () Bool)

(declare-fun b_and!46769 () Bool)

(assert (=> start!109190 (= tp!101156 b_and!46769)))

(declare-fun b!1291505 () Bool)

(declare-fun res!858069 () Bool)

(declare-fun e!737250 () Bool)

(assert (=> b!1291505 (=> (not res!858069) (not e!737250))))

(declare-datatypes ((array!85674 0))(
  ( (array!85675 (arr!41338 (Array (_ BitVec 32) (_ BitVec 64))) (size!41888 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85674)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291505 (= res!858069 (not (validKeyInArray!0 (select (arr!41338 _keys!1741) from!2144))))))

(declare-fun b!1291506 () Bool)

(declare-fun res!858072 () Bool)

(assert (=> b!1291506 (=> (not res!858072) (not e!737250))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50861 0))(
  ( (V!50862 (val!17234 Int)) )
))
(declare-datatypes ((ValueCell!16261 0))(
  ( (ValueCellFull!16261 (v!19837 V!50861)) (EmptyCell!16261) )
))
(declare-datatypes ((array!85676 0))(
  ( (array!85677 (arr!41339 (Array (_ BitVec 32) ValueCell!16261)) (size!41889 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85676)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291506 (= res!858072 (and (= (size!41889 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41888 _keys!1741) (size!41889 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291507 () Bool)

(declare-fun res!858068 () Bool)

(assert (=> b!1291507 (=> (not res!858068) (not e!737250))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1291507 (= res!858068 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41888 _keys!1741))))))

(declare-fun b!1291508 () Bool)

(declare-fun res!858073 () Bool)

(assert (=> b!1291508 (=> (not res!858073) (not e!737250))))

(declare-fun minValue!1387 () V!50861)

(declare-fun zeroValue!1387 () V!50861)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22160 0))(
  ( (tuple2!22161 (_1!11091 (_ BitVec 64)) (_2!11091 V!50861)) )
))
(declare-datatypes ((List!29317 0))(
  ( (Nil!29314) (Cons!29313 (h!30522 tuple2!22160) (t!42881 List!29317)) )
))
(declare-datatypes ((ListLongMap!19817 0))(
  ( (ListLongMap!19818 (toList!9924 List!29317)) )
))
(declare-fun contains!8042 (ListLongMap!19817 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4975 (array!85674 array!85676 (_ BitVec 32) (_ BitVec 32) V!50861 V!50861 (_ BitVec 32) Int) ListLongMap!19817)

(assert (=> b!1291508 (= res!858073 (contains!8042 (getCurrentListMap!4975 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53039 () Bool)

(declare-fun mapRes!53039 () Bool)

(assert (=> mapIsEmpty!53039 mapRes!53039))

(declare-fun b!1291510 () Bool)

(declare-fun e!737249 () Bool)

(declare-fun tp_is_empty!34319 () Bool)

(assert (=> b!1291510 (= e!737249 tp_is_empty!34319)))

(declare-fun b!1291511 () Bool)

(declare-fun e!737248 () Bool)

(declare-fun e!737251 () Bool)

(assert (=> b!1291511 (= e!737248 (and e!737251 mapRes!53039))))

(declare-fun condMapEmpty!53039 () Bool)

(declare-fun mapDefault!53039 () ValueCell!16261)

