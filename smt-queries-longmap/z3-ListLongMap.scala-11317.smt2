; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131808 () Bool)

(assert start!131808)

(declare-fun b!1543227 () Bool)

(declare-fun e!858788 () Bool)

(declare-fun e!858789 () Bool)

(declare-fun mapRes!58399 () Bool)

(assert (=> b!1543227 (= e!858788 (and e!858789 mapRes!58399))))

(declare-fun condMapEmpty!58399 () Bool)

(declare-datatypes ((V!58839 0))(
  ( (V!58840 (val!18976 Int)) )
))
(declare-datatypes ((ValueCell!17988 0))(
  ( (ValueCellFull!17988 (v!21777 V!58839)) (EmptyCell!17988) )
))
(declare-datatypes ((array!102820 0))(
  ( (array!102821 (arr!49612 (Array (_ BitVec 32) ValueCell!17988)) (size!50162 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102820)

(declare-fun mapDefault!58399 () ValueCell!17988)

(assert (=> b!1543227 (= condMapEmpty!58399 (= (arr!49612 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17988)) mapDefault!58399)))))

(declare-fun b!1543228 () Bool)

(declare-fun res!1058889 () Bool)

(declare-fun e!858785 () Bool)

(assert (=> b!1543228 (=> (not res!1058889) (not e!858785))))

(declare-datatypes ((array!102822 0))(
  ( (array!102823 (arr!49613 (Array (_ BitVec 32) (_ BitVec 64))) (size!50163 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102822)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102822 (_ BitVec 32)) Bool)

(assert (=> b!1543228 (= res!1058889 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543229 () Bool)

(declare-fun e!858787 () Bool)

(declare-fun tp_is_empty!37797 () Bool)

(assert (=> b!1543229 (= e!858787 tp_is_empty!37797)))

(declare-fun mapNonEmpty!58399 () Bool)

(declare-fun tp!110926 () Bool)

(assert (=> mapNonEmpty!58399 (= mapRes!58399 (and tp!110926 e!858787))))

(declare-fun mapRest!58399 () (Array (_ BitVec 32) ValueCell!17988))

(declare-fun mapValue!58399 () ValueCell!17988)

(declare-fun mapKey!58399 () (_ BitVec 32))

(assert (=> mapNonEmpty!58399 (= (arr!49612 _values!470) (store mapRest!58399 mapKey!58399 mapValue!58399))))

(declare-fun mapIsEmpty!58399 () Bool)

(assert (=> mapIsEmpty!58399 mapRes!58399))

(declare-fun b!1543230 () Bool)

(assert (=> b!1543230 (= e!858789 tp_is_empty!37797)))

(declare-fun res!1058888 () Bool)

(assert (=> start!131808 (=> (not res!1058888) (not e!858785))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131808 (= res!1058888 (validMask!0 mask!926))))

(assert (=> start!131808 e!858785))

(assert (=> start!131808 true))

(declare-fun array_inv!38599 (array!102820) Bool)

(assert (=> start!131808 (and (array_inv!38599 _values!470) e!858788)))

(declare-fun array_inv!38600 (array!102822) Bool)

(assert (=> start!131808 (array_inv!38600 _keys!618)))

(declare-fun b!1543231 () Bool)

(declare-fun res!1058887 () Bool)

(assert (=> b!1543231 (=> (not res!1058887) (not e!858785))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543231 (= res!1058887 (and (= (size!50162 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50163 _keys!618) (size!50162 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543232 () Bool)

(assert (=> b!1543232 (= e!858785 false)))

(declare-fun lt!665948 () Bool)

(declare-datatypes ((List!35912 0))(
  ( (Nil!35909) (Cons!35908 (h!37353 (_ BitVec 64)) (t!50606 List!35912)) )
))
(declare-fun arrayNoDuplicates!0 (array!102822 (_ BitVec 32) List!35912) Bool)

(assert (=> b!1543232 (= lt!665948 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35909))))

(assert (= (and start!131808 res!1058888) b!1543231))

(assert (= (and b!1543231 res!1058887) b!1543228))

(assert (= (and b!1543228 res!1058889) b!1543232))

(assert (= (and b!1543227 condMapEmpty!58399) mapIsEmpty!58399))

(assert (= (and b!1543227 (not condMapEmpty!58399)) mapNonEmpty!58399))

(get-info :version)

(assert (= (and mapNonEmpty!58399 ((_ is ValueCellFull!17988) mapValue!58399)) b!1543229))

(assert (= (and b!1543227 ((_ is ValueCellFull!17988) mapDefault!58399)) b!1543230))

(assert (= start!131808 b!1543227))

(declare-fun m!1424605 () Bool)

(assert (=> b!1543228 m!1424605))

(declare-fun m!1424607 () Bool)

(assert (=> mapNonEmpty!58399 m!1424607))

(declare-fun m!1424609 () Bool)

(assert (=> start!131808 m!1424609))

(declare-fun m!1424611 () Bool)

(assert (=> start!131808 m!1424611))

(declare-fun m!1424613 () Bool)

(assert (=> start!131808 m!1424613))

(declare-fun m!1424615 () Bool)

(assert (=> b!1543232 m!1424615))

(check-sat (not b!1543232) (not mapNonEmpty!58399) tp_is_empty!37797 (not b!1543228) (not start!131808))
(check-sat)
