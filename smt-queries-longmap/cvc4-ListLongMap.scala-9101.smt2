; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109394 () Bool)

(assert start!109394)

(declare-fun b_free!28883 () Bool)

(declare-fun b_next!28883 () Bool)

(assert (=> start!109394 (= b_free!28883 (not b_next!28883))))

(declare-fun tp!101767 () Bool)

(declare-fun b_and!46973 () Bool)

(assert (=> start!109394 (= tp!101767 b_and!46973)))

(declare-fun b!1295015 () Bool)

(declare-fun e!738924 () Bool)

(declare-fun e!738921 () Bool)

(assert (=> b!1295015 (= e!738924 (not e!738921))))

(declare-fun res!860661 () Bool)

(assert (=> b!1295015 (=> res!860661 e!738921)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295015 (= res!860661 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51133 0))(
  ( (V!51134 (val!17336 Int)) )
))
(declare-datatypes ((tuple2!22318 0))(
  ( (tuple2!22319 (_1!11170 (_ BitVec 64)) (_2!11170 V!51133)) )
))
(declare-datatypes ((List!29461 0))(
  ( (Nil!29458) (Cons!29457 (h!30666 tuple2!22318) (t!43025 List!29461)) )
))
(declare-datatypes ((ListLongMap!19975 0))(
  ( (ListLongMap!19976 (toList!10003 List!29461)) )
))
(declare-fun contains!8121 (ListLongMap!19975 (_ BitVec 64)) Bool)

(assert (=> b!1295015 (not (contains!8121 (ListLongMap!19976 Nil!29458) k!1205))))

(declare-datatypes ((Unit!42888 0))(
  ( (Unit!42889) )
))
(declare-fun lt!579793 () Unit!42888)

(declare-fun emptyContainsNothing!165 ((_ BitVec 64)) Unit!42888)

(assert (=> b!1295015 (= lt!579793 (emptyContainsNothing!165 k!1205))))

(declare-fun b!1295016 () Bool)

(assert (=> b!1295016 (= e!738921 true)))

(declare-fun lt!579794 () ListLongMap!19975)

(declare-fun minValue!1387 () V!51133)

(declare-fun +!4410 (ListLongMap!19975 tuple2!22318) ListLongMap!19975)

(assert (=> b!1295016 (not (contains!8121 (+!4410 lt!579794 (tuple2!22319 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579792 () Unit!42888)

(declare-fun addStillNotContains!428 (ListLongMap!19975 (_ BitVec 64) V!51133 (_ BitVec 64)) Unit!42888)

(assert (=> b!1295016 (= lt!579792 (addStillNotContains!428 lt!579794 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51133)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16363 0))(
  ( (ValueCellFull!16363 (v!19939 V!51133)) (EmptyCell!16363) )
))
(declare-datatypes ((array!86066 0))(
  ( (array!86067 (arr!41534 (Array (_ BitVec 32) ValueCell!16363)) (size!42084 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86066)

(declare-datatypes ((array!86068 0))(
  ( (array!86069 (arr!41535 (Array (_ BitVec 32) (_ BitVec 64))) (size!42085 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86068)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6043 (array!86068 array!86066 (_ BitVec 32) (_ BitVec 32) V!51133 V!51133 (_ BitVec 32) Int) ListLongMap!19975)

(assert (=> b!1295016 (= lt!579794 (getCurrentListMapNoExtraKeys!6043 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295017 () Bool)

(declare-fun res!860665 () Bool)

(assert (=> b!1295017 (=> (not res!860665) (not e!738924))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86068 (_ BitVec 32)) Bool)

(assert (=> b!1295017 (= res!860665 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295018 () Bool)

(declare-fun res!860660 () Bool)

(assert (=> b!1295018 (=> (not res!860660) (not e!738924))))

(declare-fun getCurrentListMap!5040 (array!86068 array!86066 (_ BitVec 32) (_ BitVec 32) V!51133 V!51133 (_ BitVec 32) Int) ListLongMap!19975)

(assert (=> b!1295018 (= res!860660 (contains!8121 (getCurrentListMap!5040 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53345 () Bool)

(declare-fun mapRes!53345 () Bool)

(assert (=> mapIsEmpty!53345 mapRes!53345))

(declare-fun b!1295019 () Bool)

(declare-fun e!738926 () Bool)

(declare-fun tp_is_empty!34523 () Bool)

(assert (=> b!1295019 (= e!738926 tp_is_empty!34523)))

(declare-fun res!860666 () Bool)

(assert (=> start!109394 (=> (not res!860666) (not e!738924))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109394 (= res!860666 (validMask!0 mask!2175))))

(assert (=> start!109394 e!738924))

(assert (=> start!109394 tp_is_empty!34523))

(assert (=> start!109394 true))

(declare-fun e!738925 () Bool)

(declare-fun array_inv!31449 (array!86066) Bool)

(assert (=> start!109394 (and (array_inv!31449 _values!1445) e!738925)))

(declare-fun array_inv!31450 (array!86068) Bool)

(assert (=> start!109394 (array_inv!31450 _keys!1741)))

(assert (=> start!109394 tp!101767))

(declare-fun b!1295020 () Bool)

(declare-fun res!860667 () Bool)

(assert (=> b!1295020 (=> (not res!860667) (not e!738924))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295020 (= res!860667 (not (validKeyInArray!0 (select (arr!41535 _keys!1741) from!2144))))))

(declare-fun b!1295021 () Bool)

(declare-fun res!860663 () Bool)

(assert (=> b!1295021 (=> (not res!860663) (not e!738924))))

(assert (=> b!1295021 (= res!860663 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42085 _keys!1741))))))

(declare-fun b!1295022 () Bool)

(declare-fun res!860659 () Bool)

(assert (=> b!1295022 (=> (not res!860659) (not e!738924))))

(assert (=> b!1295022 (= res!860659 (and (= (size!42084 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42085 _keys!1741) (size!42084 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295023 () Bool)

(declare-fun res!860664 () Bool)

(assert (=> b!1295023 (=> (not res!860664) (not e!738924))))

(declare-datatypes ((List!29462 0))(
  ( (Nil!29459) (Cons!29458 (h!30667 (_ BitVec 64)) (t!43026 List!29462)) )
))
(declare-fun arrayNoDuplicates!0 (array!86068 (_ BitVec 32) List!29462) Bool)

(assert (=> b!1295023 (= res!860664 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29459))))

(declare-fun b!1295024 () Bool)

(declare-fun res!860662 () Bool)

(assert (=> b!1295024 (=> (not res!860662) (not e!738924))))

(assert (=> b!1295024 (= res!860662 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42085 _keys!1741))))))

(declare-fun b!1295025 () Bool)

(declare-fun e!738922 () Bool)

(assert (=> b!1295025 (= e!738925 (and e!738922 mapRes!53345))))

(declare-fun condMapEmpty!53345 () Bool)

(declare-fun mapDefault!53345 () ValueCell!16363)

