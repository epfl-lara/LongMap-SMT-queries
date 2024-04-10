; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109280 () Bool)

(assert start!109280)

(declare-fun b_free!28769 () Bool)

(declare-fun b_next!28769 () Bool)

(assert (=> start!109280 (= b_free!28769 (not b_next!28769))))

(declare-fun tp!101426 () Bool)

(declare-fun b_and!46859 () Bool)

(assert (=> start!109280 (= tp!101426 b_and!46859)))

(declare-fun b!1293044 () Bool)

(declare-fun e!737978 () Bool)

(declare-fun e!737976 () Bool)

(assert (=> b!1293044 (= e!737978 (not e!737976))))

(declare-fun res!859207 () Bool)

(assert (=> b!1293044 (=> res!859207 e!737976)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293044 (= res!859207 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!50981 0))(
  ( (V!50982 (val!17279 Int)) )
))
(declare-datatypes ((tuple2!22236 0))(
  ( (tuple2!22237 (_1!11129 (_ BitVec 64)) (_2!11129 V!50981)) )
))
(declare-datatypes ((List!29386 0))(
  ( (Nil!29383) (Cons!29382 (h!30591 tuple2!22236) (t!42950 List!29386)) )
))
(declare-datatypes ((ListLongMap!19893 0))(
  ( (ListLongMap!19894 (toList!9962 List!29386)) )
))
(declare-fun contains!8080 (ListLongMap!19893 (_ BitVec 64)) Bool)

(assert (=> b!1293044 (not (contains!8080 (ListLongMap!19894 Nil!29383) k!1205))))

(declare-datatypes ((Unit!42822 0))(
  ( (Unit!42823) )
))
(declare-fun lt!579451 () Unit!42822)

(declare-fun emptyContainsNothing!133 ((_ BitVec 64)) Unit!42822)

(assert (=> b!1293044 (= lt!579451 (emptyContainsNothing!133 k!1205))))

(declare-fun b!1293045 () Bool)

(declare-fun res!859209 () Bool)

(assert (=> b!1293045 (=> (not res!859209) (not e!737978))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85848 0))(
  ( (array!85849 (arr!41425 (Array (_ BitVec 32) (_ BitVec 64))) (size!41975 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85848)

(assert (=> b!1293045 (= res!859209 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41975 _keys!1741))))))

(declare-fun b!1293046 () Bool)

(declare-fun res!859202 () Bool)

(assert (=> b!1293046 (=> (not res!859202) (not e!737978))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293046 (= res!859202 (not (validKeyInArray!0 (select (arr!41425 _keys!1741) from!2144))))))

(declare-fun b!1293047 () Bool)

(declare-fun e!737977 () Bool)

(declare-fun tp_is_empty!34409 () Bool)

(assert (=> b!1293047 (= e!737977 tp_is_empty!34409)))

(declare-fun b!1293049 () Bool)

(declare-fun e!737980 () Bool)

(declare-fun mapRes!53174 () Bool)

(assert (=> b!1293049 (= e!737980 (and e!737977 mapRes!53174))))

(declare-fun condMapEmpty!53174 () Bool)

(declare-datatypes ((ValueCell!16306 0))(
  ( (ValueCellFull!16306 (v!19882 V!50981)) (EmptyCell!16306) )
))
(declare-datatypes ((array!85850 0))(
  ( (array!85851 (arr!41426 (Array (_ BitVec 32) ValueCell!16306)) (size!41976 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85850)

(declare-fun mapDefault!53174 () ValueCell!16306)

