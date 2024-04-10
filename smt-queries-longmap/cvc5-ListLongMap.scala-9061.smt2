; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109150 () Bool)

(assert start!109150)

(declare-fun b_free!28639 () Bool)

(declare-fun b_next!28639 () Bool)

(assert (=> start!109150 (= b_free!28639 (not b_next!28639))))

(declare-fun tp!101035 () Bool)

(declare-fun b_and!46729 () Bool)

(assert (=> start!109150 (= tp!101035 b_and!46729)))

(declare-fun b!1290785 () Bool)

(declare-fun res!857531 () Bool)

(declare-fun e!736890 () Bool)

(assert (=> b!1290785 (=> (not res!857531) (not e!736890))))

(declare-datatypes ((array!85596 0))(
  ( (array!85597 (arr!41299 (Array (_ BitVec 32) (_ BitVec 64))) (size!41849 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85596)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290785 (= res!857531 (not (validKeyInArray!0 (select (arr!41299 _keys!1741) from!2144))))))

(declare-fun b!1290786 () Bool)

(declare-fun e!736891 () Bool)

(assert (=> b!1290786 (= e!736891 true)))

(assert (=> b!1290786 false))

(declare-datatypes ((V!50809 0))(
  ( (V!50810 (val!17214 Int)) )
))
(declare-fun minValue!1387 () V!50809)

(declare-datatypes ((tuple2!22124 0))(
  ( (tuple2!22125 (_1!11073 (_ BitVec 64)) (_2!11073 V!50809)) )
))
(declare-datatypes ((List!29287 0))(
  ( (Nil!29284) (Cons!29283 (h!30492 tuple2!22124) (t!42851 List!29287)) )
))
(declare-datatypes ((ListLongMap!19781 0))(
  ( (ListLongMap!19782 (toList!9906 List!29287)) )
))
(declare-fun lt!578802 () ListLongMap!19781)

(declare-datatypes ((Unit!42726 0))(
  ( (Unit!42727) )
))
(declare-fun lt!578803 () Unit!42726)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!46 ((_ BitVec 64) (_ BitVec 64) V!50809 ListLongMap!19781) Unit!42726)

(assert (=> b!1290786 (= lt!578803 (lemmaInListMapAfterAddingDiffThenInBefore!46 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578802))))

(declare-fun lt!578804 () ListLongMap!19781)

(declare-fun contains!8024 (ListLongMap!19781 (_ BitVec 64)) Bool)

(declare-fun +!4372 (ListLongMap!19781 tuple2!22124) ListLongMap!19781)

(assert (=> b!1290786 (not (contains!8024 (+!4372 lt!578804 (tuple2!22125 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578800 () Unit!42726)

(declare-fun addStillNotContains!390 (ListLongMap!19781 (_ BitVec 64) V!50809 (_ BitVec 64)) Unit!42726)

(assert (=> b!1290786 (= lt!578800 (addStillNotContains!390 lt!578804 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290786 (not (contains!8024 lt!578802 k!1205))))

(declare-fun zeroValue!1387 () V!50809)

(assert (=> b!1290786 (= lt!578802 (+!4372 lt!578804 (tuple2!22125 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578799 () Unit!42726)

(assert (=> b!1290786 (= lt!578799 (addStillNotContains!390 lt!578804 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16241 0))(
  ( (ValueCellFull!16241 (v!19817 V!50809)) (EmptyCell!16241) )
))
(declare-datatypes ((array!85598 0))(
  ( (array!85599 (arr!41300 (Array (_ BitVec 32) ValueCell!16241)) (size!41850 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85598)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6003 (array!85596 array!85598 (_ BitVec 32) (_ BitVec 32) V!50809 V!50809 (_ BitVec 32) Int) ListLongMap!19781)

(assert (=> b!1290786 (= lt!578804 (getCurrentListMapNoExtraKeys!6003 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290787 () Bool)

(declare-fun res!857533 () Bool)

(assert (=> b!1290787 (=> (not res!857533) (not e!736890))))

(assert (=> b!1290787 (= res!857533 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41849 _keys!1741))))))

(declare-fun b!1290788 () Bool)

(declare-fun e!736888 () Bool)

(declare-fun e!736892 () Bool)

(declare-fun mapRes!52979 () Bool)

(assert (=> b!1290788 (= e!736888 (and e!736892 mapRes!52979))))

(declare-fun condMapEmpty!52979 () Bool)

(declare-fun mapDefault!52979 () ValueCell!16241)

