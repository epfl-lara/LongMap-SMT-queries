; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109312 () Bool)

(assert start!109312)

(declare-fun b_free!28801 () Bool)

(declare-fun b_next!28801 () Bool)

(assert (=> start!109312 (= b_free!28801 (not b_next!28801))))

(declare-fun tp!101522 () Bool)

(declare-fun b_and!46891 () Bool)

(assert (=> start!109312 (= tp!101522 b_and!46891)))

(declare-fun b!1293620 () Bool)

(declare-fun res!859634 () Bool)

(declare-fun e!738267 () Bool)

(assert (=> b!1293620 (=> (not res!859634) (not e!738267))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85910 0))(
  ( (array!85911 (arr!41456 (Array (_ BitVec 32) (_ BitVec 64))) (size!42006 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85910)

(assert (=> b!1293620 (= res!859634 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42006 _keys!1741))))))

(declare-fun b!1293621 () Bool)

(declare-fun res!859635 () Bool)

(assert (=> b!1293621 (=> (not res!859635) (not e!738267))))

(declare-datatypes ((V!51025 0))(
  ( (V!51026 (val!17295 Int)) )
))
(declare-fun minValue!1387 () V!51025)

(declare-fun zeroValue!1387 () V!51025)

(declare-datatypes ((ValueCell!16322 0))(
  ( (ValueCellFull!16322 (v!19898 V!51025)) (EmptyCell!16322) )
))
(declare-datatypes ((array!85912 0))(
  ( (array!85913 (arr!41457 (Array (_ BitVec 32) ValueCell!16322)) (size!42007 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85912)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22260 0))(
  ( (tuple2!22261 (_1!11141 (_ BitVec 64)) (_2!11141 V!51025)) )
))
(declare-datatypes ((List!29408 0))(
  ( (Nil!29405) (Cons!29404 (h!30613 tuple2!22260) (t!42972 List!29408)) )
))
(declare-datatypes ((ListLongMap!19917 0))(
  ( (ListLongMap!19918 (toList!9974 List!29408)) )
))
(declare-fun contains!8092 (ListLongMap!19917 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5015 (array!85910 array!85912 (_ BitVec 32) (_ BitVec 32) V!51025 V!51025 (_ BitVec 32) Int) ListLongMap!19917)

(assert (=> b!1293621 (= res!859635 (contains!8092 (getCurrentListMap!5015 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1293622 () Bool)

(declare-fun e!738265 () Bool)

(declare-fun e!738268 () Bool)

(declare-fun mapRes!53222 () Bool)

(assert (=> b!1293622 (= e!738265 (and e!738268 mapRes!53222))))

(declare-fun condMapEmpty!53222 () Bool)

(declare-fun mapDefault!53222 () ValueCell!16322)

