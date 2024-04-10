; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109396 () Bool)

(assert start!109396)

(declare-fun b_free!28885 () Bool)

(declare-fun b_next!28885 () Bool)

(assert (=> start!109396 (= b_free!28885 (not b_next!28885))))

(declare-fun tp!101774 () Bool)

(declare-fun b_and!46975 () Bool)

(assert (=> start!109396 (= tp!101774 b_and!46975)))

(declare-fun mapNonEmpty!53348 () Bool)

(declare-fun mapRes!53348 () Bool)

(declare-fun tp!101773 () Bool)

(declare-fun e!738943 () Bool)

(assert (=> mapNonEmpty!53348 (= mapRes!53348 (and tp!101773 e!738943))))

(declare-fun mapKey!53348 () (_ BitVec 32))

(declare-datatypes ((V!51137 0))(
  ( (V!51138 (val!17337 Int)) )
))
(declare-datatypes ((ValueCell!16364 0))(
  ( (ValueCellFull!16364 (v!19940 V!51137)) (EmptyCell!16364) )
))
(declare-fun mapValue!53348 () ValueCell!16364)

(declare-fun mapRest!53348 () (Array (_ BitVec 32) ValueCell!16364))

(declare-datatypes ((array!86070 0))(
  ( (array!86071 (arr!41536 (Array (_ BitVec 32) ValueCell!16364)) (size!42086 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86070)

(assert (=> mapNonEmpty!53348 (= (arr!41536 _values!1445) (store mapRest!53348 mapKey!53348 mapValue!53348))))

(declare-fun b!1295051 () Bool)

(declare-fun res!860691 () Bool)

(declare-fun e!738939 () Bool)

(assert (=> b!1295051 (=> (not res!860691) (not e!738939))))

(declare-datatypes ((array!86072 0))(
  ( (array!86073 (arr!41537 (Array (_ BitVec 32) (_ BitVec 64))) (size!42087 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86072)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295051 (= res!860691 (not (validKeyInArray!0 (select (arr!41537 _keys!1741) from!2144))))))

(declare-fun res!860692 () Bool)

(assert (=> start!109396 (=> (not res!860692) (not e!738939))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109396 (= res!860692 (validMask!0 mask!2175))))

(assert (=> start!109396 e!738939))

(declare-fun tp_is_empty!34525 () Bool)

(assert (=> start!109396 tp_is_empty!34525))

(assert (=> start!109396 true))

(declare-fun e!738944 () Bool)

(declare-fun array_inv!31451 (array!86070) Bool)

(assert (=> start!109396 (and (array_inv!31451 _values!1445) e!738944)))

(declare-fun array_inv!31452 (array!86072) Bool)

(assert (=> start!109396 (array_inv!31452 _keys!1741)))

(assert (=> start!109396 tp!101774))

(declare-fun b!1295052 () Bool)

(declare-fun res!860687 () Bool)

(assert (=> b!1295052 (=> (not res!860687) (not e!738939))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1295052 (= res!860687 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42087 _keys!1741))))))

(declare-fun b!1295053 () Bool)

(declare-fun res!860693 () Bool)

(assert (=> b!1295053 (=> (not res!860693) (not e!738939))))

(declare-datatypes ((List!29463 0))(
  ( (Nil!29460) (Cons!29459 (h!30668 (_ BitVec 64)) (t!43027 List!29463)) )
))
(declare-fun arrayNoDuplicates!0 (array!86072 (_ BitVec 32) List!29463) Bool)

(assert (=> b!1295053 (= res!860693 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29460))))

(declare-fun b!1295054 () Bool)

(declare-fun e!738942 () Bool)

(assert (=> b!1295054 (= e!738942 true)))

(declare-datatypes ((tuple2!22320 0))(
  ( (tuple2!22321 (_1!11171 (_ BitVec 64)) (_2!11171 V!51137)) )
))
(declare-datatypes ((List!29464 0))(
  ( (Nil!29461) (Cons!29460 (h!30669 tuple2!22320) (t!43028 List!29464)) )
))
(declare-datatypes ((ListLongMap!19977 0))(
  ( (ListLongMap!19978 (toList!10004 List!29464)) )
))
(declare-fun lt!579803 () ListLongMap!19977)

(declare-fun minValue!1387 () V!51137)

(declare-fun contains!8122 (ListLongMap!19977 (_ BitVec 64)) Bool)

(declare-fun +!4411 (ListLongMap!19977 tuple2!22320) ListLongMap!19977)

(assert (=> b!1295054 (not (contains!8122 (+!4411 lt!579803 (tuple2!22321 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42890 0))(
  ( (Unit!42891) )
))
(declare-fun lt!579802 () Unit!42890)

(declare-fun addStillNotContains!429 (ListLongMap!19977 (_ BitVec 64) V!51137 (_ BitVec 64)) Unit!42890)

(assert (=> b!1295054 (= lt!579802 (addStillNotContains!429 lt!579803 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51137)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6044 (array!86072 array!86070 (_ BitVec 32) (_ BitVec 32) V!51137 V!51137 (_ BitVec 32) Int) ListLongMap!19977)

(assert (=> b!1295054 (= lt!579803 (getCurrentListMapNoExtraKeys!6044 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295055 () Bool)

(declare-fun res!860688 () Bool)

(assert (=> b!1295055 (=> (not res!860688) (not e!738939))))

(assert (=> b!1295055 (= res!860688 (and (= (size!42086 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42087 _keys!1741) (size!42086 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295056 () Bool)

(declare-fun e!738941 () Bool)

(assert (=> b!1295056 (= e!738944 (and e!738941 mapRes!53348))))

(declare-fun condMapEmpty!53348 () Bool)

(declare-fun mapDefault!53348 () ValueCell!16364)

