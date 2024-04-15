; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131750 () Bool)

(assert start!131750)

(declare-fun b!1542842 () Bool)

(declare-fun res!1058723 () Bool)

(declare-fun e!858529 () Bool)

(assert (=> b!1542842 (=> (not res!1058723) (not e!858529))))

(declare-datatypes ((array!102736 0))(
  ( (array!102737 (arr!49571 (Array (_ BitVec 32) (_ BitVec 64))) (size!50123 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102736)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102736 (_ BitVec 32)) Bool)

(assert (=> b!1542842 (= res!1058723 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058722 () Bool)

(assert (=> start!131750 (=> (not res!1058722) (not e!858529))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131750 (= res!1058722 (validMask!0 mask!926))))

(assert (=> start!131750 e!858529))

(assert (=> start!131750 true))

(declare-datatypes ((V!58829 0))(
  ( (V!58830 (val!18972 Int)) )
))
(declare-datatypes ((ValueCell!17984 0))(
  ( (ValueCellFull!17984 (v!21769 V!58829)) (EmptyCell!17984) )
))
(declare-datatypes ((array!102738 0))(
  ( (array!102739 (arr!49572 (Array (_ BitVec 32) ValueCell!17984)) (size!50124 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102738)

(declare-fun e!858530 () Bool)

(declare-fun array_inv!38763 (array!102738) Bool)

(assert (=> start!131750 (and (array_inv!38763 _values!470) e!858530)))

(declare-fun array_inv!38764 (array!102736) Bool)

(assert (=> start!131750 (array_inv!38764 _keys!618)))

(declare-fun b!1542843 () Bool)

(assert (=> b!1542843 (= e!858529 false)))

(declare-fun lt!665650 () Bool)

(declare-datatypes ((List!35953 0))(
  ( (Nil!35950) (Cons!35949 (h!37395 (_ BitVec 64)) (t!50639 List!35953)) )
))
(declare-fun arrayNoDuplicates!0 (array!102736 (_ BitVec 32) List!35953) Bool)

(assert (=> b!1542843 (= lt!665650 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35950))))

(declare-fun b!1542844 () Bool)

(declare-fun res!1058724 () Bool)

(assert (=> b!1542844 (=> (not res!1058724) (not e!858529))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542844 (= res!1058724 (and (= (size!50124 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50123 _keys!618) (size!50124 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58387 () Bool)

(declare-fun mapRes!58387 () Bool)

(declare-fun tp!110915 () Bool)

(declare-fun e!858528 () Bool)

(assert (=> mapNonEmpty!58387 (= mapRes!58387 (and tp!110915 e!858528))))

(declare-fun mapRest!58387 () (Array (_ BitVec 32) ValueCell!17984))

(declare-fun mapValue!58387 () ValueCell!17984)

(declare-fun mapKey!58387 () (_ BitVec 32))

(assert (=> mapNonEmpty!58387 (= (arr!49572 _values!470) (store mapRest!58387 mapKey!58387 mapValue!58387))))

(declare-fun b!1542845 () Bool)

(declare-fun e!858527 () Bool)

(declare-fun tp_is_empty!37789 () Bool)

(assert (=> b!1542845 (= e!858527 tp_is_empty!37789)))

(declare-fun b!1542846 () Bool)

(assert (=> b!1542846 (= e!858530 (and e!858527 mapRes!58387))))

(declare-fun condMapEmpty!58387 () Bool)

(declare-fun mapDefault!58387 () ValueCell!17984)

(assert (=> b!1542846 (= condMapEmpty!58387 (= (arr!49572 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17984)) mapDefault!58387)))))

(declare-fun b!1542847 () Bool)

(assert (=> b!1542847 (= e!858528 tp_is_empty!37789)))

(declare-fun mapIsEmpty!58387 () Bool)

(assert (=> mapIsEmpty!58387 mapRes!58387))

(assert (= (and start!131750 res!1058722) b!1542844))

(assert (= (and b!1542844 res!1058724) b!1542842))

(assert (= (and b!1542842 res!1058723) b!1542843))

(assert (= (and b!1542846 condMapEmpty!58387) mapIsEmpty!58387))

(assert (= (and b!1542846 (not condMapEmpty!58387)) mapNonEmpty!58387))

(get-info :version)

(assert (= (and mapNonEmpty!58387 ((_ is ValueCellFull!17984) mapValue!58387)) b!1542847))

(assert (= (and b!1542846 ((_ is ValueCellFull!17984) mapDefault!58387)) b!1542845))

(assert (= start!131750 b!1542846))

(declare-fun m!1423665 () Bool)

(assert (=> b!1542842 m!1423665))

(declare-fun m!1423667 () Bool)

(assert (=> start!131750 m!1423667))

(declare-fun m!1423669 () Bool)

(assert (=> start!131750 m!1423669))

(declare-fun m!1423671 () Bool)

(assert (=> start!131750 m!1423671))

(declare-fun m!1423673 () Bool)

(assert (=> b!1542843 m!1423673))

(declare-fun m!1423675 () Bool)

(assert (=> mapNonEmpty!58387 m!1423675))

(check-sat (not b!1542843) tp_is_empty!37789 (not mapNonEmpty!58387) (not start!131750) (not b!1542842))
(check-sat)
