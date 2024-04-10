; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109610 () Bool)

(assert start!109610)

(declare-fun b_free!29099 () Bool)

(declare-fun b_next!29099 () Bool)

(assert (=> start!109610 (= b_free!29099 (not b_next!29099))))

(declare-fun tp!102415 () Bool)

(declare-fun b_and!47189 () Bool)

(assert (=> start!109610 (= tp!102415 b_and!47189)))

(declare-fun b!1298347 () Bool)

(declare-fun e!740715 () Bool)

(assert (=> b!1298347 (= e!740715 (not true))))

(declare-datatypes ((V!51421 0))(
  ( (V!51422 (val!17444 Int)) )
))
(declare-fun zeroValue!1387 () V!51421)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16471 0))(
  ( (ValueCellFull!16471 (v!20047 V!51421)) (EmptyCell!16471) )
))
(declare-datatypes ((array!86484 0))(
  ( (array!86485 (arr!41743 (Array (_ BitVec 32) ValueCell!16471)) (size!42293 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86484)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86486 0))(
  ( (array!86487 (arr!41744 (Array (_ BitVec 32) (_ BitVec 64))) (size!42294 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86486)

(declare-fun minValue!1387 () V!51421)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22490 0))(
  ( (tuple2!22491 (_1!11256 (_ BitVec 64)) (_2!11256 V!51421)) )
))
(declare-datatypes ((List!29620 0))(
  ( (Nil!29617) (Cons!29616 (h!30825 tuple2!22490) (t!43184 List!29620)) )
))
(declare-datatypes ((ListLongMap!20147 0))(
  ( (ListLongMap!20148 (toList!10089 List!29620)) )
))
(declare-fun contains!8207 (ListLongMap!20147 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5118 (array!86486 array!86484 (_ BitVec 32) (_ BitVec 32) V!51421 V!51421 (_ BitVec 32) Int) ListLongMap!20147)

(assert (=> b!1298347 (contains!8207 (getCurrentListMap!5118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42989 0))(
  ( (Unit!42990) )
))
(declare-fun lt!580694 () Unit!42989)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!47 (array!86486 array!86484 (_ BitVec 32) (_ BitVec 32) V!51421 V!51421 (_ BitVec 64) (_ BitVec 32) Int) Unit!42989)

(assert (=> b!1298347 (= lt!580694 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!47 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298348 () Bool)

(declare-fun res!862862 () Bool)

(assert (=> b!1298348 (=> (not res!862862) (not e!740715))))

(assert (=> b!1298348 (= res!862862 (contains!8207 (getCurrentListMap!5118 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!53669 () Bool)

(declare-fun mapRes!53669 () Bool)

(declare-fun tp!102416 () Bool)

(declare-fun e!740713 () Bool)

(assert (=> mapNonEmpty!53669 (= mapRes!53669 (and tp!102416 e!740713))))

(declare-fun mapKey!53669 () (_ BitVec 32))

(declare-fun mapValue!53669 () ValueCell!16471)

(declare-fun mapRest!53669 () (Array (_ BitVec 32) ValueCell!16471))

(assert (=> mapNonEmpty!53669 (= (arr!41743 _values!1445) (store mapRest!53669 mapKey!53669 mapValue!53669))))

(declare-fun b!1298349 () Bool)

(declare-fun res!862863 () Bool)

(assert (=> b!1298349 (=> (not res!862863) (not e!740715))))

(assert (=> b!1298349 (= res!862863 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42294 _keys!1741)) (not (= (select (arr!41744 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298350 () Bool)

(declare-fun res!862860 () Bool)

(assert (=> b!1298350 (=> (not res!862860) (not e!740715))))

(declare-datatypes ((List!29621 0))(
  ( (Nil!29618) (Cons!29617 (h!30826 (_ BitVec 64)) (t!43185 List!29621)) )
))
(declare-fun arrayNoDuplicates!0 (array!86486 (_ BitVec 32) List!29621) Bool)

(assert (=> b!1298350 (= res!862860 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29618))))

(declare-fun b!1298351 () Bool)

(declare-fun res!862859 () Bool)

(assert (=> b!1298351 (=> (not res!862859) (not e!740715))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86486 (_ BitVec 32)) Bool)

(assert (=> b!1298351 (= res!862859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298352 () Bool)

(declare-fun tp_is_empty!34739 () Bool)

(assert (=> b!1298352 (= e!740713 tp_is_empty!34739)))

(declare-fun b!1298353 () Bool)

(declare-fun res!862861 () Bool)

(assert (=> b!1298353 (=> (not res!862861) (not e!740715))))

(assert (=> b!1298353 (= res!862861 (and (= (size!42293 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42294 _keys!1741) (size!42293 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298354 () Bool)

(declare-fun res!862857 () Bool)

(assert (=> b!1298354 (=> (not res!862857) (not e!740715))))

(assert (=> b!1298354 (= res!862857 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42294 _keys!1741))))))

(declare-fun b!1298355 () Bool)

(declare-fun e!740716 () Bool)

(assert (=> b!1298355 (= e!740716 tp_is_empty!34739)))

(declare-fun b!1298356 () Bool)

(declare-fun e!740714 () Bool)

(assert (=> b!1298356 (= e!740714 (and e!740716 mapRes!53669))))

(declare-fun condMapEmpty!53669 () Bool)

(declare-fun mapDefault!53669 () ValueCell!16471)

