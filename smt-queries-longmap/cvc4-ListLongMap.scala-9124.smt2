; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109532 () Bool)

(assert start!109532)

(declare-fun b_free!29021 () Bool)

(declare-fun b_next!29021 () Bool)

(assert (=> start!109532 (= b_free!29021 (not b_next!29021))))

(declare-fun tp!102182 () Bool)

(declare-fun b_and!47111 () Bool)

(assert (=> start!109532 (= tp!102182 b_and!47111)))

(declare-fun b!1297287 () Bool)

(declare-fun res!862152 () Bool)

(declare-fun e!740129 () Bool)

(assert (=> b!1297287 (=> (not res!862152) (not e!740129))))

(declare-datatypes ((array!86332 0))(
  ( (array!86333 (arr!41667 (Array (_ BitVec 32) (_ BitVec 64))) (size!42217 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86332)

(declare-datatypes ((List!29562 0))(
  ( (Nil!29559) (Cons!29558 (h!30767 (_ BitVec 64)) (t!43126 List!29562)) )
))
(declare-fun arrayNoDuplicates!0 (array!86332 (_ BitVec 32) List!29562) Bool)

(assert (=> b!1297287 (= res!862152 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29559))))

(declare-fun b!1297288 () Bool)

(declare-fun res!862148 () Bool)

(assert (=> b!1297288 (=> (not res!862148) (not e!740129))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86332 (_ BitVec 32)) Bool)

(assert (=> b!1297288 (= res!862148 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun mapIsEmpty!53552 () Bool)

(declare-fun mapRes!53552 () Bool)

(assert (=> mapIsEmpty!53552 mapRes!53552))

(declare-fun b!1297289 () Bool)

(assert (=> b!1297289 (= e!740129 false)))

(declare-datatypes ((V!51317 0))(
  ( (V!51318 (val!17405 Int)) )
))
(declare-fun minValue!1387 () V!51317)

(declare-fun zeroValue!1387 () V!51317)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun lt!580577 () Bool)

(declare-datatypes ((ValueCell!16432 0))(
  ( (ValueCellFull!16432 (v!20008 V!51317)) (EmptyCell!16432) )
))
(declare-datatypes ((array!86334 0))(
  ( (array!86335 (arr!41668 (Array (_ BitVec 32) ValueCell!16432)) (size!42218 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86334)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22426 0))(
  ( (tuple2!22427 (_1!11224 (_ BitVec 64)) (_2!11224 V!51317)) )
))
(declare-datatypes ((List!29563 0))(
  ( (Nil!29560) (Cons!29559 (h!30768 tuple2!22426) (t!43127 List!29563)) )
))
(declare-datatypes ((ListLongMap!20083 0))(
  ( (ListLongMap!20084 (toList!10057 List!29563)) )
))
(declare-fun contains!8175 (ListLongMap!20083 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5086 (array!86332 array!86334 (_ BitVec 32) (_ BitVec 32) V!51317 V!51317 (_ BitVec 32) Int) ListLongMap!20083)

(assert (=> b!1297289 (= lt!580577 (contains!8175 (getCurrentListMap!5086 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!862149 () Bool)

(assert (=> start!109532 (=> (not res!862149) (not e!740129))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109532 (= res!862149 (validMask!0 mask!2175))))

(assert (=> start!109532 e!740129))

(declare-fun tp_is_empty!34661 () Bool)

(assert (=> start!109532 tp_is_empty!34661))

(assert (=> start!109532 true))

(declare-fun e!740131 () Bool)

(declare-fun array_inv!31535 (array!86334) Bool)

(assert (=> start!109532 (and (array_inv!31535 _values!1445) e!740131)))

(declare-fun array_inv!31536 (array!86332) Bool)

(assert (=> start!109532 (array_inv!31536 _keys!1741)))

(assert (=> start!109532 tp!102182))

(declare-fun b!1297290 () Bool)

(declare-fun e!740128 () Bool)

(assert (=> b!1297290 (= e!740128 tp_is_empty!34661)))

(declare-fun b!1297291 () Bool)

(assert (=> b!1297291 (= e!740131 (and e!740128 mapRes!53552))))

(declare-fun condMapEmpty!53552 () Bool)

(declare-fun mapDefault!53552 () ValueCell!16432)

