; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109118 () Bool)

(assert start!109118)

(declare-fun b_free!28607 () Bool)

(declare-fun b_next!28607 () Bool)

(assert (=> start!109118 (= b_free!28607 (not b_next!28607))))

(declare-fun tp!100939 () Bool)

(declare-fun b_and!46697 () Bool)

(assert (=> start!109118 (= tp!100939 b_and!46697)))

(declare-fun b!1290209 () Bool)

(declare-fun e!736600 () Bool)

(declare-fun tp_is_empty!34247 () Bool)

(assert (=> b!1290209 (= e!736600 tp_is_empty!34247)))

(declare-fun mapNonEmpty!52931 () Bool)

(declare-fun mapRes!52931 () Bool)

(declare-fun tp!100940 () Bool)

(assert (=> mapNonEmpty!52931 (= mapRes!52931 (and tp!100940 e!736600))))

(declare-datatypes ((V!50765 0))(
  ( (V!50766 (val!17198 Int)) )
))
(declare-datatypes ((ValueCell!16225 0))(
  ( (ValueCellFull!16225 (v!19801 V!50765)) (EmptyCell!16225) )
))
(declare-fun mapRest!52931 () (Array (_ BitVec 32) ValueCell!16225))

(declare-fun mapValue!52931 () ValueCell!16225)

