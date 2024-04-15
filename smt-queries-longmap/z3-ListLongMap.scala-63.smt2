; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!910 () Bool)

(assert start!910)

(declare-fun b_free!283 () Bool)

(declare-fun b_next!283 () Bool)

(assert (=> start!910 (= b_free!283 (not b_next!283))))

(declare-fun tp!1082 () Bool)

(declare-fun b_and!431 () Bool)

(assert (=> start!910 (= tp!1082 b_and!431)))

(declare-fun b!7617 () Bool)

(declare-fun e!4262 () Bool)

(declare-fun tp_is_empty!361 () Bool)

(assert (=> b!7617 (= e!4262 tp_is_empty!361)))

(declare-fun b!7618 () Bool)

(declare-fun e!4261 () Bool)

(assert (=> b!7618 (= e!4261 tp_is_empty!361)))

(declare-fun b!7619 () Bool)

(declare-fun e!4260 () Bool)

(declare-fun mapRes!515 () Bool)

(assert (=> b!7619 (= e!4260 (and e!4261 mapRes!515))))

(declare-fun condMapEmpty!515 () Bool)

(declare-datatypes ((V!659 0))(
  ( (V!660 (val!186 Int)) )
))
(declare-datatypes ((ValueCell!164 0))(
  ( (ValueCellFull!164 (v!1278 V!659)) (EmptyCell!164) )
))
(declare-datatypes ((array!647 0))(
  ( (array!648 (arr!311 (Array (_ BitVec 32) ValueCell!164)) (size!373 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!647)

(declare-fun mapDefault!515 () ValueCell!164)

(assert (=> b!7619 (= condMapEmpty!515 (= (arr!311 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!164)) mapDefault!515)))))

(declare-fun b!7620 () Bool)

(declare-fun res!7507 () Bool)

(declare-fun e!4259 () Bool)

(assert (=> b!7620 (=> (not res!7507) (not e!4259))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-datatypes ((array!649 0))(
  ( (array!650 (arr!312 (Array (_ BitVec 32) (_ BitVec 64))) (size!374 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!649)

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7620 (= res!7507 (and (= (size!373 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!374 _keys!1806) (size!373 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7621 () Bool)

(declare-fun res!7510 () Bool)

(assert (=> b!7621 (=> (not res!7510) (not e!4259))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!649 (_ BitVec 32)) Bool)

(assert (=> b!7621 (= res!7510 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7622 () Bool)

(assert (=> b!7622 (= e!4259 false)))

(declare-fun lt!1563 () Bool)

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!659)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!659)

(declare-datatypes ((tuple2!200 0))(
  ( (tuple2!201 (_1!100 (_ BitVec 64)) (_2!100 V!659)) )
))
(declare-datatypes ((List!211 0))(
  ( (Nil!208) (Cons!207 (h!773 tuple2!200) (t!2348 List!211)) )
))
(declare-datatypes ((ListLongMap!205 0))(
  ( (ListLongMap!206 (toList!118 List!211)) )
))
(declare-fun contains!93 (ListLongMap!205 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!77 (array!649 array!647 (_ BitVec 32) (_ BitVec 32) V!659 V!659 (_ BitVec 32) Int) ListLongMap!205)

(assert (=> b!7622 (= lt!1563 (contains!93 (getCurrentListMap!77 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun mapIsEmpty!515 () Bool)

(assert (=> mapIsEmpty!515 mapRes!515))

(declare-fun mapNonEmpty!515 () Bool)

(declare-fun tp!1081 () Bool)

(assert (=> mapNonEmpty!515 (= mapRes!515 (and tp!1081 e!4262))))

(declare-fun mapRest!515 () (Array (_ BitVec 32) ValueCell!164))

(declare-fun mapValue!515 () ValueCell!164)

(declare-fun mapKey!515 () (_ BitVec 32))

(assert (=> mapNonEmpty!515 (= (arr!311 _values!1492) (store mapRest!515 mapKey!515 mapValue!515))))

(declare-fun res!7508 () Bool)

(assert (=> start!910 (=> (not res!7508) (not e!4259))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!910 (= res!7508 (validMask!0 mask!2250))))

(assert (=> start!910 e!4259))

(assert (=> start!910 tp!1082))

(assert (=> start!910 true))

(declare-fun array_inv!225 (array!647) Bool)

(assert (=> start!910 (and (array_inv!225 _values!1492) e!4260)))

(assert (=> start!910 tp_is_empty!361))

(declare-fun array_inv!226 (array!649) Bool)

(assert (=> start!910 (array_inv!226 _keys!1806)))

(declare-fun b!7623 () Bool)

(declare-fun res!7509 () Bool)

(assert (=> b!7623 (=> (not res!7509) (not e!4259))))

(declare-datatypes ((List!212 0))(
  ( (Nil!209) (Cons!208 (h!774 (_ BitVec 64)) (t!2349 List!212)) )
))
(declare-fun arrayNoDuplicates!0 (array!649 (_ BitVec 32) List!212) Bool)

(assert (=> b!7623 (= res!7509 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!209))))

(assert (= (and start!910 res!7508) b!7620))

(assert (= (and b!7620 res!7507) b!7621))

(assert (= (and b!7621 res!7510) b!7623))

(assert (= (and b!7623 res!7509) b!7622))

(assert (= (and b!7619 condMapEmpty!515) mapIsEmpty!515))

(assert (= (and b!7619 (not condMapEmpty!515)) mapNonEmpty!515))

(get-info :version)

(assert (= (and mapNonEmpty!515 ((_ is ValueCellFull!164) mapValue!515)) b!7617))

(assert (= (and b!7619 ((_ is ValueCellFull!164) mapDefault!515)) b!7618))

(assert (= start!910 b!7619))

(declare-fun m!4613 () Bool)

(assert (=> b!7623 m!4613))

(declare-fun m!4615 () Bool)

(assert (=> mapNonEmpty!515 m!4615))

(declare-fun m!4617 () Bool)

(assert (=> b!7621 m!4617))

(declare-fun m!4619 () Bool)

(assert (=> start!910 m!4619))

(declare-fun m!4621 () Bool)

(assert (=> start!910 m!4621))

(declare-fun m!4623 () Bool)

(assert (=> start!910 m!4623))

(declare-fun m!4625 () Bool)

(assert (=> b!7622 m!4625))

(assert (=> b!7622 m!4625))

(declare-fun m!4627 () Bool)

(assert (=> b!7622 m!4627))

(check-sat (not start!910) (not mapNonEmpty!515) (not b!7621) tp_is_empty!361 (not b!7622) (not b!7623) (not b_next!283) b_and!431)
(check-sat b_and!431 (not b_next!283))
