; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109418 () Bool)

(assert start!109418)

(declare-fun b_free!28907 () Bool)

(declare-fun b_next!28907 () Bool)

(assert (=> start!109418 (= b_free!28907 (not b_next!28907))))

(declare-fun tp!101840 () Bool)

(declare-fun b_and!46997 () Bool)

(assert (=> start!109418 (= tp!101840 b_and!46997)))

(declare-fun mapNonEmpty!53381 () Bool)

(declare-fun mapRes!53381 () Bool)

(declare-fun tp!101839 () Bool)

(declare-fun e!739139 () Bool)

(assert (=> mapNonEmpty!53381 (= mapRes!53381 (and tp!101839 e!739139))))

(declare-datatypes ((V!51165 0))(
  ( (V!51166 (val!17348 Int)) )
))
(declare-datatypes ((ValueCell!16375 0))(
  ( (ValueCellFull!16375 (v!19951 V!51165)) (EmptyCell!16375) )
))
(declare-fun mapRest!53381 () (Array (_ BitVec 32) ValueCell!16375))

(declare-fun mapKey!53381 () (_ BitVec 32))

(declare-datatypes ((array!86114 0))(
  ( (array!86115 (arr!41558 (Array (_ BitVec 32) ValueCell!16375)) (size!42108 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86114)

(declare-fun mapValue!53381 () ValueCell!16375)

(assert (=> mapNonEmpty!53381 (= (arr!41558 _values!1445) (store mapRest!53381 mapKey!53381 mapValue!53381))))

(declare-fun b!1295447 () Bool)

(declare-fun e!739140 () Bool)

(assert (=> b!1295447 (= e!739140 true)))

(declare-datatypes ((tuple2!22340 0))(
  ( (tuple2!22341 (_1!11181 (_ BitVec 64)) (_2!11181 V!51165)) )
))
(declare-datatypes ((List!29482 0))(
  ( (Nil!29479) (Cons!29478 (h!30687 tuple2!22340) (t!43046 List!29482)) )
))
(declare-datatypes ((ListLongMap!19997 0))(
  ( (ListLongMap!19998 (toList!10014 List!29482)) )
))
(declare-fun lt!579900 () ListLongMap!19997)

(declare-fun minValue!1387 () V!51165)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8132 (ListLongMap!19997 (_ BitVec 64)) Bool)

(declare-fun +!4420 (ListLongMap!19997 tuple2!22340) ListLongMap!19997)

(assert (=> b!1295447 (not (contains!8132 (+!4420 lt!579900 (tuple2!22341 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42908 0))(
  ( (Unit!42909) )
))
(declare-fun lt!579901 () Unit!42908)

(declare-fun addStillNotContains!438 (ListLongMap!19997 (_ BitVec 64) V!51165 (_ BitVec 64)) Unit!42908)

(assert (=> b!1295447 (= lt!579901 (addStillNotContains!438 lt!579900 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun zeroValue!1387 () V!51165)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86116 0))(
  ( (array!86117 (arr!41559 (Array (_ BitVec 32) (_ BitVec 64))) (size!42109 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86116)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun getCurrentListMapNoExtraKeys!6053 (array!86116 array!86114 (_ BitVec 32) (_ BitVec 32) V!51165 V!51165 (_ BitVec 32) Int) ListLongMap!19997)

(assert (=> b!1295447 (= lt!579900 (getCurrentListMapNoExtraKeys!6053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295448 () Bool)

(declare-fun tp_is_empty!34547 () Bool)

(assert (=> b!1295448 (= e!739139 tp_is_empty!34547)))

(declare-fun b!1295450 () Bool)

(declare-fun e!739137 () Bool)

(assert (=> b!1295450 (= e!739137 (not e!739140))))

(declare-fun res!860991 () Bool)

(assert (=> b!1295450 (=> res!860991 e!739140)))

(assert (=> b!1295450 (= res!860991 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295450 (not (contains!8132 (ListLongMap!19998 Nil!29479) k!1205))))

(declare-fun lt!579902 () Unit!42908)

(declare-fun emptyContainsNothing!173 ((_ BitVec 64)) Unit!42908)

(assert (=> b!1295450 (= lt!579902 (emptyContainsNothing!173 k!1205))))

(declare-fun b!1295451 () Bool)

(declare-fun res!860985 () Bool)

(assert (=> b!1295451 (=> (not res!860985) (not e!739137))))

(assert (=> b!1295451 (= res!860985 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42109 _keys!1741))))))

(declare-fun b!1295452 () Bool)

(declare-fun res!860986 () Bool)

(assert (=> b!1295452 (=> (not res!860986) (not e!739137))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295452 (= res!860986 (not (validKeyInArray!0 (select (arr!41559 _keys!1741) from!2144))))))

(declare-fun b!1295453 () Bool)

(declare-fun res!860990 () Bool)

(assert (=> b!1295453 (=> (not res!860990) (not e!739137))))

(declare-fun getCurrentListMap!5048 (array!86116 array!86114 (_ BitVec 32) (_ BitVec 32) V!51165 V!51165 (_ BitVec 32) Int) ListLongMap!19997)

(assert (=> b!1295453 (= res!860990 (contains!8132 (getCurrentListMap!5048 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun mapIsEmpty!53381 () Bool)

(assert (=> mapIsEmpty!53381 mapRes!53381))

(declare-fun b!1295454 () Bool)

(declare-fun e!739141 () Bool)

(assert (=> b!1295454 (= e!739141 tp_is_empty!34547)))

(declare-fun b!1295455 () Bool)

(declare-fun e!739138 () Bool)

(assert (=> b!1295455 (= e!739138 (and e!739141 mapRes!53381))))

(declare-fun condMapEmpty!53381 () Bool)

(declare-fun mapDefault!53381 () ValueCell!16375)

