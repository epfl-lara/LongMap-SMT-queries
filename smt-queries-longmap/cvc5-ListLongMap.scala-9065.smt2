; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109174 () Bool)

(assert start!109174)

(declare-fun b_free!28663 () Bool)

(declare-fun b_next!28663 () Bool)

(assert (=> start!109174 (= b_free!28663 (not b_next!28663))))

(declare-fun tp!101107 () Bool)

(declare-fun b_and!46753 () Bool)

(assert (=> start!109174 (= tp!101107 b_and!46753)))

(declare-fun b!1291217 () Bool)

(declare-fun res!857858 () Bool)

(declare-fun e!737106 () Bool)

(assert (=> b!1291217 (=> (not res!857858) (not e!737106))))

(declare-datatypes ((V!50841 0))(
  ( (V!50842 (val!17226 Int)) )
))
(declare-fun minValue!1387 () V!50841)

(declare-fun zeroValue!1387 () V!50841)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16253 0))(
  ( (ValueCellFull!16253 (v!19829 V!50841)) (EmptyCell!16253) )
))
(declare-datatypes ((array!85642 0))(
  ( (array!85643 (arr!41322 (Array (_ BitVec 32) ValueCell!16253)) (size!41872 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85642)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((array!85644 0))(
  ( (array!85645 (arr!41323 (Array (_ BitVec 32) (_ BitVec 64))) (size!41873 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85644)

(declare-datatypes ((tuple2!22144 0))(
  ( (tuple2!22145 (_1!11083 (_ BitVec 64)) (_2!11083 V!50841)) )
))
(declare-datatypes ((List!29304 0))(
  ( (Nil!29301) (Cons!29300 (h!30509 tuple2!22144) (t!42868 List!29304)) )
))
(declare-datatypes ((ListLongMap!19801 0))(
  ( (ListLongMap!19802 (toList!9916 List!29304)) )
))
(declare-fun contains!8034 (ListLongMap!19801 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4968 (array!85644 array!85642 (_ BitVec 32) (_ BitVec 32) V!50841 V!50841 (_ BitVec 32) Int) ListLongMap!19801)

(assert (=> b!1291217 (= res!857858 (contains!8034 (getCurrentListMap!4968 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291218 () Bool)

(declare-fun e!737108 () Bool)

(assert (=> b!1291218 (= e!737108 true)))

(assert (=> b!1291218 false))

(declare-fun lt!579018 () ListLongMap!19801)

(declare-datatypes ((Unit!42744 0))(
  ( (Unit!42745) )
))
(declare-fun lt!579016 () Unit!42744)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!54 ((_ BitVec 64) (_ BitVec 64) V!50841 ListLongMap!19801) Unit!42744)

(assert (=> b!1291218 (= lt!579016 (lemmaInListMapAfterAddingDiffThenInBefore!54 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579018))))

(declare-fun lt!579019 () ListLongMap!19801)

(declare-fun +!4380 (ListLongMap!19801 tuple2!22144) ListLongMap!19801)

(assert (=> b!1291218 (not (contains!8034 (+!4380 lt!579019 (tuple2!22145 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579020 () Unit!42744)

(declare-fun addStillNotContains!398 (ListLongMap!19801 (_ BitVec 64) V!50841 (_ BitVec 64)) Unit!42744)

(assert (=> b!1291218 (= lt!579020 (addStillNotContains!398 lt!579019 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291218 (not (contains!8034 lt!579018 k!1205))))

(assert (=> b!1291218 (= lt!579018 (+!4380 lt!579019 (tuple2!22145 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579017 () Unit!42744)

(assert (=> b!1291218 (= lt!579017 (addStillNotContains!398 lt!579019 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6011 (array!85644 array!85642 (_ BitVec 32) (_ BitVec 32) V!50841 V!50841 (_ BitVec 32) Int) ListLongMap!19801)

(assert (=> b!1291218 (= lt!579019 (getCurrentListMapNoExtraKeys!6011 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53015 () Bool)

(declare-fun mapRes!53015 () Bool)

(assert (=> mapIsEmpty!53015 mapRes!53015))

(declare-fun b!1291219 () Bool)

(assert (=> b!1291219 (= e!737106 (not e!737108))))

(declare-fun res!857855 () Bool)

(assert (=> b!1291219 (=> res!857855 e!737108)))

(assert (=> b!1291219 (= res!857855 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291219 (not (contains!8034 (ListLongMap!19802 Nil!29301) k!1205))))

(declare-fun lt!579015 () Unit!42744)

(declare-fun emptyContainsNothing!96 ((_ BitVec 64)) Unit!42744)

(assert (=> b!1291219 (= lt!579015 (emptyContainsNothing!96 k!1205))))

(declare-fun b!1291220 () Bool)

(declare-fun res!857854 () Bool)

(assert (=> b!1291220 (=> (not res!857854) (not e!737106))))

(assert (=> b!1291220 (= res!857854 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41873 _keys!1741))))))

(declare-fun res!857857 () Bool)

(assert (=> start!109174 (=> (not res!857857) (not e!737106))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109174 (= res!857857 (validMask!0 mask!2175))))

(assert (=> start!109174 e!737106))

(declare-fun tp_is_empty!34303 () Bool)

(assert (=> start!109174 tp_is_empty!34303))

(assert (=> start!109174 true))

(declare-fun e!737103 () Bool)

(declare-fun array_inv!31313 (array!85642) Bool)

(assert (=> start!109174 (and (array_inv!31313 _values!1445) e!737103)))

(declare-fun array_inv!31314 (array!85644) Bool)

(assert (=> start!109174 (array_inv!31314 _keys!1741)))

(assert (=> start!109174 tp!101107))

(declare-fun b!1291221 () Bool)

(declare-fun e!737107 () Bool)

(assert (=> b!1291221 (= e!737103 (and e!737107 mapRes!53015))))

(declare-fun condMapEmpty!53015 () Bool)

(declare-fun mapDefault!53015 () ValueCell!16253)

