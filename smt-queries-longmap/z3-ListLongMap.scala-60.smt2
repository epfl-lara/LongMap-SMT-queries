; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!894 () Bool)

(assert start!894)

(declare-fun b_free!267 () Bool)

(declare-fun b_next!267 () Bool)

(assert (=> start!894 (= b_free!267 (not b_next!267))))

(declare-fun tp!1034 () Bool)

(declare-fun b_and!415 () Bool)

(assert (=> start!894 (= tp!1034 b_and!415)))

(declare-fun mapNonEmpty!491 () Bool)

(declare-fun mapRes!491 () Bool)

(declare-fun tp!1033 () Bool)

(declare-fun e!4139 () Bool)

(assert (=> mapNonEmpty!491 (= mapRes!491 (and tp!1033 e!4139))))

(declare-datatypes ((V!637 0))(
  ( (V!638 (val!178 Int)) )
))
(declare-datatypes ((ValueCell!156 0))(
  ( (ValueCellFull!156 (v!1270 V!637)) (EmptyCell!156) )
))
(declare-fun mapValue!491 () ValueCell!156)

(declare-datatypes ((array!623 0))(
  ( (array!624 (arr!299 (Array (_ BitVec 32) ValueCell!156)) (size!361 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!623)

(declare-fun mapRest!491 () (Array (_ BitVec 32) ValueCell!156))

(declare-fun mapKey!491 () (_ BitVec 32))

(assert (=> mapNonEmpty!491 (= (arr!299 _values!1492) (store mapRest!491 mapKey!491 mapValue!491))))

(declare-fun b!7449 () Bool)

(declare-fun e!4142 () Bool)

(assert (=> b!7449 (= e!4142 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun minValue!1434 () V!637)

(declare-datatypes ((array!625 0))(
  ( (array!626 (arr!300 (Array (_ BitVec 32) (_ BitVec 64))) (size!362 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!625)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun lt!1539 () Bool)

(declare-fun zeroValue!1434 () V!637)

(declare-datatypes ((tuple2!192 0))(
  ( (tuple2!193 (_1!96 (_ BitVec 64)) (_2!96 V!637)) )
))
(declare-datatypes ((List!201 0))(
  ( (Nil!198) (Cons!197 (h!763 tuple2!192) (t!2338 List!201)) )
))
(declare-datatypes ((ListLongMap!197 0))(
  ( (ListLongMap!198 (toList!114 List!201)) )
))
(declare-fun contains!89 (ListLongMap!197 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!73 (array!625 array!623 (_ BitVec 32) (_ BitVec 32) V!637 V!637 (_ BitVec 32) Int) ListLongMap!197)

(assert (=> b!7449 (= lt!1539 (contains!89 (getCurrentListMap!73 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7450 () Bool)

(declare-fun res!7412 () Bool)

(assert (=> b!7450 (=> (not res!7412) (not e!4142))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!625 (_ BitVec 32)) Bool)

(assert (=> b!7450 (= res!7412 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun mapIsEmpty!491 () Bool)

(assert (=> mapIsEmpty!491 mapRes!491))

(declare-fun b!7451 () Bool)

(declare-fun e!4140 () Bool)

(declare-fun e!4141 () Bool)

(assert (=> b!7451 (= e!4140 (and e!4141 mapRes!491))))

(declare-fun condMapEmpty!491 () Bool)

(declare-fun mapDefault!491 () ValueCell!156)

(assert (=> b!7451 (= condMapEmpty!491 (= (arr!299 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!156)) mapDefault!491)))))

(declare-fun b!7452 () Bool)

(declare-fun tp_is_empty!345 () Bool)

(assert (=> b!7452 (= e!4141 tp_is_empty!345)))

(declare-fun res!7414 () Bool)

(assert (=> start!894 (=> (not res!7414) (not e!4142))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!894 (= res!7414 (validMask!0 mask!2250))))

(assert (=> start!894 e!4142))

(assert (=> start!894 tp!1034))

(assert (=> start!894 true))

(declare-fun array_inv!221 (array!623) Bool)

(assert (=> start!894 (and (array_inv!221 _values!1492) e!4140)))

(assert (=> start!894 tp_is_empty!345))

(declare-fun array_inv!222 (array!625) Bool)

(assert (=> start!894 (array_inv!222 _keys!1806)))

(declare-fun b!7453 () Bool)

(assert (=> b!7453 (= e!4139 tp_is_empty!345)))

(declare-fun b!7454 () Bool)

(declare-fun res!7411 () Bool)

(assert (=> b!7454 (=> (not res!7411) (not e!4142))))

(assert (=> b!7454 (= res!7411 (and (= (size!361 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!362 _keys!1806) (size!361 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7455 () Bool)

(declare-fun res!7413 () Bool)

(assert (=> b!7455 (=> (not res!7413) (not e!4142))))

(declare-datatypes ((List!202 0))(
  ( (Nil!199) (Cons!198 (h!764 (_ BitVec 64)) (t!2339 List!202)) )
))
(declare-fun arrayNoDuplicates!0 (array!625 (_ BitVec 32) List!202) Bool)

(assert (=> b!7455 (= res!7413 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!199))))

(assert (= (and start!894 res!7414) b!7454))

(assert (= (and b!7454 res!7411) b!7450))

(assert (= (and b!7450 res!7412) b!7455))

(assert (= (and b!7455 res!7413) b!7449))

(assert (= (and b!7451 condMapEmpty!491) mapIsEmpty!491))

(assert (= (and b!7451 (not condMapEmpty!491)) mapNonEmpty!491))

(get-info :version)

(assert (= (and mapNonEmpty!491 ((_ is ValueCellFull!156) mapValue!491)) b!7453))

(assert (= (and b!7451 ((_ is ValueCellFull!156) mapDefault!491)) b!7452))

(assert (= start!894 b!7451))

(declare-fun m!4485 () Bool)

(assert (=> b!7449 m!4485))

(assert (=> b!7449 m!4485))

(declare-fun m!4487 () Bool)

(assert (=> b!7449 m!4487))

(declare-fun m!4489 () Bool)

(assert (=> mapNonEmpty!491 m!4489))

(declare-fun m!4491 () Bool)

(assert (=> start!894 m!4491))

(declare-fun m!4493 () Bool)

(assert (=> start!894 m!4493))

(declare-fun m!4495 () Bool)

(assert (=> start!894 m!4495))

(declare-fun m!4497 () Bool)

(assert (=> b!7450 m!4497))

(declare-fun m!4499 () Bool)

(assert (=> b!7455 m!4499))

(check-sat (not mapNonEmpty!491) b_and!415 (not b!7455) (not b_next!267) (not b!7450) (not start!894) tp_is_empty!345 (not b!7449))
(check-sat b_and!415 (not b_next!267))
