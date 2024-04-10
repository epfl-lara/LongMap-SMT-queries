; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109618 () Bool)

(assert start!109618)

(declare-fun b_free!29107 () Bool)

(declare-fun b_next!29107 () Bool)

(assert (=> start!109618 (= b_free!29107 (not b_next!29107))))

(declare-fun tp!102440 () Bool)

(declare-fun b_and!47197 () Bool)

(assert (=> start!109618 (= tp!102440 b_and!47197)))

(declare-fun b!1298467 () Bool)

(declare-fun e!740775 () Bool)

(declare-fun tp_is_empty!34747 () Bool)

(assert (=> b!1298467 (= e!740775 tp_is_empty!34747)))

(declare-fun b!1298468 () Bool)

(declare-fun res!862946 () Bool)

(declare-fun e!740776 () Bool)

(assert (=> b!1298468 (=> (not res!862946) (not e!740776))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86500 0))(
  ( (array!86501 (arr!41751 (Array (_ BitVec 32) (_ BitVec 64))) (size!42301 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86500)

(assert (=> b!1298468 (= res!862946 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvslt (bvadd #b00000000000000000000000000000001 from!2144) (size!42301 _keys!1741)) (not (= (select (arr!41751 _keys!1741) from!2144) k!1205))))))

(declare-fun b!1298469 () Bool)

(declare-fun e!740773 () Bool)

(assert (=> b!1298469 (= e!740773 tp_is_empty!34747)))

(declare-fun mapNonEmpty!53681 () Bool)

(declare-fun mapRes!53681 () Bool)

(declare-fun tp!102439 () Bool)

(assert (=> mapNonEmpty!53681 (= mapRes!53681 (and tp!102439 e!740773))))

(declare-datatypes ((V!51433 0))(
  ( (V!51434 (val!17448 Int)) )
))
(declare-datatypes ((ValueCell!16475 0))(
  ( (ValueCellFull!16475 (v!20051 V!51433)) (EmptyCell!16475) )
))
(declare-fun mapRest!53681 () (Array (_ BitVec 32) ValueCell!16475))

(declare-fun mapKey!53681 () (_ BitVec 32))

(declare-fun mapValue!53681 () ValueCell!16475)

(declare-datatypes ((array!86502 0))(
  ( (array!86503 (arr!41752 (Array (_ BitVec 32) ValueCell!16475)) (size!42302 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86502)

(assert (=> mapNonEmpty!53681 (= (arr!41752 _values!1445) (store mapRest!53681 mapKey!53681 mapValue!53681))))

(declare-fun mapIsEmpty!53681 () Bool)

(assert (=> mapIsEmpty!53681 mapRes!53681))

(declare-fun b!1298471 () Bool)

(assert (=> b!1298471 (= e!740776 (not (bvsge (bvadd #b00000000000000000000000000000001 from!2144) #b00000000000000000000000000000000)))))

(declare-fun minValue!1387 () V!51433)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!51433)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22498 0))(
  ( (tuple2!22499 (_1!11260 (_ BitVec 64)) (_2!11260 V!51433)) )
))
(declare-datatypes ((List!29626 0))(
  ( (Nil!29623) (Cons!29622 (h!30831 tuple2!22498) (t!43190 List!29626)) )
))
(declare-datatypes ((ListLongMap!20155 0))(
  ( (ListLongMap!20156 (toList!10093 List!29626)) )
))
(declare-fun contains!8211 (ListLongMap!20155 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5122 (array!86500 array!86502 (_ BitVec 32) (_ BitVec 32) V!51433 V!51433 (_ BitVec 32) Int) ListLongMap!20155)

(assert (=> b!1298471 (contains!8211 (getCurrentListMap!5122 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 (bvadd #b00000000000000000000000000000001 from!2144) defaultEntry!1448) k!1205)))

(declare-datatypes ((Unit!42995 0))(
  ( (Unit!42996) )
))
(declare-fun lt!580706 () Unit!42995)

(declare-fun lemmaInListMapFromThenFromPlsOneIfNotEqToFst!50 (array!86500 array!86502 (_ BitVec 32) (_ BitVec 32) V!51433 V!51433 (_ BitVec 64) (_ BitVec 32) Int) Unit!42995)

(assert (=> b!1298471 (= lt!580706 (lemmaInListMapFromThenFromPlsOneIfNotEqToFst!50 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 k!1205 from!2144 defaultEntry!1448))))

(declare-fun b!1298472 () Bool)

(declare-fun res!862944 () Bool)

(assert (=> b!1298472 (=> (not res!862944) (not e!740776))))

(assert (=> b!1298472 (= res!862944 (and (= (size!42302 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42301 _keys!1741) (size!42302 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1298473 () Bool)

(declare-fun res!862943 () Bool)

(assert (=> b!1298473 (=> (not res!862943) (not e!740776))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86500 (_ BitVec 32)) Bool)

(assert (=> b!1298473 (= res!862943 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1298474 () Bool)

(declare-fun res!862947 () Bool)

(assert (=> b!1298474 (=> (not res!862947) (not e!740776))))

(declare-datatypes ((List!29627 0))(
  ( (Nil!29624) (Cons!29623 (h!30832 (_ BitVec 64)) (t!43191 List!29627)) )
))
(declare-fun arrayNoDuplicates!0 (array!86500 (_ BitVec 32) List!29627) Bool)

(assert (=> b!1298474 (= res!862947 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29624))))

(declare-fun res!862942 () Bool)

(assert (=> start!109618 (=> (not res!862942) (not e!740776))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109618 (= res!862942 (validMask!0 mask!2175))))

(assert (=> start!109618 e!740776))

(assert (=> start!109618 tp_is_empty!34747))

(assert (=> start!109618 true))

(declare-fun e!740774 () Bool)

(declare-fun array_inv!31601 (array!86502) Bool)

(assert (=> start!109618 (and (array_inv!31601 _values!1445) e!740774)))

(declare-fun array_inv!31602 (array!86500) Bool)

(assert (=> start!109618 (array_inv!31602 _keys!1741)))

(assert (=> start!109618 tp!102440))

(declare-fun b!1298470 () Bool)

(declare-fun res!862941 () Bool)

(assert (=> b!1298470 (=> (not res!862941) (not e!740776))))

(assert (=> b!1298470 (= res!862941 (contains!8211 (getCurrentListMap!5122 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1298475 () Bool)

(assert (=> b!1298475 (= e!740774 (and e!740775 mapRes!53681))))

(declare-fun condMapEmpty!53681 () Bool)

(declare-fun mapDefault!53681 () ValueCell!16475)

