; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109526 () Bool)

(assert start!109526)

(declare-fun b_free!29015 () Bool)

(declare-fun b_next!29015 () Bool)

(assert (=> start!109526 (= b_free!29015 (not b_next!29015))))

(declare-fun tp!102164 () Bool)

(declare-fun b_and!47105 () Bool)

(assert (=> start!109526 (= tp!102164 b_and!47105)))

(declare-fun b!1297215 () Bool)

(declare-fun e!740087 () Bool)

(declare-fun tp_is_empty!34655 () Bool)

(assert (=> b!1297215 (= e!740087 tp_is_empty!34655)))

(declare-fun b!1297216 () Bool)

(declare-fun res!862106 () Bool)

(declare-fun e!740086 () Bool)

(assert (=> b!1297216 (=> (not res!862106) (not e!740086))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((V!51309 0))(
  ( (V!51310 (val!17402 Int)) )
))
(declare-datatypes ((ValueCell!16429 0))(
  ( (ValueCellFull!16429 (v!20005 V!51309)) (EmptyCell!16429) )
))
(declare-datatypes ((array!86320 0))(
  ( (array!86321 (arr!41661 (Array (_ BitVec 32) ValueCell!16429)) (size!42211 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86320)

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-datatypes ((array!86322 0))(
  ( (array!86323 (arr!41662 (Array (_ BitVec 32) (_ BitVec 64))) (size!42212 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86322)

(assert (=> b!1297216 (= res!862106 (and (= (size!42211 _values!1445) (bvadd #b00000000000000000000000000000001 mask!2175)) (= (size!42212 _keys!1741) (size!42211 _values!1445)) (bvsge mask!2175 #b00000000000000000000000000000000) (bvsge extraKeys!1366 #b00000000000000000000000000000000) (bvsle extraKeys!1366 #b00000000000000000000000000000011)))))

(declare-fun b!1297217 () Bool)

(assert (=> b!1297217 (= e!740086 false)))

(declare-fun minValue!1387 () V!51309)

(declare-fun zeroValue!1387 () V!51309)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580568 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22422 0))(
  ( (tuple2!22423 (_1!11222 (_ BitVec 64)) (_2!11222 V!51309)) )
))
(declare-datatypes ((List!29557 0))(
  ( (Nil!29554) (Cons!29553 (h!30762 tuple2!22422) (t!43121 List!29557)) )
))
(declare-datatypes ((ListLongMap!20079 0))(
  ( (ListLongMap!20080 (toList!10055 List!29557)) )
))
(declare-fun contains!8173 (ListLongMap!20079 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5084 (array!86322 array!86320 (_ BitVec 32) (_ BitVec 32) V!51309 V!51309 (_ BitVec 32) Int) ListLongMap!20079)

(assert (=> b!1297217 (= lt!580568 (contains!8173 (getCurrentListMap!5084 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297218 () Bool)

(declare-fun res!862105 () Bool)

(assert (=> b!1297218 (=> (not res!862105) (not e!740086))))

(assert (=> b!1297218 (= res!862105 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42212 _keys!1741))))))

(declare-fun b!1297219 () Bool)

(declare-fun res!862104 () Bool)

(assert (=> b!1297219 (=> (not res!862104) (not e!740086))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86322 (_ BitVec 32)) Bool)

(assert (=> b!1297219 (= res!862104 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297220 () Bool)

(declare-fun res!862107 () Bool)

(assert (=> b!1297220 (=> (not res!862107) (not e!740086))))

(declare-datatypes ((List!29558 0))(
  ( (Nil!29555) (Cons!29554 (h!30763 (_ BitVec 64)) (t!43122 List!29558)) )
))
(declare-fun arrayNoDuplicates!0 (array!86322 (_ BitVec 32) List!29558) Bool)

(assert (=> b!1297220 (= res!862107 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29555))))

(declare-fun res!862103 () Bool)

(assert (=> start!109526 (=> (not res!862103) (not e!740086))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109526 (= res!862103 (validMask!0 mask!2175))))

(assert (=> start!109526 e!740086))

(assert (=> start!109526 tp_is_empty!34655))

(assert (=> start!109526 true))

(declare-fun e!740084 () Bool)

(declare-fun array_inv!31531 (array!86320) Bool)

(assert (=> start!109526 (and (array_inv!31531 _values!1445) e!740084)))

(declare-fun array_inv!31532 (array!86322) Bool)

(assert (=> start!109526 (array_inv!31532 _keys!1741)))

(assert (=> start!109526 tp!102164))

(declare-fun mapIsEmpty!53543 () Bool)

(declare-fun mapRes!53543 () Bool)

(assert (=> mapIsEmpty!53543 mapRes!53543))

(declare-fun b!1297221 () Bool)

(declare-fun e!740085 () Bool)

(assert (=> b!1297221 (= e!740085 tp_is_empty!34655)))

(declare-fun b!1297222 () Bool)

(assert (=> b!1297222 (= e!740084 (and e!740085 mapRes!53543))))

(declare-fun condMapEmpty!53543 () Bool)

(declare-fun mapDefault!53543 () ValueCell!16429)

