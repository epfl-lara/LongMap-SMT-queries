; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!892 () Bool)

(assert start!892)

(declare-fun b_free!265 () Bool)

(declare-fun b_next!265 () Bool)

(assert (=> start!892 (= b_free!265 (not b_next!265))))

(declare-fun tp!1027 () Bool)

(declare-fun b_and!413 () Bool)

(assert (=> start!892 (= tp!1027 b_and!413)))

(declare-fun b!7428 () Bool)

(declare-fun res!7399 () Bool)

(declare-fun e!4126 () Bool)

(assert (=> b!7428 (=> (not res!7399) (not e!4126))))

(declare-datatypes ((array!611 0))(
  ( (array!612 (arr!293 (Array (_ BitVec 32) (_ BitVec 64))) (size!355 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!611)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!611 (_ BitVec 32)) Bool)

(assert (=> b!7428 (= res!7399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7429 () Bool)

(declare-fun res!7402 () Bool)

(assert (=> b!7429 (=> (not res!7402) (not e!4126))))

(declare-datatypes ((List!197 0))(
  ( (Nil!194) (Cons!193 (h!759 (_ BitVec 64)) (t!2334 List!197)) )
))
(declare-fun arrayNoDuplicates!0 (array!611 (_ BitVec 32) List!197) Bool)

(assert (=> b!7429 (= res!7402 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!194))))

(declare-fun mapNonEmpty!488 () Bool)

(declare-fun mapRes!488 () Bool)

(declare-fun tp!1028 () Bool)

(declare-fun e!4124 () Bool)

(assert (=> mapNonEmpty!488 (= mapRes!488 (and tp!1028 e!4124))))

(declare-datatypes ((V!635 0))(
  ( (V!636 (val!177 Int)) )
))
(declare-datatypes ((ValueCell!155 0))(
  ( (ValueCellFull!155 (v!1269 V!635)) (EmptyCell!155) )
))
(declare-fun mapRest!488 () (Array (_ BitVec 32) ValueCell!155))

(declare-fun mapValue!488 () ValueCell!155)

(declare-datatypes ((array!613 0))(
  ( (array!614 (arr!294 (Array (_ BitVec 32) ValueCell!155)) (size!356 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!613)

(declare-fun mapKey!488 () (_ BitVec 32))

(assert (=> mapNonEmpty!488 (= (arr!294 _values!1492) (store mapRest!488 mapKey!488 mapValue!488))))

(declare-fun b!7430 () Bool)

(declare-fun e!4127 () Bool)

(declare-fun e!4123 () Bool)

(assert (=> b!7430 (= e!4127 (and e!4123 mapRes!488))))

(declare-fun condMapEmpty!488 () Bool)

(declare-fun mapDefault!488 () ValueCell!155)

(assert (=> b!7430 (= condMapEmpty!488 (= (arr!294 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!155)) mapDefault!488)))))

(declare-fun mapIsEmpty!488 () Bool)

(assert (=> mapIsEmpty!488 mapRes!488))

(declare-fun b!7432 () Bool)

(declare-fun tp_is_empty!343 () Bool)

(assert (=> b!7432 (= e!4124 tp_is_empty!343)))

(declare-fun b!7433 () Bool)

(declare-fun res!7400 () Bool)

(assert (=> b!7433 (=> (not res!7400) (not e!4126))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7433 (= res!7400 (and (= (size!356 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!355 _keys!1806) (size!356 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7434 () Bool)

(assert (=> b!7434 (= e!4126 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1536 () Bool)

(declare-fun minValue!1434 () V!635)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!635)

(declare-datatypes ((tuple2!186 0))(
  ( (tuple2!187 (_1!93 (_ BitVec 64)) (_2!93 V!635)) )
))
(declare-datatypes ((List!198 0))(
  ( (Nil!195) (Cons!194 (h!760 tuple2!186) (t!2335 List!198)) )
))
(declare-datatypes ((ListLongMap!191 0))(
  ( (ListLongMap!192 (toList!111 List!198)) )
))
(declare-fun contains!86 (ListLongMap!191 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!70 (array!611 array!613 (_ BitVec 32) (_ BitVec 32) V!635 V!635 (_ BitVec 32) Int) ListLongMap!191)

(assert (=> b!7434 (= lt!1536 (contains!86 (getCurrentListMap!70 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun res!7401 () Bool)

(assert (=> start!892 (=> (not res!7401) (not e!4126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!892 (= res!7401 (validMask!0 mask!2250))))

(assert (=> start!892 e!4126))

(assert (=> start!892 tp!1027))

(assert (=> start!892 true))

(declare-fun array_inv!213 (array!613) Bool)

(assert (=> start!892 (and (array_inv!213 _values!1492) e!4127)))

(assert (=> start!892 tp_is_empty!343))

(declare-fun array_inv!214 (array!611) Bool)

(assert (=> start!892 (array_inv!214 _keys!1806)))

(declare-fun b!7431 () Bool)

(assert (=> b!7431 (= e!4123 tp_is_empty!343)))

(assert (= (and start!892 res!7401) b!7433))

(assert (= (and b!7433 res!7400) b!7428))

(assert (= (and b!7428 res!7399) b!7429))

(assert (= (and b!7429 res!7402) b!7434))

(assert (= (and b!7430 condMapEmpty!488) mapIsEmpty!488))

(assert (= (and b!7430 (not condMapEmpty!488)) mapNonEmpty!488))

(get-info :version)

(assert (= (and mapNonEmpty!488 ((_ is ValueCellFull!155) mapValue!488)) b!7432))

(assert (= (and b!7430 ((_ is ValueCellFull!155) mapDefault!488)) b!7431))

(assert (= start!892 b!7430))

(declare-fun m!4469 () Bool)

(assert (=> b!7434 m!4469))

(assert (=> b!7434 m!4469))

(declare-fun m!4471 () Bool)

(assert (=> b!7434 m!4471))

(declare-fun m!4473 () Bool)

(assert (=> b!7428 m!4473))

(declare-fun m!4475 () Bool)

(assert (=> start!892 m!4475))

(declare-fun m!4477 () Bool)

(assert (=> start!892 m!4477))

(declare-fun m!4479 () Bool)

(assert (=> start!892 m!4479))

(declare-fun m!4481 () Bool)

(assert (=> mapNonEmpty!488 m!4481))

(declare-fun m!4483 () Bool)

(assert (=> b!7429 m!4483))

(check-sat (not b!7434) b_and!413 tp_is_empty!343 (not mapNonEmpty!488) (not start!892) (not b!7428) (not b!7429) (not b_next!265))
(check-sat b_and!413 (not b_next!265))
