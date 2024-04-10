; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109402 () Bool)

(assert start!109402)

(declare-fun b_free!28891 () Bool)

(declare-fun b_next!28891 () Bool)

(assert (=> start!109402 (= b_free!28891 (not b_next!28891))))

(declare-fun tp!101792 () Bool)

(declare-fun b_and!46981 () Bool)

(assert (=> start!109402 (= tp!101792 b_and!46981)))

(declare-fun b!1295159 () Bool)

(declare-fun res!860768 () Bool)

(declare-fun e!738993 () Bool)

(assert (=> b!1295159 (=> (not res!860768) (not e!738993))))

(declare-datatypes ((V!51145 0))(
  ( (V!51146 (val!17340 Int)) )
))
(declare-fun minValue!1387 () V!51145)

(declare-fun zeroValue!1387 () V!51145)

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16367 0))(
  ( (ValueCellFull!16367 (v!19943 V!51145)) (EmptyCell!16367) )
))
(declare-datatypes ((array!86082 0))(
  ( (array!86083 (arr!41542 (Array (_ BitVec 32) ValueCell!16367)) (size!42092 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86082)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86084 0))(
  ( (array!86085 (arr!41543 (Array (_ BitVec 32) (_ BitVec 64))) (size!42093 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86084)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22326 0))(
  ( (tuple2!22327 (_1!11174 (_ BitVec 64)) (_2!11174 V!51145)) )
))
(declare-datatypes ((List!29469 0))(
  ( (Nil!29466) (Cons!29465 (h!30674 tuple2!22326) (t!43033 List!29469)) )
))
(declare-datatypes ((ListLongMap!19983 0))(
  ( (ListLongMap!19984 (toList!10007 List!29469)) )
))
(declare-fun contains!8125 (ListLongMap!19983 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5043 (array!86084 array!86082 (_ BitVec 32) (_ BitVec 32) V!51145 V!51145 (_ BitVec 32) Int) ListLongMap!19983)

(assert (=> b!1295159 (= res!860768 (contains!8125 (getCurrentListMap!5043 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1295160 () Bool)

(declare-fun res!860773 () Bool)

(assert (=> b!1295160 (=> (not res!860773) (not e!738993))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86084 (_ BitVec 32)) Bool)

(assert (=> b!1295160 (= res!860773 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1295161 () Bool)

(declare-fun e!738994 () Bool)

(declare-fun tp_is_empty!34531 () Bool)

(assert (=> b!1295161 (= e!738994 tp_is_empty!34531)))

(declare-fun b!1295162 () Bool)

(declare-fun e!738996 () Bool)

(assert (=> b!1295162 (= e!738996 true)))

(declare-fun lt!579828 () ListLongMap!19983)

(declare-fun +!4414 (ListLongMap!19983 tuple2!22326) ListLongMap!19983)

(assert (=> b!1295162 (not (contains!8125 (+!4414 lt!579828 (tuple2!22327 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-datatypes ((Unit!42896 0))(
  ( (Unit!42897) )
))
(declare-fun lt!579830 () Unit!42896)

(declare-fun addStillNotContains!432 (ListLongMap!19983 (_ BitVec 64) V!51145 (_ BitVec 64)) Unit!42896)

(assert (=> b!1295162 (= lt!579830 (addStillNotContains!432 lt!579828 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6047 (array!86084 array!86082 (_ BitVec 32) (_ BitVec 32) V!51145 V!51145 (_ BitVec 32) Int) ListLongMap!19983)

(assert (=> b!1295162 (= lt!579828 (getCurrentListMapNoExtraKeys!6047 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1295163 () Bool)

(declare-fun res!860770 () Bool)

(assert (=> b!1295163 (=> (not res!860770) (not e!738993))))

(assert (=> b!1295163 (= res!860770 (and (= (size!42092 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42093 _keys!1741) (size!42092 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1295164 () Bool)

(declare-fun res!860767 () Bool)

(assert (=> b!1295164 (=> (not res!860767) (not e!738993))))

(assert (=> b!1295164 (= res!860767 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42093 _keys!1741))))))

(declare-fun mapNonEmpty!53357 () Bool)

(declare-fun mapRes!53357 () Bool)

(declare-fun tp!101791 () Bool)

(assert (=> mapNonEmpty!53357 (= mapRes!53357 (and tp!101791 e!738994))))

(declare-fun mapRest!53357 () (Array (_ BitVec 32) ValueCell!16367))

(declare-fun mapKey!53357 () (_ BitVec 32))

(declare-fun mapValue!53357 () ValueCell!16367)

(assert (=> mapNonEmpty!53357 (= (arr!41542 _values!1445) (store mapRest!53357 mapKey!53357 mapValue!53357))))

(declare-fun b!1295165 () Bool)

(declare-fun e!738995 () Bool)

(assert (=> b!1295165 (= e!738995 tp_is_empty!34531)))

(declare-fun b!1295166 () Bool)

(assert (=> b!1295166 (= e!738993 (not e!738996))))

(declare-fun res!860772 () Bool)

(assert (=> b!1295166 (=> res!860772 e!738996)))

(assert (=> b!1295166 (= res!860772 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1295166 (not (contains!8125 (ListLongMap!19984 Nil!29466) k!1205))))

(declare-fun lt!579829 () Unit!42896)

(declare-fun emptyContainsNothing!168 ((_ BitVec 64)) Unit!42896)

(assert (=> b!1295166 (= lt!579829 (emptyContainsNothing!168 k!1205))))

(declare-fun b!1295167 () Bool)

(declare-fun res!860774 () Bool)

(assert (=> b!1295167 (=> (not res!860774) (not e!738993))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1295167 (= res!860774 (not (validKeyInArray!0 (select (arr!41543 _keys!1741) from!2144))))))

(declare-fun b!1295168 () Bool)

(declare-fun res!860771 () Bool)

(assert (=> b!1295168 (=> (not res!860771) (not e!738993))))

(assert (=> b!1295168 (= res!860771 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42093 _keys!1741))))))

(declare-fun b!1295169 () Bool)

(declare-fun res!860769 () Bool)

(assert (=> b!1295169 (=> (not res!860769) (not e!738993))))

(declare-datatypes ((List!29470 0))(
  ( (Nil!29467) (Cons!29466 (h!30675 (_ BitVec 64)) (t!43034 List!29470)) )
))
(declare-fun arrayNoDuplicates!0 (array!86084 (_ BitVec 32) List!29470) Bool)

(assert (=> b!1295169 (= res!860769 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29467))))

(declare-fun res!860775 () Bool)

(assert (=> start!109402 (=> (not res!860775) (not e!738993))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109402 (= res!860775 (validMask!0 mask!2175))))

(assert (=> start!109402 e!738993))

(assert (=> start!109402 tp_is_empty!34531))

(assert (=> start!109402 true))

(declare-fun e!738997 () Bool)

(declare-fun array_inv!31457 (array!86082) Bool)

(assert (=> start!109402 (and (array_inv!31457 _values!1445) e!738997)))

(declare-fun array_inv!31458 (array!86084) Bool)

(assert (=> start!109402 (array_inv!31458 _keys!1741)))

(assert (=> start!109402 tp!101792))

(declare-fun b!1295170 () Bool)

(assert (=> b!1295170 (= e!738997 (and e!738995 mapRes!53357))))

(declare-fun condMapEmpty!53357 () Bool)

(declare-fun mapDefault!53357 () ValueCell!16367)

