; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109304 () Bool)

(assert start!109304)

(declare-fun b_free!28793 () Bool)

(declare-fun b_next!28793 () Bool)

(assert (=> start!109304 (= b_free!28793 (not b_next!28793))))

(declare-fun tp!101497 () Bool)

(declare-fun b_and!46883 () Bool)

(assert (=> start!109304 (= tp!101497 b_and!46883)))

(declare-fun b!1293476 () Bool)

(declare-fun e!738197 () Bool)

(declare-fun tp_is_empty!34433 () Bool)

(assert (=> b!1293476 (= e!738197 tp_is_empty!34433)))

(declare-fun b!1293477 () Bool)

(declare-fun res!859527 () Bool)

(declare-fun e!738194 () Bool)

(assert (=> b!1293477 (=> (not res!859527) (not e!738194))))

(declare-datatypes ((V!51013 0))(
  ( (V!51014 (val!17291 Int)) )
))
(declare-fun minValue!1387 () V!51013)

(declare-fun zeroValue!1387 () V!51013)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16318 0))(
  ( (ValueCellFull!16318 (v!19894 V!51013)) (EmptyCell!16318) )
))
(declare-datatypes ((array!85894 0))(
  ( (array!85895 (arr!41448 (Array (_ BitVec 32) ValueCell!16318)) (size!41998 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85894)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85896 0))(
  ( (array!85897 (arr!41449 (Array (_ BitVec 32) (_ BitVec 64))) (size!41999 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85896)

(declare-datatypes ((tuple2!22254 0))(
  ( (tuple2!22255 (_1!11138 (_ BitVec 64)) (_2!11138 V!51013)) )
))
(declare-datatypes ((List!29402 0))(
  ( (Nil!29399) (Cons!29398 (h!30607 tuple2!22254) (t!42966 List!29402)) )
))
(declare-datatypes ((ListLongMap!19911 0))(
  ( (ListLongMap!19912 (toList!9971 List!29402)) )
))
(declare-fun contains!8089 (ListLongMap!19911 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5013 (array!85896 array!85894 (_ BitVec 32) (_ BitVec 32) V!51013 V!51013 (_ BitVec 32) Int) ListLongMap!19911)

(assert (=> b!1293477 (= res!859527 (contains!8089 (getCurrentListMap!5013 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53210 () Bool)

(declare-fun mapRes!53210 () Bool)

(assert (=> mapIsEmpty!53210 mapRes!53210))

(declare-fun b!1293478 () Bool)

(declare-fun e!738193 () Bool)

(assert (=> b!1293478 (= e!738193 (and e!738197 mapRes!53210))))

(declare-fun condMapEmpty!53210 () Bool)

(declare-fun mapDefault!53210 () ValueCell!16318)

