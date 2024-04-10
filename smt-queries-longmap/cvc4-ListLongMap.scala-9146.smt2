; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109720 () Bool)

(assert start!109720)

(declare-fun b_free!29153 () Bool)

(declare-fun b_next!29153 () Bool)

(assert (=> start!109720 (= b_free!29153 (not b_next!29153))))

(declare-fun tp!102586 () Bool)

(declare-fun b_and!47255 () Bool)

(assert (=> start!109720 (= tp!102586 b_and!47255)))

(declare-fun mapNonEmpty!53759 () Bool)

(declare-fun mapRes!53759 () Bool)

(declare-fun tp!102587 () Bool)

(declare-fun e!741406 () Bool)

(assert (=> mapNonEmpty!53759 (= mapRes!53759 (and tp!102587 e!741406))))

(declare-fun mapKey!53759 () (_ BitVec 32))

(declare-datatypes ((V!51493 0))(
  ( (V!51494 (val!17471 Int)) )
))
(declare-datatypes ((ValueCell!16498 0))(
  ( (ValueCellFull!16498 (v!20077 V!51493)) (EmptyCell!16498) )
))
(declare-fun mapValue!53759 () ValueCell!16498)

(declare-datatypes ((array!86594 0))(
  ( (array!86595 (arr!41795 (Array (_ BitVec 32) ValueCell!16498)) (size!42345 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86594)

(declare-fun mapRest!53759 () (Array (_ BitVec 32) ValueCell!16498))

(assert (=> mapNonEmpty!53759 (= (arr!41795 _values!1445) (store mapRest!53759 mapKey!53759 mapValue!53759))))

(declare-fun b!1299601 () Bool)

(declare-fun res!863630 () Bool)

(declare-fun e!741403 () Bool)

(assert (=> b!1299601 (=> (not res!863630) (not e!741403))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!86596 0))(
  ( (array!86597 (arr!41796 (Array (_ BitVec 32) (_ BitVec 64))) (size!42346 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86596)

(assert (=> b!1299601 (= res!863630 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42346 _keys!1741))))))

(declare-fun b!1299602 () Bool)

(declare-fun e!741402 () Bool)

(declare-fun tp_is_empty!34793 () Bool)

(assert (=> b!1299602 (= e!741402 tp_is_empty!34793)))

(declare-fun b!1299603 () Bool)

(declare-fun res!863632 () Bool)

(assert (=> b!1299603 (=> (not res!863632) (not e!741403))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1299603 (= res!863632 (and (= (size!42345 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42346 _keys!1741) (size!42345 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1299604 () Bool)

(declare-fun res!863633 () Bool)

(assert (=> b!1299604 (=> (not res!863633) (not e!741403))))

(declare-fun minValue!1387 () V!51493)

(declare-fun zeroValue!1387 () V!51493)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22534 0))(
  ( (tuple2!22535 (_1!11278 (_ BitVec 64)) (_2!11278 V!51493)) )
))
(declare-datatypes ((List!29665 0))(
  ( (Nil!29662) (Cons!29661 (h!30870 tuple2!22534) (t!43235 List!29665)) )
))
(declare-datatypes ((ListLongMap!20191 0))(
  ( (ListLongMap!20192 (toList!10111 List!29665)) )
))
(declare-fun contains!8233 (ListLongMap!20191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5139 (array!86596 array!86594 (_ BitVec 32) (_ BitVec 32) V!51493 V!51493 (_ BitVec 32) Int) ListLongMap!20191)

(assert (=> b!1299604 (= res!863633 (contains!8233 (getCurrentListMap!5139 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53759 () Bool)

(assert (=> mapIsEmpty!53759 mapRes!53759))

(declare-fun b!1299605 () Bool)

(declare-fun res!863637 () Bool)

(assert (=> b!1299605 (=> (not res!863637) (not e!741403))))

(assert (=> b!1299605 (= res!863637 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42346 _keys!1741))))))

(declare-fun b!1299606 () Bool)

(declare-fun e!741404 () Bool)

(assert (=> b!1299606 (= e!741404 (and e!741402 mapRes!53759))))

(declare-fun condMapEmpty!53759 () Bool)

(declare-fun mapDefault!53759 () ValueCell!16498)

