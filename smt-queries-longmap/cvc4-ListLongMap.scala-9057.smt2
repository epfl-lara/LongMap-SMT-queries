; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109130 () Bool)

(assert start!109130)

(declare-fun b_free!28619 () Bool)

(declare-fun b_next!28619 () Bool)

(assert (=> start!109130 (= b_free!28619 (not b_next!28619))))

(declare-fun tp!100975 () Bool)

(declare-fun b_and!46709 () Bool)

(assert (=> start!109130 (= tp!100975 b_and!46709)))

(declare-fun b!1290425 () Bool)

(declare-fun e!736709 () Bool)

(declare-fun tp_is_empty!34259 () Bool)

(assert (=> b!1290425 (= e!736709 tp_is_empty!34259)))

(declare-fun b!1290426 () Bool)

(declare-fun res!857265 () Bool)

(declare-fun e!736710 () Bool)

(assert (=> b!1290426 (=> (not res!857265) (not e!736710))))

(declare-datatypes ((V!50781 0))(
  ( (V!50782 (val!17204 Int)) )
))
(declare-fun minValue!1387 () V!50781)

(declare-fun zeroValue!1387 () V!50781)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85558 0))(
  ( (array!85559 (arr!41280 (Array (_ BitVec 32) (_ BitVec 64))) (size!41830 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85558)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16231 0))(
  ( (ValueCellFull!16231 (v!19807 V!50781)) (EmptyCell!16231) )
))
(declare-datatypes ((array!85560 0))(
  ( (array!85561 (arr!41281 (Array (_ BitVec 32) ValueCell!16231)) (size!41831 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85560)

(declare-datatypes ((tuple2!22106 0))(
  ( (tuple2!22107 (_1!11064 (_ BitVec 64)) (_2!11064 V!50781)) )
))
(declare-datatypes ((List!29273 0))(
  ( (Nil!29270) (Cons!29269 (h!30478 tuple2!22106) (t!42837 List!29273)) )
))
(declare-datatypes ((ListLongMap!19763 0))(
  ( (ListLongMap!19764 (toList!9897 List!29273)) )
))
(declare-fun contains!8015 (ListLongMap!19763 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4955 (array!85558 array!85560 (_ BitVec 32) (_ BitVec 32) V!50781 V!50781 (_ BitVec 32) Int) ListLongMap!19763)

(assert (=> b!1290426 (= res!857265 (contains!8015 (getCurrentListMap!4955 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290427 () Bool)

(declare-fun e!736712 () Bool)

(assert (=> b!1290427 (= e!736712 tp_is_empty!34259)))

(declare-fun b!1290428 () Bool)

(declare-fun e!736707 () Bool)

(assert (=> b!1290428 (= e!736707 true)))

(declare-fun lt!578613 () ListLongMap!19763)

(declare-fun lt!578614 () tuple2!22106)

(declare-fun lt!578609 () Bool)

(declare-fun +!4365 (ListLongMap!19763 tuple2!22106) ListLongMap!19763)

(assert (=> b!1290428 (= lt!578609 (contains!8015 (+!4365 lt!578613 lt!578614) k!1205))))

(declare-fun lt!578611 () ListLongMap!19763)

(assert (=> b!1290428 (not (contains!8015 (+!4365 lt!578611 lt!578614) k!1205))))

(assert (=> b!1290428 (= lt!578614 (tuple2!22107 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387))))

(declare-datatypes ((Unit!42708 0))(
  ( (Unit!42709) )
))
(declare-fun lt!578612 () Unit!42708)

(declare-fun addStillNotContains!383 (ListLongMap!19763 (_ BitVec 64) V!50781 (_ BitVec 64)) Unit!42708)

(assert (=> b!1290428 (= lt!578612 (addStillNotContains!383 lt!578611 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1290428 (not (contains!8015 lt!578613 k!1205))))

(assert (=> b!1290428 (= lt!578613 (+!4365 lt!578611 (tuple2!22107 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!578615 () Unit!42708)

(assert (=> b!1290428 (= lt!578615 (addStillNotContains!383 lt!578611 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!5996 (array!85558 array!85560 (_ BitVec 32) (_ BitVec 32) V!50781 V!50781 (_ BitVec 32) Int) ListLongMap!19763)

(assert (=> b!1290428 (= lt!578611 (getCurrentListMapNoExtraKeys!5996 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290429 () Bool)

(assert (=> b!1290429 (= e!736710 (not e!736707))))

(declare-fun res!857263 () Bool)

(assert (=> b!1290429 (=> res!857263 e!736707)))

(assert (=> b!1290429 (= res!857263 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290429 (not (contains!8015 (ListLongMap!19764 Nil!29270) k!1205))))

(declare-fun lt!578610 () Unit!42708)

(declare-fun emptyContainsNothing!80 ((_ BitVec 64)) Unit!42708)

(assert (=> b!1290429 (= lt!578610 (emptyContainsNothing!80 k!1205))))

(declare-fun b!1290430 () Bool)

(declare-fun e!736711 () Bool)

(declare-fun mapRes!52949 () Bool)

(assert (=> b!1290430 (= e!736711 (and e!736709 mapRes!52949))))

(declare-fun condMapEmpty!52949 () Bool)

(declare-fun mapDefault!52949 () ValueCell!16231)

