; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109298 () Bool)

(assert start!109298)

(declare-fun b_free!28787 () Bool)

(declare-fun b_next!28787 () Bool)

(assert (=> start!109298 (= b_free!28787 (not b_next!28787))))

(declare-fun tp!101479 () Bool)

(declare-fun b_and!46877 () Bool)

(assert (=> start!109298 (= tp!101479 b_and!46877)))

(declare-fun b!1293368 () Bool)

(declare-fun e!738143 () Bool)

(declare-fun tp_is_empty!34427 () Bool)

(assert (=> b!1293368 (= e!738143 tp_is_empty!34427)))

(declare-fun b!1293369 () Bool)

(declare-fun res!859450 () Bool)

(declare-fun e!738142 () Bool)

(assert (=> b!1293369 (=> (not res!859450) (not e!738142))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85882 0))(
  ( (array!85883 (arr!41442 (Array (_ BitVec 32) (_ BitVec 64))) (size!41992 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85882)

(assert (=> b!1293369 (= res!859450 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41992 _keys!1741))))))

(declare-fun mapNonEmpty!53201 () Bool)

(declare-fun mapRes!53201 () Bool)

(declare-fun tp!101480 () Bool)

(assert (=> mapNonEmpty!53201 (= mapRes!53201 (and tp!101480 e!738143))))

(declare-datatypes ((V!51005 0))(
  ( (V!51006 (val!17288 Int)) )
))
(declare-datatypes ((ValueCell!16315 0))(
  ( (ValueCellFull!16315 (v!19891 V!51005)) (EmptyCell!16315) )
))
(declare-fun mapRest!53201 () (Array (_ BitVec 32) ValueCell!16315))

(declare-fun mapKey!53201 () (_ BitVec 32))

(declare-fun mapValue!53201 () ValueCell!16315)

(declare-datatypes ((array!85884 0))(
  ( (array!85885 (arr!41443 (Array (_ BitVec 32) ValueCell!16315)) (size!41993 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85884)

(assert (=> mapNonEmpty!53201 (= (arr!41443 _values!1445) (store mapRest!53201 mapKey!53201 mapValue!53201))))

(declare-fun b!1293370 () Bool)

(declare-fun res!859445 () Bool)

(assert (=> b!1293370 (=> (not res!859445) (not e!738142))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1293370 (= res!859445 (not (validKeyInArray!0 (select (arr!41442 _keys!1741) from!2144))))))

(declare-fun b!1293371 () Bool)

(declare-fun e!738139 () Bool)

(assert (=> b!1293371 (= e!738142 (not e!738139))))

(declare-fun res!859448 () Bool)

(assert (=> b!1293371 (=> res!859448 e!738139)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1293371 (= res!859448 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((tuple2!22248 0))(
  ( (tuple2!22249 (_1!11135 (_ BitVec 64)) (_2!11135 V!51005)) )
))
(declare-datatypes ((List!29396 0))(
  ( (Nil!29393) (Cons!29392 (h!30601 tuple2!22248) (t!42960 List!29396)) )
))
(declare-datatypes ((ListLongMap!19905 0))(
  ( (ListLongMap!19906 (toList!9968 List!29396)) )
))
(declare-fun contains!8086 (ListLongMap!19905 (_ BitVec 64)) Bool)

(assert (=> b!1293371 (not (contains!8086 (ListLongMap!19906 Nil!29393) k!1205))))

(declare-datatypes ((Unit!42834 0))(
  ( (Unit!42835) )
))
(declare-fun lt!579533 () Unit!42834)

(declare-fun emptyContainsNothing!138 ((_ BitVec 64)) Unit!42834)

(assert (=> b!1293371 (= lt!579533 (emptyContainsNothing!138 k!1205))))

(declare-fun b!1293372 () Bool)

(declare-fun res!859451 () Bool)

(assert (=> b!1293372 (=> (not res!859451) (not e!738142))))

(declare-datatypes ((List!29397 0))(
  ( (Nil!29394) (Cons!29393 (h!30602 (_ BitVec 64)) (t!42961 List!29397)) )
))
(declare-fun arrayNoDuplicates!0 (array!85882 (_ BitVec 32) List!29397) Bool)

(assert (=> b!1293372 (= res!859451 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29394))))

(declare-fun b!1293373 () Bool)

(declare-fun res!859444 () Bool)

(assert (=> b!1293373 (=> (not res!859444) (not e!738142))))

(assert (=> b!1293373 (= res!859444 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41992 _keys!1741))))))

(declare-fun b!1293374 () Bool)

(declare-fun res!859447 () Bool)

(assert (=> b!1293374 (=> (not res!859447) (not e!738142))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85882 (_ BitVec 32)) Bool)

(assert (=> b!1293374 (= res!859447 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1293375 () Bool)

(declare-fun res!859446 () Bool)

(assert (=> b!1293375 (=> (not res!859446) (not e!738142))))

(declare-fun minValue!1387 () V!51005)

(declare-fun zeroValue!1387 () V!51005)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5010 (array!85882 array!85884 (_ BitVec 32) (_ BitVec 32) V!51005 V!51005 (_ BitVec 32) Int) ListLongMap!19905)

(assert (=> b!1293375 (= res!859446 (contains!8086 (getCurrentListMap!5010 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53201 () Bool)

(assert (=> mapIsEmpty!53201 mapRes!53201))

(declare-fun b!1293376 () Bool)

(assert (=> b!1293376 (= e!738139 true)))

(declare-fun lt!579531 () ListLongMap!19905)

(declare-fun +!4401 (ListLongMap!19905 tuple2!22248) ListLongMap!19905)

(assert (=> b!1293376 (not (contains!8086 (+!4401 lt!579531 (tuple2!22249 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-fun lt!579532 () Unit!42834)

(declare-fun addStillNotContains!419 (ListLongMap!19905 (_ BitVec 64) V!51005 (_ BitVec 64)) Unit!42834)

(assert (=> b!1293376 (= lt!579532 (addStillNotContains!419 lt!579531 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6033 (array!85882 array!85884 (_ BitVec 32) (_ BitVec 32) V!51005 V!51005 (_ BitVec 32) Int) ListLongMap!19905)

(assert (=> b!1293376 (= lt!579531 (getCurrentListMapNoExtraKeys!6033 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1293377 () Bool)

(declare-fun res!859452 () Bool)

(assert (=> b!1293377 (=> (not res!859452) (not e!738142))))

(assert (=> b!1293377 (= res!859452 (and (= (size!41993 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41992 _keys!1741) (size!41993 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293378 () Bool)

(declare-fun e!738141 () Bool)

(declare-fun e!738138 () Bool)

(assert (=> b!1293378 (= e!738141 (and e!738138 mapRes!53201))))

(declare-fun condMapEmpty!53201 () Bool)

(declare-fun mapDefault!53201 () ValueCell!16315)

