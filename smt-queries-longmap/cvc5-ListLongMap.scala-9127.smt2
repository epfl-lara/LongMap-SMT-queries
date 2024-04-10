; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109546 () Bool)

(assert start!109546)

(declare-fun b_free!29035 () Bool)

(declare-fun b_next!29035 () Bool)

(assert (=> start!109546 (= b_free!29035 (not b_next!29035))))

(declare-fun tp!102224 () Bool)

(declare-fun b_and!47125 () Bool)

(assert (=> start!109546 (= tp!102224 b_and!47125)))

(declare-fun b!1297455 () Bool)

(declare-fun e!740235 () Bool)

(assert (=> b!1297455 (= e!740235 false)))

(declare-datatypes ((V!51337 0))(
  ( (V!51338 (val!17412 Int)) )
))
(declare-fun minValue!1387 () V!51337)

(declare-fun zeroValue!1387 () V!51337)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580598 () Bool)

(declare-datatypes ((ValueCell!16439 0))(
  ( (ValueCellFull!16439 (v!20015 V!51337)) (EmptyCell!16439) )
))
(declare-datatypes ((array!86360 0))(
  ( (array!86361 (arr!41681 (Array (_ BitVec 32) ValueCell!16439)) (size!42231 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86360)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86362 0))(
  ( (array!86363 (arr!41682 (Array (_ BitVec 32) (_ BitVec 64))) (size!42232 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86362)

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22436 0))(
  ( (tuple2!22437 (_1!11229 (_ BitVec 64)) (_2!11229 V!51337)) )
))
(declare-datatypes ((List!29572 0))(
  ( (Nil!29569) (Cons!29568 (h!30777 tuple2!22436) (t!43136 List!29572)) )
))
(declare-datatypes ((ListLongMap!20093 0))(
  ( (ListLongMap!20094 (toList!10062 List!29572)) )
))
(declare-fun contains!8180 (ListLongMap!20093 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5091 (array!86362 array!86360 (_ BitVec 32) (_ BitVec 32) V!51337 V!51337 (_ BitVec 32) Int) ListLongMap!20093)

(assert (=> b!1297455 (= lt!580598 (contains!8180 (getCurrentListMap!5091 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297456 () Bool)

(declare-fun e!740234 () Bool)

(declare-fun tp_is_empty!34675 () Bool)

(assert (=> b!1297456 (= e!740234 tp_is_empty!34675)))

(declare-fun b!1297457 () Bool)

(declare-fun res!862256 () Bool)

(assert (=> b!1297457 (=> (not res!862256) (not e!740235))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86362 (_ BitVec 32)) Bool)

(assert (=> b!1297457 (= res!862256 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297458 () Bool)

(declare-fun res!862253 () Bool)

(assert (=> b!1297458 (=> (not res!862253) (not e!740235))))

(assert (=> b!1297458 (= res!862253 (and (= (size!42231 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42232 _keys!1741) (size!42231 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297459 () Bool)

(declare-fun e!740236 () Bool)

(declare-fun mapRes!53573 () Bool)

(assert (=> b!1297459 (= e!740236 (and e!740234 mapRes!53573))))

(declare-fun condMapEmpty!53573 () Bool)

(declare-fun mapDefault!53573 () ValueCell!16439)

