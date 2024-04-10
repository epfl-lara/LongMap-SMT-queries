; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131742 () Bool)

(assert start!131742)

(declare-fun res!1058592 () Bool)

(declare-fun e!858293 () Bool)

(assert (=> start!131742 (=> (not res!1058592) (not e!858293))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131742 (= res!1058592 (validMask!0 mask!926))))

(assert (=> start!131742 e!858293))

(assert (=> start!131742 true))

(declare-datatypes ((V!58751 0))(
  ( (V!58752 (val!18943 Int)) )
))
(declare-datatypes ((ValueCell!17955 0))(
  ( (ValueCellFull!17955 (v!21744 V!58751)) (EmptyCell!17955) )
))
(declare-datatypes ((array!102692 0))(
  ( (array!102693 (arr!49548 (Array (_ BitVec 32) ValueCell!17955)) (size!50098 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102692)

(declare-fun e!858292 () Bool)

(declare-fun array_inv!38555 (array!102692) Bool)

(assert (=> start!131742 (and (array_inv!38555 _values!470) e!858292)))

(declare-datatypes ((array!102694 0))(
  ( (array!102695 (arr!49549 (Array (_ BitVec 32) (_ BitVec 64))) (size!50099 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102694)

(declare-fun array_inv!38556 (array!102694) Bool)

(assert (=> start!131742 (array_inv!38556 _keys!618)))

(declare-fun b!1542633 () Bool)

(declare-fun res!1058591 () Bool)

(assert (=> b!1542633 (=> (not res!1058591) (not e!858293))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102694 (_ BitVec 32)) Bool)

(assert (=> b!1542633 (= res!1058591 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542634 () Bool)

(declare-fun res!1058590 () Bool)

(assert (=> b!1542634 (=> (not res!1058590) (not e!858293))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542634 (= res!1058590 (and (= (size!50098 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50099 _keys!618) (size!50098 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542635 () Bool)

(assert (=> b!1542635 (= e!858293 false)))

(declare-fun lt!665849 () Bool)

(declare-datatypes ((List!35885 0))(
  ( (Nil!35882) (Cons!35881 (h!37326 (_ BitVec 64)) (t!50579 List!35885)) )
))
(declare-fun arrayNoDuplicates!0 (array!102694 (_ BitVec 32) List!35885) Bool)

(assert (=> b!1542635 (= lt!665849 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35882))))

(declare-fun mapIsEmpty!58300 () Bool)

(declare-fun mapRes!58300 () Bool)

(assert (=> mapIsEmpty!58300 mapRes!58300))

(declare-fun b!1542636 () Bool)

(declare-fun e!858290 () Bool)

(declare-fun tp_is_empty!37731 () Bool)

(assert (=> b!1542636 (= e!858290 tp_is_empty!37731)))

(declare-fun mapNonEmpty!58300 () Bool)

(declare-fun tp!110827 () Bool)

(declare-fun e!858294 () Bool)

(assert (=> mapNonEmpty!58300 (= mapRes!58300 (and tp!110827 e!858294))))

(declare-fun mapValue!58300 () ValueCell!17955)

(declare-fun mapKey!58300 () (_ BitVec 32))

(declare-fun mapRest!58300 () (Array (_ BitVec 32) ValueCell!17955))

(assert (=> mapNonEmpty!58300 (= (arr!49548 _values!470) (store mapRest!58300 mapKey!58300 mapValue!58300))))

(declare-fun b!1542637 () Bool)

(assert (=> b!1542637 (= e!858292 (and e!858290 mapRes!58300))))

(declare-fun condMapEmpty!58300 () Bool)

(declare-fun mapDefault!58300 () ValueCell!17955)

(assert (=> b!1542637 (= condMapEmpty!58300 (= (arr!49548 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17955)) mapDefault!58300)))))

(declare-fun b!1542638 () Bool)

(assert (=> b!1542638 (= e!858294 tp_is_empty!37731)))

(assert (= (and start!131742 res!1058592) b!1542634))

(assert (= (and b!1542634 res!1058590) b!1542633))

(assert (= (and b!1542633 res!1058591) b!1542635))

(assert (= (and b!1542637 condMapEmpty!58300) mapIsEmpty!58300))

(assert (= (and b!1542637 (not condMapEmpty!58300)) mapNonEmpty!58300))

(get-info :version)

(assert (= (and mapNonEmpty!58300 ((_ is ValueCellFull!17955) mapValue!58300)) b!1542638))

(assert (= (and b!1542637 ((_ is ValueCellFull!17955) mapDefault!58300)) b!1542636))

(assert (= start!131742 b!1542637))

(declare-fun m!1424209 () Bool)

(assert (=> start!131742 m!1424209))

(declare-fun m!1424211 () Bool)

(assert (=> start!131742 m!1424211))

(declare-fun m!1424213 () Bool)

(assert (=> start!131742 m!1424213))

(declare-fun m!1424215 () Bool)

(assert (=> b!1542633 m!1424215))

(declare-fun m!1424217 () Bool)

(assert (=> b!1542635 m!1424217))

(declare-fun m!1424219 () Bool)

(assert (=> mapNonEmpty!58300 m!1424219))

(check-sat (not b!1542635) tp_is_empty!37731 (not mapNonEmpty!58300) (not b!1542633) (not start!131742))
(check-sat)
