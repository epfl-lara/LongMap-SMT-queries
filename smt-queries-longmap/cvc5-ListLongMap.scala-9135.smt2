; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109594 () Bool)

(assert start!109594)

(declare-fun b_free!29083 () Bool)

(declare-fun b_next!29083 () Bool)

(assert (=> start!109594 (= b_free!29083 (not b_next!29083))))

(declare-fun tp!102367 () Bool)

(declare-fun b_and!47173 () Bool)

(assert (=> start!109594 (= tp!102367 b_and!47173)))

(declare-fun b!1298107 () Bool)

(declare-fun res!862689 () Bool)

(declare-fun e!740596 () Bool)

(assert (=> b!1298107 (=> (not res!862689) (not e!740596))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86452 0))(
  ( (array!86453 (arr!41727 (Array (_ BitVec 32) (_ BitVec 64))) (size!42277 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86452)

(assert (=> b!1298107 (= res!862689 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42277 _keys!1741))))))

(declare-fun b!1298108 () Bool)

(declare-fun res!862694 () Bool)

(assert (=> b!1298108 (=> (not res!862694) (not e!740596))))

(declare-datatypes ((List!29609 0))(
  ( (Nil!29606) (Cons!29605 (h!30814 (_ BitVec 64)) (t!43173 List!29609)) )
))
(declare-fun arrayNoDuplicates!0 (array!86452 (_ BitVec 32) List!29609) Bool)

(assert (=> b!1298108 (= res!862694 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29606))))

(declare-fun mapNonEmpty!53645 () Bool)

(declare-fun mapRes!53645 () Bool)

(declare-fun tp!102368 () Bool)

(declare-fun e!740593 () Bool)

(assert (=> mapNonEmpty!53645 (= mapRes!53645 (and tp!102368 e!740593))))

(declare-fun mapKey!53645 () (_ BitVec 32))

(declare-datatypes ((V!51401 0))(
  ( (V!51402 (val!17436 Int)) )
))
(declare-datatypes ((ValueCell!16463 0))(
  ( (ValueCellFull!16463 (v!20039 V!51401)) (EmptyCell!16463) )
))
(declare-fun mapRest!53645 () (Array (_ BitVec 32) ValueCell!16463))

(declare-datatypes ((array!86454 0))(
  ( (array!86455 (arr!41728 (Array (_ BitVec 32) ValueCell!16463)) (size!42278 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86454)

(declare-fun mapValue!53645 () ValueCell!16463)

(assert (=> mapNonEmpty!53645 (= (arr!41728 _values!1445) (store mapRest!53645 mapKey!53645 mapValue!53645))))

(declare-fun res!862693 () Bool)

(assert (=> start!109594 (=> (not res!862693) (not e!740596))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109594 (= res!862693 (validMask!0 mask!2175))))

(assert (=> start!109594 e!740596))

(declare-fun tp_is_empty!34723 () Bool)

(assert (=> start!109594 tp_is_empty!34723))

(assert (=> start!109594 true))

(declare-fun e!740594 () Bool)

(declare-fun array_inv!31583 (array!86454) Bool)

(assert (=> start!109594 (and (array_inv!31583 _values!1445) e!740594)))

(declare-fun array_inv!31584 (array!86452) Bool)

(assert (=> start!109594 (array_inv!31584 _keys!1741)))

(assert (=> start!109594 tp!102367))

(declare-fun b!1298109 () Bool)

(declare-fun e!740595 () Bool)

(assert (=> b!1298109 (= e!740595 tp_is_empty!34723)))

(declare-fun mapIsEmpty!53645 () Bool)

(assert (=> mapIsEmpty!53645 mapRes!53645))

(declare-fun b!1298110 () Bool)

(declare-fun res!862691 () Bool)

(assert (=> b!1298110 (=> (not res!862691) (not e!740596))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86452 (_ BitVec 32)) Bool)

(assert (=> b!1298110 (= res!862691 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298111 () Bool)

(declare-fun res!862692 () Bool)

(assert (=> b!1298111 (=> (not res!862692) (not e!740596))))

(declare-fun minValue!1387 () V!51401)

(declare-fun zeroValue!1387 () V!51401)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22478 0))(
  ( (tuple2!22479 (_1!11250 (_ BitVec 64)) (_2!11250 V!51401)) )
))
(declare-datatypes ((List!29610 0))(
  ( (Nil!29607) (Cons!29606 (h!30815 tuple2!22478) (t!43174 List!29610)) )
))
(declare-datatypes ((ListLongMap!20135 0))(
  ( (ListLongMap!20136 (toList!10083 List!29610)) )
))
(declare-fun contains!8201 (ListLongMap!20135 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5112 (array!86452 array!86454 (_ BitVec 32) (_ BitVec 32) V!51401 V!51401 (_ BitVec 32) Int) ListLongMap!20135)

(assert (=> b!1298111 (= res!862692 (contains!8201 (getCurrentListMap!5112 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298112 () Bool)

(declare-fun res!862695 () Bool)

(assert (=> b!1298112 (=> (not res!862695) (not e!740596))))

(assert (=> b!1298112 (= res!862695 (and (= (size!42278 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42277 _keys!1741) (size!42278 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298113 () Bool)

(declare-fun res!862690 () Bool)

(assert (=> b!1298113 (=> (not res!862690) (not e!740596))))

(assert (=> b!1298113 (= res!862690 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42277 _keys!1741)) (not (= (select (arr!41727 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298114 () Bool)

(assert (=> b!1298114 (= e!740593 tp_is_empty!34723)))

(declare-fun b!1298115 () Bool)

(assert (=> b!1298115 (= e!740594 (and e!740595 mapRes!53645))))

(declare-fun condMapEmpty!53645 () Bool)

(declare-fun mapDefault!53645 () ValueCell!16463)

