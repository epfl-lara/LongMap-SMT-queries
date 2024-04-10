; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!109540 () Bool)

(assert start!109540)

(declare-fun b_free!29029 () Bool)

(declare-fun b_next!29029 () Bool)

(assert (=> start!109540 (= b_free!29029 (not b_next!29029))))

(declare-fun tp!102205 () Bool)

(declare-fun b_and!47119 () Bool)

(assert (=> start!109540 (= tp!102205 b_and!47119)))

(declare-fun mapIsEmpty!53564 () Bool)

(declare-fun mapRes!53564 () Bool)

(assert (=> mapIsEmpty!53564 mapRes!53564))

(declare-fun b!1297383 () Bool)

(declare-fun res!862211 () Bool)

(declare-fun e!740188 () Bool)

(assert (=> b!1297383 (=> (not res!862211) (not e!740188))))

(declare-datatypes ((array!86348 0))(
  ( (array!86349 (arr!41675 (Array (_ BitVec 32) (_ BitVec 64))) (size!42225 (_ BitVec 32))) )
))
(declare-fun _keys!1741 () array!86348)

(declare-datatypes ((List!29566 0))(
  ( (Nil!29563) (Cons!29562 (h!30771 (_ BitVec 64)) (t!43130 List!29566)) )
))
(declare-fun arrayNoDuplicates!0 (array!86348 (_ BitVec 32) List!29566) Bool)

(assert (=> b!1297383 (= res!862211 (arrayNoDuplicates!0 _keys!1741 #b00000000000000000000000000000000 Nil!29563))))

(declare-fun b!1297384 () Bool)

(declare-fun res!862209 () Bool)

(assert (=> b!1297384 (=> (not res!862209) (not e!740188))))

(declare-fun from!2144 () (_ BitVec 32))

(assert (=> b!1297384 (= res!862209 (and (bvsge from!2144 #b00000000000000000000000000000000) (bvslt from!2144 (size!42225 _keys!1741))))))

(declare-fun mapNonEmpty!53564 () Bool)

(declare-fun tp!102206 () Bool)

(declare-fun e!740192 () Bool)

(assert (=> mapNonEmpty!53564 (= mapRes!53564 (and tp!102206 e!740192))))

(declare-datatypes ((V!51329 0))(
  ( (V!51330 (val!17409 Int)) )
))
(declare-datatypes ((ValueCell!16436 0))(
  ( (ValueCellFull!16436 (v!20012 V!51329)) (EmptyCell!16436) )
))
(declare-fun mapValue!53564 () ValueCell!16436)

(declare-datatypes ((array!86350 0))(
  ( (array!86351 (arr!41676 (Array (_ BitVec 32) ValueCell!16436)) (size!42226 (_ BitVec 32))) )
))
(declare-fun _values!1445 () array!86350)

(declare-fun mapRest!53564 () (Array (_ BitVec 32) ValueCell!16436))

(declare-fun mapKey!53564 () (_ BitVec 32))

(assert (=> mapNonEmpty!53564 (= (arr!41676 _values!1445) (store mapRest!53564 mapKey!53564 mapValue!53564))))

(declare-fun b!1297385 () Bool)

(assert (=> b!1297385 (= e!740188 false)))

(declare-fun minValue!1387 () V!51329)

(declare-fun zeroValue!1387 () V!51329)

(declare-fun lt!580589 () Bool)

(declare-fun k!1205 () (_ BitVec 64))

(declare-fun extraKeys!1366 () (_ BitVec 32))

(declare-fun defaultEntry!1448 () Int)

(declare-fun mask!2175 () (_ BitVec 32))

(declare-datatypes ((tuple2!22430 0))(
  ( (tuple2!22431 (_1!11226 (_ BitVec 64)) (_2!11226 V!51329)) )
))
(declare-datatypes ((List!29567 0))(
  ( (Nil!29564) (Cons!29563 (h!30772 tuple2!22430) (t!43131 List!29567)) )
))
(declare-datatypes ((ListLongMap!20087 0))(
  ( (ListLongMap!20088 (toList!10059 List!29567)) )
))
(declare-fun contains!8177 (ListLongMap!20087 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!5088 (array!86348 array!86350 (_ BitVec 32) (_ BitVec 32) V!51329 V!51329 (_ BitVec 32) Int) ListLongMap!20087)

(assert (=> b!1297385 (= lt!580589 (contains!8177 (getCurrentListMap!5088 _keys!1741 _values!1445 mask!2175 extraKeys!1366 zeroValue!1387 minValue!1387 from!2144 defaultEntry!1448) k!1205))))

(declare-fun res!862208 () Bool)

(assert (=> start!109540 (=> (not res!862208) (not e!740188))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!109540 (= res!862208 (validMask!0 mask!2175))))

(assert (=> start!109540 e!740188))

(declare-fun tp_is_empty!34669 () Bool)

(assert (=> start!109540 tp_is_empty!34669))

(assert (=> start!109540 true))

(declare-fun e!740191 () Bool)

(declare-fun array_inv!31541 (array!86350) Bool)

(assert (=> start!109540 (and (array_inv!31541 _values!1445) e!740191)))

(declare-fun array_inv!31542 (array!86348) Bool)

(assert (=> start!109540 (array_inv!31542 _keys!1741)))

(assert (=> start!109540 tp!102205))

(declare-fun b!1297386 () Bool)

(declare-fun e!740189 () Bool)

(assert (=> b!1297386 (= e!740191 (and e!740189 mapRes!53564))))

(declare-fun condMapEmpty!53564 () Bool)

(declare-fun mapDefault!53564 () ValueCell!16436)

