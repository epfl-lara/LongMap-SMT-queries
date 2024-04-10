; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109348 () Bool)

(assert start!109348)

(declare-fun b_free!28837 () Bool)

(declare-fun b_next!28837 () Bool)

(assert (=> start!109348 (= b_free!28837 (not b_next!28837))))

(declare-fun tp!101629 () Bool)

(declare-fun b_and!46927 () Bool)

(assert (=> start!109348 (= tp!101629 b_and!46927)))

(declare-fun b!1294239 () Bool)

(declare-fun res!860092 () Bool)

(declare-fun e!738560 () Bool)

(assert (=> b!1294239 (=> (not res!860092) (not e!738560))))

(declare-fun from!2144 () (_ BitVec 32))

(declare-datatypes ((array!85976 0))(
  ( (array!85977 (arr!41489 (Array (_ BitVec 32) (_ BitVec 64))) (size!42039 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!85976)

(assert (=> b!1294239 (= res!860092 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42039 _keys!1741))))))

(declare-fun b!1294240 () Bool)

(assert (=> b!1294240 (= e!738560 (not true))))

(declare-fun k!1205 () (_ BitVec 64))

(declare-datatypes ((V!51073 0))(
  ( (V!51074 (val!17313 Int)) )
))
(declare-datatypes ((tuple2!22284 0))(
  ( (tuple2!22285 (_1!11153 (_ BitVec 64)) (_2!11153 V!51073)) )
))
(declare-datatypes ((List!29428 0))(
  ( (Nil!29425) (Cons!29424 (h!30633 tuple2!22284) (t!42992 List!29428)) )
))
(declare-datatypes ((ListLongMap!19941 0))(
  ( (ListLongMap!19942 (toList!9986 List!29428)) )
))
(declare-fun contains!8104 (ListLongMap!19941 (_ BitVec 64)) Bool)

(assert (=> b!1294240 (not (contains!8104 (ListLongMap!19942 Nil!29425) k!1205))))

(declare-datatypes ((Unit!42864 0))(
  ( (Unit!42865) )
))
(declare-fun lt!579698 () Unit!42864)

(declare-fun emptyContainsNothing!153 ((_ BitVec 64)) Unit!42864)

(assert (=> b!1294240 (= lt!579698 (emptyContainsNothing!153 k!1205))))

(declare-fun b!1294241 () Bool)

(declare-fun res!860094 () Bool)

(assert (=> b!1294241 (=> (not res!860094) (not e!738560))))

(declare-fun validKeyInArray!0 ((_ BitVec 64)) Bool)

(assert (=> b!1294241 (= res!860094 (not (validKeyInArray!0 (select (arr!41489 _keys!1741) from!2144))))))

(declare-fun b!1294242 () Bool)

(declare-fun res!860091 () Bool)

(assert (=> b!1294242 (=> (not res!860091) (not e!738560))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((ValueCell!16340 0))(
  ( (ValueCellFull!16340 (v!19916 V!51073)) (EmptyCell!16340) )
))
(declare-datatypes ((array!85978 0))(
  ( (array!85979 (arr!41490 (Array (_ BitVec 32) ValueCell!16340)) (size!42040 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!85978)

(assert (=> b!1294242 (= res!860091 (and (= (size!42040 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42039 _keys!1741) (size!42040 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1294243 () Bool)

(declare-fun res!860090 () Bool)

(assert (=> b!1294243 (=> (not res!860090) (not e!738560))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!85976 (_ BitVec 32)) Bool)

(assert (=> b!1294243 (= res!860090 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1294244 () Bool)

(declare-fun res!860096 () Bool)

(assert (=> b!1294244 (=> (not res!860096) (not e!738560))))

(declare-datatypes ((List!29429 0))(
  ( (Nil!29426) (Cons!29425 (h!30634 (_ BitVec 64)) (t!42993 List!29429)) )
))
(declare-fun arrayNoDuplicates!0 (array!85976 (_ BitVec 32) List!29429) Bool)

(assert (=> b!1294244 (= res!860096 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29426))))

(declare-fun b!1294245 () Bool)

(declare-fun res!860097 () Bool)

(assert (=> b!1294245 (=> (not res!860097) (not e!738560))))

(declare-fun zeroValue!1387 () V!51073)

(declare-fun minValue!1387 () V!51073)

(declare-fun defaultEntry!1448 () Int)

(declare-fun getCurrentListMap!5025 (array!85976 array!85978 (_ BitVec 32) (_ BitVec 32) V!51073 V!51073 (_ BitVec 32) Int) ListLongMap!19941)

(assert (=> b!1294245 (= res!860097 (contains!8104 (getCurrentListMap!5025 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!860093 () Bool)

(assert (=> start!109348 (=> (not res!860093) (not e!738560))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109348 (= res!860093 (validMask!0 mask!2175))))

(assert (=> start!109348 e!738560))

(declare-fun tp_is_empty!34477 () Bool)

(assert (=> start!109348 tp_is_empty!34477))

(assert (=> start!109348 true))

(declare-fun e!738562 () Bool)

(declare-fun array_inv!31423 (array!85978) Bool)

(assert (=> start!109348 (and (array_inv!31423 _values!1445) e!738562)))

(declare-fun array_inv!31424 (array!85976) Bool)

(assert (=> start!109348 (array_inv!31424 _keys!1741)))

(assert (=> start!109348 tp!101629))

(declare-fun b!1294246 () Bool)

(declare-fun e!738563 () Bool)

(assert (=> b!1294246 (= e!738563 tp_is_empty!34477)))

(declare-fun mapIsEmpty!53276 () Bool)

(declare-fun mapRes!53276 () Bool)

(assert (=> mapIsEmpty!53276 mapRes!53276))

(declare-fun b!1294247 () Bool)

(declare-fun res!860095 () Bool)

(assert (=> b!1294247 (=> (not res!860095) (not e!738560))))

(assert (=> b!1294247 (= res!860095 (and (not (= k!1205 #b0000000000000000000000000000000000000000000000000000000000000000)) (not (= k!1205 #b1000000000000000000000000000000000000000000000000000000000000000)) (bvsge (bvadd #b00000000000000000000000000000001 from!2144) (size!42039 _keys!1741))))))

(declare-fun mapNonEmpty!53276 () Bool)

(declare-fun tp!101630 () Bool)

(declare-fun e!738559 () Bool)

(assert (=> mapNonEmpty!53276 (= mapRes!53276 (and tp!101630 e!738559))))

(declare-fun mapValue!53276 () ValueCell!16340)

(declare-fun mapRest!53276 () (Array (_ BitVec 32) ValueCell!16340))

(declare-fun mapKey!53276 () (_ BitVec 32))

(assert (=> mapNonEmpty!53276 (= (arr!41490 _values!1445) (store mapRest!53276 mapKey!53276 mapValue!53276))))

(declare-fun b!1294248 () Bool)

(assert (=> b!1294248 (= e!738562 (and e!738563 mapRes!53276))))

(declare-fun condMapEmpty!53276 () Bool)

(declare-fun mapDefault!53276 () ValueCell!16340)

