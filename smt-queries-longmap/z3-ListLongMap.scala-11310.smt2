; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131766 () Bool)

(assert start!131766)

(declare-fun b!1542849 () Bool)

(declare-fun e!858474 () Bool)

(declare-fun e!858471 () Bool)

(declare-fun mapRes!58336 () Bool)

(assert (=> b!1542849 (= e!858474 (and e!858471 mapRes!58336))))

(declare-fun condMapEmpty!58336 () Bool)

(declare-datatypes ((V!58783 0))(
  ( (V!58784 (val!18955 Int)) )
))
(declare-datatypes ((ValueCell!17967 0))(
  ( (ValueCellFull!17967 (v!21756 V!58783)) (EmptyCell!17967) )
))
(declare-datatypes ((array!102738 0))(
  ( (array!102739 (arr!49571 (Array (_ BitVec 32) ValueCell!17967)) (size!50121 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102738)

(declare-fun mapDefault!58336 () ValueCell!17967)

(assert (=> b!1542849 (= condMapEmpty!58336 (= (arr!49571 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17967)) mapDefault!58336)))))

(declare-fun b!1542850 () Bool)

(declare-fun e!858473 () Bool)

(declare-fun tp_is_empty!37755 () Bool)

(assert (=> b!1542850 (= e!858473 tp_is_empty!37755)))

(declare-fun b!1542851 () Bool)

(declare-fun res!1058699 () Bool)

(declare-fun e!858472 () Bool)

(assert (=> b!1542851 (=> (not res!1058699) (not e!858472))))

(declare-datatypes ((array!102740 0))(
  ( (array!102741 (arr!49572 (Array (_ BitVec 32) (_ BitVec 64))) (size!50122 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102740)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542851 (= res!1058699 (and (= (size!50121 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50122 _keys!618) (size!50121 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542852 () Bool)

(declare-fun res!1058700 () Bool)

(assert (=> b!1542852 (=> (not res!1058700) (not e!858472))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102740 (_ BitVec 32)) Bool)

(assert (=> b!1542852 (= res!1058700 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542853 () Bool)

(assert (=> b!1542853 (= e!858471 tp_is_empty!37755)))

(declare-fun b!1542854 () Bool)

(assert (=> b!1542854 (= e!858472 false)))

(declare-fun lt!665885 () Bool)

(declare-datatypes ((List!35894 0))(
  ( (Nil!35891) (Cons!35890 (h!37335 (_ BitVec 64)) (t!50588 List!35894)) )
))
(declare-fun arrayNoDuplicates!0 (array!102740 (_ BitVec 32) List!35894) Bool)

(assert (=> b!1542854 (= lt!665885 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35891))))

(declare-fun res!1058698 () Bool)

(assert (=> start!131766 (=> (not res!1058698) (not e!858472))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131766 (= res!1058698 (validMask!0 mask!926))))

(assert (=> start!131766 e!858472))

(assert (=> start!131766 true))

(declare-fun array_inv!38571 (array!102738) Bool)

(assert (=> start!131766 (and (array_inv!38571 _values!470) e!858474)))

(declare-fun array_inv!38572 (array!102740) Bool)

(assert (=> start!131766 (array_inv!38572 _keys!618)))

(declare-fun mapNonEmpty!58336 () Bool)

(declare-fun tp!110863 () Bool)

(assert (=> mapNonEmpty!58336 (= mapRes!58336 (and tp!110863 e!858473))))

(declare-fun mapValue!58336 () ValueCell!17967)

(declare-fun mapRest!58336 () (Array (_ BitVec 32) ValueCell!17967))

(declare-fun mapKey!58336 () (_ BitVec 32))

(assert (=> mapNonEmpty!58336 (= (arr!49571 _values!470) (store mapRest!58336 mapKey!58336 mapValue!58336))))

(declare-fun mapIsEmpty!58336 () Bool)

(assert (=> mapIsEmpty!58336 mapRes!58336))

(assert (= (and start!131766 res!1058698) b!1542851))

(assert (= (and b!1542851 res!1058699) b!1542852))

(assert (= (and b!1542852 res!1058700) b!1542854))

(assert (= (and b!1542849 condMapEmpty!58336) mapIsEmpty!58336))

(assert (= (and b!1542849 (not condMapEmpty!58336)) mapNonEmpty!58336))

(get-info :version)

(assert (= (and mapNonEmpty!58336 ((_ is ValueCellFull!17967) mapValue!58336)) b!1542850))

(assert (= (and b!1542849 ((_ is ValueCellFull!17967) mapDefault!58336)) b!1542853))

(assert (= start!131766 b!1542849))

(declare-fun m!1424353 () Bool)

(assert (=> b!1542852 m!1424353))

(declare-fun m!1424355 () Bool)

(assert (=> b!1542854 m!1424355))

(declare-fun m!1424357 () Bool)

(assert (=> start!131766 m!1424357))

(declare-fun m!1424359 () Bool)

(assert (=> start!131766 m!1424359))

(declare-fun m!1424361 () Bool)

(assert (=> start!131766 m!1424361))

(declare-fun m!1424363 () Bool)

(assert (=> mapNonEmpty!58336 m!1424363))

(check-sat tp_is_empty!37755 (not b!1542852) (not b!1542854) (not mapNonEmpty!58336) (not start!131766))
(check-sat)
