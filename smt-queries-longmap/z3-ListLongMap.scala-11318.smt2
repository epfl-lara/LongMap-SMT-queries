; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131762 () Bool)

(assert start!131762)

(declare-fun b!1542950 () Bool)

(declare-fun e!858620 () Bool)

(assert (=> b!1542950 (= e!858620 false)))

(declare-fun lt!665668 () Bool)

(declare-datatypes ((array!102756 0))(
  ( (array!102757 (arr!49581 (Array (_ BitVec 32) (_ BitVec 64))) (size!50133 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102756)

(declare-datatypes ((List!35957 0))(
  ( (Nil!35954) (Cons!35953 (h!37399 (_ BitVec 64)) (t!50643 List!35957)) )
))
(declare-fun arrayNoDuplicates!0 (array!102756 (_ BitVec 32) List!35957) Bool)

(assert (=> b!1542950 (= lt!665668 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35954))))

(declare-fun b!1542951 () Bool)

(declare-fun e!858621 () Bool)

(declare-fun tp_is_empty!37801 () Bool)

(assert (=> b!1542951 (= e!858621 tp_is_empty!37801)))

(declare-fun b!1542952 () Bool)

(declare-fun e!858619 () Bool)

(declare-fun mapRes!58405 () Bool)

(assert (=> b!1542952 (= e!858619 (and e!858621 mapRes!58405))))

(declare-fun condMapEmpty!58405 () Bool)

(declare-datatypes ((V!58845 0))(
  ( (V!58846 (val!18978 Int)) )
))
(declare-datatypes ((ValueCell!17990 0))(
  ( (ValueCellFull!17990 (v!21775 V!58845)) (EmptyCell!17990) )
))
(declare-datatypes ((array!102758 0))(
  ( (array!102759 (arr!49582 (Array (_ BitVec 32) ValueCell!17990)) (size!50134 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102758)

(declare-fun mapDefault!58405 () ValueCell!17990)

(assert (=> b!1542952 (= condMapEmpty!58405 (= (arr!49582 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17990)) mapDefault!58405)))))

(declare-fun res!1058776 () Bool)

(assert (=> start!131762 (=> (not res!1058776) (not e!858620))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131762 (= res!1058776 (validMask!0 mask!926))))

(assert (=> start!131762 e!858620))

(assert (=> start!131762 true))

(declare-fun array_inv!38769 (array!102758) Bool)

(assert (=> start!131762 (and (array_inv!38769 _values!470) e!858619)))

(declare-fun array_inv!38770 (array!102756) Bool)

(assert (=> start!131762 (array_inv!38770 _keys!618)))

(declare-fun mapNonEmpty!58405 () Bool)

(declare-fun tp!110933 () Bool)

(declare-fun e!858617 () Bool)

(assert (=> mapNonEmpty!58405 (= mapRes!58405 (and tp!110933 e!858617))))

(declare-fun mapValue!58405 () ValueCell!17990)

(declare-fun mapKey!58405 () (_ BitVec 32))

(declare-fun mapRest!58405 () (Array (_ BitVec 32) ValueCell!17990))

(assert (=> mapNonEmpty!58405 (= (arr!49582 _values!470) (store mapRest!58405 mapKey!58405 mapValue!58405))))

(declare-fun mapIsEmpty!58405 () Bool)

(assert (=> mapIsEmpty!58405 mapRes!58405))

(declare-fun b!1542953 () Bool)

(declare-fun res!1058777 () Bool)

(assert (=> b!1542953 (=> (not res!1058777) (not e!858620))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542953 (= res!1058777 (and (= (size!50134 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50133 _keys!618) (size!50134 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542954 () Bool)

(declare-fun res!1058778 () Bool)

(assert (=> b!1542954 (=> (not res!1058778) (not e!858620))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102756 (_ BitVec 32)) Bool)

(assert (=> b!1542954 (= res!1058778 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542955 () Bool)

(assert (=> b!1542955 (= e!858617 tp_is_empty!37801)))

(assert (= (and start!131762 res!1058776) b!1542953))

(assert (= (and b!1542953 res!1058777) b!1542954))

(assert (= (and b!1542954 res!1058778) b!1542950))

(assert (= (and b!1542952 condMapEmpty!58405) mapIsEmpty!58405))

(assert (= (and b!1542952 (not condMapEmpty!58405)) mapNonEmpty!58405))

(get-info :version)

(assert (= (and mapNonEmpty!58405 ((_ is ValueCellFull!17990) mapValue!58405)) b!1542955))

(assert (= (and b!1542952 ((_ is ValueCellFull!17990) mapDefault!58405)) b!1542951))

(assert (= start!131762 b!1542952))

(declare-fun m!1423737 () Bool)

(assert (=> b!1542950 m!1423737))

(declare-fun m!1423739 () Bool)

(assert (=> start!131762 m!1423739))

(declare-fun m!1423741 () Bool)

(assert (=> start!131762 m!1423741))

(declare-fun m!1423743 () Bool)

(assert (=> start!131762 m!1423743))

(declare-fun m!1423745 () Bool)

(assert (=> mapNonEmpty!58405 m!1423745))

(declare-fun m!1423747 () Bool)

(assert (=> b!1542954 m!1423747))

(check-sat tp_is_empty!37801 (not mapNonEmpty!58405) (not start!131762) (not b!1542954) (not b!1542950))
(check-sat)
