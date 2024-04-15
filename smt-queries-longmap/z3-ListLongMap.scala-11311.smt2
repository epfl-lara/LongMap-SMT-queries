; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131720 () Bool)

(assert start!131720)

(declare-fun b!1542572 () Bool)

(declare-fun e!858302 () Bool)

(declare-fun tp_is_empty!37759 () Bool)

(assert (=> b!1542572 (= e!858302 tp_is_empty!37759)))

(declare-fun b!1542573 () Bool)

(declare-fun e!858305 () Bool)

(assert (=> b!1542573 (= e!858305 false)))

(declare-fun lt!665605 () Bool)

(declare-datatypes ((array!102678 0))(
  ( (array!102679 (arr!49542 (Array (_ BitVec 32) (_ BitVec 64))) (size!50094 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102678)

(declare-datatypes ((List!35945 0))(
  ( (Nil!35942) (Cons!35941 (h!37387 (_ BitVec 64)) (t!50631 List!35945)) )
))
(declare-fun arrayNoDuplicates!0 (array!102678 (_ BitVec 32) List!35945) Bool)

(assert (=> b!1542573 (= lt!665605 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35942))))

(declare-fun mapNonEmpty!58342 () Bool)

(declare-fun mapRes!58342 () Bool)

(declare-fun tp!110870 () Bool)

(declare-fun e!858303 () Bool)

(assert (=> mapNonEmpty!58342 (= mapRes!58342 (and tp!110870 e!858303))))

(declare-fun mapKey!58342 () (_ BitVec 32))

(declare-datatypes ((V!58789 0))(
  ( (V!58790 (val!18957 Int)) )
))
(declare-datatypes ((ValueCell!17969 0))(
  ( (ValueCellFull!17969 (v!21754 V!58789)) (EmptyCell!17969) )
))
(declare-datatypes ((array!102680 0))(
  ( (array!102681 (arr!49543 (Array (_ BitVec 32) ValueCell!17969)) (size!50095 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102680)

(declare-fun mapValue!58342 () ValueCell!17969)

(declare-fun mapRest!58342 () (Array (_ BitVec 32) ValueCell!17969))

(assert (=> mapNonEmpty!58342 (= (arr!49543 _values!470) (store mapRest!58342 mapKey!58342 mapValue!58342))))

(declare-fun res!1058587 () Bool)

(assert (=> start!131720 (=> (not res!1058587) (not e!858305))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131720 (= res!1058587 (validMask!0 mask!926))))

(assert (=> start!131720 e!858305))

(assert (=> start!131720 true))

(declare-fun e!858306 () Bool)

(declare-fun array_inv!38737 (array!102680) Bool)

(assert (=> start!131720 (and (array_inv!38737 _values!470) e!858306)))

(declare-fun array_inv!38738 (array!102678) Bool)

(assert (=> start!131720 (array_inv!38738 _keys!618)))

(declare-fun b!1542574 () Bool)

(assert (=> b!1542574 (= e!858303 tp_is_empty!37759)))

(declare-fun b!1542575 () Bool)

(declare-fun res!1058589 () Bool)

(assert (=> b!1542575 (=> (not res!1058589) (not e!858305))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102678 (_ BitVec 32)) Bool)

(assert (=> b!1542575 (= res!1058589 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542576 () Bool)

(assert (=> b!1542576 (= e!858306 (and e!858302 mapRes!58342))))

(declare-fun condMapEmpty!58342 () Bool)

(declare-fun mapDefault!58342 () ValueCell!17969)

(assert (=> b!1542576 (= condMapEmpty!58342 (= (arr!49543 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17969)) mapDefault!58342)))))

(declare-fun b!1542577 () Bool)

(declare-fun res!1058588 () Bool)

(assert (=> b!1542577 (=> (not res!1058588) (not e!858305))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542577 (= res!1058588 (and (= (size!50095 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50094 _keys!618) (size!50095 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58342 () Bool)

(assert (=> mapIsEmpty!58342 mapRes!58342))

(assert (= (and start!131720 res!1058587) b!1542577))

(assert (= (and b!1542577 res!1058588) b!1542575))

(assert (= (and b!1542575 res!1058589) b!1542573))

(assert (= (and b!1542576 condMapEmpty!58342) mapIsEmpty!58342))

(assert (= (and b!1542576 (not condMapEmpty!58342)) mapNonEmpty!58342))

(get-info :version)

(assert (= (and mapNonEmpty!58342 ((_ is ValueCellFull!17969) mapValue!58342)) b!1542574))

(assert (= (and b!1542576 ((_ is ValueCellFull!17969) mapDefault!58342)) b!1542572))

(assert (= start!131720 b!1542576))

(declare-fun m!1423485 () Bool)

(assert (=> b!1542573 m!1423485))

(declare-fun m!1423487 () Bool)

(assert (=> mapNonEmpty!58342 m!1423487))

(declare-fun m!1423489 () Bool)

(assert (=> start!131720 m!1423489))

(declare-fun m!1423491 () Bool)

(assert (=> start!131720 m!1423491))

(declare-fun m!1423493 () Bool)

(assert (=> start!131720 m!1423493))

(declare-fun m!1423495 () Bool)

(assert (=> b!1542575 m!1423495))

(check-sat tp_is_empty!37759 (not b!1542575) (not b!1542573) (not start!131720) (not mapNonEmpty!58342))
(check-sat)
