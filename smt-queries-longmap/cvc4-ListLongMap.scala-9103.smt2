; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109406 () Bool)

(assert start!109406)

(declare-fun b_free!28895 () Bool)

(declare-fun b_next!28895 () Bool)

(assert (=> start!109406 (= b_free!28895 (not b_next!28895))))

(declare-fun tp!101803 () Bool)

(declare-fun b_and!46985 () Bool)

(assert (=> start!109406 (= tp!101803 b_and!46985)))

(declare-fun b!1295231 () Bool)

(declare-fun e!739029 () Bool)

(declare-fun e!739031 () Bool)

(assert (=> b!1295231 (= e!739029 (not e!739031))))

(declare-fun res!860829 () Bool)

(assert (=> b!1295231 (=> res!860829 e!739031)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295231 (= res!860829 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51149 0))(
  ( (V!51150 (val!17342 Int)) )
))
(declare-datatypes ((tuple2!22330 0))(
  ( (tuple2!22331 (_1!11176 (_ BitVec 64)) (_2!11176 V!51149)) )
))
(declare-datatypes ((List!29473 0))(
  ( (Nil!29470) (Cons!29469 (h!30678 tuple2!22330) (t!43037 List!29473)) )
))
(declare-datatypes ((ListLongMap!19987 0))(
  ( (ListLongMap!19988 (toList!10009 List!29473)) )
))
(declare-fun contains!8127 (ListLongMap!19987 (_ BitVec 64)) Bool)

(assert (=> b!1295231 (not (contains!8127 (ListLongMap!19988 Nil!29470) k!1205))))

(declare-datatypes ((Unit!42900 0))(
  ( (Unit!42901) )
))
(declare-fun lt!579848 () Unit!42900)

(declare-fun emptyContainsNothing!170 ((_ BitVec 64)) Unit!42900)

(assert (=> b!1295231 (= lt!579848 (emptyContainsNothing!170 k!1205))))

(declare-fun b!1295232 () Bool)

(declare-fun res!860828 () Bool)

(assert (=> b!1295232 (=> (not res!860828) (not e!739029))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!86090 0))(
  ( (array!86091 (arr!41546 (Array (_ BitVec 32) (_ BitVec 64))) (size!42096 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86090)

(assert (=> b!1295232 (= res!860828 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42096 _keys!1741))))))

(declare-fun b!1295233 () Bool)

(assert (=> b!1295233 (= e!739031 true)))

(declare-fun lt!579846 () ListLongMap!19987)

(declare-fun minValue!1387 () V!51149)

(declare-fun +!4416 (ListLongMap!19987 tuple2!22330) ListLongMap!19987)

(assert (=> b!1295233 (not (contains!8127 (+!4416 lt!579846 (tuple2!22331 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579847 () Unit!42900)

(declare-fun addStillNotContains!434 (ListLongMap!19987 (_ BitVec 64) V!51149 (_ BitVec 64)) Unit!42900)

(assert (=> b!1295233 (= lt!579847 (addStillNotContains!434 lt!579846 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51149)

(declare-datatypes ((ValueCell!16369 0))(
  ( (ValueCellFull!16369 (v!19945 V!51149)) (EmptyCell!16369) )
))
(declare-datatypes ((array!86092 0))(
  ( (array!86093 (arr!41547 (Array (_ BitVec 32) ValueCell!16369)) (size!42097 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86092)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6049 (array!86090 array!86092 (_ BitVec 32) (_ BitVec 32) V!51149 V!51149 (_ BitVec 32) Int) ListLongMap!19987)

(assert (=> b!1295233 (= lt!579846 (getCurrentListMapNoExtraKeys!6049 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295234 () Bool)

(declare-fun res!860826 () Bool)

(assert (=> b!1295234 (=> (not res!860826) (not e!739029))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86090 (_ BitVec 32)) Bool)

(assert (=> b!1295234 (= res!860826 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295235 () Bool)

(declare-fun res!860827 () Bool)

(assert (=> b!1295235 (=> (not res!860827) (not e!739029))))

(declare-datatypes ((List!29474 0))(
  ( (Nil!29471) (Cons!29470 (h!30679 (_ BitVec 64)) (t!43038 List!29474)) )
))
(declare-fun arrayNoDuplicates!0 (array!86090 (_ BitVec 32) List!29474) Bool)

(assert (=> b!1295235 (= res!860827 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29471))))

(declare-fun b!1295236 () Bool)

(declare-fun res!860821 () Bool)

(assert (=> b!1295236 (=> (not res!860821) (not e!739029))))

(assert (=> b!1295236 (= res!860821 (and (= (size!42097 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42096 _keys!1741) (size!42097 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295237 () Bool)

(declare-fun res!860823 () Bool)

(assert (=> b!1295237 (=> (not res!860823) (not e!739029))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295237 (= res!860823 (not (validKeyInArray!0 (select (arr!41546 _keys!1741) from!2144))))))

(declare-fun b!1295238 () Bool)

(declare-fun e!739034 () Bool)

(declare-fun e!739033 () Bool)

(declare-fun mapRes!53363 () Bool)

(assert (=> b!1295238 (= e!739034 (and e!739033 mapRes!53363))))

(declare-fun condMapEmpty!53363 () Bool)

(declare-fun mapDefault!53363 () ValueCell!16369)

