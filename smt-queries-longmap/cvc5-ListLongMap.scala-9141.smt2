; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109630 () Bool)

(assert start!109630)

(declare-fun b_free!29119 () Bool)

(declare-fun b_next!29119 () Bool)

(assert (=> start!109630 (= b_free!29119 (not b_next!29119))))

(declare-fun tp!102475 () Bool)

(declare-fun b_and!47209 () Bool)

(assert (=> start!109630 (= tp!102475 b_and!47209)))

(declare-fun mapIsEmpty!53699 () Bool)

(declare-fun mapRes!53699 () Bool)

(assert (=> mapIsEmpty!53699 mapRes!53699))

(declare-fun b!1298647 () Bool)

(declare-fun res!863068 () Bool)

(declare-fun e!740867 () Bool)

(assert (=> b!1298647 (=> (not res!863068) (not e!740867))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86524 0))(
  ( (array!86525 (arr!41763 (Array (_ BitVec 32) (_ BitVec 64))) (size!42313 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86524)

(declare-datatypes ((V!51449 0))(
  ( (V!51450 (val!17454 Int)) )
))
(declare-datatypes ((ValueCell!16481 0))(
  ( (ValueCellFull!16481 (v!20057 V!51449)) (EmptyCell!16481) )
))
(declare-datatypes ((array!86526 0))(
  ( (array!86527 (arr!41764 (Array (_ BitVec 32) ValueCell!16481)) (size!42314 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86526)

(assert (=> b!1298647 (= res!863068 (and (= (size!42314 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42313 _keys!1741) (size!42314 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298648 () Bool)

(declare-fun res!863069 () Bool)

(assert (=> b!1298648 (=> (not res!863069) (not e!740867))))

(declare-datatypes ((List!29638 0))(
  ( (Nil!29635) (Cons!29634 (h!30843 (_ BitVec 64)) (t!43202 List!29638)) )
))
(declare-fun arrayNoDuplicates!0 (array!86524 (_ BitVec 32) List!29638) Bool)

(assert (=> b!1298648 (= res!863069 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29635))))

(declare-fun b!1298649 () Bool)

(declare-fun res!863073 () Bool)

(assert (=> b!1298649 (=> (not res!863073) (not e!740867))))

(declare-fun minValue!1387 () V!51449)

(declare-fun zeroValue!1387 () V!51449)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22510 0))(
  ( (tuple2!22511 (_1!11266 (_ BitVec 64)) (_2!11266 V!51449)) )
))
(declare-datatypes ((List!29639 0))(
  ( (Nil!29636) (Cons!29635 (h!30844 tuple2!22510) (t!43203 List!29639)) )
))
(declare-datatypes ((ListLongMap!20167 0))(
  ( (ListLongMap!20168 (toList!10099 List!29639)) )
))
(declare-fun contains!8217 (ListLongMap!20167 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5128 (array!86524 array!86526 (_ BitVec 32) (_ BitVec 32) V!51449 V!51449 (_ BitVec 32) Int) ListLongMap!20167)

(assert (=> b!1298649 (= res!863073 (contains!8217 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298650 () Bool)

(declare-fun res!863072 () Bool)

(assert (=> b!1298650 (=> (not res!863072) (not e!740867))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86524 (_ BitVec 32)) Bool)

(assert (=> b!1298650 (= res!863072 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298651 () Bool)

(declare-fun e!740865 () Bool)

(declare-fun tp_is_empty!34759 () Bool)

(assert (=> b!1298651 (= e!740865 tp_is_empty!34759)))

(declare-fun b!1298652 () Bool)

(assert (=> b!1298652 (= e!740867 (not (or (bvslt (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000) (bvslt (bvsub (size!42313 _keys!1741) (bvadd #b00000000000000000000000000000001 from!2144)) (bvsub (size!42313 _keys!1741) from!2144)))))))

(assert (=> b!1298652 (contains!8217 (getCurrentListMap!5128 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!43003 0))(
  ( (Unit!43004) )
))
(declare-fun lt!580724 () Unit!43003)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!54 (array!86524 array!86526 (_ BitVec 32) (_ BitVec 32) V!51449 V!51449 (_ BitVec 64) (_ BitVec 32) Int) Unit!43003)

(assert (=> b!1298652 (= lt!580724 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!54 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298653 () Bool)

(declare-fun res!863070 () Bool)

(assert (=> b!1298653 (=> (not res!863070) (not e!740867))))

(assert (=> b!1298653 (= res!863070 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42313 _keys!1741)) (not (= (select (arr!41763 _keys!1741) from!2144) k!1205))))))

(declare-fun mapNonEmpty!53699 () Bool)

(declare-fun tp!102476 () Bool)

(assert (=> mapNonEmpty!53699 (= mapRes!53699 (and tp!102476 e!740865))))

(declare-fun mapKey!53699 () (_ BitVec 32))

(declare-fun mapRest!53699 () (Array (_ BitVec 32) ValueCell!16481))

(declare-fun mapValue!53699 () ValueCell!16481)

(assert (=> mapNonEmpty!53699 (= (arr!41764 _values!1445) (store mapRest!53699 mapKey!53699 mapValue!53699))))

(declare-fun b!1298654 () Bool)

(declare-fun e!740866 () Bool)

(declare-fun e!740863 () Bool)

(assert (=> b!1298654 (= e!740866 (and e!740863 mapRes!53699))))

(declare-fun condMapEmpty!53699 () Bool)

(declare-fun mapDefault!53699 () ValueCell!16481)

