; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109184 () Bool)

(assert start!109184)

(declare-fun b_free!28673 () Bool)

(declare-fun b_next!28673 () Bool)

(assert (=> start!109184 (= b_free!28673 (not b_next!28673))))

(declare-fun tp!101138 () Bool)

(declare-fun b_and!46763 () Bool)

(assert (=> start!109184 (= tp!101138 b_and!46763)))

(declare-fun res!857986 () Bool)

(declare-fun e!737198 () Bool)

(assert (=> start!109184 (=> (not res!857986) (not e!737198))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109184 (= res!857986 (validMask!0 mask!2175))))

(assert (=> start!109184 e!737198))

(declare-fun tp_is_empty!34313 () Bool)

(assert (=> start!109184 tp_is_empty!34313))

(assert (=> start!109184 true))

(declare-datatypes ((V!50853 0))(
  ( (V!50854 (val!17231 Int)) )
))
(declare-datatypes ((ValueCell!16258 0))(
  ( (ValueCellFull!16258 (v!19834 V!50853)) (EmptyCell!16258) )
))
(declare-datatypes ((array!85662 0))(
  ( (array!85663 (arr!41332 (Array (_ BitVec 32) ValueCell!16258)) (size!41882 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85662)

(declare-fun e!737197 () Bool)

(declare-fun array_inv!31319 (array!85662) Bool)

(assert (=> start!109184 (and (array_inv!31319 _values!1445) e!737197)))

(declare-datatypes ((array!85664 0))(
  ( (array!85665 (arr!41333 (Array (_ BitVec 32) (_ BitVec 64))) (size!41883 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85664)

(declare-fun array_inv!31320 (array!85664) Bool)

(assert (=> start!109184 (array_inv!31320 _keys!1741)))

(assert (=> start!109184 tp!101138))

(declare-fun b!1291397 () Bool)

(declare-fun res!857992 () Bool)

(assert (=> b!1291397 (=> (not res!857992) (not e!737198))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1291397 (= res!857992 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41883 _keys!1741))))))

(declare-fun mapNonEmpty!53030 () Bool)

(declare-fun mapRes!53030 () Bool)

(declare-fun tp!101137 () Bool)

(declare-fun e!737196 () Bool)

(assert (=> mapNonEmpty!53030 (= mapRes!53030 (and tp!101137 e!737196))))

(declare-fun mapValue!53030 () ValueCell!16258)

(declare-fun mapRest!53030 () (Array (_ BitVec 32) ValueCell!16258))

(declare-fun mapKey!53030 () (_ BitVec 32))

(assert (=> mapNonEmpty!53030 (= (arr!41332 _values!1445) (store mapRest!53030 mapKey!53030 mapValue!53030))))

(declare-fun b!1291398 () Bool)

(declare-fun res!857990 () Bool)

(assert (=> b!1291398 (=> (not res!857990) (not e!737198))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1291398 (= res!857990 (not (validKeyInArray!0 (select (arr!41333 _keys!1741) from!2144))))))

(declare-fun b!1291399 () Bool)

(declare-fun res!857988 () Bool)

(assert (=> b!1291399 (=> (not res!857988) (not e!737198))))

(declare-datatypes ((List!29311 0))(
  ( (Nil!29308) (Cons!29307 (h!30516 (_ BitVec 64)) (t!42875 List!29311)) )
))
(declare-fun arrayNoDuplicates!0 (array!85664 (_ BitVec 32) List!29311) Bool)

(assert (=> b!1291399 (= res!857988 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29308))))

(declare-fun b!1291400 () Bool)

(declare-fun res!857994 () Bool)

(assert (=> b!1291400 (=> (not res!857994) (not e!737198))))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(assert (=> b!1291400 (= res!857994 (and (= (size!41882 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41883 _keys!1741) (size!41882 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1291401 () Bool)

(declare-fun res!857989 () Bool)

(assert (=> b!1291401 (=> (not res!857989) (not e!737198))))

(declare-fun minValue!1387 () V!50853)

(declare-fun zeroValue!1387 () V!50853)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22154 0))(
  ( (tuple2!22155 (_1!11088 (_ BitVec 64)) (_2!11088 V!50853)) )
))
(declare-datatypes ((List!29312 0))(
  ( (Nil!29309) (Cons!29308 (h!30517 tuple2!22154) (t!42876 List!29312)) )
))
(declare-datatypes ((ListLongMap!19811 0))(
  ( (ListLongMap!19812 (toList!9921 List!29312)) )
))
(declare-fun contains!8039 (ListLongMap!19811 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!4972 (array!85664 array!85662 (_ BitVec 32) (_ BitVec 32) V!50853 V!50853 (_ BitVec 32) Int) ListLongMap!19811)

(assert (=> b!1291401 (= res!857989 (contains!8039 (getCurrentListMap!4972 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1291402 () Bool)

(assert (=> b!1291402 (= e!737196 tp_is_empty!34313)))

(declare-fun mapIsEmpty!53030 () Bool)

(assert (=> mapIsEmpty!53030 mapRes!53030))

(declare-fun b!1291403 () Bool)

(declare-fun res!857991 () Bool)

(assert (=> b!1291403 (=> (not res!857991) (not e!737198))))

(assert (=> b!1291403 (= res!857991 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41883 _keys!1741))))))

(declare-fun b!1291404 () Bool)

(declare-fun e!737194 () Bool)

(assert (=> b!1291404 (= e!737194 tp_is_empty!34313)))

(declare-fun b!1291405 () Bool)

(declare-fun e!737195 () Bool)

(assert (=> b!1291405 (= e!737198 (not e!737195))))

(declare-fun res!857987 () Bool)

(assert (=> b!1291405 (=> res!857987 e!737195)))

(assert (=> b!1291405 (= res!857987 (or (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000) (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)))))

(assert (=> b!1291405 (not (contains!8039 (ListLongMap!19812 Nil!29309) k!1205))))

(declare-datatypes ((Unit!42754 0))(
  ( (Unit!42755) )
))
(declare-fun lt!579106 () Unit!42754)

(declare-fun emptyContainsNothing!99 ((_ BitVec 64)) Unit!42754)

(assert (=> b!1291405 (= lt!579106 (emptyContainsNothing!99 k!1205))))

(declare-fun b!1291406 () Bool)

(assert (=> b!1291406 (= e!737195 true)))

(assert (=> b!1291406 false))

(declare-fun lt!579107 () ListLongMap!19811)

(declare-fun lt!579108 () Unit!42754)

(declare-fun lemmaInListMapAfterAddingDiffThenInBefore!59 ((_ BitVec 64) (_ BitVec 64) V!50853 ListLongMap!19811) Unit!42754)

(assert (=> b!1291406 (= lt!579108 (lemmaInListMapAfterAddingDiffThenInBefore!59 k!1205 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 lt!579107))))

(declare-fun lt!579109 () ListLongMap!19811)

(declare-fun +!4385 (ListLongMap!19811 tuple2!22154) ListLongMap!19811)

(assert (=> b!1291406 (not (contains!8039 (+!4385 lt!579109 (tuple2!22155 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387)) k!1205))))

(declare-fun lt!579110 () Unit!42754)

(declare-fun addStillNotContains!403 (ListLongMap!19811 (_ BitVec 64) V!50853 (_ BitVec 64)) Unit!42754)

(assert (=> b!1291406 (= lt!579110 (addStillNotContains!403 lt!579109 #b1000000000000000000000000000000000000000000000000000000000000000 minValue!1387 k!1205))))

(assert (=> b!1291406 (not (contains!8039 lt!579107 k!1205))))

(assert (=> b!1291406 (= lt!579107 (+!4385 lt!579109 (tuple2!22155 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)))))

(declare-fun lt!579105 () Unit!42754)

(assert (=> b!1291406 (= lt!579105 (addStillNotContains!403 lt!579109 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun getCurrentListMapNoExtraKeys!6016 (array!85664 array!85662 (_ BitVec 32) (_ BitVec 32) V!50853 V!50853 (_ BitVec 32) Int) ListLongMap!19811)

(assert (=> b!1291406 (= lt!579109 (getCurrentListMapNoExtraKeys!6016 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1291407 () Bool)

(assert (=> b!1291407 (= e!737197 (and e!737194 mapRes!53030))))

(declare-fun condMapEmpty!53030 () Bool)

(declare-fun mapDefault!53030 () ValueCell!16258)

