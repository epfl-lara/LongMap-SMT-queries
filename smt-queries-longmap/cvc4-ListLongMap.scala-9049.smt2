; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109082 () Bool)

(assert start!109082)

(declare-fun b_free!28571 () Bool)

(declare-fun b_next!28571 () Bool)

(assert (=> start!109082 (= b_free!28571 (not b_next!28571))))

(declare-fun tp!100831 () Bool)

(declare-fun b_and!46661 () Bool)

(assert (=> start!109082 (= tp!100831 b_and!46661)))

(declare-fun b!1289561 () Bool)

(declare-fun res!856615 () Bool)

(declare-fun e!736276 () Bool)

(assert (=> b!1289561 (=> (not res!856615) (not e!736276))))

(declare-datatypes ((array!85464 0))(
  ( (array!85465 (arr!41233 (Array (_ BitVec 32) (_ BitVec 64))) (size!41783 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85464)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85464 (_ BitVec 32)) Bool)

(assert (=> b!1289561 (= res!856615 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1289562 () Bool)

(declare-fun res!856611 () Bool)

(assert (=> b!1289562 (=> (not res!856611) (not e!736276))))

(declare-datatypes ((List!29236 0))(
  ( (Nil!29233) (Cons!29232 (h!30441 (_ BitVec 64)) (t!42800 List!29236)) )
))
(declare-fun arrayNoDuplicates!0 (array!85464 (_ BitVec 32) List!29236) Bool)

(assert (=> b!1289562 (= res!856611 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29233))))

(declare-fun b!1289563 () Bool)

(declare-fun e!736275 () Bool)

(declare-fun tp_is_empty!34211 () Bool)

(assert (=> b!1289563 (= e!736275 tp_is_empty!34211)))

(declare-fun b!1289564 () Bool)

(declare-fun e!736277 () Bool)

(assert (=> b!1289564 (= e!736276 (not e!736277))))

(declare-fun res!856613 () Bool)

(assert (=> b!1289564 (=> res!856613 e!736277)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1289564 (= res!856613 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50717 0))(
  ( (V!50718 (val!17180 Int)) )
))
(declare-datatypes ((tuple2!22068 0))(
  ( (tuple2!22069 (_1!11045 (_ BitVec 64)) (_2!11045 V!50717)) )
))
(declare-datatypes ((List!29237 0))(
  ( (Nil!29234) (Cons!29233 (h!30442 tuple2!22068) (t!42801 List!29237)) )
))
(declare-datatypes ((ListLongMap!19725 0))(
  ( (ListLongMap!19726 (toList!9878 List!29237)) )
))
(declare-fun contains!7996 (ListLongMap!19725 (_ BitVec 64)) Bool)

(assert (=> b!1289564 (not (contains!7996 (ListLongMap!19726 Nil!29234) k!1205))))

(declare-datatypes ((Unit!42674 0))(
  ( (Unit!42675) )
))
(declare-fun lt!578297 () Unit!42674)

(declare-fun emptyContainsNothing!65 ((_ BitVec 64)) Unit!42674)

(assert (=> b!1289564 (= lt!578297 (emptyContainsNothing!65 k!1205))))

(declare-fun b!1289565 () Bool)

(assert (=> b!1289565 (= e!736277 true)))

(declare-fun lt!578298 () ListLongMap!19725)

(declare-fun minValue!1387 () V!50717)

(declare-fun +!4350 (ListLongMap!19725 tuple2!22068) ListLongMap!19725)

(assert (=> b!1289565 (not (contains!7996 (+!4350 lt!578298 (tuple2!22069 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!578299 () Unit!42674)

(declare-fun addStillNotContains!368 (ListLongMap!19725 (_ BitVec 64) V!50717 (_ BitVec 64)) Unit!42674)

(assert (=> b!1289565 (= lt!578299 (addStillNotContains!368 lt!578298 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!50717)

(assert (=> b!1289565 (not (contains!7996 (+!4350 lt!578298 (tuple2!22069 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578300 () Unit!42674)

(assert (=> b!1289565 (= lt!578300 (addStillNotContains!368 lt!578298 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16207 0))(
  ( (ValueCellFull!16207 (v!19783 V!50717)) (EmptyCell!16207) )
))
(declare-datatypes ((array!85466 0))(
  ( (array!85467 (arr!41234 (Array (_ BitVec 32) ValueCell!16207)) (size!41784 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85466)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5981 (array!85464 array!85466 (_ BitVec 32) (_ BitVec 32) V!50717 V!50717 (_ BitVec 32) Int) ListLongMap!19725)

(assert (=> b!1289565 (= lt!578298 (getCurrentListMapNoExtraKeys!5981 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1289566 () Bool)

(declare-fun res!856617 () Bool)

(assert (=> b!1289566 (=> (not res!856617) (not e!736276))))

(declare-fun getCurrentListMap!4938 (array!85464 array!85466 (_ BitVec 32) (_ BitVec 32) V!50717 V!50717 (_ BitVec 32) Int) ListLongMap!19725)

(assert (=> b!1289566 (= res!856617 (contains!7996 (getCurrentListMap!4938 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!856616 () Bool)

(assert (=> start!109082 (=> (not res!856616) (not e!736276))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109082 (= res!856616 (validMask!0 mask!2175))))

(assert (=> start!109082 e!736276))

(assert (=> start!109082 tp_is_empty!34211))

(assert (=> start!109082 true))

(declare-fun e!736280 () Bool)

(declare-fun array_inv!31255 (array!85466) Bool)

(assert (=> start!109082 (and (array_inv!31255 _values!1445) e!736280)))

(declare-fun array_inv!31256 (array!85464) Bool)

(assert (=> start!109082 (array_inv!31256 _keys!1741)))

(assert (=> start!109082 tp!100831))

(declare-fun b!1289567 () Bool)

(declare-fun mapRes!52877 () Bool)

(assert (=> b!1289567 (= e!736280 (and e!736275 mapRes!52877))))

(declare-fun condMapEmpty!52877 () Bool)

(declare-fun mapDefault!52877 () ValueCell!16207)

