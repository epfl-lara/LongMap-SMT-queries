; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131784 () Bool)

(assert start!131784)

(declare-fun b!1543011 () Bool)

(declare-fun e!858607 () Bool)

(assert (=> b!1543011 (= e!858607 false)))

(declare-fun lt!665912 () Bool)

(declare-datatypes ((array!102772 0))(
  ( (array!102773 (arr!49588 (Array (_ BitVec 32) (_ BitVec 64))) (size!50138 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102772)

(declare-datatypes ((List!35901 0))(
  ( (Nil!35898) (Cons!35897 (h!37342 (_ BitVec 64)) (t!50595 List!35901)) )
))
(declare-fun arrayNoDuplicates!0 (array!102772 (_ BitVec 32) List!35901) Bool)

(assert (=> b!1543011 (= lt!665912 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35898))))

(declare-fun b!1543012 () Bool)

(declare-fun e!858609 () Bool)

(declare-fun e!858606 () Bool)

(declare-fun mapRes!58363 () Bool)

(assert (=> b!1543012 (= e!858609 (and e!858606 mapRes!58363))))

(declare-fun condMapEmpty!58363 () Bool)

(declare-datatypes ((V!58807 0))(
  ( (V!58808 (val!18964 Int)) )
))
(declare-datatypes ((ValueCell!17976 0))(
  ( (ValueCellFull!17976 (v!21765 V!58807)) (EmptyCell!17976) )
))
(declare-datatypes ((array!102774 0))(
  ( (array!102775 (arr!49589 (Array (_ BitVec 32) ValueCell!17976)) (size!50139 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102774)

(declare-fun mapDefault!58363 () ValueCell!17976)

(assert (=> b!1543012 (= condMapEmpty!58363 (= (arr!49589 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17976)) mapDefault!58363)))))

(declare-fun mapIsEmpty!58363 () Bool)

(assert (=> mapIsEmpty!58363 mapRes!58363))

(declare-fun mapNonEmpty!58363 () Bool)

(declare-fun tp!110890 () Bool)

(declare-fun e!858605 () Bool)

(assert (=> mapNonEmpty!58363 (= mapRes!58363 (and tp!110890 e!858605))))

(declare-fun mapRest!58363 () (Array (_ BitVec 32) ValueCell!17976))

(declare-fun mapKey!58363 () (_ BitVec 32))

(declare-fun mapValue!58363 () ValueCell!17976)

(assert (=> mapNonEmpty!58363 (= (arr!49589 _values!470) (store mapRest!58363 mapKey!58363 mapValue!58363))))

(declare-fun b!1543013 () Bool)

(declare-fun res!1058781 () Bool)

(assert (=> b!1543013 (=> (not res!1058781) (not e!858607))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102772 (_ BitVec 32)) Bool)

(assert (=> b!1543013 (= res!1058781 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058779 () Bool)

(assert (=> start!131784 (=> (not res!1058779) (not e!858607))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131784 (= res!1058779 (validMask!0 mask!926))))

(assert (=> start!131784 e!858607))

(assert (=> start!131784 true))

(declare-fun array_inv!38583 (array!102774) Bool)

(assert (=> start!131784 (and (array_inv!38583 _values!470) e!858609)))

(declare-fun array_inv!38584 (array!102772) Bool)

(assert (=> start!131784 (array_inv!38584 _keys!618)))

(declare-fun b!1543014 () Bool)

(declare-fun tp_is_empty!37773 () Bool)

(assert (=> b!1543014 (= e!858606 tp_is_empty!37773)))

(declare-fun b!1543015 () Bool)

(assert (=> b!1543015 (= e!858605 tp_is_empty!37773)))

(declare-fun b!1543016 () Bool)

(declare-fun res!1058780 () Bool)

(assert (=> b!1543016 (=> (not res!1058780) (not e!858607))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543016 (= res!1058780 (and (= (size!50139 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50138 _keys!618) (size!50139 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!131784 res!1058779) b!1543016))

(assert (= (and b!1543016 res!1058780) b!1543013))

(assert (= (and b!1543013 res!1058781) b!1543011))

(assert (= (and b!1543012 condMapEmpty!58363) mapIsEmpty!58363))

(assert (= (and b!1543012 (not condMapEmpty!58363)) mapNonEmpty!58363))

(get-info :version)

(assert (= (and mapNonEmpty!58363 ((_ is ValueCellFull!17976) mapValue!58363)) b!1543015))

(assert (= (and b!1543012 ((_ is ValueCellFull!17976) mapDefault!58363)) b!1543014))

(assert (= start!131784 b!1543012))

(declare-fun m!1424461 () Bool)

(assert (=> b!1543011 m!1424461))

(declare-fun m!1424463 () Bool)

(assert (=> mapNonEmpty!58363 m!1424463))

(declare-fun m!1424465 () Bool)

(assert (=> b!1543013 m!1424465))

(declare-fun m!1424467 () Bool)

(assert (=> start!131784 m!1424467))

(declare-fun m!1424469 () Bool)

(assert (=> start!131784 m!1424469))

(declare-fun m!1424471 () Bool)

(assert (=> start!131784 m!1424471))

(check-sat (not mapNonEmpty!58363) tp_is_empty!37773 (not b!1543011) (not start!131784) (not b!1543013))
(check-sat)
