; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!108836 () Bool)

(assert start!108836)

(declare-fun b_free!28349 () Bool)

(declare-fun b_next!28349 () Bool)

(assert (=> start!108836 (= b_free!28349 (not b_next!28349))))

(declare-fun tp!100163 () Bool)

(declare-fun b_and!46415 () Bool)

(assert (=> start!108836 (= tp!100163 b_and!46415)))

(declare-fun b!1285319 () Bool)

(declare-fun e!734176 () Bool)

(assert (=> b!1285319 (= e!734176 false)))

(declare-datatypes ((V!50421 0))(
  ( (V!50422 (val!17069 Int)) )
))
(declare-fun minValue!1387 () V!50421)

(declare-fun zeroValue!1387 () V!50421)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!576901 () Bool)

(declare-datatypes ((ValueCell!16096 0))(
  ( (ValueCellFull!16096 (v!19671 V!50421)) (EmptyCell!16096) )
))
(declare-datatypes ((array!85036 0))(
  ( (array!85037 (arr!41020 (Array (_ BitVec 32) ValueCell!16096)) (size!41570 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85036)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85038 0))(
  ( (array!85039 (arr!41021 (Array (_ BitVec 32) (_ BitVec 64))) (size!41571 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85038)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21880 0))(
  ( (tuple2!21881 (_1!10951 (_ BitVec 64)) (_2!10951 V!50421)) )
))
(declare-datatypes ((List!29071 0))(
  ( (Nil!29068) (Cons!29067 (h!30276 tuple2!21880) (t!42615 List!29071)) )
))
(declare-datatypes ((ListLongMap!19537 0))(
  ( (ListLongMap!19538 (toList!9784 List!29071)) )
))
(declare-fun contains!7901 (ListLongMap!19537 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4862 (array!85038 array!85036 (_ BitVec 32) (_ BitVec 32) V!50421 V!50421 (_ BitVec 32) Int) ListLongMap!19537)

(assert (=> b!1285319 (= lt!576901 (contains!7901 (getCurrentListMap!4862 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1285320 () Bool)

(declare-fun e!734180 () Bool)

(declare-fun e!734178 () Bool)

(declare-fun mapRes!52541 () Bool)

(assert (=> b!1285320 (= e!734180 (and e!734178 mapRes!52541))))

(declare-fun condMapEmpty!52541 () Bool)

(declare-fun mapDefault!52541 () ValueCell!16096)

