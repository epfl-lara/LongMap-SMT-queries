; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109322 () Bool)

(assert start!109322)

(declare-fun b_free!28811 () Bool)

(declare-fun b_next!28811 () Bool)

(assert (=> start!109322 (= b_free!28811 (not b_next!28811))))

(declare-fun tp!101552 () Bool)

(declare-fun b_and!46901 () Bool)

(assert (=> start!109322 (= tp!101552 b_and!46901)))

(declare-fun mapNonEmpty!53237 () Bool)

(declare-fun mapRes!53237 () Bool)

(declare-fun tp!101551 () Bool)

(declare-fun e!738357 () Bool)

(assert (=> mapNonEmpty!53237 (= mapRes!53237 (and tp!101551 e!738357))))

(declare-fun mapKey!53237 () (_ BitVec 32))

(declare-datatypes ((V!51037 0))(
  ( (V!51038 (val!17300 Int)) )
))
(declare-datatypes ((ValueCell!16327 0))(
  ( (ValueCellFull!16327 (v!19903 V!51037)) (EmptyCell!16327) )
))
(declare-fun mapRest!53237 () (Array (_ BitVec 32) ValueCell!16327))

(declare-fun mapValue!53237 () ValueCell!16327)

(declare-datatypes ((array!85928 0))(
  ( (array!85929 (arr!41465 (Array (_ BitVec 32) ValueCell!16327)) (size!42015 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85928)

(assert (=> mapNonEmpty!53237 (= (arr!41465 _values!1445) (store mapRest!53237 mapKey!53237 mapValue!53237))))

(declare-fun b!1293800 () Bool)

(declare-fun e!738356 () Bool)

(assert (=> b!1293800 (= e!738356 true)))

(declare-datatypes ((tuple2!22266 0))(
  ( (tuple2!22267 (_1!11144 (_ BitVec 64)) (_2!11144 V!51037)) )
))
(declare-datatypes ((List!29413 0))(
  ( (Nil!29410) (Cons!29409 (h!30618 tuple2!22266) (t!42977 List!29413)) )
))
(declare-datatypes ((ListLongMap!19923 0))(
  ( (ListLongMap!19924 (toList!9977 List!29413)) )
))
(declare-fun lt!579639 () ListLongMap!19923)

(declare-fun zeroValue!1387 () V!51037)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8095 (ListLongMap!19923 (_ BitVec 64)) Bool)

(declare-fun +!4406 (ListLongMap!19923 tuple2!22266) ListLongMap!19923)

(assert (=> b!1293800 (not (contains!8095 (+!4406 lt!579639 (tuple2!22267 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42848 0))(
  ( (Unit!42849) )
))
(declare-fun lt!579641 () Unit!42848)

(declare-fun addStillNotContains!424 (ListLongMap!19923 (_ BitVec 64) V!51037 (_ BitVec 64)) Unit!42848)

(assert (=> b!1293800 (= lt!579641 (addStillNotContains!424 lt!579639 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!51037)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85930 0))(
  ( (array!85931 (arr!41466 (Array (_ BitVec 32) (_ BitVec 64))) (size!42016 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85930)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6038 (array!85930 array!85928 (_ BitVec 32) (_ BitVec 32) V!51037 V!51037 (_ BitVec 32) Int) ListLongMap!19923)

(assert (=> b!1293800 (= lt!579639 (getCurrentListMapNoExtraKeys!6038 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293801 () Bool)

(declare-fun res!859776 () Bool)

(declare-fun e!738354 () Bool)

(assert (=> b!1293801 (=> (not res!859776) (not e!738354))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85930 (_ BitVec 32)) Bool)

(assert (=> b!1293801 (= res!859776 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293802 () Bool)

(declare-fun res!859771 () Bool)

(assert (=> b!1293802 (=> (not res!859771) (not e!738354))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293802 (= res!859771 (not (validKeyInArray!0 (select (arr!41466 _keys!1741) from!2144))))))

(declare-fun mapIsEmpty!53237 () Bool)

(assert (=> mapIsEmpty!53237 mapRes!53237))

(declare-fun b!1293803 () Bool)

(declare-fun res!859775 () Bool)

(assert (=> b!1293803 (=> (not res!859775) (not e!738354))))

(declare-fun getCurrentListMap!5018 (array!85930 array!85928 (_ BitVec 32) (_ BitVec 32) V!51037 V!51037 (_ BitVec 32) Int) ListLongMap!19923)

(assert (=> b!1293803 (= res!859775 (contains!8095 (getCurrentListMap!5018 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1293804 () Bool)

(assert (=> b!1293804 (= e!738354 (not e!738356))))

(declare-fun res!859769 () Bool)

(assert (=> b!1293804 (=> res!859769 e!738356)))

(assert (=> b!1293804 (= res!859769 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293804 (not (contains!8095 (ListLongMap!19924 Nil!29410) k!1205))))

(declare-fun lt!579640 () Unit!42848)

(declare-fun emptyContainsNothing!145 ((_ BitVec 64)) Unit!42848)

(assert (=> b!1293804 (= lt!579640 (emptyContainsNothing!145 k!1205))))

(declare-fun res!859768 () Bool)

(assert (=> start!109322 (=> (not res!859768) (not e!738354))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109322 (= res!859768 (validMask!0 mask!2175))))

(assert (=> start!109322 e!738354))

(declare-fun tp_is_empty!34451 () Bool)

(assert (=> start!109322 tp_is_empty!34451))

(assert (=> start!109322 true))

(declare-fun e!738359 () Bool)

(declare-fun array_inv!31407 (array!85928) Bool)

(assert (=> start!109322 (and (array_inv!31407 _values!1445) e!738359)))

(declare-fun array_inv!31408 (array!85930) Bool)

(assert (=> start!109322 (array_inv!31408 _keys!1741)))

(assert (=> start!109322 tp!101552))

(declare-fun b!1293805 () Bool)

(declare-fun e!738358 () Bool)

(assert (=> b!1293805 (= e!738359 (and e!738358 mapRes!53237))))

(declare-fun condMapEmpty!53237 () Bool)

(declare-fun mapDefault!53237 () ValueCell!16327)

