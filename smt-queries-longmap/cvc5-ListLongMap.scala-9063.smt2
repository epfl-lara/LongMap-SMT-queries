; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109162 () Bool)

(assert start!109162)

(declare-fun b_free!28651 () Bool)

(declare-fun b_next!28651 () Bool)

(assert (=> start!109162 (= b_free!28651 (not b_next!28651))))

(declare-fun tp!101072 () Bool)

(declare-fun b_and!46741 () Bool)

(assert (=> start!109162 (= tp!101072 b_and!46741)))

(declare-fun b!1291001 () Bool)

(declare-fun res!857692 () Bool)

(declare-fun e!737000 () Bool)

(assert (=> b!1291001 (=> (not res!857692) (not e!737000))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85618 0))(
  ( (array!85619 (arr!41310 (Array (_ BitVec 32) (_ BitVec 64))) (size!41860 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85618)

(assert (=> b!1291001 (= res!857692 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41860 _keys!1741))))))

(declare-fun mapIsEmpty!52997 () Bool)

(declare-fun mapRes!52997 () Bool)

(assert (=> mapIsEmpty!52997 mapRes!52997))

(declare-fun b!1291002 () Bool)

(declare-fun e!736996 () Bool)

(assert (=> b!1291002 (= e!736996 true)))

(assert (=> b!1291002 false))

(declare-datatypes ((V!50825 0))(
  ( (V!50826 (val!17220 Int)) )
))
(declare-fun minValue!1387 () V!50825)

(declare-datatypes ((tuple2!22134 0))(
  ( (tuple2!22135 (_1!11078 (_ BitVec 64)) (_2!11078 V!50825)) )
))
(declare-datatypes ((List!29296 0))(
  ( (Nil!29293) (Cons!29292 (h!30501 tuple2!22134) (t!42860 List!29296)) )
))
(declare-datatypes ((ListLongMap!19791 0))(
  ( (ListLongMap!19792 (toList!9911 List!29296)) )
))
(declare-fun lt!578911 () ListLongMap!19791)

(declare-datatypes ((Unit!42736 0))(
  ( (Unit!42737) )
))
(declare-fun lt!578909 () Unit!42736)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!51 ((_ BitVec 64) (_ BitVec 64) V!50825 ListLongMap!19791) Unit!42736)

(assert (=> b!1291002 (= lt!578909 (lemmaInListMapAfterAddingDiffThenInBefore!51 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!578911))))

(declare-fun lt!578910 () ListLongMap!19791)

(declare-fun contains!8029 (ListLongMap!19791 (_ BitVec 64)) Bool)

(declare-fun +!4377 (ListLongMap!19791 tuple2!22134) ListLongMap!19791)

(assert (=> b!1291002 (not (contains!8029 (+!4377 lt!578910 (tuple2!22135 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578908 () Unit!42736)

(declare-fun addStillNotContains!395 (ListLongMap!19791 (_ BitVec 64) V!50825 (_ BitVec 64)) Unit!42736)

(assert (=> b!1291002 (= lt!578908 (addStillNotContains!395 lt!578910 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291002 (not (contains!8029 lt!578911 k!1205))))

(declare-fun zeroValue!1387 () V!50825)

(assert (=> b!1291002 (= lt!578911 (+!4377 lt!578910 (tuple2!22135 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578912 () Unit!42736)

(assert (=> b!1291002 (= lt!578912 (addStillNotContains!395 lt!578910 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-datatypes ((ValueCell!16247 0))(
  ( (ValueCellFull!16247 (v!19823 V!50825)) (EmptyCell!16247) )
))
(declare-datatypes ((array!85620 0))(
  ( (array!85621 (arr!41311 (Array (_ BitVec 32) ValueCell!16247)) (size!41861 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85620)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6008 (array!85618 array!85620 (_ BitVec 32) (_ BitVec 32) V!50825 V!50825 (_ BitVec 32) Int) ListLongMap!19791)

(assert (=> b!1291002 (= lt!578910 (getCurrentListMapNoExtraKeys!6008 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291003 () Bool)

(declare-fun e!736999 () Bool)

(declare-fun tp_is_empty!34291 () Bool)

(assert (=> b!1291003 (= e!736999 tp_is_empty!34291)))

(declare-fun b!1291004 () Bool)

(declare-fun res!857689 () Bool)

(assert (=> b!1291004 (=> (not res!857689) (not e!737000))))

(declare-fun getCurrentListMap!4964 (array!85618 array!85620 (_ BitVec 32) (_ BitVec 32) V!50825 V!50825 (_ BitVec 32) Int) ListLongMap!19791)

(assert (=> b!1291004 (= res!857689 (contains!8029 (getCurrentListMap!4964 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291005 () Bool)

(declare-fun res!857694 () Bool)

(assert (=> b!1291005 (=> (not res!857694) (not e!737000))))

(assert (=> b!1291005 (= res!857694 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41860 _keys!1741))))))

(declare-fun b!1291006 () Bool)

(declare-fun e!736995 () Bool)

(declare-fun e!736997 () Bool)

(assert (=> b!1291006 (= e!736995 (and e!736997 mapRes!52997))))

(declare-fun condMapEmpty!52997 () Bool)

(declare-fun mapDefault!52997 () ValueCell!16247)

