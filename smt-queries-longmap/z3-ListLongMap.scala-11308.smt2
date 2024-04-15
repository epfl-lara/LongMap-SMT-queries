; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131702 () Bool)

(assert start!131702)

(declare-fun b!1542410 () Bool)

(declare-fun e!858167 () Bool)

(declare-fun tp_is_empty!37741 () Bool)

(assert (=> b!1542410 (= e!858167 tp_is_empty!37741)))

(declare-fun res!1058508 () Bool)

(declare-fun e!858170 () Bool)

(assert (=> start!131702 (=> (not res!1058508) (not e!858170))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131702 (= res!1058508 (validMask!0 mask!926))))

(assert (=> start!131702 e!858170))

(assert (=> start!131702 true))

(declare-datatypes ((V!58765 0))(
  ( (V!58766 (val!18948 Int)) )
))
(declare-datatypes ((ValueCell!17960 0))(
  ( (ValueCellFull!17960 (v!21745 V!58765)) (EmptyCell!17960) )
))
(declare-datatypes ((array!102646 0))(
  ( (array!102647 (arr!49526 (Array (_ BitVec 32) ValueCell!17960)) (size!50078 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102646)

(declare-fun e!858171 () Bool)

(declare-fun array_inv!38723 (array!102646) Bool)

(assert (=> start!131702 (and (array_inv!38723 _values!470) e!858171)))

(declare-datatypes ((array!102648 0))(
  ( (array!102649 (arr!49527 (Array (_ BitVec 32) (_ BitVec 64))) (size!50079 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102648)

(declare-fun array_inv!38724 (array!102648) Bool)

(assert (=> start!131702 (array_inv!38724 _keys!618)))

(declare-fun b!1542411 () Bool)

(declare-fun e!858169 () Bool)

(assert (=> b!1542411 (= e!858169 tp_is_empty!37741)))

(declare-fun b!1542412 () Bool)

(declare-fun res!1058506 () Bool)

(assert (=> b!1542412 (=> (not res!1058506) (not e!858170))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542412 (= res!1058506 (and (= (size!50078 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50079 _keys!618) (size!50078 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58315 () Bool)

(declare-fun mapRes!58315 () Bool)

(assert (=> mapIsEmpty!58315 mapRes!58315))

(declare-fun b!1542413 () Bool)

(assert (=> b!1542413 (= e!858170 false)))

(declare-fun lt!665578 () Bool)

(declare-datatypes ((List!35939 0))(
  ( (Nil!35936) (Cons!35935 (h!37381 (_ BitVec 64)) (t!50625 List!35939)) )
))
(declare-fun arrayNoDuplicates!0 (array!102648 (_ BitVec 32) List!35939) Bool)

(assert (=> b!1542413 (= lt!665578 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35936))))

(declare-fun mapNonEmpty!58315 () Bool)

(declare-fun tp!110843 () Bool)

(assert (=> mapNonEmpty!58315 (= mapRes!58315 (and tp!110843 e!858167))))

(declare-fun mapRest!58315 () (Array (_ BitVec 32) ValueCell!17960))

(declare-fun mapKey!58315 () (_ BitVec 32))

(declare-fun mapValue!58315 () ValueCell!17960)

(assert (=> mapNonEmpty!58315 (= (arr!49526 _values!470) (store mapRest!58315 mapKey!58315 mapValue!58315))))

(declare-fun b!1542414 () Bool)

(declare-fun res!1058507 () Bool)

(assert (=> b!1542414 (=> (not res!1058507) (not e!858170))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102648 (_ BitVec 32)) Bool)

(assert (=> b!1542414 (= res!1058507 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542415 () Bool)

(assert (=> b!1542415 (= e!858171 (and e!858169 mapRes!58315))))

(declare-fun condMapEmpty!58315 () Bool)

(declare-fun mapDefault!58315 () ValueCell!17960)

(assert (=> b!1542415 (= condMapEmpty!58315 (= (arr!49526 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17960)) mapDefault!58315)))))

(assert (= (and start!131702 res!1058508) b!1542412))

(assert (= (and b!1542412 res!1058506) b!1542414))

(assert (= (and b!1542414 res!1058507) b!1542413))

(assert (= (and b!1542415 condMapEmpty!58315) mapIsEmpty!58315))

(assert (= (and b!1542415 (not condMapEmpty!58315)) mapNonEmpty!58315))

(get-info :version)

(assert (= (and mapNonEmpty!58315 ((_ is ValueCellFull!17960) mapValue!58315)) b!1542410))

(assert (= (and b!1542415 ((_ is ValueCellFull!17960) mapDefault!58315)) b!1542411))

(assert (= start!131702 b!1542415))

(declare-fun m!1423377 () Bool)

(assert (=> start!131702 m!1423377))

(declare-fun m!1423379 () Bool)

(assert (=> start!131702 m!1423379))

(declare-fun m!1423381 () Bool)

(assert (=> start!131702 m!1423381))

(declare-fun m!1423383 () Bool)

(assert (=> b!1542413 m!1423383))

(declare-fun m!1423385 () Bool)

(assert (=> mapNonEmpty!58315 m!1423385))

(declare-fun m!1423387 () Bool)

(assert (=> b!1542414 m!1423387))

(check-sat (not b!1542414) tp_is_empty!37741 (not start!131702) (not mapNonEmpty!58315) (not b!1542413))
(check-sat)
