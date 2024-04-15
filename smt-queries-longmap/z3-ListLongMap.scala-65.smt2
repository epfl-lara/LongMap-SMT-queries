; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!922 () Bool)

(assert start!922)

(declare-fun b_free!295 () Bool)

(declare-fun b_next!295 () Bool)

(assert (=> start!922 (= b_free!295 (not b_next!295))))

(declare-fun tp!1118 () Bool)

(declare-fun b_and!443 () Bool)

(assert (=> start!922 (= tp!1118 b_and!443)))

(declare-fun res!7582 () Bool)

(declare-fun e!4348 () Bool)

(assert (=> start!922 (=> (not res!7582) (not e!4348))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!922 (= res!7582 (validMask!0 mask!2250))))

(assert (=> start!922 e!4348))

(assert (=> start!922 tp!1118))

(assert (=> start!922 true))

(declare-datatypes ((V!675 0))(
  ( (V!676 (val!192 Int)) )
))
(declare-datatypes ((ValueCell!170 0))(
  ( (ValueCellFull!170 (v!1284 V!675)) (EmptyCell!170) )
))
(declare-datatypes ((array!669 0))(
  ( (array!670 (arr!322 (Array (_ BitVec 32) ValueCell!170)) (size!384 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!669)

(declare-fun e!4349 () Bool)

(declare-fun array_inv!235 (array!669) Bool)

(assert (=> start!922 (and (array_inv!235 _values!1492) e!4349)))

(declare-fun tp_is_empty!373 () Bool)

(assert (=> start!922 tp_is_empty!373))

(declare-datatypes ((array!671 0))(
  ( (array!672 (arr!323 (Array (_ BitVec 32) (_ BitVec 64))) (size!385 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!671)

(declare-fun array_inv!236 (array!671) Bool)

(assert (=> start!922 (array_inv!236 _keys!1806)))

(declare-fun b!7743 () Bool)

(declare-fun res!7579 () Bool)

(assert (=> b!7743 (=> (not res!7579) (not e!4348))))

(declare-datatypes ((List!220 0))(
  ( (Nil!217) (Cons!216 (h!782 (_ BitVec 64)) (t!2357 List!220)) )
))
(declare-fun arrayNoDuplicates!0 (array!671 (_ BitVec 32) List!220) Bool)

(assert (=> b!7743 (= res!7579 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!217))))

(declare-fun b!7744 () Bool)

(declare-fun e!4351 () Bool)

(assert (=> b!7744 (= e!4351 tp_is_empty!373)))

(declare-fun mapNonEmpty!533 () Bool)

(declare-fun mapRes!533 () Bool)

(declare-fun tp!1117 () Bool)

(declare-fun e!4352 () Bool)

(assert (=> mapNonEmpty!533 (= mapRes!533 (and tp!1117 e!4352))))

(declare-fun mapKey!533 () (_ BitVec 32))

(declare-fun mapValue!533 () ValueCell!170)

(declare-fun mapRest!533 () (Array (_ BitVec 32) ValueCell!170))

(assert (=> mapNonEmpty!533 (= (arr!322 _values!1492) (store mapRest!533 mapKey!533 mapValue!533))))

(declare-fun b!7745 () Bool)

(assert (=> b!7745 (= e!4352 tp_is_empty!373)))

(declare-fun b!7746 () Bool)

(assert (=> b!7746 (= e!4349 (and e!4351 mapRes!533))))

(declare-fun condMapEmpty!533 () Bool)

(declare-fun mapDefault!533 () ValueCell!170)

(assert (=> b!7746 (= condMapEmpty!533 (= (arr!322 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!170)) mapDefault!533)))))

(declare-fun b!7747 () Bool)

(assert (=> b!7747 (= e!4348 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun lt!1581 () Bool)

(declare-fun minValue!1434 () V!675)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(declare-fun zeroValue!1434 () V!675)

(declare-datatypes ((tuple2!208 0))(
  ( (tuple2!209 (_1!104 (_ BitVec 64)) (_2!104 V!675)) )
))
(declare-datatypes ((List!221 0))(
  ( (Nil!218) (Cons!217 (h!783 tuple2!208) (t!2358 List!221)) )
))
(declare-datatypes ((ListLongMap!213 0))(
  ( (ListLongMap!214 (toList!122 List!221)) )
))
(declare-fun contains!97 (ListLongMap!213 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!81 (array!671 array!669 (_ BitVec 32) (_ BitVec 32) V!675 V!675 (_ BitVec 32) Int) ListLongMap!213)

(assert (=> b!7747 (= lt!1581 (contains!97 (getCurrentListMap!81 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7748 () Bool)

(declare-fun res!7581 () Bool)

(assert (=> b!7748 (=> (not res!7581) (not e!4348))))

(assert (=> b!7748 (= res!7581 (and (= (size!384 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!385 _keys!1806) (size!384 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!533 () Bool)

(assert (=> mapIsEmpty!533 mapRes!533))

(declare-fun b!7749 () Bool)

(declare-fun res!7580 () Bool)

(assert (=> b!7749 (=> (not res!7580) (not e!4348))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!671 (_ BitVec 32)) Bool)

(assert (=> b!7749 (= res!7580 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(assert (= (and start!922 res!7582) b!7748))

(assert (= (and b!7748 res!7581) b!7749))

(assert (= (and b!7749 res!7580) b!7743))

(assert (= (and b!7743 res!7579) b!7747))

(assert (= (and b!7746 condMapEmpty!533) mapIsEmpty!533))

(assert (= (and b!7746 (not condMapEmpty!533)) mapNonEmpty!533))

(get-info :version)

(assert (= (and mapNonEmpty!533 ((_ is ValueCellFull!170) mapValue!533)) b!7745))

(assert (= (and b!7746 ((_ is ValueCellFull!170) mapDefault!533)) b!7744))

(assert (= start!922 b!7746))

(declare-fun m!4709 () Bool)

(assert (=> b!7749 m!4709))

(declare-fun m!4711 () Bool)

(assert (=> mapNonEmpty!533 m!4711))

(declare-fun m!4713 () Bool)

(assert (=> b!7747 m!4713))

(assert (=> b!7747 m!4713))

(declare-fun m!4715 () Bool)

(assert (=> b!7747 m!4715))

(declare-fun m!4717 () Bool)

(assert (=> start!922 m!4717))

(declare-fun m!4719 () Bool)

(assert (=> start!922 m!4719))

(declare-fun m!4721 () Bool)

(assert (=> start!922 m!4721))

(declare-fun m!4723 () Bool)

(assert (=> b!7743 m!4723))

(check-sat (not start!922) (not mapNonEmpty!533) tp_is_empty!373 (not b_next!295) (not b!7747) (not b!7743) b_and!443 (not b!7749))
(check-sat b_and!443 (not b_next!295))
