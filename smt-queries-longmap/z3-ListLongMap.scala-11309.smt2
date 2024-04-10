; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131760 () Bool)

(assert start!131760)

(declare-fun mapIsEmpty!58327 () Bool)

(declare-fun mapRes!58327 () Bool)

(assert (=> mapIsEmpty!58327 mapRes!58327))

(declare-fun b!1542795 () Bool)

(declare-fun e!858425 () Bool)

(declare-fun e!858427 () Bool)

(assert (=> b!1542795 (= e!858425 (and e!858427 mapRes!58327))))

(declare-fun condMapEmpty!58327 () Bool)

(declare-datatypes ((V!58775 0))(
  ( (V!58776 (val!18952 Int)) )
))
(declare-datatypes ((ValueCell!17964 0))(
  ( (ValueCellFull!17964 (v!21753 V!58775)) (EmptyCell!17964) )
))
(declare-datatypes ((array!102726 0))(
  ( (array!102727 (arr!49565 (Array (_ BitVec 32) ValueCell!17964)) (size!50115 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102726)

(declare-fun mapDefault!58327 () ValueCell!17964)

(assert (=> b!1542795 (= condMapEmpty!58327 (= (arr!49565 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17964)) mapDefault!58327)))))

(declare-fun b!1542796 () Bool)

(declare-fun res!1058672 () Bool)

(declare-fun e!858426 () Bool)

(assert (=> b!1542796 (=> (not res!1058672) (not e!858426))))

(declare-datatypes ((array!102728 0))(
  ( (array!102729 (arr!49566 (Array (_ BitVec 32) (_ BitVec 64))) (size!50116 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102728)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1542796 (= res!1058672 (and (= (size!50115 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50116 _keys!618) (size!50115 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542797 () Bool)

(assert (=> b!1542797 (= e!858426 false)))

(declare-fun lt!665876 () Bool)

(declare-datatypes ((List!35892 0))(
  ( (Nil!35889) (Cons!35888 (h!37333 (_ BitVec 64)) (t!50586 List!35892)) )
))
(declare-fun arrayNoDuplicates!0 (array!102728 (_ BitVec 32) List!35892) Bool)

(assert (=> b!1542797 (= lt!665876 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35889))))

(declare-fun b!1542798 () Bool)

(declare-fun res!1058673 () Bool)

(assert (=> b!1542798 (=> (not res!1058673) (not e!858426))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102728 (_ BitVec 32)) Bool)

(assert (=> b!1542798 (= res!1058673 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058671 () Bool)

(assert (=> start!131760 (=> (not res!1058671) (not e!858426))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131760 (= res!1058671 (validMask!0 mask!926))))

(assert (=> start!131760 e!858426))

(assert (=> start!131760 true))

(declare-fun array_inv!38565 (array!102726) Bool)

(assert (=> start!131760 (and (array_inv!38565 _values!470) e!858425)))

(declare-fun array_inv!38566 (array!102728) Bool)

(assert (=> start!131760 (array_inv!38566 _keys!618)))

(declare-fun mapNonEmpty!58327 () Bool)

(declare-fun tp!110854 () Bool)

(declare-fun e!858428 () Bool)

(assert (=> mapNonEmpty!58327 (= mapRes!58327 (and tp!110854 e!858428))))

(declare-fun mapKey!58327 () (_ BitVec 32))

(declare-fun mapRest!58327 () (Array (_ BitVec 32) ValueCell!17964))

(declare-fun mapValue!58327 () ValueCell!17964)

(assert (=> mapNonEmpty!58327 (= (arr!49565 _values!470) (store mapRest!58327 mapKey!58327 mapValue!58327))))

(declare-fun b!1542799 () Bool)

(declare-fun tp_is_empty!37749 () Bool)

(assert (=> b!1542799 (= e!858427 tp_is_empty!37749)))

(declare-fun b!1542800 () Bool)

(assert (=> b!1542800 (= e!858428 tp_is_empty!37749)))

(assert (= (and start!131760 res!1058671) b!1542796))

(assert (= (and b!1542796 res!1058672) b!1542798))

(assert (= (and b!1542798 res!1058673) b!1542797))

(assert (= (and b!1542795 condMapEmpty!58327) mapIsEmpty!58327))

(assert (= (and b!1542795 (not condMapEmpty!58327)) mapNonEmpty!58327))

(get-info :version)

(assert (= (and mapNonEmpty!58327 ((_ is ValueCellFull!17964) mapValue!58327)) b!1542800))

(assert (= (and b!1542795 ((_ is ValueCellFull!17964) mapDefault!58327)) b!1542799))

(assert (= start!131760 b!1542795))

(declare-fun m!1424317 () Bool)

(assert (=> b!1542797 m!1424317))

(declare-fun m!1424319 () Bool)

(assert (=> b!1542798 m!1424319))

(declare-fun m!1424321 () Bool)

(assert (=> start!131760 m!1424321))

(declare-fun m!1424323 () Bool)

(assert (=> start!131760 m!1424323))

(declare-fun m!1424325 () Bool)

(assert (=> start!131760 m!1424325))

(declare-fun m!1424327 () Bool)

(assert (=> mapNonEmpty!58327 m!1424327))

(check-sat (not b!1542798) (not start!131760) (not b!1542797) tp_is_empty!37749 (not mapNonEmpty!58327))
(check-sat)
