; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109480 () Bool)

(assert start!109480)

(declare-fun b_free!28969 () Bool)

(declare-fun b_next!28969 () Bool)

(assert (=> start!109480 (= b_free!28969 (not b_next!28969))))

(declare-fun tp!102026 () Bool)

(declare-fun b_and!47059 () Bool)

(assert (=> start!109480 (= tp!102026 b_and!47059)))

(declare-fun b!1296654 () Bool)

(declare-fun res!861753 () Bool)

(declare-fun e!739740 () Bool)

(assert (=> b!1296654 (=> (not res!861753) (not e!739740))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86236 0))(
  ( (array!86237 (arr!41619 (Array (_ BitVec 32) (_ BitVec 64))) (size!42169 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86236)

(assert (=> b!1296654 (= res!861753 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42169 _keys!1741))))))

(declare-fun b!1296655 () Bool)

(assert (=> b!1296655 (= e!739740 false)))

(declare-datatypes ((V!51249 0))(
  ( (V!51250 (val!17379 Int)) )
))
(declare-fun minValue!1387 () V!51249)

(declare-fun zeroValue!1387 () V!51249)

(declare-datatypes ((ValueCell!16406 0))(
  ( (ValueCellFull!16406 (v!19982 V!51249)) (EmptyCell!16406) )
))
(declare-datatypes ((array!86238 0))(
  ( (array!86239 (arr!41620 (Array (_ BitVec 32) ValueCell!16406)) (size!42170 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86238)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun lt!580508 () Bool)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22390 0))(
  ( (tuple2!22391 (_1!11206 (_ BitVec 64)) (_2!11206 V!51249)) )
))
(declare-datatypes ((List!29528 0))(
  ( (Nil!29525) (Cons!29524 (h!30733 tuple2!22390) (t!43092 List!29528)) )
))
(declare-datatypes ((ListLongMap!20047 0))(
  ( (ListLongMap!20048 (toList!10039 List!29528)) )
))
(declare-fun contains!8157 (ListLongMap!20047 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5068 (array!86236 array!86238 (_ BitVec 32) (_ BitVec 32) V!51249 V!51249 (_ BitVec 32) Int) ListLongMap!20047)

(assert (=> b!1296655 (= lt!580508 (contains!8157 (getCurrentListMap!5068 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1296656 () Bool)

(declare-fun e!739738 () Bool)

(declare-fun e!739741 () Bool)

(declare-fun mapRes!53474 () Bool)

(assert (=> b!1296656 (= e!739738 (and e!739741 mapRes!53474))))

(declare-fun condMapEmpty!53474 () Bool)

(declare-fun mapDefault!53474 () ValueCell!16406)

