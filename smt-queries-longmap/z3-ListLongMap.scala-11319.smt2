; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131820 () Bool)

(assert start!131820)

(declare-fun mapNonEmpty!58417 () Bool)

(declare-fun mapRes!58417 () Bool)

(declare-fun tp!110944 () Bool)

(declare-fun e!858879 () Bool)

(assert (=> mapNonEmpty!58417 (= mapRes!58417 (and tp!110944 e!858879))))

(declare-fun mapKey!58417 () (_ BitVec 32))

(declare-datatypes ((V!58855 0))(
  ( (V!58856 (val!18982 Int)) )
))
(declare-datatypes ((ValueCell!17994 0))(
  ( (ValueCellFull!17994 (v!21783 V!58855)) (EmptyCell!17994) )
))
(declare-fun mapRest!58417 () (Array (_ BitVec 32) ValueCell!17994))

(declare-fun mapValue!58417 () ValueCell!17994)

(declare-datatypes ((array!102842 0))(
  ( (array!102843 (arr!49623 (Array (_ BitVec 32) ValueCell!17994)) (size!50173 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102842)

(assert (=> mapNonEmpty!58417 (= (arr!49623 _values!470) (store mapRest!58417 mapKey!58417 mapValue!58417))))

(declare-fun res!1058941 () Bool)

(declare-fun e!858878 () Bool)

(assert (=> start!131820 (=> (not res!1058941) (not e!858878))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131820 (= res!1058941 (validMask!0 mask!926))))

(assert (=> start!131820 e!858878))

(assert (=> start!131820 true))

(declare-fun e!858876 () Bool)

(declare-fun array_inv!38605 (array!102842) Bool)

(assert (=> start!131820 (and (array_inv!38605 _values!470) e!858876)))

(declare-datatypes ((array!102844 0))(
  ( (array!102845 (arr!49624 (Array (_ BitVec 32) (_ BitVec 64))) (size!50174 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102844)

(declare-fun array_inv!38606 (array!102844) Bool)

(assert (=> start!131820 (array_inv!38606 _keys!618)))

(declare-fun b!1543335 () Bool)

(declare-fun e!858875 () Bool)

(assert (=> b!1543335 (= e!858876 (and e!858875 mapRes!58417))))

(declare-fun condMapEmpty!58417 () Bool)

(declare-fun mapDefault!58417 () ValueCell!17994)

(assert (=> b!1543335 (= condMapEmpty!58417 (= (arr!49623 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17994)) mapDefault!58417)))))

(declare-fun b!1543336 () Bool)

(declare-fun tp_is_empty!37809 () Bool)

(assert (=> b!1543336 (= e!858879 tp_is_empty!37809)))

(declare-fun b!1543337 () Bool)

(assert (=> b!1543337 (= e!858878 false)))

(declare-fun lt!665966 () Bool)

(declare-datatypes ((List!35917 0))(
  ( (Nil!35914) (Cons!35913 (h!37358 (_ BitVec 64)) (t!50611 List!35917)) )
))
(declare-fun arrayNoDuplicates!0 (array!102844 (_ BitVec 32) List!35917) Bool)

(assert (=> b!1543337 (= lt!665966 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35914))))

(declare-fun b!1543338 () Bool)

(assert (=> b!1543338 (= e!858875 tp_is_empty!37809)))

(declare-fun b!1543339 () Bool)

(declare-fun res!1058943 () Bool)

(assert (=> b!1543339 (=> (not res!1058943) (not e!858878))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543339 (= res!1058943 (and (= (size!50173 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50174 _keys!618) (size!50173 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543340 () Bool)

(declare-fun res!1058942 () Bool)

(assert (=> b!1543340 (=> (not res!1058942) (not e!858878))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102844 (_ BitVec 32)) Bool)

(assert (=> b!1543340 (= res!1058942 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58417 () Bool)

(assert (=> mapIsEmpty!58417 mapRes!58417))

(assert (= (and start!131820 res!1058941) b!1543339))

(assert (= (and b!1543339 res!1058943) b!1543340))

(assert (= (and b!1543340 res!1058942) b!1543337))

(assert (= (and b!1543335 condMapEmpty!58417) mapIsEmpty!58417))

(assert (= (and b!1543335 (not condMapEmpty!58417)) mapNonEmpty!58417))

(get-info :version)

(assert (= (and mapNonEmpty!58417 ((_ is ValueCellFull!17994) mapValue!58417)) b!1543336))

(assert (= (and b!1543335 ((_ is ValueCellFull!17994) mapDefault!58417)) b!1543338))

(assert (= start!131820 b!1543335))

(declare-fun m!1424677 () Bool)

(assert (=> mapNonEmpty!58417 m!1424677))

(declare-fun m!1424679 () Bool)

(assert (=> start!131820 m!1424679))

(declare-fun m!1424681 () Bool)

(assert (=> start!131820 m!1424681))

(declare-fun m!1424683 () Bool)

(assert (=> start!131820 m!1424683))

(declare-fun m!1424685 () Bool)

(assert (=> b!1543337 m!1424685))

(declare-fun m!1424687 () Bool)

(assert (=> b!1543340 m!1424687))

(check-sat (not b!1543340) (not start!131820) (not b!1543337) (not mapNonEmpty!58417) tp_is_empty!37809)
(check-sat)
