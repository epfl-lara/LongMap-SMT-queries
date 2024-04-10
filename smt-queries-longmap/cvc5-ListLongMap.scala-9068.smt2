; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109192 () Bool)

(assert start!109192)

(declare-fun b_free!28681 () Bool)

(declare-fun b_next!28681 () Bool)

(assert (=> start!109192 (= b_free!28681 (not b_next!28681))))

(declare-fun tp!101161 () Bool)

(declare-fun b_and!46771 () Bool)

(assert (=> start!109192 (= tp!101161 b_and!46771)))

(declare-fun b!1291541 () Bool)

(declare-fun res!858095 () Bool)

(declare-fun e!737268 () Bool)

(assert (=> b!1291541 (=> (not res!858095) (not e!737268))))

(declare-datatypes ((array!85678 0))(
  ( (array!85679 (arr!41340 (Array (_ BitVec 32) (_ BitVec 64))) (size!41890 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85678)

(declare-datatypes ((List!29318 0))(
  ( (Nil!29315) (Cons!29314 (h!30523 (_ BitVec 64)) (t!42882 List!29318)) )
))
(declare-fun arrayNoDuplicates!0 (array!85678 (_ BitVec 32) List!29318) Bool)

(assert (=> b!1291541 (= res!858095 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29315))))

(declare-fun b!1291542 () Bool)

(declare-fun res!858099 () Bool)

(assert (=> b!1291542 (=> (not res!858099) (not e!737268))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1291542 (= res!858099 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41890 _keys!1741))))))

(declare-fun res!858096 () Bool)

(assert (=> start!109192 (=> (not res!858096) (not e!737268))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109192 (= res!858096 (validMask!0 mask!2175))))

(assert (=> start!109192 e!737268))

(declare-fun tp_is_empty!34321 () Bool)

(assert (=> start!109192 tp_is_empty!34321))

(assert (=> start!109192 true))

(declare-datatypes ((V!50865 0))(
  ( (V!50866 (val!17235 Int)) )
))
(declare-datatypes ((ValueCell!16262 0))(
  ( (ValueCellFull!16262 (v!19838 V!50865)) (EmptyCell!16262) )
))
(declare-datatypes ((array!85680 0))(
  ( (array!85681 (arr!41341 (Array (_ BitVec 32) ValueCell!16262)) (size!41891 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85680)

(declare-fun e!737265 () Bool)

(declare-fun array_inv!31325 (array!85680) Bool)

(assert (=> start!109192 (and (array_inv!31325 _values!1445) e!737265)))

(declare-fun array_inv!31326 (array!85678) Bool)

(assert (=> start!109192 (array_inv!31326 _keys!1741)))

(assert (=> start!109192 tp!101161))

(declare-fun b!1291543 () Bool)

(declare-fun e!737267 () Bool)

(assert (=> b!1291543 (= e!737268 (not e!737267))))

(declare-fun res!858098 () Bool)

(assert (=> b!1291543 (=> res!858098 e!737267)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291543 (= res!858098 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22162 0))(
  ( (tuple2!22163 (_1!11092 (_ BitVec 64)) (_2!11092 V!50865)) )
))
(declare-datatypes ((List!29319 0))(
  ( (Nil!29316) (Cons!29315 (h!30524 tuple2!22162) (t!42883 List!29319)) )
))
(declare-datatypes ((ListLongMap!19819 0))(
  ( (ListLongMap!19820 (toList!9925 List!29319)) )
))
(declare-fun contains!8043 (ListLongMap!19819 (_ BitVec 64)) Bool)

(assert (=> b!1291543 (not (contains!8043 (ListLongMap!19820 Nil!29316) k!1205))))

(declare-datatypes ((Unit!42760 0))(
  ( (Unit!42761) )
))
(declare-fun lt!579181 () Unit!42760)

(declare-fun emptyContainsNothing!102 ((_ BitVec 64)) Unit!42760)

(assert (=> b!1291543 (= lt!579181 (emptyContainsNothing!102 k!1205))))

(declare-fun b!1291544 () Bool)

(declare-fun res!858097 () Bool)

(assert (=> b!1291544 (=> (not res!858097) (not e!737268))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291544 (= res!858097 (not (validKeyInArray!0 (select (arr!41340 _keys!1741) from!2144))))))

(declare-fun b!1291545 () Bool)

(declare-fun res!858094 () Bool)

(assert (=> b!1291545 (=> (not res!858094) (not e!737268))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85678 (_ BitVec 32)) Bool)

(assert (=> b!1291545 (= res!858094 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53042 () Bool)

(declare-fun mapRes!53042 () Bool)

(assert (=> mapIsEmpty!53042 mapRes!53042))

(declare-fun b!1291546 () Bool)

(declare-fun e!737269 () Bool)

(assert (=> b!1291546 (= e!737269 tp_is_empty!34321)))

(declare-fun b!1291547 () Bool)

(declare-fun res!858102 () Bool)

(assert (=> b!1291547 (=> (not res!858102) (not e!737268))))

(assert (=> b!1291547 (= res!858102 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41890 _keys!1741))))))

(declare-fun b!1291548 () Bool)

(declare-fun e!737270 () Bool)

(assert (=> b!1291548 (= e!737270 tp_is_empty!34321)))

(declare-fun b!1291549 () Bool)

(assert (=> b!1291549 (= e!737267 true)))

(assert (=> b!1291549 false))

(declare-fun minValue!1387 () V!50865)

(declare-fun lt!579182 () ListLongMap!19819)

(declare-fun lt!579180 () Unit!42760)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!62 ((_ BitVec 64) (_ BitVec 64) V!50865 ListLongMap!19819) Unit!42760)

(assert (=> b!1291549 (= lt!579180 (lemmaInListMapAfterAddingDiffThenInBefore!62 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579182))))

(declare-fun lt!579179 () ListLongMap!19819)

(declare-fun +!4388 (ListLongMap!19819 tuple2!22162) ListLongMap!19819)

(assert (=> b!1291549 (not (contains!8043 (+!4388 lt!579179 (tuple2!22163 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579178 () Unit!42760)

(declare-fun addStillNotContains!406 (ListLongMap!19819 (_ BitVec 64) V!50865 (_ BitVec 64)) Unit!42760)

(assert (=> b!1291549 (= lt!579178 (addStillNotContains!406 lt!579179 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291549 (not (contains!8043 lt!579182 k!1205))))

(declare-fun zeroValue!1387 () V!50865)

(assert (=> b!1291549 (= lt!579182 (+!4388 lt!579179 (tuple2!22163 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579177 () Unit!42760)

(assert (=> b!1291549 (= lt!579177 (addStillNotContains!406 lt!579179 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6019 (array!85678 array!85680 (_ BitVec 32) (_ BitVec 32) V!50865 V!50865 (_ BitVec 32) Int) ListLongMap!19819)

(assert (=> b!1291549 (= lt!579179 (getCurrentListMapNoExtraKeys!6019 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291550 () Bool)

(assert (=> b!1291550 (= e!737265 (and e!737270 mapRes!53042))))

(declare-fun condMapEmpty!53042 () Bool)

(declare-fun mapDefault!53042 () ValueCell!16262)

