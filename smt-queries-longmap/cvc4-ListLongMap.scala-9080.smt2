; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109268 () Bool)

(assert start!109268)

(declare-fun b_free!28757 () Bool)

(declare-fun b_next!28757 () Bool)

(assert (=> start!109268 (= b_free!28757 (not b_next!28757))))

(declare-fun tp!101389 () Bool)

(declare-fun b_and!46847 () Bool)

(assert (=> start!109268 (= tp!101389 b_and!46847)))

(declare-fun b!1292828 () Bool)

(declare-fun res!859047 () Bool)

(declare-fun e!737870 () Bool)

(assert (=> b!1292828 (=> (not res!859047) (not e!737870))))

(declare-datatypes ((array!85826 0))(
  ( (array!85827 (arr!41414 (Array (_ BitVec 32) (_ BitVec 64))) (size!41964 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85826)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1292828 (= res!859047 (not (validKeyInArray!0 (select (arr!41414 _keys!1741) from!2144))))))

(declare-fun b!1292829 () Bool)

(declare-fun res!859042 () Bool)

(assert (=> b!1292829 (=> (not res!859042) (not e!737870))))

(declare-datatypes ((V!50965 0))(
  ( (V!50966 (val!17273 Int)) )
))
(declare-fun minValue!1387 () V!50965)

(declare-fun zeroValue!1387 () V!50965)

(declare-datatypes ((ValueCell!16300 0))(
  ( (ValueCellFull!16300 (v!19876 V!50965)) (EmptyCell!16300) )
))
(declare-datatypes ((array!85828 0))(
  ( (array!85829 (arr!41415 (Array (_ BitVec 32) ValueCell!16300)) (size!41965 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85828)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22228 0))(
  ( (tuple2!22229 (_1!11125 (_ BitVec 64)) (_2!11125 V!50965)) )
))
(declare-datatypes ((List!29378 0))(
  ( (Nil!29375) (Cons!29374 (h!30583 tuple2!22228) (t!42942 List!29378)) )
))
(declare-datatypes ((ListLongMap!19885 0))(
  ( (ListLongMap!19886 (toList!9958 List!29378)) )
))
(declare-fun contains!8076 (ListLongMap!19885 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5002 (array!85826 array!85828 (_ BitVec 32) (_ BitVec 32) V!50965 V!50965 (_ BitVec 32) Int) ListLongMap!19885)

(assert (=> b!1292829 (= res!859042 (contains!8076 (getCurrentListMap!5002 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292830 () Bool)

(declare-fun res!859040 () Bool)

(assert (=> b!1292830 (=> (not res!859040) (not e!737870))))

(assert (=> b!1292830 (= res!859040 (and (= (size!41965 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41964 _keys!1741) (size!41965 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292831 () Bool)

(declare-fun e!737873 () Bool)

(declare-fun e!737872 () Bool)

(declare-fun mapRes!53156 () Bool)

(assert (=> b!1292831 (= e!737873 (and e!737872 mapRes!53156))))

(declare-fun condMapEmpty!53156 () Bool)

(declare-fun mapDefault!53156 () ValueCell!16300)

