; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131624 () Bool)

(assert start!131624)

(declare-fun b!1541708 () Bool)

(declare-fun e!857582 () Bool)

(declare-fun e!857584 () Bool)

(declare-fun mapRes!58198 () Bool)

(assert (=> b!1541708 (= e!857582 (and e!857584 mapRes!58198))))

(declare-fun condMapEmpty!58198 () Bool)

(declare-datatypes ((V!58661 0))(
  ( (V!58662 (val!18909 Int)) )
))
(declare-datatypes ((ValueCell!17921 0))(
  ( (ValueCellFull!17921 (v!21706 V!58661)) (EmptyCell!17921) )
))
(declare-datatypes ((array!102500 0))(
  ( (array!102501 (arr!49453 (Array (_ BitVec 32) ValueCell!17921)) (size!50005 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102500)

(declare-fun mapDefault!58198 () ValueCell!17921)

(assert (=> b!1541708 (= condMapEmpty!58198 (= (arr!49453 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17921)) mapDefault!58198)))))

(declare-fun b!1541709 () Bool)

(declare-fun res!1058156 () Bool)

(declare-fun e!857585 () Bool)

(assert (=> b!1541709 (=> (not res!1058156) (not e!857585))))

(declare-datatypes ((array!102502 0))(
  ( (array!102503 (arr!49454 (Array (_ BitVec 32) (_ BitVec 64))) (size!50006 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102502)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102502 (_ BitVec 32)) Bool)

(assert (=> b!1541709 (= res!1058156 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1541710 () Bool)

(declare-fun tp_is_empty!37663 () Bool)

(assert (=> b!1541710 (= e!857584 tp_is_empty!37663)))

(declare-fun mapIsEmpty!58198 () Bool)

(assert (=> mapIsEmpty!58198 mapRes!58198))

(declare-fun b!1541711 () Bool)

(declare-fun e!857583 () Bool)

(assert (=> b!1541711 (= e!857583 tp_is_empty!37663)))

(declare-fun mapNonEmpty!58198 () Bool)

(declare-fun tp!110726 () Bool)

(assert (=> mapNonEmpty!58198 (= mapRes!58198 (and tp!110726 e!857583))))

(declare-fun mapValue!58198 () ValueCell!17921)

(declare-fun mapKey!58198 () (_ BitVec 32))

(declare-fun mapRest!58198 () (Array (_ BitVec 32) ValueCell!17921))

(assert (=> mapNonEmpty!58198 (= (arr!49453 _values!470) (store mapRest!58198 mapKey!58198 mapValue!58198))))

(declare-fun b!1541712 () Bool)

(declare-fun res!1058155 () Bool)

(assert (=> b!1541712 (=> (not res!1058155) (not e!857585))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1541712 (= res!1058155 (and (= (size!50005 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50006 _keys!618) (size!50005 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541713 () Bool)

(assert (=> b!1541713 (= e!857585 false)))

(declare-fun lt!665461 () Bool)

(declare-datatypes ((List!35911 0))(
  ( (Nil!35908) (Cons!35907 (h!37353 (_ BitVec 64)) (t!50597 List!35911)) )
))
(declare-fun arrayNoDuplicates!0 (array!102502 (_ BitVec 32) List!35911) Bool)

(assert (=> b!1541713 (= lt!665461 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35908))))

(declare-fun res!1058157 () Bool)

(assert (=> start!131624 (=> (not res!1058157) (not e!857585))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131624 (= res!1058157 (validMask!0 mask!926))))

(assert (=> start!131624 e!857585))

(assert (=> start!131624 true))

(declare-fun array_inv!38669 (array!102500) Bool)

(assert (=> start!131624 (and (array_inv!38669 _values!470) e!857582)))

(declare-fun array_inv!38670 (array!102502) Bool)

(assert (=> start!131624 (array_inv!38670 _keys!618)))

(assert (= (and start!131624 res!1058157) b!1541712))

(assert (= (and b!1541712 res!1058155) b!1541709))

(assert (= (and b!1541709 res!1058156) b!1541713))

(assert (= (and b!1541708 condMapEmpty!58198) mapIsEmpty!58198))

(assert (= (and b!1541708 (not condMapEmpty!58198)) mapNonEmpty!58198))

(get-info :version)

(assert (= (and mapNonEmpty!58198 ((_ is ValueCellFull!17921) mapValue!58198)) b!1541711))

(assert (= (and b!1541708 ((_ is ValueCellFull!17921) mapDefault!58198)) b!1541710))

(assert (= start!131624 b!1541708))

(declare-fun m!1422909 () Bool)

(assert (=> b!1541709 m!1422909))

(declare-fun m!1422911 () Bool)

(assert (=> mapNonEmpty!58198 m!1422911))

(declare-fun m!1422913 () Bool)

(assert (=> b!1541713 m!1422913))

(declare-fun m!1422915 () Bool)

(assert (=> start!131624 m!1422915))

(declare-fun m!1422917 () Bool)

(assert (=> start!131624 m!1422917))

(declare-fun m!1422919 () Bool)

(assert (=> start!131624 m!1422919))

(check-sat tp_is_empty!37663 (not b!1541713) (not mapNonEmpty!58198) (not start!131624) (not b!1541709))
(check-sat)
