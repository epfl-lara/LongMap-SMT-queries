; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109492 () Bool)

(assert start!109492)

(declare-fun b_free!28981 () Bool)

(declare-fun b_next!28981 () Bool)

(assert (=> start!109492 (= b_free!28981 (not b_next!28981))))

(declare-fun tp!102062 () Bool)

(declare-fun b_and!47071 () Bool)

(assert (=> start!109492 (= tp!102062 b_and!47071)))

(declare-fun b!1296800 () Bool)

(declare-fun res!861843 () Bool)

(declare-fun e!739828 () Bool)

(assert (=> b!1296800 (=> (not res!861843) (not e!739828))))

(declare-datatypes ((V!51265 0))(
  ( (V!51266 (val!17385 Int)) )
))
(declare-fun minValue!1387 () V!51265)

(declare-fun zeroValue!1387 () V!51265)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16412 0))(
  ( (ValueCellFull!16412 (v!19988 V!51265)) (EmptyCell!16412) )
))
(declare-datatypes ((array!86258 0))(
  ( (array!86259 (arr!41630 (Array (_ BitVec 32) ValueCell!16412)) (size!42180 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86258)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86260 0))(
  ( (array!86261 (arr!41631 (Array (_ BitVec 32) (_ BitVec 64))) (size!42181 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86260)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22398 0))(
  ( (tuple2!22399 (_1!11210 (_ BitVec 64)) (_2!11210 V!51265)) )
))
(declare-datatypes ((List!29535 0))(
  ( (Nil!29532) (Cons!29531 (h!30740 tuple2!22398) (t!43099 List!29535)) )
))
(declare-datatypes ((ListLongMap!20055 0))(
  ( (ListLongMap!20056 (toList!10043 List!29535)) )
))
(declare-fun contains!8161 (ListLongMap!20055 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5072 (array!86260 array!86258 (_ BitVec 32) (_ BitVec 32) V!51265 V!51265 (_ BitVec 32) Int) ListLongMap!20055)

(assert (=> b!1296800 (= res!861843 (contains!8161 (getCurrentListMap!5072 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296801 () Bool)

(declare-fun res!861841 () Bool)

(assert (=> b!1296801 (=> (not res!861841) (not e!739828))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86260 (_ BitVec 32)) Bool)

(assert (=> b!1296801 (= res!861841 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun res!861844 () Bool)

(assert (=> start!109492 (=> (not res!861844) (not e!739828))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109492 (= res!861844 (validMask!0 mask!2175))))

(assert (=> start!109492 e!739828))

(declare-fun tp_is_empty!34621 () Bool)

(assert (=> start!109492 tp_is_empty!34621))

(assert (=> start!109492 true))

(declare-fun e!739831 () Bool)

(declare-fun array_inv!31507 (array!86258) Bool)

(assert (=> start!109492 (and (array_inv!31507 _values!1445) e!739831)))

(declare-fun array_inv!31508 (array!86260) Bool)

(assert (=> start!109492 (array_inv!31508 _keys!1741)))

(assert (=> start!109492 tp!102062))

(declare-fun mapIsEmpty!53492 () Bool)

(declare-fun mapRes!53492 () Bool)

(assert (=> mapIsEmpty!53492 mapRes!53492))

(declare-fun b!1296802 () Bool)

(declare-fun res!861845 () Bool)

(assert (=> b!1296802 (=> (not res!861845) (not e!739828))))

(assert (=> b!1296802 (= res!861845 (and (= (size!42180 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42181 _keys!1741) (size!42180 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1296803 () Bool)

(declare-fun e!739829 () Bool)

(assert (=> b!1296803 (= e!739831 (and e!739829 mapRes!53492))))

(declare-fun condMapEmpty!53492 () Bool)

(declare-fun mapDefault!53492 () ValueCell!16412)

