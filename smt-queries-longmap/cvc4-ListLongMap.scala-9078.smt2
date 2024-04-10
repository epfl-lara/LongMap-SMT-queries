; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109256 () Bool)

(assert start!109256)

(declare-fun b_free!28745 () Bool)

(declare-fun b_next!28745 () Bool)

(assert (=> start!109256 (= b_free!28745 (not b_next!28745))))

(declare-fun tp!101354 () Bool)

(declare-fun b_and!46835 () Bool)

(assert (=> start!109256 (= tp!101354 b_and!46835)))

(declare-fun b!1292613 () Bool)

(declare-fun res!858878 () Bool)

(declare-fun e!737761 () Bool)

(assert (=> b!1292613 (=> (not res!858878) (not e!737761))))

(declare-datatypes ((array!85802 0))(
  ( (array!85803 (arr!41402 (Array (_ BitVec 32) (_ BitVec 64))) (size!41952 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85802)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292613 (= res!858878 (not (validKeyInArray!0 (select (arr!41402 _keys!1741) from!2144))))))

(declare-fun b!1292614 () Bool)

(declare-fun res!858884 () Bool)

(assert (=> b!1292614 (=> (not res!858884) (not e!737761))))

(assert (=> b!1292614 (= res!858884 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41952 _keys!1741))))))

(declare-fun b!1292615 () Bool)

(declare-fun res!858880 () Bool)

(assert (=> b!1292615 (=> (not res!858880) (not e!737761))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50949 0))(
  ( (V!50950 (val!17267 Int)) )
))
(declare-datatypes ((ValueCell!16294 0))(
  ( (ValueCellFull!16294 (v!19870 V!50949)) (EmptyCell!16294) )
))
(declare-datatypes ((array!85804 0))(
  ( (array!85805 (arr!41403 (Array (_ BitVec 32) ValueCell!16294)) (size!41953 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85804)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1292615 (= res!858880 (and (= (size!41953 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41952 _keys!1741) (size!41953 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292616 () Bool)

(declare-fun res!858881 () Bool)

(assert (=> b!1292616 (=> (not res!858881) (not e!737761))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1292616 (= res!858881 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41952 _keys!1741))))))

(declare-fun b!1292617 () Bool)

(declare-fun e!737765 () Bool)

(declare-fun tp_is_empty!34385 () Bool)

(assert (=> b!1292617 (= e!737765 tp_is_empty!34385)))

(declare-fun res!858885 () Bool)

(assert (=> start!109256 (=> (not res!858885) (not e!737761))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109256 (= res!858885 (validMask!0 mask!2175))))

(assert (=> start!109256 e!737761))

(assert (=> start!109256 tp_is_empty!34385))

(assert (=> start!109256 true))

(declare-fun e!737764 () Bool)

(declare-fun array_inv!31367 (array!85804) Bool)

(assert (=> start!109256 (and (array_inv!31367 _values!1445) e!737764)))

(declare-fun array_inv!31368 (array!85802) Bool)

(assert (=> start!109256 (array_inv!31368 _keys!1741)))

(assert (=> start!109256 tp!101354))

(declare-fun b!1292618 () Bool)

(declare-fun e!737763 () Bool)

(assert (=> b!1292618 (= e!737763 tp_is_empty!34385)))

(declare-fun b!1292619 () Bool)

(declare-fun res!858883 () Bool)

(assert (=> b!1292619 (=> (not res!858883) (not e!737761))))

(declare-fun minValue!1387 () V!50949)

(declare-fun zeroValue!1387 () V!50949)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22218 0))(
  ( (tuple2!22219 (_1!11120 (_ BitVec 64)) (_2!11120 V!50949)) )
))
(declare-datatypes ((List!29369 0))(
  ( (Nil!29366) (Cons!29365 (h!30574 tuple2!22218) (t!42933 List!29369)) )
))
(declare-datatypes ((ListLongMap!19875 0))(
  ( (ListLongMap!19876 (toList!9953 List!29369)) )
))
(declare-fun contains!8071 (ListLongMap!19875 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4999 (array!85802 array!85804 (_ BitVec 32) (_ BitVec 32) V!50949 V!50949 (_ BitVec 32) Int) ListLongMap!19875)

(assert (=> b!1292619 (= res!858883 (contains!8071 (getCurrentListMap!4999 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292620 () Bool)

(declare-fun res!858882 () Bool)

(assert (=> b!1292620 (=> (not res!858882) (not e!737761))))

(declare-datatypes ((List!29370 0))(
  ( (Nil!29367) (Cons!29366 (h!30575 (_ BitVec 64)) (t!42934 List!29370)) )
))
(declare-fun arrayNoDuplicates!0 (array!85802 (_ BitVec 32) List!29370) Bool)

(assert (=> b!1292620 (= res!858882 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29367))))

(declare-fun mapIsEmpty!53138 () Bool)

(declare-fun mapRes!53138 () Bool)

(assert (=> mapIsEmpty!53138 mapRes!53138))

(declare-fun b!1292621 () Bool)

(assert (=> b!1292621 (= e!737764 (and e!737765 mapRes!53138))))

(declare-fun condMapEmpty!53138 () Bool)

(declare-fun mapDefault!53138 () ValueCell!16294)

