; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109558 () Bool)

(assert start!109558)

(declare-fun b_free!29047 () Bool)

(declare-fun b_next!29047 () Bool)

(assert (=> start!109558 (= b_free!29047 (not b_next!29047))))

(declare-fun tp!102259 () Bool)

(declare-fun b_and!47137 () Bool)

(assert (=> start!109558 (= tp!102259 b_and!47137)))

(declare-fun res!862343 () Bool)

(declare-fun e!740326 () Bool)

(assert (=> start!109558 (=> (not res!862343) (not e!740326))))

(declare-fun mask!2175 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109558 (= res!862343 (validMask!0 mask!2175))))

(assert (=> start!109558 e!740326))

(declare-fun tp_is_empty!34687 () Bool)

(assert (=> start!109558 tp_is_empty!34687))

(assert (=> start!109558 true))

(declare-datatypes ((V!51353 0))(
  ( (V!51354 (val!17418 Int)) )
))
(declare-datatypes ((ValueCell!16445 0))(
  ( (ValueCellFull!16445 (v!20021 V!51353)) (EmptyCell!16445) )
))
(declare-datatypes ((array!86384 0))(
  ( (array!86385 (arr!41693 (Array (_ BitVec 32) ValueCell!16445)) (size!42243 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86384)

(declare-fun e!740323 () Bool)

(declare-fun array_inv!31557 (array!86384) Bool)

(assert (=> start!109558 (and (array_inv!31557 _values!1445) e!740323)))

(declare-datatypes ((array!86386 0))(
  ( (array!86387 (arr!41694 (Array (_ BitVec 32) (_ BitVec 64))) (size!42244 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86386)

(declare-fun array_inv!31558 (array!86386) Bool)

(assert (=> start!109558 (array_inv!31558 _keys!1741)))

(assert (=> start!109558 tp!102259))

(declare-fun b!1297599 () Bool)

(assert (=> b!1297599 (= e!740326 false)))

(declare-fun minValue!1387 () V!51353)

(declare-fun zeroValue!1387 () V!51353)

(declare-fun lt!580616 () Bool)

(declare-fun from!2144 () (_ BitVec 32))

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-datatypes ((tuple2!22446 0))(
  ( (tuple2!22447 (_1!11234 (_ BitVec 64)) (_2!11234 V!51353)) )
))
(declare-datatypes ((List!29581 0))(
  ( (Nil!29578) (Cons!29577 (h!30786 tuple2!22446) (t!43145 List!29581)) )
))
(declare-datatypes ((ListLongMap!20103 0))(
  ( (ListLongMap!20104 (toList!10067 List!29581)) )
))
(declare-fun contains!8185 (ListLongMap!20103 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5096 (array!86386 array!86384 (_ BitVec 32) (_ BitVec 32) V!51353 V!51353 (_ BitVec 32) Int) ListLongMap!20103)

(assert (=> b!1297599 (= lt!580616 (contains!8185 (getCurrentListMap!5096 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun b!1297600 () Bool)

(declare-fun res!862346 () Bool)

(assert (=> b!1297600 (=> (not res!862346) (not e!740326))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!86386 (_ BitVec 32)) Bool)

(assert (=> b!1297600 (= res!862346 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1741 mask!2175))))

(declare-fun b!1297601 () Bool)

(declare-fun res!862347 () Bool)

(assert (=> b!1297601 (=> (not res!862347) (not e!740326))))

(declare-datatypes ((List!29582 0))(
  ( (Nil!29579) (Cons!29578 (h!30787 (_ BitVec 64)) (t!43146 List!29582)) )
))
(declare-fun arrayNoDuplicates!0 (array!86386 (_ BitVec 32) List!29582) Bool)

(assert (=> b!1297601 (= res!862347 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29579))))

(declare-fun b!1297602 () Bool)

(declare-fun e!740324 () Bool)

(assert (=> b!1297602 (= e!740324 tp_is_empty!34687)))

(declare-fun mapIsEmpty!53591 () Bool)

(declare-fun mapRes!53591 () Bool)

(assert (=> mapIsEmpty!53591 mapRes!53591))

(declare-fun b!1297603 () Bool)

(declare-fun e!740327 () Bool)

(assert (=> b!1297603 (= e!740327 tp_is_empty!34687)))

(declare-fun b!1297604 () Bool)

(assert (=> b!1297604 (= e!740323 (and e!740324 mapRes!53591))))

(declare-fun condMapEmpty!53591 () Bool)

(declare-fun mapDefault!53591 () ValueCell!16445)

