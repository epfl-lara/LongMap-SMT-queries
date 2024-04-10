; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109214 () Bool)

(assert start!109214)

(declare-fun b_free!28703 () Bool)

(declare-fun b_next!28703 () Bool)

(assert (=> start!109214 (= b_free!28703 (not b_next!28703))))

(declare-fun tp!101227 () Bool)

(declare-fun b_and!46793 () Bool)

(assert (=> start!109214 (= tp!101227 b_and!46793)))

(declare-fun mapIsEmpty!53075 () Bool)

(declare-fun mapRes!53075 () Bool)

(assert (=> mapIsEmpty!53075 mapRes!53075))

(declare-fun b!1291920 () Bool)

(declare-fun e!737449 () Bool)

(declare-fun tp_is_empty!34343 () Bool)

(assert (=> b!1291920 (= e!737449 tp_is_empty!34343)))

(declare-fun b!1291921 () Bool)

(declare-fun res!858378 () Bool)

(declare-fun e!737448 () Bool)

(assert (=> b!1291921 (=> (not res!858378) (not e!737448))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85722 0))(
  ( (array!85723 (arr!41362 (Array (_ BitVec 32) (_ BitVec 64))) (size!41912 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85722)

(assert (=> b!1291921 (= res!858378 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41912 _keys!1741))))))

(declare-fun b!1291922 () Bool)

(declare-fun res!858374 () Bool)

(assert (=> b!1291922 (=> (not res!858374) (not e!737448))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50893 0))(
  ( (V!50894 (val!17246 Int)) )
))
(declare-datatypes ((ValueCell!16273 0))(
  ( (ValueCellFull!16273 (v!19849 V!50893)) (EmptyCell!16273) )
))
(declare-datatypes ((array!85724 0))(
  ( (array!85725 (arr!41363 (Array (_ BitVec 32) ValueCell!16273)) (size!41913 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85724)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291922 (= res!858374 (and (= (size!41913 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41912 _keys!1741) (size!41913 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291923 () Bool)

(declare-fun res!858381 () Bool)

(assert (=> b!1291923 (=> (not res!858381) (not e!737448))))

(assert (=> b!1291923 (= res!858381 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41912 _keys!1741))))))

(declare-fun res!858380 () Bool)

(assert (=> start!109214 (=> (not res!858380) (not e!737448))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109214 (= res!858380 (validMask!0 mask!2175))))

(assert (=> start!109214 e!737448))

(assert (=> start!109214 tp_is_empty!34343))

(assert (=> start!109214 true))

(declare-fun e!737450 () Bool)

(declare-fun array_inv!31341 (array!85724) Bool)

(assert (=> start!109214 (and (array_inv!31341 _values!1445) e!737450)))

(declare-fun array_inv!31342 (array!85722) Bool)

(assert (=> start!109214 (array_inv!31342 _keys!1741)))

(assert (=> start!109214 tp!101227))

(declare-fun b!1291924 () Bool)

(declare-fun res!858375 () Bool)

(assert (=> b!1291924 (=> (not res!858375) (not e!737448))))

(declare-datatypes ((List!29336 0))(
  ( (Nil!29333) (Cons!29332 (h!30541 (_ BitVec 64)) (t!42900 List!29336)) )
))
(declare-fun arrayNoDuplicates!0 (array!85722 (_ BitVec 32) List!29336) Bool)

(assert (=> b!1291924 (= res!858375 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29333))))

(declare-fun b!1291925 () Bool)

(declare-fun res!858377 () Bool)

(assert (=> b!1291925 (=> (not res!858377) (not e!737448))))

(declare-fun minValue!1387 () V!50893)

(declare-fun zeroValue!1387 () V!50893)

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22182 0))(
  ( (tuple2!22183 (_1!11102 (_ BitVec 64)) (_2!11102 V!50893)) )
))
(declare-datatypes ((List!29337 0))(
  ( (Nil!29334) (Cons!29333 (h!30542 tuple2!22182) (t!42901 List!29337)) )
))
(declare-datatypes ((ListLongMap!19839 0))(
  ( (ListLongMap!19840 (toList!9935 List!29337)) )
))
(declare-fun contains!8053 (ListLongMap!19839 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4983 (array!85722 array!85724 (_ BitVec 32) (_ BitVec 32) V!50893 V!50893 (_ BitVec 32) Int) ListLongMap!19839)

(assert (=> b!1291925 (= res!858377 (contains!8053 (getCurrentListMap!4983 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291926 () Bool)

(declare-fun res!858379 () Bool)

(assert (=> b!1291926 (=> (not res!858379) (not e!737448))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85722 (_ BitVec 32)) Bool)

(assert (=> b!1291926 (= res!858379 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1291927 () Bool)

(declare-fun res!858376 () Bool)

(assert (=> b!1291927 (=> (not res!858376) (not e!737448))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291927 (= res!858376 (not (validKeyInArray!0 (select (arr!41362 _keys!1741) from!2144))))))

(declare-fun b!1291928 () Bool)

(assert (=> b!1291928 (= e!737448 (not true))))

(assert (=> b!1291928 (not (contains!8053 (ListLongMap!19840 Nil!29334) k!1205))))

(declare-datatypes ((Unit!42780 0))(
  ( (Unit!42781) )
))
(declare-fun lt!579290 () Unit!42780)

(declare-fun emptyContainsNothing!112 ((_ BitVec 64)) Unit!42780)

(assert (=> b!1291928 (= lt!579290 (emptyContainsNothing!112 k!1205))))

(declare-fun mapNonEmpty!53075 () Bool)

(declare-fun tp!101228 () Bool)

(assert (=> mapNonEmpty!53075 (= mapRes!53075 (and tp!101228 e!737449))))

(declare-fun mapKey!53075 () (_ BitVec 32))

(declare-fun mapRest!53075 () (Array (_ BitVec 32) ValueCell!16273))

(declare-fun mapValue!53075 () ValueCell!16273)

(assert (=> mapNonEmpty!53075 (= (arr!41363 _values!1445) (store mapRest!53075 mapKey!53075 mapValue!53075))))

(declare-fun b!1291929 () Bool)

(declare-fun e!737447 () Bool)

(assert (=> b!1291929 (= e!737447 tp_is_empty!34343)))

(declare-fun b!1291930 () Bool)

(assert (=> b!1291930 (= e!737450 (and e!737447 mapRes!53075))))

(declare-fun condMapEmpty!53075 () Bool)

(declare-fun mapDefault!53075 () ValueCell!16273)

