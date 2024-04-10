; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108746 () Bool)

(assert start!108746)

(declare-fun b_free!28259 () Bool)

(declare-fun b_next!28259 () Bool)

(assert (=> start!108746 (= b_free!28259 (not b_next!28259))))

(declare-fun tp!99892 () Bool)

(declare-fun b_and!46325 () Bool)

(assert (=> start!108746 (= tp!99892 b_and!46325)))

(declare-fun b!1284100 () Bool)

(declare-fun e!733503 () Bool)

(declare-fun tp_is_empty!33899 () Bool)

(assert (=> b!1284100 (= e!733503 tp_is_empty!33899)))

(declare-fun mapIsEmpty!52406 () Bool)

(declare-fun mapRes!52406 () Bool)

(assert (=> mapIsEmpty!52406 mapRes!52406))

(declare-fun b!1284101 () Bool)

(declare-fun e!733502 () Bool)

(assert (=> b!1284101 (= e!733502 (not true))))

(declare-datatypes ((V!50301 0))(
  ( (V!50302 (val!17024 Int)) )
))
(declare-datatypes ((tuple2!21806 0))(
  ( (tuple2!21807 (_1!10914 (_ BitVec 64)) (_2!10914 V!50301)) )
))
(declare-datatypes ((List!29000 0))(
  ( (Nil!28997) (Cons!28996 (h!30205 tuple2!21806) (t!42544 List!29000)) )
))
(declare-datatypes ((ListLongMap!19463 0))(
  ( (ListLongMap!19464 (toList!9747 List!29000)) )
))
(declare-fun lt!576766 () ListLongMap!19463)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!7864 (ListLongMap!19463 (_ BitVec 64)) Bool)

(assert (=> b!1284101 (contains!7864 lt!576766 k!1205)))

(declare-fun minValue!1387 () V!50301)

(declare-datatypes ((Unit!42501 0))(
  ( (Unit!42502) )
))
(declare-fun lt!576765 () Unit!42501)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!21 ((_ BitVec 64) (_ BitVec 64) V!50301 ListLongMap!19463) Unit!42501)

(assert (=> b!1284101 (= lt!576765 (lemmaInListMapAfterAddingDiffThenInBefore!21 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!576766))))

(declare-fun zeroValue!1387 () V!50301)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16051 0))(
  ( (ValueCellFull!16051 (v!19626 V!50301)) (EmptyCell!16051) )
))
(declare-datatypes ((array!84856 0))(
  ( (array!84857 (arr!40930 (Array (_ BitVec 32) ValueCell!16051)) (size!41480 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!84856)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!84858 0))(
  ( (array!84859 (arr!40931 (Array (_ BitVec 32) (_ BitVec 64))) (size!41481 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!84858)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun +!4297 (ListLongMap!19463 tuple2!21806) ListLongMap!19463)

(declare-fun getCurrentListMapNoExtraKeys!5927 (array!84858 array!84856 (_ BitVec 32) (_ BitVec 32) V!50301 V!50301 (_ BitVec 32) Int) ListLongMap!19463)

(assert (=> b!1284101 (= lt!576766 (+!4297 (getCurrentListMapNoExtraKeys!5927 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) (tuple2!21807 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun b!1284102 () Bool)

(declare-fun res!853045 () Bool)

(assert (=> b!1284102 (=> (not res!853045) (not e!733502))))

(assert (=> b!1284102 (= res!853045 (and (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000))))))

(declare-fun b!1284103 () Bool)

(declare-fun res!853046 () Bool)

(assert (=> b!1284103 (=> (not res!853046) (not e!733502))))

(assert (=> b!1284103 (= res!853046 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41481 _keys!1741))))))

(declare-fun b!1284104 () Bool)

(declare-fun res!853047 () Bool)

(assert (=> b!1284104 (=> (not res!853047) (not e!733502))))

(declare-fun getCurrentListMap!4826 (array!84858 array!84856 (_ BitVec 32) (_ BitVec 32) V!50301 V!50301 (_ BitVec 32) Int) ListLongMap!19463)

(assert (=> b!1284104 (= res!853047 (contains!7864 (getCurrentListMap!4826 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1284105 () Bool)

(declare-fun res!853042 () Bool)

(assert (=> b!1284105 (=> (not res!853042) (not e!733502))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1284105 (= res!853042 (validKeyInArray!0 (select (arr!40931 _keys!1741) from!2144)))))

(declare-fun b!1284106 () Bool)

(declare-fun e!733504 () Bool)

(assert (=> b!1284106 (= e!733504 tp_is_empty!33899)))

(declare-fun b!1284107 () Bool)

(declare-fun res!853050 () Bool)

(assert (=> b!1284107 (=> (not res!853050) (not e!733502))))

(declare-datatypes ((List!29001 0))(
  ( (Nil!28998) (Cons!28997 (h!30206 (_ BitVec 64)) (t!42545 List!29001)) )
))
(declare-fun arrayNoDuplicates!0 (array!84858 (_ BitVec 32) List!29001) Bool)

(assert (=> b!1284107 (= res!853050 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!28998))))

(declare-fun res!853043 () Bool)

(assert (=> start!108746 (=> (not res!853043) (not e!733502))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!108746 (= res!853043 (validMask!0 mask!2175))))

(assert (=> start!108746 e!733502))

(assert (=> start!108746 tp_is_empty!33899))

(assert (=> start!108746 true))

(declare-fun e!733505 () Bool)

(declare-fun array_inv!31043 (array!84856) Bool)

(assert (=> start!108746 (and (array_inv!31043 _values!1445) e!733505)))

(declare-fun array_inv!31044 (array!84858) Bool)

(assert (=> start!108746 (array_inv!31044 _keys!1741)))

(assert (=> start!108746 tp!99892))

(declare-fun b!1284108 () Bool)

(assert (=> b!1284108 (= e!733505 (and e!733504 mapRes!52406))))

(declare-fun condMapEmpty!52406 () Bool)

(declare-fun mapDefault!52406 () ValueCell!16051)

