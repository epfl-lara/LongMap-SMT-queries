; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!916 () Bool)

(assert start!916)

(declare-fun b_free!289 () Bool)

(declare-fun b_next!289 () Bool)

(assert (=> start!916 (= b_free!289 (not b_next!289))))

(declare-fun tp!1099 () Bool)

(declare-fun b_and!437 () Bool)

(assert (=> start!916 (= tp!1099 b_and!437)))

(declare-fun b!7680 () Bool)

(declare-fun res!7544 () Bool)

(declare-fun e!4303 () Bool)

(assert (=> b!7680 (=> (not res!7544) (not e!4303))))

(declare-datatypes ((array!657 0))(
  ( (array!658 (arr!316 (Array (_ BitVec 32) (_ BitVec 64))) (size!378 (_ BitVec 32))) )
))
(declare-fun _keys!1806 () array!657)

(declare-datatypes ((List!215 0))(
  ( (Nil!212) (Cons!211 (h!777 (_ BitVec 64)) (t!2352 List!215)) )
))
(declare-fun arrayNoDuplicates!0 (array!657 (_ BitVec 32) List!215) Bool)

(assert (=> b!7680 (= res!7544 (arrayNoDuplicates!0 _keys!1806 #b00000000000000000000000000000000 Nil!212))))

(declare-fun mapNonEmpty!524 () Bool)

(declare-fun mapRes!524 () Bool)

(declare-fun tp!1100 () Bool)

(declare-fun e!4306 () Bool)

(assert (=> mapNonEmpty!524 (= mapRes!524 (and tp!1100 e!4306))))

(declare-datatypes ((V!667 0))(
  ( (V!668 (val!189 Int)) )
))
(declare-datatypes ((ValueCell!167 0))(
  ( (ValueCellFull!167 (v!1281 V!667)) (EmptyCell!167) )
))
(declare-datatypes ((array!659 0))(
  ( (array!660 (arr!317 (Array (_ BitVec 32) ValueCell!167)) (size!379 (_ BitVec 32))) )
))
(declare-fun _values!1492 () array!659)

(declare-fun mapValue!524 () ValueCell!167)

(declare-fun mapRest!524 () (Array (_ BitVec 32) ValueCell!167))

(declare-fun mapKey!524 () (_ BitVec 32))

(assert (=> mapNonEmpty!524 (= (arr!317 _values!1492) (store mapRest!524 mapKey!524 mapValue!524))))

(declare-fun res!7545 () Bool)

(assert (=> start!916 (=> (not res!7545) (not e!4303))))

(declare-fun mask!2250 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!916 (= res!7545 (validMask!0 mask!2250))))

(assert (=> start!916 e!4303))

(assert (=> start!916 tp!1099))

(assert (=> start!916 true))

(declare-fun e!4304 () Bool)

(declare-fun array_inv!229 (array!659) Bool)

(assert (=> start!916 (and (array_inv!229 _values!1492) e!4304)))

(declare-fun tp_is_empty!367 () Bool)

(assert (=> start!916 tp_is_empty!367))

(declare-fun array_inv!230 (array!657) Bool)

(assert (=> start!916 (array_inv!230 _keys!1806)))

(declare-fun b!7681 () Bool)

(declare-fun res!7546 () Bool)

(assert (=> b!7681 (=> (not res!7546) (not e!4303))))

(declare-fun extraKeys!1413 () (_ BitVec 32))

(assert (=> b!7681 (= res!7546 (and (= (size!379 _values!1492) (bvadd #b00000000000000000000000000000001 mask!2250)) (= (size!378 _keys!1806) (size!379 _values!1492)) (bvsge mask!2250 #b00000000000000000000000000000000) (bvsge extraKeys!1413 #b00000000000000000000000000000000) (bvsle extraKeys!1413 #b00000000000000000000000000000011)))))

(declare-fun b!7682 () Bool)

(assert (=> b!7682 (= e!4303 false)))

(declare-fun defaultEntry!1495 () Int)

(declare-fun minValue!1434 () V!667)

(declare-fun k0!1278 () (_ BitVec 64))

(declare-fun zeroValue!1434 () V!667)

(declare-fun lt!1572 () Bool)

(declare-datatypes ((tuple2!204 0))(
  ( (tuple2!205 (_1!102 (_ BitVec 64)) (_2!102 V!667)) )
))
(declare-datatypes ((List!216 0))(
  ( (Nil!213) (Cons!212 (h!778 tuple2!204) (t!2353 List!216)) )
))
(declare-datatypes ((ListLongMap!209 0))(
  ( (ListLongMap!210 (toList!120 List!216)) )
))
(declare-fun contains!95 (ListLongMap!209 (_ BitVec 64)) Bool)

(declare-fun getCurrentListMap!79 (array!657 array!659 (_ BitVec 32) (_ BitVec 32) V!667 V!667 (_ BitVec 32) Int) ListLongMap!209)

(assert (=> b!7682 (= lt!1572 (contains!95 (getCurrentListMap!79 _keys!1806 _values!1492 mask!2250 extraKeys!1413 zeroValue!1434 minValue!1434 #b00000000000000000000000000000000 defaultEntry!1495) k0!1278))))

(declare-fun b!7683 () Bool)

(declare-fun res!7543 () Bool)

(assert (=> b!7683 (=> (not res!7543) (not e!4303))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!657 (_ BitVec 32)) Bool)

(assert (=> b!7683 (= res!7543 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!1806 mask!2250))))

(declare-fun b!7684 () Bool)

(assert (=> b!7684 (= e!4306 tp_is_empty!367)))

(declare-fun b!7685 () Bool)

(declare-fun e!4305 () Bool)

(assert (=> b!7685 (= e!4304 (and e!4305 mapRes!524))))

(declare-fun condMapEmpty!524 () Bool)

(declare-fun mapDefault!524 () ValueCell!167)

(assert (=> b!7685 (= condMapEmpty!524 (= (arr!317 _values!1492) ((as const (Array (_ BitVec 32) ValueCell!167)) mapDefault!524)))))

(declare-fun b!7686 () Bool)

(assert (=> b!7686 (= e!4305 tp_is_empty!367)))

(declare-fun mapIsEmpty!524 () Bool)

(assert (=> mapIsEmpty!524 mapRes!524))

(assert (= (and start!916 res!7545) b!7681))

(assert (= (and b!7681 res!7546) b!7683))

(assert (= (and b!7683 res!7543) b!7680))

(assert (= (and b!7680 res!7544) b!7682))

(assert (= (and b!7685 condMapEmpty!524) mapIsEmpty!524))

(assert (= (and b!7685 (not condMapEmpty!524)) mapNonEmpty!524))

(get-info :version)

(assert (= (and mapNonEmpty!524 ((_ is ValueCellFull!167) mapValue!524)) b!7684))

(assert (= (and b!7685 ((_ is ValueCellFull!167) mapDefault!524)) b!7686))

(assert (= start!916 b!7685))

(declare-fun m!4661 () Bool)

(assert (=> b!7683 m!4661))

(declare-fun m!4663 () Bool)

(assert (=> mapNonEmpty!524 m!4663))

(declare-fun m!4665 () Bool)

(assert (=> b!7682 m!4665))

(assert (=> b!7682 m!4665))

(declare-fun m!4667 () Bool)

(assert (=> b!7682 m!4667))

(declare-fun m!4669 () Bool)

(assert (=> b!7680 m!4669))

(declare-fun m!4671 () Bool)

(assert (=> start!916 m!4671))

(declare-fun m!4673 () Bool)

(assert (=> start!916 m!4673))

(declare-fun m!4675 () Bool)

(assert (=> start!916 m!4675))

(check-sat (not b!7683) (not b_next!289) tp_is_empty!367 (not mapNonEmpty!524) (not b!7680) (not start!916) b_and!437 (not b!7682))
(check-sat b_and!437 (not b_next!289))
