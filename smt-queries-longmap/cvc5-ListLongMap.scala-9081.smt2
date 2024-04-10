; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109270 () Bool)

(assert start!109270)

(declare-fun b_free!28759 () Bool)

(declare-fun b_next!28759 () Bool)

(assert (=> start!109270 (= b_free!28759 (not b_next!28759))))

(declare-fun tp!101395 () Bool)

(declare-fun b_and!46849 () Bool)

(assert (=> start!109270 (= tp!101395 b_and!46849)))

(declare-fun b!1292864 () Bool)

(declare-fun e!737887 () Bool)

(declare-fun tp_is_empty!34399 () Bool)

(assert (=> b!1292864 (= e!737887 tp_is_empty!34399)))

(declare-fun b!1292865 () Bool)

(declare-fun res!859068 () Bool)

(declare-fun e!737890 () Bool)

(assert (=> b!1292865 (=> (not res!859068) (not e!737890))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85830 0))(
  ( (array!85831 (arr!41416 (Array (_ BitVec 32) (_ BitVec 64))) (size!41966 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85830)

(assert (=> b!1292865 (= res!859068 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!41966 _keys!1741))))))

(declare-fun res!859069 () Bool)

(assert (=> start!109270 (=> (not res!859069) (not e!737890))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109270 (= res!859069 (validMask!0 mask!2175))))

(assert (=> start!109270 e!737890))

(assert (=> start!109270 tp_is_empty!34399))

(assert (=> start!109270 true))

(declare-datatypes ((V!50969 0))(
  ( (V!50970 (val!17274 Int)) )
))
(declare-datatypes ((ValueCell!16301 0))(
  ( (ValueCellFull!16301 (v!19877 V!50969)) (EmptyCell!16301) )
))
(declare-datatypes ((array!85832 0))(
  ( (array!85833 (arr!41417 (Array (_ BitVec 32) ValueCell!16301)) (size!41967 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85832)

(declare-fun e!737891 () Bool)

(declare-fun array_inv!31379 (array!85832) Bool)

(assert (=> start!109270 (and (array_inv!31379 _values!1445) e!737891)))

(declare-fun array_inv!31380 (array!85830) Bool)

(assert (=> start!109270 (array_inv!31380 _keys!1741)))

(assert (=> start!109270 tp!101395))

(declare-fun b!1292866 () Bool)

(declare-fun res!859071 () Bool)

(assert (=> b!1292866 (=> (not res!859071) (not e!737890))))

(declare-datatypes ((List!29379 0))(
  ( (Nil!29376) (Cons!29375 (h!30584 (_ BitVec 64)) (t!42943 List!29379)) )
))
(declare-fun arrayNoDuplicates!0 (array!85830 (_ BitVec 32) List!29379) Bool)

(assert (=> b!1292866 (= res!859071 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29376))))

(declare-fun b!1292867 () Bool)

(declare-fun e!737888 () Bool)

(assert (=> b!1292867 (= e!737888 true)))

(declare-datatypes ((tuple2!22230 0))(
  ( (tuple2!22231 (_1!11126 (_ BitVec 64)) (_2!11126 V!50969)) )
))
(declare-datatypes ((List!29380 0))(
  ( (Nil!29377) (Cons!29376 (h!30585 tuple2!22230) (t!42944 List!29380)) )
))
(declare-datatypes ((ListLongMap!19887 0))(
  ( (ListLongMap!19888 (toList!9959 List!29380)) )
))
(declare-fun lt!579406 () ListLongMap!19887)

(declare-fun zeroValue!1387 () V!50969)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun contains!8077 (ListLongMap!19887 (_ BitVec 64)) Bool)

(declare-fun +!4394 (ListLongMap!19887 tuple2!22230) ListLongMap!19887)

(assert (=> b!1292867 (not (contains!8077 (+!4394 lt!579406 (tuple2!22231 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387)) k!1205))))

(declare-datatypes ((Unit!42816 0))(
  ( (Unit!42817) )
))
(declare-fun lt!579405 () Unit!42816)

(declare-fun addStillNotContains!412 (ListLongMap!19887 (_ BitVec 64) V!50969 (_ BitVec 64)) Unit!42816)

(assert (=> b!1292867 (= lt!579405 (addStillNotContains!412 lt!579406 #b0000000000000000000000000000000000000000000000000000000000000000 zeroValue!1387 k!1205))))

(declare-fun minValue!1387 () V!50969)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMapNoExtraKeys!6026 (array!85830 array!85832 (_ BitVec 32) (_ BitVec 32) V!50969 V!50969 (_ BitVec 32) Int) ListLongMap!19887)

(assert (=> b!1292867 (= lt!579406 (getCurrentListMapNoExtraKeys!6026 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448))))

(declare-fun b!1292868 () Bool)

(declare-fun res!859074 () Bool)

(assert (=> b!1292868 (=> (not res!859074) (not e!737890))))

(assert (=> b!1292868 (= res!859074 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41966 _keys!1741))))))

(declare-fun b!1292869 () Bool)

(assert (=> b!1292869 (= e!737890 (not e!737888))))

(declare-fun res!859067 () Bool)

(assert (=> b!1292869 (=> res!859067 e!737888)))

(assert (=> b!1292869 (= res!859067 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1292869 (not (contains!8077 (ListLongMap!19888 Nil!29377) k!1205))))

(declare-fun lt!579407 () Unit!42816)

(declare-fun emptyContainsNothing!130 ((_ BitVec 64)) Unit!42816)

(assert (=> b!1292869 (= lt!579407 (emptyContainsNothing!130 k!1205))))

(declare-fun mapIsEmpty!53159 () Bool)

(declare-fun mapRes!53159 () Bool)

(assert (=> mapIsEmpty!53159 mapRes!53159))

(declare-fun b!1292870 () Bool)

(declare-fun e!737889 () Bool)

(assert (=> b!1292870 (= e!737889 tp_is_empty!34399)))

(declare-fun b!1292871 () Bool)

(declare-fun res!859072 () Bool)

(assert (=> b!1292871 (=> (not res!859072) (not e!737890))))

(assert (=> b!1292871 (= res!859072 (and (= (size!41967 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41966 _keys!1741) (size!41967 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1292872 () Bool)

(declare-fun res!859073 () Bool)

(assert (=> b!1292872 (=> (not res!859073) (not e!737890))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85830 (_ BitVec 32)) Bool)

(assert (=> b!1292872 (= res!859073 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1292873 () Bool)

(declare-fun res!859066 () Bool)

(assert (=> b!1292873 (=> (not res!859066) (not e!737890))))

(declare-fun getCurrentListMap!5003 (array!85830 array!85832 (_ BitVec 32) (_ BitVec 32) V!50969 V!50969 (_ BitVec 32) Int) ListLongMap!19887)

(assert (=> b!1292873 (= res!859066 (contains!8077 (getCurrentListMap!5003 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1292874 () Bool)

(assert (=> b!1292874 (= e!737891 (and e!737887 mapRes!53159))))

(declare-fun condMapEmpty!53159 () Bool)

(declare-fun mapDefault!53159 () ValueCell!16301)

