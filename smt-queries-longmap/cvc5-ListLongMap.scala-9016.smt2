; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108856 () Bool)

(assert start!108856)

(declare-fun b_free!28369 () Bool)

(declare-fun b_next!28369 () Bool)

(assert (=> start!108856 (= b_free!28369 (not b_next!28369))))

(declare-fun tp!100223 () Bool)

(declare-fun b_and!46435 () Bool)

(assert (=> start!108856 (= tp!100223 b_and!46435)))

(declare-fun b!1285559 () Bool)

(declare-fun e!734329 () Bool)

(assert (=> b!1285559 (= e!734329 false)))

(declare-datatypes ((V!50449 0))(
  ( (V!50450 (val!17079 Int)) )
))
(declare-fun minValue!1387 () V!50449)

(declare-fun zeroValue!1387 () V!50449)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576931 () Bool)

(declare-datatypes ((ValueCell!16106 0))(
  ( (ValueCellFull!16106 (v!19681 V!50449)) (EmptyCell!16106) )
))
(declare-datatypes ((array!85072 0))(
  ( (array!85073 (arr!41038 (Array (_ BitVec 32) ValueCell!16106)) (size!41588 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85072)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85074 0))(
  ( (array!85075 (arr!41039 (Array (_ BitVec 32) (_ BitVec 64))) (size!41589 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85074)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21892 0))(
  ( (tuple2!21893 (_1!10957 (_ BitVec 64)) (_2!10957 V!50449)) )
))
(declare-datatypes ((List!29082 0))(
  ( (Nil!29079) (Cons!29078 (h!30287 tuple2!21892) (t!42626 List!29082)) )
))
(declare-datatypes ((ListLongMap!19549 0))(
  ( (ListLongMap!19550 (toList!9790 List!29082)) )
))
(declare-fun contains!7907 (ListLongMap!19549 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4868 (array!85074 array!85072 (_ BitVec 32) (_ BitVec 32) V!50449 V!50449 (_ BitVec 32) Int) ListLongMap!19549)

(assert (=> b!1285559 (= lt!576931 (contains!7907 (getCurrentListMap!4868 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapNonEmpty!52571 () Bool)

(declare-fun mapRes!52571 () Bool)

(declare-fun tp!100222 () Bool)

(declare-fun e!734328 () Bool)

(assert (=> mapNonEmpty!52571 (= mapRes!52571 (and tp!100222 e!734328))))

(declare-fun mapValue!52571 () ValueCell!16106)

(declare-fun mapKey!52571 () (_ BitVec 32))

(declare-fun mapRest!52571 () (Array (_ BitVec 32) ValueCell!16106))

(assert (=> mapNonEmpty!52571 (= (arr!41038 _values!1445) (store mapRest!52571 mapKey!52571 mapValue!52571))))

(declare-fun b!1285560 () Bool)

(declare-fun res!854006 () Bool)

(assert (=> b!1285560 (=> (not res!854006) (not e!734329))))

(assert (=> b!1285560 (= res!854006 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41589 _keys!1741))))))

(declare-fun b!1285561 () Bool)

(declare-fun tp_is_empty!34009 () Bool)

(assert (=> b!1285561 (= e!734328 tp_is_empty!34009)))

(declare-fun b!1285562 () Bool)

(declare-fun e!734327 () Bool)

(assert (=> b!1285562 (= e!734327 tp_is_empty!34009)))

(declare-fun b!1285563 () Bool)

(declare-fun e!734326 () Bool)

(assert (=> b!1285563 (= e!734326 (and e!734327 mapRes!52571))))

(declare-fun condMapEmpty!52571 () Bool)

(declare-fun mapDefault!52571 () ValueCell!16106)

