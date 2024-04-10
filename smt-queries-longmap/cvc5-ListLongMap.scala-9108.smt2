; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109432 () Bool)

(assert start!109432)

(declare-fun b_free!28921 () Bool)

(declare-fun b_next!28921 () Bool)

(assert (=> start!109432 (= b_free!28921 (not b_next!28921))))

(declare-fun tp!101881 () Bool)

(declare-fun b_and!47011 () Bool)

(assert (=> start!109432 (= tp!101881 b_and!47011)))

(declare-fun mapNonEmpty!53402 () Bool)

(declare-fun mapRes!53402 () Bool)

(declare-fun tp!101882 () Bool)

(declare-fun e!739268 () Bool)

(assert (=> mapNonEmpty!53402 (= mapRes!53402 (and tp!101882 e!739268))))

(declare-datatypes ((V!51185 0))(
  ( (V!51186 (val!17355 Int)) )
))
(declare-datatypes ((ValueCell!16382 0))(
  ( (ValueCellFull!16382 (v!19958 V!51185)) (EmptyCell!16382) )
))
(declare-fun mapRest!53402 () (Array (_ BitVec 32) ValueCell!16382))

(declare-fun mapKey!53402 () (_ BitVec 32))

(declare-datatypes ((array!86142 0))(
  ( (array!86143 (arr!41572 (Array (_ BitVec 32) ValueCell!16382)) (size!42122 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86142)

(declare-fun mapValue!53402 () ValueCell!16382)

(assert (=> mapNonEmpty!53402 (= (arr!41572 _values!1445) (store mapRest!53402 mapKey!53402 mapValue!53402))))

(declare-fun b!1295699 () Bool)

(declare-fun tp_is_empty!34561 () Bool)

(assert (=> b!1295699 (= e!739268 tp_is_empty!34561)))

(declare-fun b!1295700 () Bool)

(declare-fun res!861175 () Bool)

(declare-fun e!739264 () Bool)

(assert (=> b!1295700 (=> (not res!861175) (not e!739264))))

(declare-datatypes ((array!86144 0))(
  ( (array!86145 (arr!41573 (Array (_ BitVec 32) (_ BitVec 64))) (size!42123 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86144)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295700 (= res!861175 (not (validKeyInArray!0 (select (arr!41573 _keys!1741) from!2144))))))

(declare-fun res!861177 () Bool)

(assert (=> start!109432 (=> (not res!861177) (not e!739264))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109432 (= res!861177 (validMask!0 mask!2175))))

(assert (=> start!109432 e!739264))

(assert (=> start!109432 tp_is_empty!34561))

(assert (=> start!109432 true))

(declare-fun e!739265 () Bool)

(declare-fun array_inv!31473 (array!86142) Bool)

(assert (=> start!109432 (and (array_inv!31473 _values!1445) e!739265)))

(declare-fun array_inv!31474 (array!86144) Bool)

(assert (=> start!109432 (array_inv!31474 _keys!1741)))

(assert (=> start!109432 tp!101881))

(declare-fun b!1295701 () Bool)

(declare-fun res!861180 () Bool)

(assert (=> b!1295701 (=> (not res!861180) (not e!739264))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86144 (_ BitVec 32)) Bool)

(assert (=> b!1295701 (= res!861180 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295702 () Bool)

(declare-fun res!861173 () Bool)

(assert (=> b!1295702 (=> (not res!861173) (not e!739264))))

(declare-fun k!1205 () (_ BitVec 64))

(assert (=> b!1295702 (= res!861173 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42123 _keys!1741))))))

(declare-fun b!1295703 () Bool)

(declare-fun e!739266 () Bool)

(assert (=> b!1295703 (= e!739264 (not e!739266))))

(declare-fun res!861178 () Bool)

(assert (=> b!1295703 (=> res!861178 e!739266)))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1295703 (= res!861178 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(declare-datatypes ((tuple2!22352 0))(
  ( (tuple2!22353 (_1!11187 (_ BitVec 64)) (_2!11187 V!51185)) )
))
(declare-datatypes ((List!29493 0))(
  ( (Nil!29490) (Cons!29489 (h!30698 tuple2!22352) (t!43057 List!29493)) )
))
(declare-datatypes ((ListLongMap!20009 0))(
  ( (ListLongMap!20010 (toList!10020 List!29493)) )
))
(declare-fun contains!8138 (ListLongMap!20009 (_ BitVec 64)) Bool)

(assert (=> b!1295703 (not (contains!8138 (ListLongMap!20010 Nil!29490) k!1205))))

(declare-datatypes ((Unit!42918 0))(
  ( (Unit!42919) )
))
(declare-fun lt!579965 () Unit!42918)

(declare-fun emptyContainsNothing!178 ((_ BitVec 64)) Unit!42918)

(assert (=> b!1295703 (= lt!579965 (emptyContainsNothing!178 k!1205))))

(declare-fun b!1295704 () Bool)

(declare-fun res!861176 () Bool)

(assert (=> b!1295704 (=> (not res!861176) (not e!739264))))

(declare-fun zeroValue!1387 () V!51185)

(declare-fun minValue!1387 () V!51185)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5053 (array!86144 array!86142 (_ BitVec 32) (_ BitVec 32) V!51185 V!51185 (_ BitVec 32) Int) ListLongMap!20009)

(assert (=> b!1295704 (= res!861176 (contains!8138 (getCurrentListMap!5053 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1295705 () Bool)

(declare-fun res!861174 () Bool)

(assert (=> b!1295705 (=> (not res!861174) (not e!739264))))

(declare-datatypes ((List!29494 0))(
  ( (Nil!29491) (Cons!29490 (h!30699 (_ BitVec 64)) (t!43058 List!29494)) )
))
(declare-fun arrayNoDuplicates!0 (array!86144 (_ BitVec 32) List!29494) Bool)

(assert (=> b!1295705 (= res!861174 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29491))))

(declare-fun b!1295706 () Bool)

(declare-fun e!739267 () Bool)

(assert (=> b!1295706 (= e!739267 tp_is_empty!34561)))

(declare-fun b!1295707 () Bool)

(assert (=> b!1295707 (= e!739266 true)))

(declare-fun lt!579964 () ListLongMap!20009)

(declare-fun +!4424 (ListLongMap!20009 tuple2!22352) ListLongMap!20009)

(assert (=> b!1295707 (not (contains!8138 (+!4424 lt!579964 (tuple2!22353 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579963 () Unit!42918)

(declare-fun addStillNotContains!442 (ListLongMap!20009 (_ BitVec 64) V!51185 (_ BitVec 64)) Unit!42918)

(assert (=> b!1295707 (= lt!579963 (addStillNotContains!442 lt!579964 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6057 (array!86144 array!86142 (_ BitVec 32) (_ BitVec 32) V!51185 V!51185 (_ BitVec 32) Int) ListLongMap!20009)

(assert (=> b!1295707 (= lt!579964 (getCurrentListMapNoExtraKeys!6057 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun mapIsEmpty!53402 () Bool)

(assert (=> mapIsEmpty!53402 mapRes!53402))

(declare-fun b!1295708 () Bool)

(declare-fun res!861179 () Bool)

(assert (=> b!1295708 (=> (not res!861179) (not e!739264))))

(assert (=> b!1295708 (= res!861179 (and (= (size!42122 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42123 _keys!1741) (size!42122 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295709 () Bool)

(declare-fun res!861172 () Bool)

(assert (=> b!1295709 (=> (not res!861172) (not e!739264))))

(assert (=> b!1295709 (= res!861172 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42123 _keys!1741))))))

(declare-fun b!1295710 () Bool)

(assert (=> b!1295710 (= e!739265 (and e!739267 mapRes!53402))))

(declare-fun condMapEmpty!53402 () Bool)

(declare-fun mapDefault!53402 () ValueCell!16382)

