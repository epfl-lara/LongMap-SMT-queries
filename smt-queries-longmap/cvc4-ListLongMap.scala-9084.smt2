; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109292 () Bool)

(assert start!109292)

(declare-fun b_free!28781 () Bool)

(declare-fun b_next!28781 () Bool)

(assert (=> start!109292 (= b_free!28781 (not b_next!28781))))

(declare-fun tp!101462 () Bool)

(declare-fun b_and!46871 () Bool)

(assert (=> start!109292 (= tp!101462 b_and!46871)))

(declare-fun mapNonEmpty!53192 () Bool)

(declare-fun mapRes!53192 () Bool)

(declare-fun tp!101461 () Bool)

(declare-fun e!738089 () Bool)

(assert (=> mapNonEmpty!53192 (= mapRes!53192 (and tp!101461 e!738089))))

(declare-fun mapKey!53192 () (_ BitVec 32))

(declare-datatypes ((V!50997 0))(
  ( (V!50998 (val!17285 Int)) )
))
(declare-datatypes ((ValueCell!16312 0))(
  ( (ValueCellFull!16312 (v!19888 V!50997)) (EmptyCell!16312) )
))
(declare-datatypes ((array!85872 0))(
  ( (array!85873 (arr!41437 (Array (_ BitVec 32) ValueCell!16312)) (size!41987 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85872)

(declare-fun mapRest!53192 () (Array (_ BitVec 32) ValueCell!16312))

(declare-fun mapValue!53192 () ValueCell!16312)

(assert (=> mapNonEmpty!53192 (= (arr!41437 _values!1445) (store mapRest!53192 mapKey!53192 mapValue!53192))))

(declare-fun b!1293260 () Bool)

(declare-fun e!738088 () Bool)

(declare-fun tp_is_empty!34421 () Bool)

(assert (=> b!1293260 (= e!738088 tp_is_empty!34421)))

(declare-fun b!1293261 () Bool)

(declare-fun res!859371 () Bool)

(declare-fun e!738085 () Bool)

(assert (=> b!1293261 (=> (not res!859371) (not e!738085))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!85874 0))(
  ( (array!85875 (arr!41438 (Array (_ BitVec 32) (_ BitVec 64))) (size!41988 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85874)

(assert (=> b!1293261 (= res!859371 (and (= (size!41987 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!41988 _keys!1741) (size!41987 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1293262 () Bool)

(declare-fun res!859366 () Bool)

(assert (=> b!1293262 (=> (not res!859366) (not e!738085))))

(declare-fun minValue!1387 () V!50997)

(declare-fun zeroValue!1387 () V!50997)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22244 0))(
  ( (tuple2!22245 (_1!11133 (_ BitVec 64)) (_2!11133 V!50997)) )
))
(declare-datatypes ((List!29393 0))(
  ( (Nil!29390) (Cons!29389 (h!30598 tuple2!22244) (t!42957 List!29393)) )
))
(declare-datatypes ((ListLongMap!19901 0))(
  ( (ListLongMap!19902 (toList!9966 List!29393)) )
))
(declare-fun contains!8084 (ListLongMap!19901 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5008 (array!85874 array!85872 (_ BitVec 32) (_ BitVec 32) V!50997 V!50997 (_ BitVec 32) Int) ListLongMap!19901)

(assert (=> b!1293262 (= res!859366 (contains!8084 (getCurrentListMap!5008 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1293263 () Bool)

(declare-fun e!738086 () Bool)

(assert (=> b!1293263 (= e!738085 (not e!738086))))

(declare-fun res!859368 () Bool)

(assert (=> b!1293263 (=> res!859368 e!738086)))

(assert (=> b!1293263 (= res!859368 (or (not (= (bvand extraKeys!1366 #b00000000000000000000000000000010) #b00000000000000000000000000000000)) (= (bvand extraKeys!1366 #b00000000000000000000000000000001) #b00000000000000000000000000000000)))))

(assert (=> b!1293263 (not (contains!8084 (ListLongMap!19902 Nil!29390) k!1205))))

(declare-datatypes ((Unit!42830 0))(
  ( (Unit!42831) )
))
(declare-fun lt!579506 () Unit!42830)

(declare-fun emptyContainsNothing!136 ((_ BitVec 64)) Unit!42830)

(assert (=> b!1293263 (= lt!579506 (emptyContainsNothing!136 k!1205))))

(declare-fun res!859367 () Bool)

(assert (=> start!109292 (=> (not res!859367) (not e!738085))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109292 (= res!859367 (validMask!0 mask!2175))))

(assert (=> start!109292 e!738085))

(assert (=> start!109292 tp_is_empty!34421))

(assert (=> start!109292 true))

(declare-fun e!738084 () Bool)

(declare-fun array_inv!31395 (array!85872) Bool)

(assert (=> start!109292 (and (array_inv!31395 _values!1445) e!738084)))

(declare-fun array_inv!31396 (array!85874) Bool)

(assert (=> start!109292 (array_inv!31396 _keys!1741)))

(assert (=> start!109292 tp!101462))

(declare-fun b!1293264 () Bool)

(declare-fun res!859363 () Bool)

(assert (=> b!1293264 (=> (not res!859363) (not e!738085))))

(assert (=> b!1293264 (= res!859363 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!41988 _keys!1741))))))

(declare-fun b!1293265 () Bool)

(assert (=> b!1293265 (= e!738089 tp_is_empty!34421)))

(declare-fun b!1293266 () Bool)

(assert (=> b!1293266 (= e!738084 (and e!738088 mapRes!53192))))

(declare-fun condMapEmpty!53192 () Bool)

(declare-fun mapDefault!53192 () ValueCell!16312)

