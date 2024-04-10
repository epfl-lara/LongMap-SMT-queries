; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109228 () Bool)

(assert start!109228)

(declare-fun b_free!28717 () Bool)

(declare-fun b_next!28717 () Bool)

(assert (=> start!109228 (= b_free!28717 (not b_next!28717))))

(declare-fun tp!101269 () Bool)

(declare-fun b_and!46807 () Bool)

(assert (=> start!109228 (= tp!101269 b_and!46807)))

(declare-fun b!1292151 () Bool)

(declare-fun res!858543 () Bool)

(declare-fun e!737555 () Bool)

(assert (=> b!1292151 (=> (not res!858543) (not e!737555))))

(declare-datatypes ((array!85748 0))(
  ( (array!85749 (arr!41375 (Array (_ BitVec 32) (_ BitVec 64))) (size!41925 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85748)

(declare-datatypes ((List!29347 0))(
  ( (Nil!29344) (Cons!29343 (h!30552 (_ BitVec 64)) (t!42911 List!29347)) )
))
(declare-fun arrayNoDuplicates!0 (array!85748 (_ BitVec 32) List!29347) Bool)

(assert (=> b!1292151 (= res!858543 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29344))))

(declare-fun b!1292152 () Bool)

(declare-fun res!858545 () Bool)

(assert (=> b!1292152 (=> (not res!858545) (not e!737555))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50913 0))(
  ( (V!50914 (val!17253 Int)) )
))
(declare-datatypes ((ValueCell!16280 0))(
  ( (ValueCellFull!16280 (v!19856 V!50913)) (EmptyCell!16280) )
))
(declare-datatypes ((array!85750 0))(
  ( (array!85751 (arr!41376 (Array (_ BitVec 32) ValueCell!16280)) (size!41926 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85750)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292152 (= res!858545 (and (= (size!41926 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41925 _keys!1741) (size!41926 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292153 () Bool)

(declare-fun res!858546 () Bool)

(assert (=> b!1292153 (=> (not res!858546) (not e!737555))))

(declare-fun zeroValue!1387 () V!50913)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun minValue!1387 () V!50913)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22194 0))(
  ( (tuple2!22195 (_1!11108 (_ BitVec 64)) (_2!11108 V!50913)) )
))
(declare-datatypes ((List!29348 0))(
  ( (Nil!29345) (Cons!29344 (h!30553 tuple2!22194) (t!42912 List!29348)) )
))
(declare-datatypes ((ListLongMap!19851 0))(
  ( (ListLongMap!19852 (toList!9941 List!29348)) )
))
(declare-fun contains!8059 (ListLongMap!19851 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4987 (array!85748 array!85750 (_ BitVec 32) (_ BitVec 32) V!50913 V!50913 (_ BitVec 32) Int) ListLongMap!19851)

(assert (=> b!1292153 (= res!858546 (contains!8059 (getCurrentListMap!4987 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292154 () Bool)

(declare-fun res!858547 () Bool)

(assert (=> b!1292154 (=> (not res!858547) (not e!737555))))

(assert (=> b!1292154 (= res!858547 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41925 _keys!1741))))))

(declare-fun res!858549 () Bool)

(assert (=> start!109228 (=> (not res!858549) (not e!737555))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109228 (= res!858549 (validMask!0 mask!2175))))

(assert (=> start!109228 e!737555))

(declare-fun tp_is_empty!34357 () Bool)

(assert (=> start!109228 tp_is_empty!34357))

(assert (=> start!109228 true))

(declare-fun e!737552 () Bool)

(declare-fun array_inv!31351 (array!85750) Bool)

(assert (=> start!109228 (and (array_inv!31351 _values!1445) e!737552)))

(declare-fun array_inv!31352 (array!85748) Bool)

(assert (=> start!109228 (array_inv!31352 _keys!1741)))

(assert (=> start!109228 tp!101269))

(declare-fun b!1292155 () Bool)

(declare-fun res!858544 () Bool)

(assert (=> b!1292155 (=> (not res!858544) (not e!737555))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292155 (= res!858544 (not (validKeyInArray!0 (select (arr!41375 _keys!1741) from!2144))))))

(declare-fun b!1292156 () Bool)

(declare-fun res!858542 () Bool)

(assert (=> b!1292156 (=> (not res!858542) (not e!737555))))

(assert (=> b!1292156 (= res!858542 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41925 _keys!1741))))))

(declare-fun b!1292157 () Bool)

(declare-fun e!737551 () Bool)

(assert (=> b!1292157 (= e!737551 tp_is_empty!34357)))

(declare-fun b!1292158 () Bool)

(declare-fun e!737554 () Bool)

(assert (=> b!1292158 (= e!737554 tp_is_empty!34357)))

(declare-fun mapIsEmpty!53096 () Bool)

(declare-fun mapRes!53096 () Bool)

(assert (=> mapIsEmpty!53096 mapRes!53096))

(declare-fun b!1292159 () Bool)

(declare-fun res!858548 () Bool)

(assert (=> b!1292159 (=> (not res!858548) (not e!737555))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85748 (_ BitVec 32)) Bool)

(assert (=> b!1292159 (= res!858548 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292160 () Bool)

(assert (=> b!1292160 (= e!737555 (not true))))

(assert (=> b!1292160 (not (contains!8059 (ListLongMap!19852 Nil!29345) k!1205))))

(declare-datatypes ((Unit!42792 0))(
  ( (Unit!42793) )
))
(declare-fun lt!579311 () Unit!42792)

(declare-fun emptyContainsNothing!118 ((_ BitVec 64)) Unit!42792)

(assert (=> b!1292160 (= lt!579311 (emptyContainsNothing!118 k!1205))))

(declare-fun b!1292161 () Bool)

(assert (=> b!1292161 (= e!737552 (and e!737554 mapRes!53096))))

(declare-fun condMapEmpty!53096 () Bool)

(declare-fun mapDefault!53096 () ValueCell!16280)

