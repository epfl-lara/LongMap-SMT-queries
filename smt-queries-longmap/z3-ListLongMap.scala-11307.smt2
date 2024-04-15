; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131696 () Bool)

(assert start!131696)

(declare-fun b!1542357 () Bool)

(declare-fun e!858124 () Bool)

(declare-fun e!858125 () Bool)

(declare-fun mapRes!58306 () Bool)

(assert (=> b!1542357 (= e!858124 (and e!858125 mapRes!58306))))

(declare-fun condMapEmpty!58306 () Bool)

(declare-datatypes ((V!58757 0))(
  ( (V!58758 (val!18945 Int)) )
))
(declare-datatypes ((ValueCell!17957 0))(
  ( (ValueCellFull!17957 (v!21742 V!58757)) (EmptyCell!17957) )
))
(declare-datatypes ((array!102636 0))(
  ( (array!102637 (arr!49521 (Array (_ BitVec 32) ValueCell!17957)) (size!50073 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102636)

(declare-fun mapDefault!58306 () ValueCell!17957)

(assert (=> b!1542357 (= condMapEmpty!58306 (= (arr!49521 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17957)) mapDefault!58306)))))

(declare-fun mapIsEmpty!58306 () Bool)

(assert (=> mapIsEmpty!58306 mapRes!58306))

(declare-fun b!1542358 () Bool)

(declare-fun res!1058480 () Bool)

(declare-fun e!858126 () Bool)

(assert (=> b!1542358 (=> (not res!1058480) (not e!858126))))

(declare-datatypes ((array!102638 0))(
  ( (array!102639 (arr!49522 (Array (_ BitVec 32) (_ BitVec 64))) (size!50074 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102638)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102638 (_ BitVec 32)) Bool)

(assert (=> b!1542358 (= res!1058480 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542359 () Bool)

(declare-fun tp_is_empty!37735 () Bool)

(assert (=> b!1542359 (= e!858125 tp_is_empty!37735)))

(declare-fun mapNonEmpty!58306 () Bool)

(declare-fun tp!110834 () Bool)

(declare-fun e!858122 () Bool)

(assert (=> mapNonEmpty!58306 (= mapRes!58306 (and tp!110834 e!858122))))

(declare-fun mapKey!58306 () (_ BitVec 32))

(declare-fun mapValue!58306 () ValueCell!17957)

(declare-fun mapRest!58306 () (Array (_ BitVec 32) ValueCell!17957))

(assert (=> mapNonEmpty!58306 (= (arr!49521 _values!470) (store mapRest!58306 mapKey!58306 mapValue!58306))))

(declare-fun b!1542356 () Bool)

(assert (=> b!1542356 (= e!858122 tp_is_empty!37735)))

(declare-fun res!1058479 () Bool)

(assert (=> start!131696 (=> (not res!1058479) (not e!858126))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131696 (= res!1058479 (validMask!0 mask!926))))

(assert (=> start!131696 e!858126))

(assert (=> start!131696 true))

(declare-fun array_inv!38719 (array!102636) Bool)

(assert (=> start!131696 (and (array_inv!38719 _values!470) e!858124)))

(declare-fun array_inv!38720 (array!102638) Bool)

(assert (=> start!131696 (array_inv!38720 _keys!618)))

(declare-fun b!1542360 () Bool)

(declare-fun res!1058481 () Bool)

(assert (=> b!1542360 (=> (not res!1058481) (not e!858126))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542360 (= res!1058481 (and (= (size!50073 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50074 _keys!618) (size!50073 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542361 () Bool)

(assert (=> b!1542361 (= e!858126 false)))

(declare-fun lt!665569 () Bool)

(declare-datatypes ((List!35937 0))(
  ( (Nil!35934) (Cons!35933 (h!37379 (_ BitVec 64)) (t!50623 List!35937)) )
))
(declare-fun arrayNoDuplicates!0 (array!102638 (_ BitVec 32) List!35937) Bool)

(assert (=> b!1542361 (= lt!665569 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35934))))

(assert (= (and start!131696 res!1058479) b!1542360))

(assert (= (and b!1542360 res!1058481) b!1542358))

(assert (= (and b!1542358 res!1058480) b!1542361))

(assert (= (and b!1542357 condMapEmpty!58306) mapIsEmpty!58306))

(assert (= (and b!1542357 (not condMapEmpty!58306)) mapNonEmpty!58306))

(get-info :version)

(assert (= (and mapNonEmpty!58306 ((_ is ValueCellFull!17957) mapValue!58306)) b!1542356))

(assert (= (and b!1542357 ((_ is ValueCellFull!17957) mapDefault!58306)) b!1542359))

(assert (= start!131696 b!1542357))

(declare-fun m!1423341 () Bool)

(assert (=> b!1542358 m!1423341))

(declare-fun m!1423343 () Bool)

(assert (=> mapNonEmpty!58306 m!1423343))

(declare-fun m!1423345 () Bool)

(assert (=> start!131696 m!1423345))

(declare-fun m!1423347 () Bool)

(assert (=> start!131696 m!1423347))

(declare-fun m!1423349 () Bool)

(assert (=> start!131696 m!1423349))

(declare-fun m!1423351 () Bool)

(assert (=> b!1542361 m!1423351))

(check-sat (not start!131696) (not b!1542358) tp_is_empty!37735 (not b!1542361) (not mapNonEmpty!58306))
(check-sat)
