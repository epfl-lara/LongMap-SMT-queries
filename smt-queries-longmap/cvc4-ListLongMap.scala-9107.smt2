; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109430 () Bool)

(assert start!109430)

(declare-fun b_free!28919 () Bool)

(declare-fun b_next!28919 () Bool)

(assert (=> start!109430 (= b_free!28919 (not b_next!28919))))

(declare-fun tp!101876 () Bool)

(declare-fun b_and!47009 () Bool)

(assert (=> start!109430 (= tp!101876 b_and!47009)))

(declare-fun b!1295663 () Bool)

(declare-fun res!861149 () Bool)

(declare-fun e!739245 () Bool)

(assert (=> b!1295663 (=> (not res!861149) (not e!739245))))

(declare-datatypes ((array!86138 0))(
  ( (array!86139 (arr!41570 (Array (_ BitVec 32) (_ BitVec 64))) (size!42120 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86138)

(declare-datatypes ((List!29491 0))(
  ( (Nil!29488) (Cons!29487 (h!30696 (_ BitVec 64)) (t!43055 List!29491)) )
))
(declare-fun arrayNoDuplicates!0 (array!86138 (_ BitVec 32) List!29491) Bool)

(assert (=> b!1295663 (= res!861149 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29488))))

(declare-fun b!1295664 () Bool)

(declare-fun res!861145 () Bool)

(assert (=> b!1295664 (=> (not res!861145) (not e!739245))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295664 (= res!861145 (not (validKeyInArray!0 (select (arr!41570 _keys!1741) from!2144))))))

(declare-fun b!1295666 () Bool)

(declare-fun e!739246 () Bool)

(assert (=> b!1295666 (= e!739245 (not e!739246))))

(declare-fun res!861147 () Bool)

(assert (=> b!1295666 (=> res!861147 e!739246)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295666 (= res!861147 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51181 0))(
  ( (V!51182 (val!17354 Int)) )
))
(declare-datatypes ((tuple2!22350 0))(
  ( (tuple2!22351 (_1!11186 (_ BitVec 64)) (_2!11186 V!51181)) )
))
(declare-datatypes ((List!29492 0))(
  ( (Nil!29489) (Cons!29488 (h!30697 tuple2!22350) (t!43056 List!29492)) )
))
(declare-datatypes ((ListLongMap!20007 0))(
  ( (ListLongMap!20008 (toList!10019 List!29492)) )
))
(declare-fun contains!8137 (ListLongMap!20007 (_ BitVec 64)) Bool)

(assert (=> b!1295666 (not (contains!8137 (ListLongMap!20008 Nil!29489) k!1205))))

(declare-datatypes ((Unit!42916 0))(
  ( (Unit!42917) )
))
(declare-fun lt!579955 () Unit!42916)

(declare-fun emptyContainsNothing!177 ((_ BitVec 64)) Unit!42916)

(assert (=> b!1295666 (= lt!579955 (emptyContainsNothing!177 k!1205))))

(declare-fun mapIsEmpty!53399 () Bool)

(declare-fun mapRes!53399 () Bool)

(assert (=> mapIsEmpty!53399 mapRes!53399))

(declare-fun b!1295667 () Bool)

(declare-fun e!739249 () Bool)

(declare-fun e!739247 () Bool)

(assert (=> b!1295667 (= e!739249 (and e!739247 mapRes!53399))))

(declare-fun condMapEmpty!53399 () Bool)

(declare-datatypes ((ValueCell!16381 0))(
  ( (ValueCellFull!16381 (v!19957 V!51181)) (EmptyCell!16381) )
))
(declare-datatypes ((array!86140 0))(
  ( (array!86141 (arr!41571 (Array (_ BitVec 32) ValueCell!16381)) (size!42121 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86140)

(declare-fun mapDefault!53399 () ValueCell!16381)

