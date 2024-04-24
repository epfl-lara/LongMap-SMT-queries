; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132122 () Bool)

(assert start!132122)

(declare-fun b!1544781 () Bool)

(declare-fun e!859559 () Bool)

(declare-fun tp_is_empty!37699 () Bool)

(assert (=> b!1544781 (= e!859559 tp_is_empty!37699)))

(declare-fun res!1059307 () Bool)

(declare-fun e!859563 () Bool)

(assert (=> start!132122 (=> (not res!1059307) (not e!859563))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132122 (= res!1059307 (validMask!0 mask!926))))

(assert (=> start!132122 e!859563))

(assert (=> start!132122 true))

(declare-datatypes ((V!58709 0))(
  ( (V!58710 (val!18927 Int)) )
))
(declare-datatypes ((ValueCell!17939 0))(
  ( (ValueCellFull!17939 (v!21720 V!58709)) (EmptyCell!17939) )
))
(declare-datatypes ((array!102754 0))(
  ( (array!102755 (arr!49572 (Array (_ BitVec 32) ValueCell!17939)) (size!50123 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102754)

(declare-fun e!859561 () Bool)

(declare-fun array_inv!38831 (array!102754) Bool)

(assert (=> start!132122 (and (array_inv!38831 _values!470) e!859561)))

(declare-datatypes ((array!102756 0))(
  ( (array!102757 (arr!49573 (Array (_ BitVec 32) (_ BitVec 64))) (size!50124 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102756)

(declare-fun array_inv!38832 (array!102756) Bool)

(assert (=> start!132122 (array_inv!38832 _keys!618)))

(declare-fun b!1544782 () Bool)

(declare-fun mapRes!58252 () Bool)

(assert (=> b!1544782 (= e!859561 (and e!859559 mapRes!58252))))

(declare-fun condMapEmpty!58252 () Bool)

(declare-fun mapDefault!58252 () ValueCell!17939)

(assert (=> b!1544782 (= condMapEmpty!58252 (= (arr!49572 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17939)) mapDefault!58252)))))

(declare-fun b!1544783 () Bool)

(declare-fun e!859562 () Bool)

(assert (=> b!1544783 (= e!859562 tp_is_empty!37699)))

(declare-fun b!1544784 () Bool)

(assert (=> b!1544784 (= e!859563 false)))

(declare-fun lt!666709 () Bool)

(declare-datatypes ((List!35916 0))(
  ( (Nil!35913) (Cons!35912 (h!37375 (_ BitVec 64)) (t!50602 List!35916)) )
))
(declare-fun arrayNoDuplicates!0 (array!102756 (_ BitVec 32) List!35916) Bool)

(assert (=> b!1544784 (= lt!666709 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35913))))

(declare-fun b!1544785 () Bool)

(declare-fun res!1059308 () Bool)

(assert (=> b!1544785 (=> (not res!1059308) (not e!859563))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102756 (_ BitVec 32)) Bool)

(assert (=> b!1544785 (= res!1059308 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapNonEmpty!58252 () Bool)

(declare-fun tp!110779 () Bool)

(assert (=> mapNonEmpty!58252 (= mapRes!58252 (and tp!110779 e!859562))))

(declare-fun mapValue!58252 () ValueCell!17939)

(declare-fun mapRest!58252 () (Array (_ BitVec 32) ValueCell!17939))

(declare-fun mapKey!58252 () (_ BitVec 32))

(assert (=> mapNonEmpty!58252 (= (arr!49572 _values!470) (store mapRest!58252 mapKey!58252 mapValue!58252))))

(declare-fun mapIsEmpty!58252 () Bool)

(assert (=> mapIsEmpty!58252 mapRes!58252))

(declare-fun b!1544786 () Bool)

(declare-fun res!1059306 () Bool)

(assert (=> b!1544786 (=> (not res!1059306) (not e!859563))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544786 (= res!1059306 (and (= (size!50123 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50124 _keys!618) (size!50123 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(assert (= (and start!132122 res!1059307) b!1544786))

(assert (= (and b!1544786 res!1059306) b!1544785))

(assert (= (and b!1544785 res!1059308) b!1544784))

(assert (= (and b!1544782 condMapEmpty!58252) mapIsEmpty!58252))

(assert (= (and b!1544782 (not condMapEmpty!58252)) mapNonEmpty!58252))

(get-info :version)

(assert (= (and mapNonEmpty!58252 ((_ is ValueCellFull!17939) mapValue!58252)) b!1544783))

(assert (= (and b!1544782 ((_ is ValueCellFull!17939) mapDefault!58252)) b!1544781))

(assert (= start!132122 b!1544782))

(declare-fun m!1426275 () Bool)

(assert (=> start!132122 m!1426275))

(declare-fun m!1426277 () Bool)

(assert (=> start!132122 m!1426277))

(declare-fun m!1426279 () Bool)

(assert (=> start!132122 m!1426279))

(declare-fun m!1426281 () Bool)

(assert (=> b!1544784 m!1426281))

(declare-fun m!1426283 () Bool)

(assert (=> b!1544785 m!1426283))

(declare-fun m!1426285 () Bool)

(assert (=> mapNonEmpty!58252 m!1426285))

(check-sat (not b!1544785) (not b!1544784) (not start!132122) (not mapNonEmpty!58252) tp_is_empty!37699)
(check-sat)
