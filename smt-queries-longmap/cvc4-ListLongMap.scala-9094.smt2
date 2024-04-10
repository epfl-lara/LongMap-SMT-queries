; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109352 () Bool)

(assert start!109352)

(declare-fun b_free!28841 () Bool)

(declare-fun b_next!28841 () Bool)

(assert (=> start!109352 (= b_free!28841 (not b_next!28841))))

(declare-fun tp!101642 () Bool)

(declare-fun b_and!46931 () Bool)

(assert (=> start!109352 (= tp!101642 b_and!46931)))

(declare-fun mapIsEmpty!53282 () Bool)

(declare-fun mapRes!53282 () Bool)

(assert (=> mapIsEmpty!53282 mapRes!53282))

(declare-fun b!1294305 () Bool)

(declare-fun e!738593 () Bool)

(declare-fun tp_is_empty!34481 () Bool)

(assert (=> b!1294305 (= e!738593 tp_is_empty!34481)))

(declare-fun b!1294306 () Bool)

(declare-fun res!860145 () Bool)

(declare-fun e!738592 () Bool)

(assert (=> b!1294306 (=> (not res!860145) (not e!738592))))

(declare-datatypes ((array!85984 0))(
  ( (array!85985 (arr!41493 (Array (_ BitVec 32) (_ BitVec 64))) (size!42043 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85984)

(declare-datatypes ((List!29432 0))(
  ( (Nil!29429) (Cons!29428 (h!30637 (_ BitVec 64)) (t!42996 List!29432)) )
))
(declare-fun arrayNoDuplicates!0 (array!85984 (_ BitVec 32) List!29432) Bool)

(assert (=> b!1294306 (= res!860145 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29429))))

(declare-fun b!1294307 () Bool)

(declare-fun res!860139 () Bool)

(assert (=> b!1294307 (=> (not res!860139) (not e!738592))))

(declare-datatypes ((V!51077 0))(
  ( (V!51078 (val!17315 Int)) )
))
(declare-fun minValue!1387 () V!51077)

(declare-fun zeroValue!1387 () V!51077)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16342 0))(
  ( (ValueCellFull!16342 (v!19918 V!51077)) (EmptyCell!16342) )
))
(declare-datatypes ((array!85986 0))(
  ( (array!85987 (arr!41494 (Array (_ BitVec 32) ValueCell!16342)) (size!42044 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85986)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22288 0))(
  ( (tuple2!22289 (_1!11155 (_ BitVec 64)) (_2!11155 V!51077)) )
))
(declare-datatypes ((List!29433 0))(
  ( (Nil!29430) (Cons!29429 (h!30638 tuple2!22288) (t!42997 List!29433)) )
))
(declare-datatypes ((ListLongMap!19945 0))(
  ( (ListLongMap!19946 (toList!9988 List!29433)) )
))
(declare-fun contains!8106 (ListLongMap!19945 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5027 (array!85984 array!85986 (_ BitVec 32) (_ BitVec 32) V!51077 V!51077 (_ BitVec 32) Int) ListLongMap!19945)

(assert (=> b!1294307 (= res!860139 (contains!8106 (getCurrentListMap!5027 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1294308 () Bool)

(declare-fun res!860140 () Bool)

(assert (=> b!1294308 (=> (not res!860140) (not e!738592))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294308 (= res!860140 (not (validKeyInArray!0 (select (arr!41493 _keys!1741) from!2144))))))

(declare-fun b!1294309 () Bool)

(declare-fun e!738590 () Bool)

(assert (=> b!1294309 (= e!738590 (and e!738593 mapRes!53282))))

(declare-fun condMapEmpty!53282 () Bool)

(declare-fun mapDefault!53282 () ValueCell!16342)

