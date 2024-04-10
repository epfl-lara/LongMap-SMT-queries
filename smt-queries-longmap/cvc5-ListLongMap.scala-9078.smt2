; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109252 () Bool)

(assert start!109252)

(declare-fun b_free!28741 () Bool)

(declare-fun b_next!28741 () Bool)

(assert (=> start!109252 (= b_free!28741 (not b_next!28741))))

(declare-fun tp!101342 () Bool)

(declare-fun b_and!46831 () Bool)

(assert (=> start!109252 (= tp!101342 b_and!46831)))

(declare-fun b!1292547 () Bool)

(declare-fun res!858830 () Bool)

(declare-fun e!737731 () Bool)

(assert (=> b!1292547 (=> (not res!858830) (not e!737731))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85794 0))(
  ( (array!85795 (arr!41398 (Array (_ BitVec 32) (_ BitVec 64))) (size!41948 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85794)

(assert (=> b!1292547 (= res!858830 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41948 _keys!1741))))))

(declare-fun b!1292548 () Bool)

(declare-fun e!737732 () Bool)

(declare-fun tp_is_empty!34381 () Bool)

(assert (=> b!1292548 (= e!737732 tp_is_empty!34381)))

(declare-fun b!1292549 () Bool)

(declare-fun res!858835 () Bool)

(assert (=> b!1292549 (=> (not res!858835) (not e!737731))))

(declare-datatypes ((V!50945 0))(
  ( (V!50946 (val!17265 Int)) )
))
(declare-fun minValue!1387 () V!50945)

(declare-fun zeroValue!1387 () V!50945)

(declare-datatypes ((ValueCell!16292 0))(
  ( (ValueCellFull!16292 (v!19868 V!50945)) (EmptyCell!16292) )
))
(declare-datatypes ((array!85796 0))(
  ( (array!85797 (arr!41399 (Array (_ BitVec 32) ValueCell!16292)) (size!41949 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85796)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22214 0))(
  ( (tuple2!22215 (_1!11118 (_ BitVec 64)) (_2!11118 V!50945)) )
))
(declare-datatypes ((List!29366 0))(
  ( (Nil!29363) (Cons!29362 (h!30571 tuple2!22214) (t!42930 List!29366)) )
))
(declare-datatypes ((ListLongMap!19871 0))(
  ( (ListLongMap!19872 (toList!9951 List!29366)) )
))
(declare-fun contains!8069 (ListLongMap!19871 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4997 (array!85794 array!85796 (_ BitVec 32) (_ BitVec 32) V!50945 V!50945 (_ BitVec 32) Int) ListLongMap!19871)

(assert (=> b!1292549 (= res!858835 (contains!8069 (getCurrentListMap!4997 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292550 () Bool)

(declare-fun res!858831 () Bool)

(assert (=> b!1292550 (=> (not res!858831) (not e!737731))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292550 (= res!858831 (not (validKeyInArray!0 (select (arr!41398 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53132 () Bool)

(declare-fun mapRes!53132 () Bool)

(assert (=> mapIsEmpty!53132 mapRes!53132))

(declare-fun b!1292551 () Bool)

(declare-fun e!737735 () Bool)

(declare-fun e!737734 () Bool)

(assert (=> b!1292551 (= e!737735 (and e!737734 mapRes!53132))))

(declare-fun condMapEmpty!53132 () Bool)

(declare-fun mapDefault!53132 () ValueCell!16292)

