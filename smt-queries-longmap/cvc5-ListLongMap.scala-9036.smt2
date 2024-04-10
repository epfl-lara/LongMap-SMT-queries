; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109000 () Bool)

(assert start!109000)

(declare-fun b_free!28489 () Bool)

(declare-fun b_next!28489 () Bool)

(assert (=> start!109000 (= b_free!28489 (not b_next!28489))))

(declare-fun tp!100585 () Bool)

(declare-fun b_and!46579 () Bool)

(assert (=> start!109000 (= tp!100585 b_and!46579)))

(declare-fun mapNonEmpty!52754 () Bool)

(declare-fun mapRes!52754 () Bool)

(declare-fun tp!100586 () Bool)

(declare-fun e!735544 () Bool)

(assert (=> mapNonEmpty!52754 (= mapRes!52754 (and tp!100586 e!735544))))

(declare-fun mapKey!52754 () (_ BitVec 32))

(declare-datatypes ((V!50609 0))(
  ( (V!50610 (val!17139 Int)) )
))
(declare-datatypes ((ValueCell!16166 0))(
  ( (ValueCellFull!16166 (v!19742 V!50609)) (EmptyCell!16166) )
))
(declare-fun mapValue!52754 () ValueCell!16166)

(declare-datatypes ((array!85306 0))(
  ( (array!85307 (arr!41154 (Array (_ BitVec 32) ValueCell!16166)) (size!41704 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85306)

(declare-fun mapRest!52754 () (Array (_ BitVec 32) ValueCell!16166))

(assert (=> mapNonEmpty!52754 (= (arr!41154 _values!1445) (store mapRest!52754 mapKey!52754 mapValue!52754))))

(declare-fun b!1288092 () Bool)

(declare-fun res!855512 () Bool)

(declare-fun e!735548 () Bool)

(assert (=> b!1288092 (=> (not res!855512) (not e!735548))))

(declare-datatypes ((array!85308 0))(
  ( (array!85309 (arr!41155 (Array (_ BitVec 32) (_ BitVec 64))) (size!41705 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85308)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288092 (= res!855512 (not (validKeyInArray!0 (select (arr!41155 _keys!1741) from!2144))))))

(declare-fun b!1288093 () Bool)

(declare-fun res!855511 () Bool)

(assert (=> b!1288093 (=> (not res!855511) (not e!735548))))

(declare-fun minValue!1387 () V!50609)

(declare-fun zeroValue!1387 () V!50609)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!21998 0))(
  ( (tuple2!21999 (_1!11010 (_ BitVec 64)) (_2!11010 V!50609)) )
))
(declare-datatypes ((List!29173 0))(
  ( (Nil!29170) (Cons!29169 (h!30378 tuple2!21998) (t!42737 List!29173)) )
))
(declare-datatypes ((ListLongMap!19655 0))(
  ( (ListLongMap!19656 (toList!9843 List!29173)) )
))
(declare-fun contains!7961 (ListLongMap!19655 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4911 (array!85308 array!85306 (_ BitVec 32) (_ BitVec 32) V!50609 V!50609 (_ BitVec 32) Int) ListLongMap!19655)

(assert (=> b!1288093 (= res!855511 (contains!7961 (getCurrentListMap!4911 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1288094 () Bool)

(declare-fun res!855513 () Bool)

(assert (=> b!1288094 (=> (not res!855513) (not e!735548))))

(assert (=> b!1288094 (= res!855513 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41705 _keys!1741))))))

(declare-fun b!1288095 () Bool)

(assert (=> b!1288095 (= e!735548 (not (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000) (bvsle from!2144 (size!41705 _keys!1741)))))))

(assert (=> b!1288095 (not (contains!7961 (ListLongMap!19656 Nil!29170) k!1205))))

(declare-datatypes ((Unit!42606 0))(
  ( (Unit!42607) )
))
(declare-fun lt!577925 () Unit!42606)

(declare-fun emptyContainsNothing!32 ((_ BitVec 64)) Unit!42606)

(assert (=> b!1288095 (= lt!577925 (emptyContainsNothing!32 k!1205))))

(declare-fun b!1288096 () Bool)

(declare-fun e!735546 () Bool)

(declare-fun e!735545 () Bool)

(assert (=> b!1288096 (= e!735546 (and e!735545 mapRes!52754))))

(declare-fun condMapEmpty!52754 () Bool)

(declare-fun mapDefault!52754 () ValueCell!16166)

