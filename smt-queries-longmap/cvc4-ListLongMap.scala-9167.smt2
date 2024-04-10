; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!110132 () Bool)

(assert start!110132)

(declare-fun b_free!29279 () Bool)

(declare-fun b_next!29279 () Bool)

(assert (=> start!110132 (= b_free!29279 (not b_next!29279))))

(declare-fun tp!102992 () Bool)

(declare-fun b_and!47453 () Bool)

(assert (=> start!110132 (= tp!102992 b_and!47453)))

(declare-fun b!1304075 () Bool)

(declare-fun e!743838 () Bool)

(declare-fun e!743840 () Bool)

(assert (=> b!1304075 (= e!743838 (not e!743840))))

(declare-fun res!866111 () Bool)

(assert (=> b!1304075 (=> res!866111 e!743840)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1304075 (= res!866111 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51661 0))(
  ( (V!51662 (val!17534 Int)) )
))
(declare-datatypes ((tuple2!22630 0))(
  ( (tuple2!22631 (_1!11326 (_ BitVec 64)) (_2!11326 V!51661)) )
))
(declare-datatypes ((List!29753 0))(
  ( (Nil!29750) (Cons!29749 (h!30958 tuple2!22630) (t!43349 List!29753)) )
))
(declare-datatypes ((ListLongMap!20287 0))(
  ( (ListLongMap!20288 (toList!10159 List!29753)) )
))
(declare-fun contains!8297 (ListLongMap!20287 (_ BitVec 64)) Bool)

(assert (=> b!1304075 (not (contains!8297 (ListLongMap!20288 Nil!29750) k!1205))))

(declare-datatypes ((Unit!43182 0))(
  ( (Unit!43183) )
))
(declare-fun lt!583615 () Unit!43182)

(declare-fun emptyContainsNothing!222 ((_ BitVec 64)) Unit!43182)

(assert (=> b!1304075 (= lt!583615 (emptyContainsNothing!222 k!1205))))

(declare-fun b!1304076 () Bool)

(declare-fun res!866108 () Bool)

(assert (=> b!1304076 (=> (not res!866108) (not e!743838))))

(declare-datatypes ((array!86850 0))(
  ( (array!86851 (arr!41915 (Array (_ BitVec 32) (_ BitVec 64))) (size!42465 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86850)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1304076 (= res!866108 (not (validKeyInArray!0 (select (arr!41915 _keys!1741) from!2144))))))

(declare-fun b!1304077 () Bool)

(declare-fun res!866105 () Bool)

(assert (=> b!1304077 (=> (not res!866105) (not e!743838))))

(assert (=> b!1304077 (= res!866105 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42465 _keys!1741))))))

(declare-fun b!1304078 () Bool)

(declare-fun res!866110 () Bool)

(assert (=> b!1304078 (=> (not res!866110) (not e!743838))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16561 0))(
  ( (ValueCellFull!16561 (v!20152 V!51661)) (EmptyCell!16561) )
))
(declare-datatypes ((array!86852 0))(
  ( (array!86853 (arr!41916 (Array (_ BitVec 32) ValueCell!16561)) (size!42466 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86852)

(assert (=> b!1304078 (= res!866110 (and (= (size!42466 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42465 _keys!1741) (size!42466 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1304079 () Bool)

(assert (=> b!1304079 (= e!743840 false)))

(declare-fun lt!583614 () ListLongMap!20287)

(declare-fun zeroValue!1387 () V!51661)

(declare-fun +!4482 (ListLongMap!20287 tuple2!22630) ListLongMap!20287)

(assert (=> b!1304079 (not (contains!8297 (+!4482 lt!583614 (tuple2!22631 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!583613 () Unit!43182)

(declare-fun addStillNotContains!479 (ListLongMap!20287 (_ BitVec 64) V!51661 (_ BitVec 64)) Unit!43182)

(assert (=> b!1304079 (= lt!583613 (addStillNotContains!479 lt!583614 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!51661)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6117 (array!86850 array!86852 (_ BitVec 32) (_ BitVec 32) V!51661 V!51661 (_ BitVec 32) Int) ListLongMap!20287)

(assert (=> b!1304079 (= lt!583614 (getCurrentListMapNoExtraKeys!6117 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1304080 () Bool)

(declare-fun e!743841 () Bool)

(declare-fun e!743839 () Bool)

(declare-fun mapRes!53975 () Bool)

(assert (=> b!1304080 (= e!743841 (and e!743839 mapRes!53975))))

(declare-fun condMapEmpty!53975 () Bool)

(declare-fun mapDefault!53975 () ValueCell!16561)

