; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109400 () Bool)

(assert start!109400)

(declare-fun b_free!28889 () Bool)

(declare-fun b_next!28889 () Bool)

(assert (=> start!109400 (= b_free!28889 (not b_next!28889))))

(declare-fun tp!101785 () Bool)

(declare-fun b_and!46979 () Bool)

(assert (=> start!109400 (= tp!101785 b_and!46979)))

(declare-fun b!1295123 () Bool)

(declare-fun e!738976 () Bool)

(declare-fun tp_is_empty!34529 () Bool)

(assert (=> b!1295123 (= e!738976 tp_is_empty!34529)))

(declare-fun b!1295124 () Bool)

(declare-fun res!860741 () Bool)

(declare-fun e!738978 () Bool)

(assert (=> b!1295124 (=> (not res!860741) (not e!738978))))

(declare-datatypes ((array!86078 0))(
  ( (array!86079 (arr!41540 (Array (_ BitVec 32) (_ BitVec 64))) (size!42090 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86078)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295124 (= res!860741 (not (validKeyInArray!0 (select (arr!41540 _keys!1741) from!2144))))))

(declare-fun b!1295125 () Bool)

(declare-fun res!860747 () Bool)

(assert (=> b!1295125 (=> (not res!860747) (not e!738978))))

(assert (=> b!1295125 (= res!860747 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42090 _keys!1741))))))

(declare-fun b!1295126 () Bool)

(declare-fun e!738979 () Bool)

(assert (=> b!1295126 (= e!738979 tp_is_empty!34529)))

(declare-fun mapNonEmpty!53354 () Bool)

(declare-fun mapRes!53354 () Bool)

(declare-fun tp!101786 () Bool)

(assert (=> mapNonEmpty!53354 (= mapRes!53354 (and tp!101786 e!738976))))

(declare-datatypes ((V!51141 0))(
  ( (V!51142 (val!17339 Int)) )
))
(declare-datatypes ((ValueCell!16366 0))(
  ( (ValueCellFull!16366 (v!19942 V!51141)) (EmptyCell!16366) )
))
(declare-fun mapValue!53354 () ValueCell!16366)

(declare-fun mapKey!53354 () (_ BitVec 32))

(declare-datatypes ((array!86080 0))(
  ( (array!86081 (arr!41541 (Array (_ BitVec 32) ValueCell!16366)) (size!42091 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86080)

(declare-fun mapRest!53354 () (Array (_ BitVec 32) ValueCell!16366))

(assert (=> mapNonEmpty!53354 (= (arr!41541 _values!1445) (store mapRest!53354 mapKey!53354 mapValue!53354))))

(declare-fun res!860748 () Bool)

(assert (=> start!109400 (=> (not res!860748) (not e!738978))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109400 (= res!860748 (validMask!0 mask!2175))))

(assert (=> start!109400 e!738978))

(assert (=> start!109400 tp_is_empty!34529))

(assert (=> start!109400 true))

(declare-fun e!738977 () Bool)

(declare-fun array_inv!31455 (array!86080) Bool)

(assert (=> start!109400 (and (array_inv!31455 _values!1445) e!738977)))

(declare-fun array_inv!31456 (array!86078) Bool)

(assert (=> start!109400 (array_inv!31456 _keys!1741)))

(assert (=> start!109400 tp!101785))

(declare-fun b!1295127 () Bool)

(declare-fun res!860746 () Bool)

(assert (=> b!1295127 (=> (not res!860746) (not e!738978))))

(declare-datatypes ((List!29467 0))(
  ( (Nil!29464) (Cons!29463 (h!30672 (_ BitVec 64)) (t!43031 List!29467)) )
))
(declare-fun arrayNoDuplicates!0 (array!86078 (_ BitVec 32) List!29467) Bool)

(assert (=> b!1295127 (= res!860746 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29464))))

(declare-fun b!1295128 () Bool)

(declare-fun res!860744 () Bool)

(assert (=> b!1295128 (=> (not res!860744) (not e!738978))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295128 (= res!860744 (and (= (size!42091 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42090 _keys!1741) (size!42091 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295129 () Bool)

(declare-fun res!860740 () Bool)

(assert (=> b!1295129 (=> (not res!860740) (not e!738978))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86078 (_ BitVec 32)) Bool)

(assert (=> b!1295129 (= res!860740 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295130 () Bool)

(declare-fun e!738975 () Bool)

(assert (=> b!1295130 (= e!738975 true)))

(declare-datatypes ((tuple2!22324 0))(
  ( (tuple2!22325 (_1!11173 (_ BitVec 64)) (_2!11173 V!51141)) )
))
(declare-datatypes ((List!29468 0))(
  ( (Nil!29465) (Cons!29464 (h!30673 tuple2!22324) (t!43032 List!29468)) )
))
(declare-datatypes ((ListLongMap!19981 0))(
  ( (ListLongMap!19982 (toList!10006 List!29468)) )
))
(declare-fun lt!579820 () ListLongMap!19981)

(declare-fun minValue!1387 () V!51141)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8124 (ListLongMap!19981 (_ BitVec 64)) Bool)

(declare-fun +!4413 (ListLongMap!19981 tuple2!22324) ListLongMap!19981)

(assert (=> b!1295130 (not (contains!8124 (+!4413 lt!579820 (tuple2!22325 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42894 0))(
  ( (Unit!42895) )
))
(declare-fun lt!579819 () Unit!42894)

(declare-fun addStillNotContains!431 (ListLongMap!19981 (_ BitVec 64) V!51141 (_ BitVec 64)) Unit!42894)

(assert (=> b!1295130 (= lt!579819 (addStillNotContains!431 lt!579820 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51141)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6046 (array!86078 array!86080 (_ BitVec 32) (_ BitVec 32) V!51141 V!51141 (_ BitVec 32) Int) ListLongMap!19981)

(assert (=> b!1295130 (= lt!579820 (getCurrentListMapNoExtraKeys!6046 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295131 () Bool)

(assert (=> b!1295131 (= e!738978 (not e!738975))))

(declare-fun res!860745 () Bool)

(assert (=> b!1295131 (=> res!860745 e!738975)))

(assert (=> b!1295131 (= res!860745 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295131 (not (contains!8124 (ListLongMap!19982 Nil!29465) k!1205))))

(declare-fun lt!579821 () Unit!42894)

(declare-fun emptyContainsNothing!167 ((_ BitVec 64)) Unit!42894)

(assert (=> b!1295131 (= lt!579821 (emptyContainsNothing!167 k!1205))))

(declare-fun b!1295132 () Bool)

(declare-fun res!860742 () Bool)

(assert (=> b!1295132 (=> (not res!860742) (not e!738978))))

(declare-fun getCurrentListMap!5042 (array!86078 array!86080 (_ BitVec 32) (_ BitVec 32) V!51141 V!51141 (_ BitVec 32) Int) ListLongMap!19981)

(assert (=> b!1295132 (= res!860742 (contains!8124 (getCurrentListMap!5042 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53354 () Bool)

(assert (=> mapIsEmpty!53354 mapRes!53354))

(declare-fun b!1295133 () Bool)

(declare-fun res!860743 () Bool)

(assert (=> b!1295133 (=> (not res!860743) (not e!738978))))

(assert (=> b!1295133 (= res!860743 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42090 _keys!1741))))))

(declare-fun b!1295134 () Bool)

(assert (=> b!1295134 (= e!738977 (and e!738979 mapRes!53354))))

(declare-fun condMapEmpty!53354 () Bool)

(declare-fun mapDefault!53354 () ValueCell!16366)

