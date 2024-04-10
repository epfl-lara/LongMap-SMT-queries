; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109640 () Bool)

(assert start!109640)

(declare-fun b_free!29129 () Bool)

(declare-fun b_next!29129 () Bool)

(assert (=> start!109640 (= b_free!29129 (not b_next!29129))))

(declare-fun tp!102506 () Bool)

(declare-fun b_and!47219 () Bool)

(assert (=> start!109640 (= tp!102506 b_and!47219)))

(declare-fun b!1298805 () Bool)

(declare-fun res!863183 () Bool)

(declare-fun e!740950 () Bool)

(assert (=> b!1298805 (=> (not res!863183) (not e!740950))))

(declare-datatypes ((array!86544 0))(
  ( (array!86545 (arr!41773 (Array (_ BitVec 32) (_ BitVec 64))) (size!42323 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86544)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86544 (_ BitVec 32)) Bool)

(assert (=> b!1298805 (= res!863183 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298806 () Bool)

(declare-fun res!863184 () Bool)

(assert (=> b!1298806 (=> (not res!863184) (not e!740950))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1298806 (= res!863184 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42323 _keys!1741)) (not (= (select (arr!41773 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298807 () Bool)

(declare-fun e!740947 () Bool)

(declare-fun tp_is_empty!34769 () Bool)

(assert (=> b!1298807 (= e!740947 tp_is_empty!34769)))

(declare-fun b!1298808 () Bool)

(declare-fun res!863180 () Bool)

(assert (=> b!1298808 (=> (not res!863180) (not e!740950))))

(declare-datatypes ((V!51461 0))(
  ( (V!51462 (val!17459 Int)) )
))
(declare-datatypes ((ValueCell!16486 0))(
  ( (ValueCellFull!16486 (v!20062 V!51461)) (EmptyCell!16486) )
))
(declare-datatypes ((array!86546 0))(
  ( (array!86547 (arr!41774 (Array (_ BitVec 32) ValueCell!16486)) (size!42324 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86546)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1298808 (= res!863180 (and (= (size!42324 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42323 _keys!1741) (size!42324 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!53714 () Bool)

(declare-fun mapRes!53714 () Bool)

(assert (=> mapIsEmpty!53714 mapRes!53714))

(declare-fun b!1298809 () Bool)

(declare-fun e!740948 () Bool)

(declare-fun arrayContainsKey!0 (array!86544 (_ BitVec 64) (_ BitVec 32)) Bool)

(assert (=> b!1298809 (= e!740948 (arrayContainsKey!0 _keys!1741 k!1205 from!2144))))

(assert (=> b!1298809 (arrayContainsKey!0 _keys!1741 k!1205 (bvadd #b00000000000000000000000000000001 from!2144))))

(declare-fun minValue!1387 () V!51461)

(declare-fun zeroValue!1387 () V!51461)

(declare-datatypes ((Unit!43011 0))(
  ( (Unit!43012) )
))
(declare-fun lt!580748 () Unit!43011)

(declare-fun defaultEntry!1448 () Int)

(declare-fun lemmaListMapContainsThenArrayContainsFrom!639 (array!86544 array!86546 (_ BitVec 32) (_ BitVec 32) V!51461 V!51461 (_ BitVec 64) (_ BitVec 32) Int) Unit!43011)

(assert (=> b!1298809 (= lt!580748 (lemmaListMapContainsThenArrayContainsFrom!639 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448))))

(declare-fun b!1298810 () Bool)

(declare-fun res!863186 () Bool)

(assert (=> b!1298810 (=> (not res!863186) (not e!740950))))

(declare-datatypes ((tuple2!22518 0))(
  ( (tuple2!22519 (_1!11270 (_ BitVec 64)) (_2!11270 V!51461)) )
))
(declare-datatypes ((List!29647 0))(
  ( (Nil!29644) (Cons!29643 (h!30852 tuple2!22518) (t!43211 List!29647)) )
))
(declare-datatypes ((ListLongMap!20175 0))(
  ( (ListLongMap!20176 (toList!10103 List!29647)) )
))
(declare-fun contains!8221 (ListLongMap!20175 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5132 (array!86544 array!86546 (_ BitVec 32) (_ BitVec 32) V!51461 V!51461 (_ BitVec 32) Int) ListLongMap!20175)

(assert (=> b!1298810 (= res!863186 (contains!8221 (getCurrentListMap!5132 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!863187 () Bool)

(assert (=> start!109640 (=> (not res!863187) (not e!740950))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109640 (= res!863187 (validMask!0 mask!2175))))

(assert (=> start!109640 e!740950))

(assert (=> start!109640 tp_is_empty!34769))

(assert (=> start!109640 true))

(declare-fun e!740946 () Bool)

(declare-fun array_inv!31615 (array!86546) Bool)

(assert (=> start!109640 (and (array_inv!31615 _values!1445) e!740946)))

(declare-fun array_inv!31616 (array!86544) Bool)

(assert (=> start!109640 (array_inv!31616 _keys!1741)))

(assert (=> start!109640 tp!102506))

(declare-fun b!1298811 () Bool)

(declare-fun res!863181 () Bool)

(assert (=> b!1298811 (=> (not res!863181) (not e!740950))))

(assert (=> b!1298811 (= res!863181 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42323 _keys!1741))))))

(declare-fun b!1298812 () Bool)

(declare-fun e!740951 () Bool)

(assert (=> b!1298812 (= e!740951 tp_is_empty!34769)))

(declare-fun b!1298813 () Bool)

(declare-fun res!863185 () Bool)

(assert (=> b!1298813 (=> (not res!863185) (not e!740950))))

(declare-datatypes ((List!29648 0))(
  ( (Nil!29645) (Cons!29644 (h!30853 (_ BitVec 64)) (t!43212 List!29648)) )
))
(declare-fun arrayNoDuplicates!0 (array!86544 (_ BitVec 32) List!29648) Bool)

(assert (=> b!1298813 (= res!863185 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29645))))

(declare-fun b!1298814 () Bool)

(assert (=> b!1298814 (= e!740946 (and e!740951 mapRes!53714))))

(declare-fun condMapEmpty!53714 () Bool)

(declare-fun mapDefault!53714 () ValueCell!16486)

