; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131736 () Bool)

(assert start!131736)

(declare-fun mapNonEmpty!58291 () Bool)

(declare-fun mapRes!58291 () Bool)

(declare-fun tp!110818 () Bool)

(declare-fun e!858246 () Bool)

(assert (=> mapNonEmpty!58291 (= mapRes!58291 (and tp!110818 e!858246))))

(declare-fun mapKey!58291 () (_ BitVec 32))

(declare-datatypes ((V!58743 0))(
  ( (V!58744 (val!18940 Int)) )
))
(declare-datatypes ((ValueCell!17952 0))(
  ( (ValueCellFull!17952 (v!21741 V!58743)) (EmptyCell!17952) )
))
(declare-fun mapRest!58291 () (Array (_ BitVec 32) ValueCell!17952))

(declare-fun mapValue!58291 () ValueCell!17952)

(declare-datatypes ((array!102680 0))(
  ( (array!102681 (arr!49542 (Array (_ BitVec 32) ValueCell!17952)) (size!50092 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102680)

(assert (=> mapNonEmpty!58291 (= (arr!49542 _values!470) (store mapRest!58291 mapKey!58291 mapValue!58291))))

(declare-fun mapIsEmpty!58291 () Bool)

(assert (=> mapIsEmpty!58291 mapRes!58291))

(declare-fun b!1542579 () Bool)

(declare-fun e!858245 () Bool)

(declare-fun tp_is_empty!37725 () Bool)

(assert (=> b!1542579 (= e!858245 tp_is_empty!37725)))

(declare-fun res!1058563 () Bool)

(declare-fun e!858247 () Bool)

(assert (=> start!131736 (=> (not res!1058563) (not e!858247))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131736 (= res!1058563 (validMask!0 mask!926))))

(assert (=> start!131736 e!858247))

(assert (=> start!131736 true))

(declare-fun e!858248 () Bool)

(declare-fun array_inv!38549 (array!102680) Bool)

(assert (=> start!131736 (and (array_inv!38549 _values!470) e!858248)))

(declare-datatypes ((array!102682 0))(
  ( (array!102683 (arr!49543 (Array (_ BitVec 32) (_ BitVec 64))) (size!50093 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102682)

(declare-fun array_inv!38550 (array!102682) Bool)

(assert (=> start!131736 (array_inv!38550 _keys!618)))

(declare-fun b!1542580 () Bool)

(assert (=> b!1542580 (= e!858246 tp_is_empty!37725)))

(declare-fun b!1542581 () Bool)

(declare-fun res!1058564 () Bool)

(assert (=> b!1542581 (=> (not res!1058564) (not e!858247))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542581 (= res!1058564 (and (= (size!50092 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50093 _keys!618) (size!50092 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542582 () Bool)

(declare-fun res!1058565 () Bool)

(assert (=> b!1542582 (=> (not res!1058565) (not e!858247))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102682 (_ BitVec 32)) Bool)

(assert (=> b!1542582 (= res!1058565 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542583 () Bool)

(assert (=> b!1542583 (= e!858247 false)))

(declare-fun lt!665840 () Bool)

(declare-datatypes ((List!35883 0))(
  ( (Nil!35880) (Cons!35879 (h!37324 (_ BitVec 64)) (t!50577 List!35883)) )
))
(declare-fun arrayNoDuplicates!0 (array!102682 (_ BitVec 32) List!35883) Bool)

(assert (=> b!1542583 (= lt!665840 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35880))))

(declare-fun b!1542584 () Bool)

(assert (=> b!1542584 (= e!858248 (and e!858245 mapRes!58291))))

(declare-fun condMapEmpty!58291 () Bool)

(declare-fun mapDefault!58291 () ValueCell!17952)

(assert (=> b!1542584 (= condMapEmpty!58291 (= (arr!49542 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17952)) mapDefault!58291)))))

(assert (= (and start!131736 res!1058563) b!1542581))

(assert (= (and b!1542581 res!1058564) b!1542582))

(assert (= (and b!1542582 res!1058565) b!1542583))

(assert (= (and b!1542584 condMapEmpty!58291) mapIsEmpty!58291))

(assert (= (and b!1542584 (not condMapEmpty!58291)) mapNonEmpty!58291))

(get-info :version)

(assert (= (and mapNonEmpty!58291 ((_ is ValueCellFull!17952) mapValue!58291)) b!1542580))

(assert (= (and b!1542584 ((_ is ValueCellFull!17952) mapDefault!58291)) b!1542579))

(assert (= start!131736 b!1542584))

(declare-fun m!1424173 () Bool)

(assert (=> mapNonEmpty!58291 m!1424173))

(declare-fun m!1424175 () Bool)

(assert (=> start!131736 m!1424175))

(declare-fun m!1424177 () Bool)

(assert (=> start!131736 m!1424177))

(declare-fun m!1424179 () Bool)

(assert (=> start!131736 m!1424179))

(declare-fun m!1424181 () Bool)

(assert (=> b!1542582 m!1424181))

(declare-fun m!1424183 () Bool)

(assert (=> b!1542583 m!1424183))

(check-sat (not b!1542583) (not b!1542582) (not start!131736) (not mapNonEmpty!58291) tp_is_empty!37725)
(check-sat)
