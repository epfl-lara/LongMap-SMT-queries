; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!898 () Bool)

(assert start!898)

(declare-fun b_free!271 () Bool)

(declare-fun b_next!271 () Bool)

(assert (=> start!898 (= b_free!271 (not b_next!271))))

(declare-fun tp!1046 () Bool)

(declare-fun b_and!419 () Bool)

(assert (=> start!898 (= tp!1046 b_and!419)))

(declare-fun b!7491 () Bool)

(declare-fun res!7436 () Bool)

(declare-fun e!4171 () Bool)

(assert (=> b!7491 (=> (not res!7436) (not e!4171))))

(declare-datatypes ((array!623 0))(
  ( (array!624 (arr!299 (Array (_ BitVec 32) (_ BitVec 64))) (size!361 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!623)

(declare-datatypes ((List!202 0))(
  ( (Nil!199) (Cons!198 (h!764 (_ BitVec 64)) (t!2339 List!202)) )
))
(declare-fun arrayNoDuplicates!0 (array!623 (_ BitVec 32) List!202) Bool)

(assert (=> b!7491 (= res!7436 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!199))))

(declare-fun b!7493 () Bool)

(declare-fun res!7435 () Bool)

(assert (=> b!7493 (=> (not res!7435) (not e!4171))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!623 (_ BitVec 32)) Bool)

(assert (=> b!7493 (= res!7435 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!497 () Bool)

(declare-fun mapRes!497 () Bool)

(assert (=> mapIsEmpty!497 mapRes!497))

(declare-fun b!7494 () Bool)

(declare-fun e!4172 () Bool)

(declare-fun tp_is_empty!349 () Bool)

(assert (=> b!7494 (= e!4172 tp_is_empty!349)))

(declare-fun b!7495 () Bool)

(declare-fun e!4170 () Bool)

(assert (=> b!7495 (= e!4170 tp_is_empty!349)))

(declare-fun b!7496 () Bool)

(declare-fun res!7438 () Bool)

(assert (=> b!7496 (=> (not res!7438) (not e!4171))))

(declare-datatypes ((V!643 0))(
  ( (V!644 (val!180 Int)) )
))
(declare-datatypes ((ValueCell!158 0))(
  ( (ValueCellFull!158 (v!1272 V!643)) (EmptyCell!158) )
))
(declare-datatypes ((array!625 0))(
  ( (array!626 (arr!300 (Array (_ BitVec 32) ValueCell!158)) (size!362 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!625)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7496 (= res!7438 (and (= (size!362 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!361 _keys!1806) (size!362 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7497 () Bool)

(assert (=> b!7497 (= e!4171 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!643)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!643)

(declare-fun lt!1545 () Bool)

(declare-datatypes ((tuple2!190 0))(
  ( (tuple2!191 (_1!95 (_ BitVec 64)) (_2!95 V!643)) )
))
(declare-datatypes ((List!203 0))(
  ( (Nil!200) (Cons!199 (h!765 tuple2!190) (t!2340 List!203)) )
))
(declare-datatypes ((ListLongMap!195 0))(
  ( (ListLongMap!196 (toList!113 List!203)) )
))
(declare-fun contains!88 (ListLongMap!195 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!72 (array!623 array!625 (_ BitVec 32) (_ BitVec 32) V!643 V!643 (_ BitVec 32) Int) ListLongMap!195)

(assert (=> b!7497 (= lt!1545 (contains!88 (getCurrentListMap!72 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapNonEmpty!497 () Bool)

(declare-fun tp!1045 () Bool)

(assert (=> mapNonEmpty!497 (= mapRes!497 (and tp!1045 e!4170))))

(declare-fun mapValue!497 () ValueCell!158)

(declare-fun mapKey!497 () (_ BitVec 32))

(declare-fun mapRest!497 () (Array (_ BitVec 32) ValueCell!158))

(assert (=> mapNonEmpty!497 (= (arr!300 _values!1492) (store mapRest!497 mapKey!497 mapValue!497))))

(declare-fun res!7437 () Bool)

(assert (=> start!898 (=> (not res!7437) (not e!4171))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!898 (= res!7437 (validMask!0 mask!2250))))

(assert (=> start!898 e!4171))

(assert (=> start!898 tp!1046))

(assert (=> start!898 true))

(declare-fun e!4168 () Bool)

(declare-fun array_inv!217 (array!625) Bool)

(assert (=> start!898 (and (array_inv!217 _values!1492) e!4168)))

(assert (=> start!898 tp_is_empty!349))

(declare-fun array_inv!218 (array!623) Bool)

(assert (=> start!898 (array_inv!218 _keys!1806)))

(declare-fun b!7492 () Bool)

(assert (=> b!7492 (= e!4168 (and e!4172 mapRes!497))))

(declare-fun condMapEmpty!497 () Bool)

(declare-fun mapDefault!497 () ValueCell!158)

(assert (=> b!7492 (= condMapEmpty!497 (= (arr!300 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!158)) mapDefault!497)))))

(assert (= (and start!898 res!7437) b!7496))

(assert (= (and b!7496 res!7438) b!7493))

(assert (= (and b!7493 res!7435) b!7491))

(assert (= (and b!7491 res!7436) b!7497))

(assert (= (and b!7492 condMapEmpty!497) mapIsEmpty!497))

(assert (= (and b!7492 (not condMapEmpty!497)) mapNonEmpty!497))

(get-info :version)

(assert (= (and mapNonEmpty!497 ((_ is ValueCellFull!158) mapValue!497)) b!7495))

(assert (= (and b!7492 ((_ is ValueCellFull!158) mapDefault!497)) b!7494))

(assert (= start!898 b!7492))

(declare-fun m!4517 () Bool)

(assert (=> mapNonEmpty!497 m!4517))

(declare-fun m!4519 () Bool)

(assert (=> start!898 m!4519))

(declare-fun m!4521 () Bool)

(assert (=> start!898 m!4521))

(declare-fun m!4523 () Bool)

(assert (=> start!898 m!4523))

(declare-fun m!4525 () Bool)

(assert (=> b!7497 m!4525))

(assert (=> b!7497 m!4525))

(declare-fun m!4527 () Bool)

(assert (=> b!7497 m!4527))

(declare-fun m!4529 () Bool)

(assert (=> b!7493 m!4529))

(declare-fun m!4531 () Bool)

(assert (=> b!7491 m!4531))

(check-sat (not b!7493) (not b!7497) (not mapNonEmpty!497) tp_is_empty!349 b_and!419 (not start!898) (not b_next!271) (not b!7491))
(check-sat b_and!419 (not b_next!271))
