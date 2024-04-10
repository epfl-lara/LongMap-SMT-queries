; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109238 () Bool)

(assert start!109238)

(declare-fun b_free!28727 () Bool)

(declare-fun b_next!28727 () Bool)

(assert (=> start!109238 (= b_free!28727 (not b_next!28727))))

(declare-fun tp!101299 () Bool)

(declare-fun b_and!46817 () Bool)

(assert (=> start!109238 (= tp!101299 b_and!46817)))

(declare-fun b!1292316 () Bool)

(declare-fun res!858668 () Bool)

(declare-fun e!737629 () Bool)

(assert (=> b!1292316 (=> (not res!858668) (not e!737629))))

(declare-datatypes ((array!85766 0))(
  ( (array!85767 (arr!41384 (Array (_ BitVec 32) (_ BitVec 64))) (size!41934 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85766)

(declare-datatypes ((List!29355 0))(
  ( (Nil!29352) (Cons!29351 (h!30560 (_ BitVec 64)) (t!42919 List!29355)) )
))
(declare-fun arrayNoDuplicates!0 (array!85766 (_ BitVec 32) List!29355) Bool)

(assert (=> b!1292316 (= res!858668 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29352))))

(declare-fun b!1292317 () Bool)

(declare-fun res!858663 () Bool)

(assert (=> b!1292317 (=> (not res!858663) (not e!737629))))

(declare-datatypes ((V!50925 0))(
  ( (V!50926 (val!17258 Int)) )
))
(declare-fun minValue!1387 () V!50925)

(declare-fun zeroValue!1387 () V!50925)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16285 0))(
  ( (ValueCellFull!16285 (v!19861 V!50925)) (EmptyCell!16285) )
))
(declare-datatypes ((array!85768 0))(
  ( (array!85769 (arr!41385 (Array (_ BitVec 32) ValueCell!16285)) (size!41935 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85768)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22202 0))(
  ( (tuple2!22203 (_1!11112 (_ BitVec 64)) (_2!11112 V!50925)) )
))
(declare-datatypes ((List!29356 0))(
  ( (Nil!29353) (Cons!29352 (h!30561 tuple2!22202) (t!42920 List!29356)) )
))
(declare-datatypes ((ListLongMap!19859 0))(
  ( (ListLongMap!19860 (toList!9945 List!29356)) )
))
(declare-fun contains!8063 (ListLongMap!19859 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4991 (array!85766 array!85768 (_ BitVec 32) (_ BitVec 32) V!50925 V!50925 (_ BitVec 32) Int) ListLongMap!19859)

(assert (=> b!1292317 (= res!858663 (contains!8063 (getCurrentListMap!4991 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292318 () Bool)

(declare-fun res!858669 () Bool)

(assert (=> b!1292318 (=> (not res!858669) (not e!737629))))

(assert (=> b!1292318 (= res!858669 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41934 _keys!1741))))))

(declare-fun b!1292319 () Bool)

(declare-fun res!858666 () Bool)

(assert (=> b!1292319 (=> (not res!858666) (not e!737629))))

(assert (=> b!1292319 (= res!858666 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41934 _keys!1741))))))

(declare-fun b!1292320 () Bool)

(declare-fun e!737628 () Bool)

(declare-fun tp_is_empty!34367 () Bool)

(assert (=> b!1292320 (= e!737628 tp_is_empty!34367)))

(declare-fun b!1292321 () Bool)

(declare-fun res!858667 () Bool)

(assert (=> b!1292321 (=> (not res!858667) (not e!737629))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292321 (= res!858667 (not (validKeyInArray!0 (select (arr!41384 _keys!1741) from!2144))))))

(declare-fun b!1292322 () Bool)

(declare-fun e!737626 () Bool)

(assert (=> b!1292322 (= e!737626 tp_is_empty!34367)))

(declare-fun b!1292323 () Bool)

(declare-fun res!858664 () Bool)

(assert (=> b!1292323 (=> (not res!858664) (not e!737629))))

(assert (=> b!1292323 (= res!858664 (and (= (size!41935 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41934 _keys!1741) (size!41935 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292324 () Bool)

(assert (=> b!1292324 (= e!737629 (not true))))

(assert (=> b!1292324 (not (contains!8063 (ListLongMap!19860 Nil!29353) k!1205))))

(declare-datatypes ((Unit!42798 0))(
  ( (Unit!42799) )
))
(declare-fun lt!579326 () Unit!42798)

(declare-fun emptyContainsNothing!121 ((_ BitVec 64)) Unit!42798)

(assert (=> b!1292324 (= lt!579326 (emptyContainsNothing!121 k!1205))))

(declare-fun b!1292325 () Bool)

(declare-fun e!737630 () Bool)

(declare-fun mapRes!53111 () Bool)

(assert (=> b!1292325 (= e!737630 (and e!737628 mapRes!53111))))

(declare-fun condMapEmpty!53111 () Bool)

(declare-fun mapDefault!53111 () ValueCell!16285)

