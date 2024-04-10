; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131730 () Bool)

(assert start!131730)

(declare-fun b!1542525 () Bool)

(declare-fun e!858203 () Bool)

(declare-fun tp_is_empty!37719 () Bool)

(assert (=> b!1542525 (= e!858203 tp_is_empty!37719)))

(declare-fun b!1542526 () Bool)

(declare-fun res!1058538 () Bool)

(declare-fun e!858201 () Bool)

(assert (=> b!1542526 (=> (not res!1058538) (not e!858201))))

(declare-datatypes ((array!102668 0))(
  ( (array!102669 (arr!49536 (Array (_ BitVec 32) (_ BitVec 64))) (size!50086 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102668)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58735 0))(
  ( (V!58736 (val!18937 Int)) )
))
(declare-datatypes ((ValueCell!17949 0))(
  ( (ValueCellFull!17949 (v!21738 V!58735)) (EmptyCell!17949) )
))
(declare-datatypes ((array!102670 0))(
  ( (array!102671 (arr!49537 (Array (_ BitVec 32) ValueCell!17949)) (size!50087 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102670)

(assert (=> b!1542526 (= res!1058538 (and (= (size!50087 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50086 _keys!618) (size!50087 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542527 () Bool)

(declare-fun e!858204 () Bool)

(declare-fun e!858202 () Bool)

(declare-fun mapRes!58282 () Bool)

(assert (=> b!1542527 (= e!858204 (and e!858202 mapRes!58282))))

(declare-fun condMapEmpty!58282 () Bool)

(declare-fun mapDefault!58282 () ValueCell!17949)

(assert (=> b!1542527 (= condMapEmpty!58282 (= (arr!49537 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17949)) mapDefault!58282)))))

(declare-fun b!1542528 () Bool)

(declare-fun res!1058536 () Bool)

(assert (=> b!1542528 (=> (not res!1058536) (not e!858201))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102668 (_ BitVec 32)) Bool)

(assert (=> b!1542528 (= res!1058536 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542529 () Bool)

(assert (=> b!1542529 (= e!858201 false)))

(declare-fun lt!665831 () Bool)

(declare-datatypes ((List!35880 0))(
  ( (Nil!35877) (Cons!35876 (h!37321 (_ BitVec 64)) (t!50574 List!35880)) )
))
(declare-fun arrayNoDuplicates!0 (array!102668 (_ BitVec 32) List!35880) Bool)

(assert (=> b!1542529 (= lt!665831 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35877))))

(declare-fun mapNonEmpty!58282 () Bool)

(declare-fun tp!110809 () Bool)

(assert (=> mapNonEmpty!58282 (= mapRes!58282 (and tp!110809 e!858203))))

(declare-fun mapValue!58282 () ValueCell!17949)

(declare-fun mapRest!58282 () (Array (_ BitVec 32) ValueCell!17949))

(declare-fun mapKey!58282 () (_ BitVec 32))

(assert (=> mapNonEmpty!58282 (= (arr!49537 _values!470) (store mapRest!58282 mapKey!58282 mapValue!58282))))

(declare-fun b!1542530 () Bool)

(assert (=> b!1542530 (= e!858202 tp_is_empty!37719)))

(declare-fun mapIsEmpty!58282 () Bool)

(assert (=> mapIsEmpty!58282 mapRes!58282))

(declare-fun res!1058537 () Bool)

(assert (=> start!131730 (=> (not res!1058537) (not e!858201))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131730 (= res!1058537 (validMask!0 mask!926))))

(assert (=> start!131730 e!858201))

(assert (=> start!131730 true))

(declare-fun array_inv!38543 (array!102670) Bool)

(assert (=> start!131730 (and (array_inv!38543 _values!470) e!858204)))

(declare-fun array_inv!38544 (array!102668) Bool)

(assert (=> start!131730 (array_inv!38544 _keys!618)))

(assert (= (and start!131730 res!1058537) b!1542526))

(assert (= (and b!1542526 res!1058538) b!1542528))

(assert (= (and b!1542528 res!1058536) b!1542529))

(assert (= (and b!1542527 condMapEmpty!58282) mapIsEmpty!58282))

(assert (= (and b!1542527 (not condMapEmpty!58282)) mapNonEmpty!58282))

(get-info :version)

(assert (= (and mapNonEmpty!58282 ((_ is ValueCellFull!17949) mapValue!58282)) b!1542525))

(assert (= (and b!1542527 ((_ is ValueCellFull!17949) mapDefault!58282)) b!1542530))

(assert (= start!131730 b!1542527))

(declare-fun m!1424137 () Bool)

(assert (=> b!1542528 m!1424137))

(declare-fun m!1424139 () Bool)

(assert (=> b!1542529 m!1424139))

(declare-fun m!1424141 () Bool)

(assert (=> mapNonEmpty!58282 m!1424141))

(declare-fun m!1424143 () Bool)

(assert (=> start!131730 m!1424143))

(declare-fun m!1424145 () Bool)

(assert (=> start!131730 m!1424145))

(declare-fun m!1424147 () Bool)

(assert (=> start!131730 m!1424147))

(check-sat (not b!1542529) (not b!1542528) tp_is_empty!37719 (not mapNonEmpty!58282) (not start!131730))
(check-sat)
