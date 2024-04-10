; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109372 () Bool)

(assert start!109372)

(declare-fun b_free!28861 () Bool)

(declare-fun b_next!28861 () Bool)

(assert (=> start!109372 (= b_free!28861 (not b_next!28861))))

(declare-fun tp!101701 () Bool)

(declare-fun b_and!46951 () Bool)

(assert (=> start!109372 (= tp!101701 b_and!46951)))

(declare-fun b!1294635 () Bool)

(declare-fun res!860380 () Bool)

(declare-fun e!738742 () Bool)

(assert (=> b!1294635 (=> (not res!860380) (not e!738742))))

(declare-datatypes ((V!51105 0))(
  ( (V!51106 (val!17325 Int)) )
))
(declare-fun minValue!1387 () V!51105)

(declare-fun zeroValue!1387 () V!51105)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16352 0))(
  ( (ValueCellFull!16352 (v!19928 V!51105)) (EmptyCell!16352) )
))
(declare-datatypes ((array!86022 0))(
  ( (array!86023 (arr!41512 (Array (_ BitVec 32) ValueCell!16352)) (size!42062 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86022)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86024 0))(
  ( (array!86025 (arr!41513 (Array (_ BitVec 32) (_ BitVec 64))) (size!42063 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86024)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22304 0))(
  ( (tuple2!22305 (_1!11163 (_ BitVec 64)) (_2!11163 V!51105)) )
))
(declare-datatypes ((List!29447 0))(
  ( (Nil!29444) (Cons!29443 (h!30652 tuple2!22304) (t!43011 List!29447)) )
))
(declare-datatypes ((ListLongMap!19961 0))(
  ( (ListLongMap!19962 (toList!9996 List!29447)) )
))
(declare-fun contains!8114 (ListLongMap!19961 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5033 (array!86024 array!86022 (_ BitVec 32) (_ BitVec 32) V!51105 V!51105 (_ BitVec 32) Int) ListLongMap!19961)

(assert (=> b!1294635 (= res!860380 (contains!8114 (getCurrentListMap!5033 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294636 () Bool)

(assert (=> b!1294636 (= e!738742 (not true))))

(assert (=> b!1294636 (not (contains!8114 (ListLongMap!19962 Nil!29444) k!1205))))

(declare-datatypes ((Unit!42878 0))(
  ( (Unit!42879) )
))
(declare-fun lt!579734 () Unit!42878)

(declare-fun emptyContainsNothing!160 ((_ BitVec 64)) Unit!42878)

(assert (=> b!1294636 (= lt!579734 (emptyContainsNothing!160 k!1205))))

(declare-fun mapNonEmpty!53312 () Bool)

(declare-fun mapRes!53312 () Bool)

(declare-fun tp!101702 () Bool)

(declare-fun e!738739 () Bool)

(assert (=> mapNonEmpty!53312 (= mapRes!53312 (and tp!101702 e!738739))))

(declare-fun mapRest!53312 () (Array (_ BitVec 32) ValueCell!16352))

(declare-fun mapValue!53312 () ValueCell!16352)

(declare-fun mapKey!53312 () (_ BitVec 32))

(assert (=> mapNonEmpty!53312 (= (arr!41512 _values!1445) (store mapRest!53312 mapKey!53312 mapValue!53312))))

(declare-fun b!1294637 () Bool)

(declare-fun res!860381 () Bool)

(assert (=> b!1294637 (=> (not res!860381) (not e!738742))))

(assert (=> b!1294637 (= res!860381 (and (= (size!42062 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42063 _keys!1741) (size!42062 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294639 () Bool)

(declare-fun res!860383 () Bool)

(assert (=> b!1294639 (=> (not res!860383) (not e!738742))))

(declare-datatypes ((List!29448 0))(
  ( (Nil!29445) (Cons!29444 (h!30653 (_ BitVec 64)) (t!43012 List!29448)) )
))
(declare-fun arrayNoDuplicates!0 (array!86024 (_ BitVec 32) List!29448) Bool)

(assert (=> b!1294639 (= res!860383 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29445))))

(declare-fun b!1294640 () Bool)

(declare-fun res!860378 () Bool)

(assert (=> b!1294640 (=> (not res!860378) (not e!738742))))

(assert (=> b!1294640 (= res!860378 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42063 _keys!1741))))))

(declare-fun b!1294641 () Bool)

(declare-fun res!860385 () Bool)

(assert (=> b!1294641 (=> (not res!860385) (not e!738742))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86024 (_ BitVec 32)) Bool)

(assert (=> b!1294641 (= res!860385 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!860379 () Bool)

(assert (=> start!109372 (=> (not res!860379) (not e!738742))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109372 (= res!860379 (validMask!0 mask!2175))))

(assert (=> start!109372 e!738742))

(declare-fun tp_is_empty!34501 () Bool)

(assert (=> start!109372 tp_is_empty!34501))

(assert (=> start!109372 true))

(declare-fun e!738743 () Bool)

(declare-fun array_inv!31437 (array!86022) Bool)

(assert (=> start!109372 (and (array_inv!31437 _values!1445) e!738743)))

(declare-fun array_inv!31438 (array!86024) Bool)

(assert (=> start!109372 (array_inv!31438 _keys!1741)))

(assert (=> start!109372 tp!101701))

(declare-fun b!1294638 () Bool)

(declare-fun res!860382 () Bool)

(assert (=> b!1294638 (=> (not res!860382) (not e!738742))))

(assert (=> b!1294638 (= res!860382 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42063 _keys!1741))))))

(declare-fun b!1294642 () Bool)

(declare-fun res!860384 () Bool)

(assert (=> b!1294642 (=> (not res!860384) (not e!738742))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294642 (= res!860384 (not (validKeyInArray!0 (select (arr!41513 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53312 () Bool)

(assert (=> mapIsEmpty!53312 mapRes!53312))

(declare-fun b!1294643 () Bool)

(assert (=> b!1294643 (= e!738739 tp_is_empty!34501)))

(declare-fun b!1294644 () Bool)

(declare-fun e!738741 () Bool)

(assert (=> b!1294644 (= e!738743 (and e!738741 mapRes!53312))))

(declare-fun condMapEmpty!53312 () Bool)

(declare-fun mapDefault!53312 () ValueCell!16352)

