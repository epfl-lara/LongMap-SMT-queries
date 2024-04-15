; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!904 () Bool)

(assert start!904)

(declare-fun b_free!277 () Bool)

(declare-fun b_next!277 () Bool)

(assert (=> start!904 (= b_free!277 (not b_next!277))))

(declare-fun tp!1063 () Bool)

(declare-fun b_and!425 () Bool)

(assert (=> start!904 (= tp!1063 b_and!425)))

(declare-fun mapIsEmpty!506 () Bool)

(declare-fun mapRes!506 () Bool)

(assert (=> mapIsEmpty!506 mapRes!506))

(declare-fun b!7554 () Bool)

(declare-fun e!4214 () Bool)

(assert (=> b!7554 (= e!4214 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((V!651 0))(
  ( (V!652 (val!183 Int)) )
))
(declare-datatypes ((ValueCell!161 0))(
  ( (ValueCellFull!161 (v!1275 V!651)) (EmptyCell!161) )
))
(declare-datatypes ((array!635 0))(
  ( (array!636 (arr!305 (Array (_ BitVec 32) ValueCell!161)) (size!367 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!635)

(declare-fun minValue!1434 () V!651)

(declare-datatypes ((array!637 0))(
  ( (array!638 (arr!306 (Array (_ BitVec 32) (_ BitVec 64))) (size!368 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!637)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lt!1554 () Bool)

(declare-fun zeroValue!1434 () V!651)

(declare-datatypes ((tuple2!194 0))(
  ( (tuple2!195 (_1!97 (_ BitVec 64)) (_2!97 V!651)) )
))
(declare-datatypes ((List!205 0))(
  ( (Nil!202) (Cons!201 (h!767 tuple2!194) (t!2342 List!205)) )
))
(declare-datatypes ((ListLongMap!199 0))(
  ( (ListLongMap!200 (toList!115 List!205)) )
))
(declare-fun contains!90 (ListLongMap!199 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!74 (array!637 array!635 (_ BitVec 32) (_ BitVec 32) V!651 V!651 (_ BitVec 32) Int) ListLongMap!199)

(assert (=> b!7554 (= lt!1554 (contains!90 (getCurrentListMap!74 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7555 () Bool)

(declare-fun e!4216 () Bool)

(declare-fun e!4215 () Bool)

(assert (=> b!7555 (= e!4216 (and e!4215 mapRes!506))))

(declare-fun condMapEmpty!506 () Bool)

(declare-fun mapDefault!506 () ValueCell!161)

(assert (=> b!7555 (= condMapEmpty!506 (= (arr!305 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!161)) mapDefault!506)))))

(declare-fun mapNonEmpty!506 () Bool)

(declare-fun tp!1064 () Bool)

(declare-fun e!4217 () Bool)

(assert (=> mapNonEmpty!506 (= mapRes!506 (and tp!1064 e!4217))))

(declare-fun mapValue!506 () ValueCell!161)

(declare-fun mapKey!506 () (_ BitVec 32))

(declare-fun mapRest!506 () (Array (_ BitVec 32) ValueCell!161))

(assert (=> mapNonEmpty!506 (= (arr!305 _values!1492) (store mapRest!506 mapKey!506 mapValue!506))))

(declare-fun b!7556 () Bool)

(declare-fun tp_is_empty!355 () Bool)

(assert (=> b!7556 (= e!4215 tp_is_empty!355)))

(declare-fun res!7474 () Bool)

(assert (=> start!904 (=> (not res!7474) (not e!4214))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!904 (= res!7474 (validMask!0 mask!2250))))

(assert (=> start!904 e!4214))

(assert (=> start!904 tp!1063))

(assert (=> start!904 true))

(declare-fun array_inv!221 (array!635) Bool)

(assert (=> start!904 (and (array_inv!221 _values!1492) e!4216)))

(assert (=> start!904 tp_is_empty!355))

(declare-fun array_inv!222 (array!637) Bool)

(assert (=> start!904 (array_inv!222 _keys!1806)))

(declare-fun b!7557 () Bool)

(declare-fun res!7473 () Bool)

(assert (=> b!7557 (=> (not res!7473) (not e!4214))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!637 (_ BitVec 32)) Bool)

(assert (=> b!7557 (= res!7473 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7558 () Bool)

(declare-fun res!7471 () Bool)

(assert (=> b!7558 (=> (not res!7471) (not e!4214))))

(assert (=> b!7558 (= res!7471 (and (= (size!367 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!368 _keys!1806) (size!367 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7559 () Bool)

(declare-fun res!7472 () Bool)

(assert (=> b!7559 (=> (not res!7472) (not e!4214))))

(declare-datatypes ((List!206 0))(
  ( (Nil!203) (Cons!202 (h!768 (_ BitVec 64)) (t!2343 List!206)) )
))
(declare-fun arrayNoDuplicates!0 (array!637 (_ BitVec 32) List!206) Bool)

(assert (=> b!7559 (= res!7472 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!203))))

(declare-fun b!7560 () Bool)

(assert (=> b!7560 (= e!4217 tp_is_empty!355)))

(assert (= (and start!904 res!7474) b!7558))

(assert (= (and b!7558 res!7471) b!7557))

(assert (= (and b!7557 res!7473) b!7559))

(assert (= (and b!7559 res!7472) b!7554))

(assert (= (and b!7555 condMapEmpty!506) mapIsEmpty!506))

(assert (= (and b!7555 (not condMapEmpty!506)) mapNonEmpty!506))

(get-info :version)

(assert (= (and mapNonEmpty!506 ((_ is ValueCellFull!161) mapValue!506)) b!7560))

(assert (= (and b!7555 ((_ is ValueCellFull!161) mapDefault!506)) b!7556))

(assert (= start!904 b!7555))

(declare-fun m!4565 () Bool)

(assert (=> start!904 m!4565))

(declare-fun m!4567 () Bool)

(assert (=> start!904 m!4567))

(declare-fun m!4569 () Bool)

(assert (=> start!904 m!4569))

(declare-fun m!4571 () Bool)

(assert (=> b!7557 m!4571))

(declare-fun m!4573 () Bool)

(assert (=> mapNonEmpty!506 m!4573))

(declare-fun m!4575 () Bool)

(assert (=> b!7559 m!4575))

(declare-fun m!4577 () Bool)

(assert (=> b!7554 m!4577))

(assert (=> b!7554 m!4577))

(declare-fun m!4579 () Bool)

(assert (=> b!7554 m!4579))

(check-sat (not b!7554) (not b!7559) (not mapNonEmpty!506) (not b!7557) (not b_next!277) b_and!425 tp_is_empty!355 (not start!904))
(check-sat b_and!425 (not b_next!277))