(declare-datatypes ((array!85536 0))(
  ( (array!85537 (arr!41269 (Array (_ BitVec 32) ValueCell!16225)) (size!41819 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85536)

(declare-fun mapKey!52931 () (_ BitVec 32))

(assert (=> mapNonEmpty!52931 (= (arr!41269 _values!1445) (store mapRest!52931 mapKey!52931 mapValue!52931))))

(declare-fun res!857097 () Bool)

(declare-fun e!736599 () Bool)

(assert (=> start!109118 (=> (not res!857097) (not e!736599))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109118 (= res!857097 (validMask!0 mask!2175))))

(assert (=> start!109118 e!736599))

(assert (=> start!109118 tp_is_empty!34247))

(assert (=> start!109118 true))

(declare-fun e!736603 () Bool)

(declare-fun array_inv!31279 (array!85536) Bool)

(assert (=> start!109118 (and (array_inv!31279 _values!1445) e!736603)))

(declare-datatypes ((array!85538 0))(
  ( (array!85539 (arr!41270 (Array (_ BitVec 32) (_ BitVec 64))) (size!41820 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85538)

(declare-fun array_inv!31280 (array!85538) Bool)

(assert (=> start!109118 (array_inv!31280 _keys!1741)))

(assert (=> start!109118 tp!100939))

(declare-fun b!1290210 () Bool)

(declare-fun res!857101 () Bool)

(assert (=> b!1290210 (=> (not res!857101) (not e!736599))))

(declare-datatypes ((List!29263 0))(
  ( (Nil!29260) (Cons!29259 (h!30468 (_ BitVec 64)) (t!42827 List!29263)) )
))
(declare-fun arrayNoDuplicates!0 (array!85538 (_ BitVec 32) List!29263) Bool)

(assert (=> b!1290210 (= res!857101 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29260))))

(declare-fun b!1290211 () Bool)

(declare-fun res!857096 () Bool)

(assert (=> b!1290211 (=> (not res!857096) (not e!736599))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85538 (_ BitVec 32)) Bool)

(assert (=> b!1290211 (= res!857096 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1290212 () Bool)

(declare-fun e!736602 () Bool)

(assert (=> b!1290212 (= e!736602 true)))

(declare-datatypes ((tuple2!22096 0))(
  ( (tuple2!22097 (_1!11059 (_ BitVec 64)) (_2!11059 V!50765)) )
))
(declare-datatypes ((List!29264 0))(
  ( (Nil!29261) (Cons!29260 (h!30469 tuple2!22096) (t!42828 List!29264)) )
))
(declare-datatypes ((ListLongMap!19753 0))(
  ( (ListLongMap!19754 (toList!9892 List!29264)) )
))
(declare-fun lt!578516 () ListLongMap!19753)

(declare-fun minValue!1387 () V!50765)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8010 (ListLongMap!19753 (_ BitVec 64)) Bool)

(declare-fun +!4361 (ListLongMap!19753 tuple2!22096) ListLongMap!19753)

(assert (=> b!1290212 (not (contains!8010 (+!4361 lt!578516 (tuple2!22097 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42698 0))(
  ( (Unit!42699) )
))
(declare-fun lt!578515 () Unit!42698)

(declare-fun addStillNotContains!379 (ListLongMap!19753 (_ BitVec 64) V!50765 (_ BitVec 64)) Unit!42698)

(assert (=> b!1290212 (= lt!578515 (addStillNotContains!379 lt!578516 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!50765)

(assert (=> b!1290212 (not (contains!8010 (+!4361 lt!578516 (tuple2!22097 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!578513 () Unit!42698)

(assert (=> b!1290212 (= lt!578513 (addStillNotContains!379 lt!578516 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!5992 (array!85538 array!85536 (_ BitVec 32) (_ BitVec 32) V!50765 V!50765 (_ BitVec 32) Int) ListLongMap!19753)

(assert (=> b!1290212 (= lt!578516 (getCurrentListMapNoExtraKeys!5992 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1290213 () Bool)

(declare-fun res!857102 () Bool)

(assert (=> b!1290213 (=> (not res!857102) (not e!736599))))

(declare-fun getCurrentListMap!4950 (array!85538 array!85536 (_ BitVec 32) (_ BitVec 32) V!50765 V!50765 (_ BitVec 32) Int) ListLongMap!19753)

(assert (=> b!1290213 (= res!857102 (contains!8010 (getCurrentListMap!4950 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1290214 () Bool)

(declare-fun res!857103 () Bool)

(assert (=> b!1290214 (=> (not res!857103) (not e!736599))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1290214 (= res!857103 (not (validKeyInArray!0 (select (arr!41270 _keys!1741) from!2144))))))

(declare-fun b!1290215 () Bool)

(declare-fun res!857095 () Bool)

(assert (=> b!1290215 (=> (not res!857095) (not e!736599))))

(assert (=> b!1290215 (= res!857095 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41820 _keys!1741))))))

(declare-fun b!1290216 () Bool)

(declare-fun res!857098 () Bool)

(assert (=> b!1290216 (=> (not res!857098) (not e!736599))))

(assert (=> b!1290216 (= res!857098 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41820 _keys!1741))))))

(declare-fun b!1290217 () Bool)

(declare-fun res!857099 () Bool)

(assert (=> b!1290217 (=> (not res!857099) (not e!736599))))

(assert (=> b!1290217 (= res!857099 (and (= (size!41819 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41820 _keys!1741) (size!41819 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1290218 () Bool)

(assert (=> b!1290218 (= e!736599 (not e!736602))))

(declare-fun res!857100 () Bool)

(assert (=> b!1290218 (=> res!857100 e!736602)))

(assert (=> b!1290218 (= res!857100 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1290218 (not (contains!8010 (ListLongMap!19754 Nil!29261) k!1205))))

(declare-fun lt!578514 () Unit!42698)

(declare-fun emptyContainsNothing!75 ((_ BitVec 64)) Unit!42698)

(assert (=> b!1290218 (= lt!578514 (emptyContainsNothing!75 k!1205))))

(declare-fun mapIsEmpty!52931 () Bool)

(assert (=> mapIsEmpty!52931 mapRes!52931))

(declare-fun b!1290219 () Bool)

(declare-fun e!736604 () Bool)

(assert (=> b!1290219 (= e!736603 (and e!736604 mapRes!52931))))

(declare-fun condMapEmpty!52931 () Bool)

(declare-fun mapDefault!52931 () ValueCell!16225)

