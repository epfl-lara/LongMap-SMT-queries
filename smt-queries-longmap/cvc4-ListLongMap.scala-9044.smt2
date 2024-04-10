; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109052 () Bool)

(assert start!109052)

(declare-fun b_free!28541 () Bool)

(declare-fun b_next!28541 () Bool)

(assert (=> start!109052 (= b_free!28541 (not b_next!28541))))

(declare-fun tp!100741 () Bool)

(declare-fun b_and!46631 () Bool)

(assert (=> start!109052 (= tp!100741 b_and!46631)))

(declare-fun b!1289021 () Bool)

(declare-fun res!856205 () Bool)

(declare-fun e!736010 () Bool)

(assert (=> b!1289021 (=> (not res!856205) (not e!736010))))

(declare-datatypes ((V!50677 0))(
  ( (V!50678 (val!17165 Int)) )
))
(declare-fun minValue!1387 () V!50677)

(declare-fun zeroValue!1387 () V!50677)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16192 0))(
  ( (ValueCellFull!16192 (v!19768 V!50677)) (EmptyCell!16192) )
))
(declare-datatypes ((array!85406 0))(
  ( (array!85407 (arr!41204 (Array (_ BitVec 32) ValueCell!16192)) (size!41754 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85406)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85408 0))(
  ( (array!85409 (arr!41205 (Array (_ BitVec 32) (_ BitVec 64))) (size!41755 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85408)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22044 0))(
  ( (tuple2!22045 (_1!11033 (_ BitVec 64)) (_2!11033 V!50677)) )
))
(declare-datatypes ((List!29215 0))(
  ( (Nil!29212) (Cons!29211 (h!30420 tuple2!22044) (t!42779 List!29215)) )
))
(declare-datatypes ((ListLongMap!19701 0))(
  ( (ListLongMap!19702 (toList!9866 List!29215)) )
))
(declare-fun contains!7984 (ListLongMap!19701 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4927 (array!85408 array!85406 (_ BitVec 32) (_ BitVec 32) V!50677 V!50677 (_ BitVec 32) Int) ListLongMap!19701)

(assert (=> b!1289021 (= res!856205 (contains!7984 (getCurrentListMap!4927 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1289022 () Bool)

(declare-fun e!736009 () Bool)

(assert (=> b!1289022 (= e!736009 true)))

(declare-fun lt!578138 () ListLongMap!19701)

(declare-fun +!4338 (ListLongMap!19701 tuple2!22044) ListLongMap!19701)

(assert (=> b!1289022 (not (contains!7984 (+!4338 lt!578138 (tuple2!22045 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42650 0))(
  ( (Unit!42651) )
))
(declare-fun lt!578136 () Unit!42650)

(declare-fun addStillNotContains!356 (ListLongMap!19701 (_ BitVec 64) V!50677 (_ BitVec 64)) Unit!42650)

(assert (=> b!1289022 (= lt!578136 (addStillNotContains!356 lt!578138 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5969 (array!85408 array!85406 (_ BitVec 32) (_ BitVec 32) V!50677 V!50677 (_ BitVec 32) Int) ListLongMap!19701)

(assert (=> b!1289022 (= lt!578138 (getCurrentListMapNoExtraKeys!5969 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289023 () Bool)

(declare-fun res!856212 () Bool)

(assert (=> b!1289023 (=> (not res!856212) (not e!736010))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1289023 (= res!856212 (not (validKeyInArray!0 (select (arr!41205 _keys!1741) from!2144))))))

(declare-fun b!1289025 () Bool)

(declare-fun e!736006 () Bool)

(declare-fun tp_is_empty!34181 () Bool)

(assert (=> b!1289025 (= e!736006 tp_is_empty!34181)))

(declare-fun b!1289026 () Bool)

(declare-fun e!736005 () Bool)

(declare-fun e!736007 () Bool)

(declare-fun mapRes!52832 () Bool)

(assert (=> b!1289026 (= e!736005 (and e!736007 mapRes!52832))))

(declare-fun condMapEmpty!52832 () Bool)

(declare-fun mapDefault!52832 () ValueCell!16192)

