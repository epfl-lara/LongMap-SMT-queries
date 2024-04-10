; Options: -q --produce-models --incremental --print-success --lang smt2.6
(declare-fun start!904 () Bool)

(assert start!904)

(declare-fun b_free!277 () Bool)

(declare-fun b_next!277 () Bool)

(assert (=> start!904 (= b_free!277 (not b_next!277))))

(declare-fun tp!1064 () Bool)

(declare-fun b_and!425 () Bool)

(assert (=> start!904 (= tp!1064 b_and!425)))

(declare-fun b!7554 () Bool)

(declare-fun e!4216 () Bool)

(assert (=> b!7554 (= e!4216 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun lt!1554 () Bool)

(declare-datatypes ((V!651 0))(
  ( (V!652 (val!183 Int)) )
))
(declare-fun minValue!1434 () V!651)

(declare-datatypes ((array!643 0))(
  ( (array!644 (arr!309 (Array (_ BitVec 32) (_ BitVec 64))) (size!371 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!643)

(declare-fun k!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!651)

(declare-datatypes ((ValueCell!161 0))(
  ( (ValueCellFull!161 (v!1275 V!651)) (EmptyCell!161) )
))
(declare-datatypes ((array!645 0))(
  ( (array!646 (arr!310 (Array (_ BitVec 32) ValueCell!161)) (size!372 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!645)

(declare-datatypes ((tuple2!198 0))(
  ( (tuple2!199 (_1!99 (_ BitVec 64)) (_2!99 V!651)) )
))
(declare-datatypes ((List!207 0))(
  ( (Nil!204) (Cons!203 (h!769 tuple2!198) (t!2344 List!207)) )
))
(declare-datatypes ((ListLongMap!203 0))(
  ( (ListLongMap!204 (toList!117 List!207)) )
))
(declare-fun contains!92 (ListLongMap!203 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!76 (array!643 array!645 (_ BitVec 32) (_ BitVec 32) V!651 V!651 (_ BitVec 32) Int) ListLongMap!203)

(assert (=> b!7554 (= lt!1554 (contains!92 (getCurrentListMap!76 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k!1278))))

(declare-fun b!7555 () Bool)

(declare-fun e!4217 () Bool)

(declare-fun tp_is_empty!355 () Bool)

(assert (=> b!7555 (= e!4217 tp_is_empty!355)))

(declare-fun mapNonEmpty!506 () Bool)

(declare-fun mapRes!506 () Bool)

(declare-fun tp!1063 () Bool)

(declare-fun e!4215 () Bool)

(assert (=> mapNonEmpty!506 (= mapRes!506 (and tp!1063 e!4215))))

(declare-fun mapKey!506 () (_ BitVec 32))

(declare-fun mapRest!506 () (Array (_ BitVec 32) ValueCell!161))

(declare-fun mapValue!506 () ValueCell!161)

(assert (=> mapNonEmpty!506 (= (arr!310 _values!1492) (store mapRest!506 mapKey!506 mapValue!506))))

(declare-fun b!7556 () Bool)

(assert (=> b!7556 (= e!4215 tp_is_empty!355)))

(declare-fun b!7557 () Bool)

(declare-fun res!7471 () Bool)

(assert (=> b!7557 (=> (not res!7471) (not e!4216))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!643 (_ BitVec 32)) Bool)

(assert (=> b!7557 (= res!7471 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun res!7473 () Bool)

(assert (=> start!904 (=> (not res!7473) (not e!4216))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!904 (= res!7473 (validMask!0 mask!2250))))

(assert (=> start!904 e!4216))

(assert (=> start!904 tp!1064))

(assert (=> start!904 true))

(declare-fun e!4213 () Bool)

(declare-fun array_inv!229 (array!645) Bool)

(assert (=> start!904 (and (array_inv!229 _values!1492) e!4213)))

(assert (=> start!904 tp_is_empty!355))

(declare-fun array_inv!230 (array!643) Bool)

(assert (=> start!904 (array_inv!230 _keys!1806)))

(declare-fun b!7558 () Bool)

(declare-fun res!7474 () Bool)

(assert (=> b!7558 (=> (not res!7474) (not e!4216))))

(declare-datatypes ((List!208 0))(
  ( (Nil!205) (Cons!204 (h!770 (_ BitVec 64)) (t!2345 List!208)) )
))
(declare-fun arrayNoDuplicates!0 (array!643 (_ BitVec 32) List!208) Bool)

(assert (=> b!7558 (= res!7474 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!205))))

(declare-fun b!7559 () Bool)

(assert (=> b!7559 (= e!4213 (and e!4217 mapRes!506))))

(declare-fun condMapEmpty!506 () Bool)

(declare-fun mapDefault!506 () ValueCell!161)

