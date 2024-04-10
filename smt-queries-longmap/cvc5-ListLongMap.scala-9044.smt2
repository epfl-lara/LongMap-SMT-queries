; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109048 () Bool)

(assert start!109048)

(declare-fun b_free!28537 () Bool)

(declare-fun b_next!28537 () Bool)

(assert (=> start!109048 (= b_free!28537 (not b_next!28537))))

(declare-fun tp!100729 () Bool)

(declare-fun b_and!46627 () Bool)

(assert (=> start!109048 (= tp!100729 b_and!46627)))

(declare-fun b!1288949 () Bool)

(declare-fun res!856150 () Bool)

(declare-fun e!735974 () Bool)

(assert (=> b!1288949 (=> (not res!856150) (not e!735974))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((array!85398 0))(
  ( (array!85399 (arr!41200 (Array (_ BitVec 32) (_ BitVec 64))) (size!41750 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85398)

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1288949 (= res!856150 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41750 _keys!1741))))))

(declare-fun b!1288950 () Bool)

(declare-fun e!735969 () Bool)

(declare-fun tp_is_empty!34177 () Bool)

(assert (=> b!1288950 (= e!735969 tp_is_empty!34177)))

(declare-fun b!1288951 () Bool)

(declare-fun e!735971 () Bool)

(assert (=> b!1288951 (= e!735971 true)))

(declare-datatypes ((V!50673 0))(
  ( (V!50674 (val!17163 Int)) )
))
(declare-datatypes ((tuple2!22040 0))(
  ( (tuple2!22041 (_1!11031 (_ BitVec 64)) (_2!11031 V!50673)) )
))
(declare-datatypes ((List!29211 0))(
  ( (Nil!29208) (Cons!29207 (h!30416 tuple2!22040) (t!42775 List!29211)) )
))
(declare-datatypes ((ListLongMap!19697 0))(
  ( (ListLongMap!19698 (toList!9864 List!29211)) )
))
(declare-fun lt!578118 () ListLongMap!19697)

(declare-fun zeroValue!1387 () V!50673)

(declare-fun contains!7982 (ListLongMap!19697 (_ BitVec 64)) Bool)

(declare-fun +!4336 (ListLongMap!19697 tuple2!22040) ListLongMap!19697)

(assert (=> b!1288951 (not (contains!7982 (+!4336 lt!578118 (tuple2!22041 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42646 0))(
  ( (Unit!42647) )
))
(declare-fun lt!578119 () Unit!42646)

(declare-fun addStillNotContains!354 (ListLongMap!19697 (_ BitVec 64) V!50673 (_ BitVec 64)) Unit!42646)

(assert (=> b!1288951 (= lt!578119 (addStillNotContains!354 lt!578118 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50673)

(declare-datatypes ((ValueCell!16190 0))(
  ( (ValueCellFull!16190 (v!19766 V!50673)) (EmptyCell!16190) )
))
(declare-datatypes ((array!85400 0))(
  ( (array!85401 (arr!41201 (Array (_ BitVec 32) ValueCell!16190)) (size!41751 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85400)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!5967 (array!85398 array!85400 (_ BitVec 32) (_ BitVec 32) V!50673 V!50673 (_ BitVec 32) Int) ListLongMap!19697)

(assert (=> b!1288951 (= lt!578118 (getCurrentListMapNoExtraKeys!5967 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!52826 () Bool)

(declare-fun mapRes!52826 () Bool)

(assert (=> mapIsEmpty!52826 mapRes!52826))

(declare-fun b!1288952 () Bool)

(assert (=> b!1288952 (= e!735974 (not e!735971))))

(declare-fun res!856154 () Bool)

(assert (=> b!1288952 (=> res!856154 e!735971)))

(assert (=> b!1288952 (= res!856154 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1288952 (not (contains!7982 (ListLongMap!19698 Nil!29208) k!1205))))

(declare-fun lt!578120 () Unit!42646)

(declare-fun emptyContainsNothing!52 ((_ BitVec 64)) Unit!42646)

(assert (=> b!1288952 (= lt!578120 (emptyContainsNothing!52 k!1205))))

(declare-fun b!1288953 () Bool)

(declare-fun res!856156 () Bool)

(assert (=> b!1288953 (=> (not res!856156) (not e!735974))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1288953 (= res!856156 (not (validKeyInArray!0 (select (arr!41200 _keys!1741) from!2144))))))

(declare-fun b!1288954 () Bool)

(declare-fun res!856158 () Bool)

(assert (=> b!1288954 (=> (not res!856158) (not e!735974))))

(declare-fun getCurrentListMap!4925 (array!85398 array!85400 (_ BitVec 32) (_ BitVec 32) V!50673 V!50673 (_ BitVec 32) Int) ListLongMap!19697)

(assert (=> b!1288954 (= res!856158 (contains!7982 (getCurrentListMap!4925 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1288955 () Bool)

(declare-fun res!856157 () Bool)

(assert (=> b!1288955 (=> (not res!856157) (not e!735974))))

(assert (=> b!1288955 (= res!856157 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41750 _keys!1741))))))

(declare-fun b!1288956 () Bool)

(declare-fun e!735972 () Bool)

(assert (=> b!1288956 (= e!735972 tp_is_empty!34177)))

(declare-fun b!1288958 () Bool)

(declare-fun res!856153 () Bool)

(assert (=> b!1288958 (=> (not res!856153) (not e!735974))))

(declare-datatypes ((List!29212 0))(
  ( (Nil!29209) (Cons!29208 (h!30417 (_ BitVec 64)) (t!42776 List!29212)) )
))
(declare-fun arrayNoDuplicates!0 (array!85398 (_ BitVec 32) List!29212) Bool)

(assert (=> b!1288958 (= res!856153 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29209))))

(declare-fun mapNonEmpty!52826 () Bool)

(declare-fun tp!100730 () Bool)

(assert (=> mapNonEmpty!52826 (= mapRes!52826 (and tp!100730 e!735972))))

(declare-fun mapValue!52826 () ValueCell!16190)

(declare-fun mapRest!52826 () (Array (_ BitVec 32) ValueCell!16190))

(declare-fun mapKey!52826 () (_ BitVec 32))

(assert (=> mapNonEmpty!52826 (= (arr!41201 _values!1445) (store mapRest!52826 mapKey!52826 mapValue!52826))))

(declare-fun b!1288959 () Bool)

(declare-fun e!735970 () Bool)

(assert (=> b!1288959 (= e!735970 (and e!735969 mapRes!52826))))

(declare-fun condMapEmpty!52826 () Bool)

(declare-fun mapDefault!52826 () ValueCell!16190)

