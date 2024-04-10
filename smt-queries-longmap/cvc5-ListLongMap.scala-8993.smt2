; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108718 () Bool)

(assert start!108718)

(declare-fun b_free!28231 () Bool)

(declare-fun b_next!28231 () Bool)

(assert (=> start!108718 (= b_free!28231 (not b_next!28231))))

(declare-fun tp!99808 () Bool)

(declare-fun b_and!46297 () Bool)

(assert (=> start!108718 (= tp!99808 b_and!46297)))

(declare-fun b!1283596 () Bool)

(declare-fun res!852669 () Bool)

(declare-fun e!733293 () Bool)

(assert (=> b!1283596 (=> (not res!852669) (not e!733293))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!50265 0))(
  ( (V!50266 (val!17010 Int)) )
))
(declare-datatypes ((ValueCell!16037 0))(
  ( (ValueCellFull!16037 (v!19612 V!50265)) (EmptyCell!16037) )
))
(declare-datatypes ((array!84804 0))(
  ( (array!84805 (arr!40904 (Array (_ BitVec 32) ValueCell!16037)) (size!41454 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84804)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84806 0))(
  ( (array!84807 (arr!40905 (Array (_ BitVec 32) (_ BitVec 64))) (size!41455 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84806)

(assert (=> b!1283596 (= res!852669 (and (= (size!41454 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41455 _keys!1741) (size!41454 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1283597 () Bool)

(assert (=> b!1283597 (= e!733293 (not true))))

(declare-datatypes ((tuple2!21784 0))(
  ( (tuple2!21785 (_1!10903 (_ BitVec 64)) (_2!10903 V!50265)) )
))
(declare-datatypes ((List!28981 0))(
  ( (Nil!28978) (Cons!28977 (h!30186 tuple2!21784) (t!42525 List!28981)) )
))
(declare-datatypes ((ListLongMap!19441 0))(
  ( (ListLongMap!19442 (toList!9736 List!28981)) )
))
(declare-fun lt!576682 () ListLongMap!19441)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7853 (ListLongMap!19441 (_ BitVec 64)) Bool)

(assert (=> b!1283597 (contains!7853 lt!576682 k!1205)))

(declare-fun minValue!1387 () V!50265)

(declare-datatypes ((Unit!42481 0))(
  ( (Unit!42482) )
))
(declare-fun lt!576681 () Unit!42481)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!11 ((_ BitVec 64) (_ BitVec 64) V!50265 ListLongMap!19441) Unit!42481)

(assert (=> b!1283597 (= lt!576681 (lemmaInListMapAfterAddingDiffThenInBefore!11 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576682))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun zeroValue!1387 () V!50265)

(declare-fun defaultEntry!1448 () Int)

(declare-fun +!4287 (ListLongMap!19441 tuple2!21784) ListLongMap!19441)

(declare-fun getCurrentListMapNoExtraKeys!5917 (array!84806 array!84804 (_ BitVec 32) (_ BitVec 32) V!50265 V!50265 (_ BitVec 32) Int) ListLongMap!19441)

(assert (=> b!1283597 (= lt!576682 (+!4287 (getCurrentListMapNoExtraKeys!5917 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21785 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun mapIsEmpty!52364 () Bool)

(declare-fun mapRes!52364 () Bool)

(assert (=> mapIsEmpty!52364 mapRes!52364))

(declare-fun b!1283599 () Bool)

(declare-fun res!852665 () Bool)

(assert (=> b!1283599 (=> (not res!852665) (not e!733293))))

(assert (=> b!1283599 (= res!852665 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41455 _keys!1741))))))

(declare-fun b!1283600 () Bool)

(declare-fun res!852670 () Bool)

(assert (=> b!1283600 (=> (not res!852670) (not e!733293))))

(assert (=> b!1283600 (= res!852670 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41455 _keys!1741))))))

(declare-fun b!1283601 () Bool)

(declare-fun res!852672 () Bool)

(assert (=> b!1283601 (=> (not res!852672) (not e!733293))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1283601 (= res!852672 (validKeyInArray!0 (select (arr!40905 _keys!1741) from!2144)))))

(declare-fun b!1283602 () Bool)

(declare-fun e!733294 () Bool)

(declare-fun e!733295 () Bool)

(assert (=> b!1283602 (= e!733294 (and e!733295 mapRes!52364))))

(declare-fun condMapEmpty!52364 () Bool)

(declare-fun mapDefault!52364 () ValueCell!16037)

