; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110070 () Bool)

(assert start!110070)

(declare-fun b_free!29269 () Bool)

(declare-fun b_next!29269 () Bool)

(assert (=> start!110070 (= b_free!29269 (not b_next!29269))))

(declare-fun tp!102957 () Bool)

(declare-fun b_and!47433 () Bool)

(assert (=> start!110070 (= tp!102957 b_and!47433)))

(declare-fun b!1303588 () Bool)

(declare-fun res!865832 () Bool)

(declare-fun e!743549 () Bool)

(assert (=> b!1303588 (=> (not res!865832) (not e!743549))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51649 0))(
  ( (V!51650 (val!17529 Int)) )
))
(declare-datatypes ((ValueCell!16556 0))(
  ( (ValueCellFull!16556 (v!20145 V!51649)) (EmptyCell!16556) )
))
(declare-datatypes ((array!86828 0))(
  ( (array!86829 (arr!41905 (Array (_ BitVec 32) ValueCell!16556)) (size!42455 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86828)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86830 0))(
  ( (array!86831 (arr!41906 (Array (_ BitVec 32) (_ BitVec 64))) (size!42456 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86830)

(assert (=> b!1303588 (= res!865832 (and (= (size!42455 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42456 _keys!1741) (size!42455 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1303589 () Bool)

(declare-fun res!865835 () Bool)

(assert (=> b!1303589 (=> (not res!865835) (not e!743549))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86830 (_ BitVec 32)) Bool)

(assert (=> b!1303589 (= res!865835 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1303590 () Bool)

(declare-fun e!743545 () Bool)

(declare-fun tp_is_empty!34909 () Bool)

(assert (=> b!1303590 (= e!743545 tp_is_empty!34909)))

(declare-fun b!1303591 () Bool)

(declare-fun e!743548 () Bool)

(declare-fun e!743550 () Bool)

(assert (=> b!1303591 (= e!743548 e!743550)))

(declare-fun res!865833 () Bool)

(assert (=> b!1303591 (=> (not res!865833) (not e!743550))))

(declare-fun minValue!1387 () V!51649)

(declare-fun zeroValue!1387 () V!51649)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22620 0))(
  ( (tuple2!22621 (_1!11321 (_ BitVec 64)) (_2!11321 V!51649)) )
))
(declare-datatypes ((List!29745 0))(
  ( (Nil!29742) (Cons!29741 (h!30950 tuple2!22620) (t!43339 List!29745)) )
))
(declare-datatypes ((ListLongMap!20277 0))(
  ( (ListLongMap!20278 (toList!10154 List!29745)) )
))
(declare-fun contains!8290 (ListLongMap!20277 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMapNoExtraKeys!6112 (array!86830 array!86828 (_ BitVec 32) (_ BitVec 32) V!51649 V!51649 (_ BitVec 32) Int) ListLongMap!20277)

(assert (=> b!1303591 (= res!865833 (not (contains!8290 (getCurrentListMapNoExtraKeys!6112 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205)))))

(declare-fun b!1303592 () Bool)

(declare-fun res!865837 () Bool)

(assert (=> b!1303592 (=> (not res!865837) (not e!743549))))

(assert (=> b!1303592 (= res!865837 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42456 _keys!1741))))))

(declare-fun mapIsEmpty!53956 () Bool)

(declare-fun mapRes!53956 () Bool)

(assert (=> mapIsEmpty!53956 mapRes!53956))

(declare-fun mapNonEmpty!53956 () Bool)

(declare-fun tp!102958 () Bool)

(declare-fun e!743546 () Bool)

(assert (=> mapNonEmpty!53956 (= mapRes!53956 (and tp!102958 e!743546))))

(declare-fun mapRest!53956 () (Array (_ BitVec 32) ValueCell!16556))

(declare-fun mapKey!53956 () (_ BitVec 32))

(declare-fun mapValue!53956 () ValueCell!16556)

(assert (=> mapNonEmpty!53956 (= (arr!41905 _values!1445) (store mapRest!53956 mapKey!53956 mapValue!53956))))

(declare-fun b!1303593 () Bool)

(declare-fun res!865830 () Bool)

(assert (=> b!1303593 (=> (not res!865830) (not e!743549))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1303593 (= res!865830 (not (validKeyInArray!0 (select (arr!41906 _keys!1741) from!2144))))))

(declare-fun b!1303594 () Bool)

(declare-fun res!865836 () Bool)

(assert (=> b!1303594 (=> (not res!865836) (not e!743549))))

(assert (=> b!1303594 (= res!865836 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42456 _keys!1741))))))

(declare-fun b!1303595 () Bool)

(declare-fun res!865834 () Bool)

(assert (=> b!1303595 (=> (not res!865834) (not e!743549))))

(declare-fun getCurrentListMap!5175 (array!86830 array!86828 (_ BitVec 32) (_ BitVec 32) V!51649 V!51649 (_ BitVec 32) Int) ListLongMap!20277)

(assert (=> b!1303595 (= res!865834 (contains!8290 (getCurrentListMap!5175 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!865839 () Bool)

(assert (=> start!110070 (=> (not res!865839) (not e!743549))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!110070 (= res!865839 (validMask!0 mask!2175))))

(assert (=> start!110070 e!743549))

(assert (=> start!110070 tp_is_empty!34909))

(assert (=> start!110070 true))

(declare-fun e!743551 () Bool)

(declare-fun array_inv!31691 (array!86828) Bool)

(assert (=> start!110070 (and (array_inv!31691 _values!1445) e!743551)))

(declare-fun array_inv!31692 (array!86830) Bool)

(assert (=> start!110070 (array_inv!31692 _keys!1741)))

(assert (=> start!110070 tp!102957))

(declare-fun b!1303596 () Bool)

(assert (=> b!1303596 (= e!743550 (not (= #b0000000000000000000000000000000000000000000000000000000000000000 k!1205)))))

(declare-fun b!1303597 () Bool)

(assert (=> b!1303597 (= e!743549 (not e!743548))))

(declare-fun res!865838 () Bool)

(assert (=> b!1303597 (=> res!865838 e!743548)))

(assert (=> b!1303597 (= res!865838 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1303597 (not (contains!8290 (ListLongMap!20278 Nil!29742) k!1205))))

(declare-datatypes ((Unit!43162 0))(
  ( (Unit!43163) )
))
(declare-fun lt!583350 () Unit!43162)

(declare-fun emptyContainsNothing!218 ((_ BitVec 64)) Unit!43162)

(assert (=> b!1303597 (= lt!583350 (emptyContainsNothing!218 k!1205))))

(declare-fun b!1303598 () Bool)

(assert (=> b!1303598 (= e!743546 tp_is_empty!34909)))

(declare-fun b!1303599 () Bool)

(assert (=> b!1303599 (= e!743551 (and e!743545 mapRes!53956))))

(declare-fun condMapEmpty!53956 () Bool)

(declare-fun mapDefault!53956 () ValueCell!16556)

