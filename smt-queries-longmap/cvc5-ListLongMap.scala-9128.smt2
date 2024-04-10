; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109552 () Bool)

(assert start!109552)

(declare-fun b_free!29041 () Bool)

(declare-fun b_next!29041 () Bool)

(assert (=> start!109552 (= b_free!29041 (not b_next!29041))))

(declare-fun tp!102241 () Bool)

(declare-fun b_and!47131 () Bool)

(assert (=> start!109552 (= tp!102241 b_and!47131)))

(declare-fun b!1297527 () Bool)

(declare-fun res!862301 () Bool)

(declare-fun e!740278 () Bool)

(assert (=> b!1297527 (=> (not res!862301) (not e!740278))))

(declare-datatypes ((array!86372 0))(
  ( (array!86373 (arr!41687 (Array (_ BitVec 32) (_ BitVec 64))) (size!42237 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86372)

(declare-datatypes ((List!29575 0))(
  ( (Nil!29572) (Cons!29571 (h!30780 (_ BitVec 64)) (t!43139 List!29575)) )
))
(declare-fun arrayNoDuplicates!0 (array!86372 (_ BitVec 32) List!29575) Bool)

(assert (=> b!1297527 (= res!862301 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29572))))

(declare-fun b!1297528 () Bool)

(declare-fun e!740280 () Bool)

(declare-fun tp_is_empty!34681 () Bool)

(assert (=> b!1297528 (= e!740280 tp_is_empty!34681)))

(declare-fun b!1297529 () Bool)

(assert (=> b!1297529 (= e!740278 false)))

(declare-datatypes ((V!51345 0))(
  ( (V!51346 (val!17415 Int)) )
))
(declare-fun minValue!1387 () V!51345)

(declare-fun zeroValue!1387 () V!51345)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16442 0))(
  ( (ValueCellFull!16442 (v!20018 V!51345)) (EmptyCell!16442) )
))
(declare-datatypes ((array!86374 0))(
  ( (array!86375 (arr!41688 (Array (_ BitVec 32) ValueCell!16442)) (size!42238 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86374)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lt!580607 () Bool)

(declare-datatypes ((tuple2!22440 0))(
  ( (tuple2!22441 (_1!11231 (_ BitVec 64)) (_2!11231 V!51345)) )
))
(declare-datatypes ((List!29576 0))(
  ( (Nil!29573) (Cons!29572 (h!30781 tuple2!22440) (t!43140 List!29576)) )
))
(declare-datatypes ((ListLongMap!20097 0))(
  ( (ListLongMap!20098 (toList!10064 List!29576)) )
))
(declare-fun contains!8182 (ListLongMap!20097 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5093 (array!86372 array!86374 (_ BitVec 32) (_ BitVec 32) V!51345 V!51345 (_ BitVec 32) Int) ListLongMap!20097)

(assert (=> b!1297529 (= lt!580607 (contains!8182 (getCurrentListMap!5093 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!862302 () Bool)

(assert (=> start!109552 (=> (not res!862302) (not e!740278))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109552 (= res!862302 (validMask!0 mask!2175))))

(assert (=> start!109552 e!740278))

(assert (=> start!109552 tp_is_empty!34681))

(assert (=> start!109552 true))

(declare-fun e!740281 () Bool)

(declare-fun array_inv!31551 (array!86374) Bool)

(assert (=> start!109552 (and (array_inv!31551 _values!1445) e!740281)))

(declare-fun array_inv!31552 (array!86372) Bool)

(assert (=> start!109552 (array_inv!31552 _keys!1741)))

(assert (=> start!109552 tp!102241))

(declare-fun mapNonEmpty!53582 () Bool)

(declare-fun mapRes!53582 () Bool)

(declare-fun tp!102242 () Bool)

(assert (=> mapNonEmpty!53582 (= mapRes!53582 (and tp!102242 e!740280))))

(declare-fun mapKey!53582 () (_ BitVec 32))

(declare-fun mapValue!53582 () ValueCell!16442)

(declare-fun mapRest!53582 () (Array (_ BitVec 32) ValueCell!16442))

(assert (=> mapNonEmpty!53582 (= (arr!41688 _values!1445) (store mapRest!53582 mapKey!53582 mapValue!53582))))

(declare-fun mapIsEmpty!53582 () Bool)

(assert (=> mapIsEmpty!53582 mapRes!53582))

(declare-fun b!1297530 () Bool)

(declare-fun res!862299 () Bool)

(assert (=> b!1297530 (=> (not res!862299) (not e!740278))))

(assert (=> b!1297530 (= res!862299 (and (= (size!42238 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42237 _keys!1741) (size!42238 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297531 () Bool)

(declare-fun e!740282 () Bool)

(assert (=> b!1297531 (= e!740281 (and e!740282 mapRes!53582))))

(declare-fun condMapEmpty!53582 () Bool)

(declare-fun mapDefault!53582 () ValueCell!16442)

