; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131774 () Bool)

(assert start!131774)

(declare-fun mapIsEmpty!58423 () Bool)

(declare-fun mapRes!58423 () Bool)

(assert (=> mapIsEmpty!58423 mapRes!58423))

(declare-fun b!1543058 () Bool)

(declare-fun res!1058830 () Bool)

(declare-fun e!858707 () Bool)

(assert (=> b!1543058 (=> (not res!1058830) (not e!858707))))

(declare-datatypes ((array!102778 0))(
  ( (array!102779 (arr!49592 (Array (_ BitVec 32) (_ BitVec 64))) (size!50144 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102778)

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58861 0))(
  ( (V!58862 (val!18984 Int)) )
))
(declare-datatypes ((ValueCell!17996 0))(
  ( (ValueCellFull!17996 (v!21781 V!58861)) (EmptyCell!17996) )
))
(declare-datatypes ((array!102780 0))(
  ( (array!102781 (arr!49593 (Array (_ BitVec 32) ValueCell!17996)) (size!50145 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102780)

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543058 (= res!1058830 (and (= (size!50145 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50144 _keys!618) (size!50145 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58423 () Bool)

(declare-fun tp!110951 () Bool)

(declare-fun e!858710 () Bool)

(assert (=> mapNonEmpty!58423 (= mapRes!58423 (and tp!110951 e!858710))))

(declare-fun mapKey!58423 () (_ BitVec 32))

(declare-fun mapRest!58423 () (Array (_ BitVec 32) ValueCell!17996))

(declare-fun mapValue!58423 () ValueCell!17996)

(assert (=> mapNonEmpty!58423 (= (arr!49593 _values!470) (store mapRest!58423 mapKey!58423 mapValue!58423))))

(declare-fun b!1543059 () Bool)

(declare-fun tp_is_empty!37813 () Bool)

(assert (=> b!1543059 (= e!858710 tp_is_empty!37813)))

(declare-fun res!1058832 () Bool)

(assert (=> start!131774 (=> (not res!1058832) (not e!858707))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131774 (= res!1058832 (validMask!0 mask!926))))

(assert (=> start!131774 e!858707))

(assert (=> start!131774 true))

(declare-fun e!858709 () Bool)

(declare-fun array_inv!38779 (array!102780) Bool)

(assert (=> start!131774 (and (array_inv!38779 _values!470) e!858709)))

(declare-fun array_inv!38780 (array!102778) Bool)

(assert (=> start!131774 (array_inv!38780 _keys!618)))

(declare-fun b!1543060 () Bool)

(declare-fun res!1058831 () Bool)

(assert (=> b!1543060 (=> (not res!1058831) (not e!858707))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102778 (_ BitVec 32)) Bool)

(assert (=> b!1543060 (= res!1058831 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543061 () Bool)

(assert (=> b!1543061 (= e!858707 false)))

(declare-fun lt!665686 () Bool)

(declare-datatypes ((List!35961 0))(
  ( (Nil!35958) (Cons!35957 (h!37403 (_ BitVec 64)) (t!50647 List!35961)) )
))
(declare-fun arrayNoDuplicates!0 (array!102778 (_ BitVec 32) List!35961) Bool)

(assert (=> b!1543061 (= lt!665686 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35958))))

(declare-fun b!1543062 () Bool)

(declare-fun e!858711 () Bool)

(assert (=> b!1543062 (= e!858709 (and e!858711 mapRes!58423))))

(declare-fun condMapEmpty!58423 () Bool)

(declare-fun mapDefault!58423 () ValueCell!17996)

(assert (=> b!1543062 (= condMapEmpty!58423 (= (arr!49593 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17996)) mapDefault!58423)))))

(declare-fun b!1543063 () Bool)

(assert (=> b!1543063 (= e!858711 tp_is_empty!37813)))

(assert (= (and start!131774 res!1058832) b!1543058))

(assert (= (and b!1543058 res!1058830) b!1543060))

(assert (= (and b!1543060 res!1058831) b!1543061))

(assert (= (and b!1543062 condMapEmpty!58423) mapIsEmpty!58423))

(assert (= (and b!1543062 (not condMapEmpty!58423)) mapNonEmpty!58423))

(get-info :version)

(assert (= (and mapNonEmpty!58423 ((_ is ValueCellFull!17996) mapValue!58423)) b!1543059))

(assert (= (and b!1543062 ((_ is ValueCellFull!17996) mapDefault!58423)) b!1543063))

(assert (= start!131774 b!1543062))

(declare-fun m!1423809 () Bool)

(assert (=> mapNonEmpty!58423 m!1423809))

(declare-fun m!1423811 () Bool)

(assert (=> start!131774 m!1423811))

(declare-fun m!1423813 () Bool)

(assert (=> start!131774 m!1423813))

(declare-fun m!1423815 () Bool)

(assert (=> start!131774 m!1423815))

(declare-fun m!1423817 () Bool)

(assert (=> b!1543060 m!1423817))

(declare-fun m!1423819 () Bool)

(assert (=> b!1543061 m!1423819))

(check-sat (not b!1543060) tp_is_empty!37813 (not b!1543061) (not mapNonEmpty!58423) (not start!131774))
(check-sat)
