; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131796 () Bool)

(assert start!131796)

(declare-fun b!1543119 () Bool)

(declare-fun e!858696 () Bool)

(declare-fun tp_is_empty!37785 () Bool)

(assert (=> b!1543119 (= e!858696 tp_is_empty!37785)))

(declare-fun mapIsEmpty!58381 () Bool)

(declare-fun mapRes!58381 () Bool)

(assert (=> mapIsEmpty!58381 mapRes!58381))

(declare-fun mapNonEmpty!58381 () Bool)

(declare-fun tp!110908 () Bool)

(declare-fun e!858697 () Bool)

(assert (=> mapNonEmpty!58381 (= mapRes!58381 (and tp!110908 e!858697))))

(declare-datatypes ((V!58823 0))(
  ( (V!58824 (val!18970 Int)) )
))
(declare-datatypes ((ValueCell!17982 0))(
  ( (ValueCellFull!17982 (v!21771 V!58823)) (EmptyCell!17982) )
))
(declare-fun mapValue!58381 () ValueCell!17982)

(declare-fun mapRest!58381 () (Array (_ BitVec 32) ValueCell!17982))

(declare-datatypes ((array!102796 0))(
  ( (array!102797 (arr!49600 (Array (_ BitVec 32) ValueCell!17982)) (size!50150 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102796)

(declare-fun mapKey!58381 () (_ BitVec 32))

(assert (=> mapNonEmpty!58381 (= (arr!49600 _values!470) (store mapRest!58381 mapKey!58381 mapValue!58381))))

(declare-fun b!1543120 () Bool)

(assert (=> b!1543120 (= e!858697 tp_is_empty!37785)))

(declare-fun b!1543121 () Bool)

(declare-fun res!1058835 () Bool)

(declare-fun e!858695 () Bool)

(assert (=> b!1543121 (=> (not res!1058835) (not e!858695))))

(declare-datatypes ((array!102798 0))(
  ( (array!102799 (arr!49601 (Array (_ BitVec 32) (_ BitVec 64))) (size!50151 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102798)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543121 (= res!1058835 (and (= (size!50150 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50151 _keys!618) (size!50150 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543122 () Bool)

(declare-fun res!1058833 () Bool)

(assert (=> b!1543122 (=> (not res!1058833) (not e!858695))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102798 (_ BitVec 32)) Bool)

(assert (=> b!1543122 (= res!1058833 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1543123 () Bool)

(assert (=> b!1543123 (= e!858695 false)))

(declare-fun lt!665930 () Bool)

(declare-datatypes ((List!35906 0))(
  ( (Nil!35903) (Cons!35902 (h!37347 (_ BitVec 64)) (t!50600 List!35906)) )
))
(declare-fun arrayNoDuplicates!0 (array!102798 (_ BitVec 32) List!35906) Bool)

(assert (=> b!1543123 (= lt!665930 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35903))))

(declare-fun res!1058834 () Bool)

(assert (=> start!131796 (=> (not res!1058834) (not e!858695))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131796 (= res!1058834 (validMask!0 mask!926))))

(assert (=> start!131796 e!858695))

(assert (=> start!131796 true))

(declare-fun e!858699 () Bool)

(declare-fun array_inv!38591 (array!102796) Bool)

(assert (=> start!131796 (and (array_inv!38591 _values!470) e!858699)))

(declare-fun array_inv!38592 (array!102798) Bool)

(assert (=> start!131796 (array_inv!38592 _keys!618)))

(declare-fun b!1543124 () Bool)

(assert (=> b!1543124 (= e!858699 (and e!858696 mapRes!58381))))

(declare-fun condMapEmpty!58381 () Bool)

(declare-fun mapDefault!58381 () ValueCell!17982)

(assert (=> b!1543124 (= condMapEmpty!58381 (= (arr!49600 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17982)) mapDefault!58381)))))

(assert (= (and start!131796 res!1058834) b!1543121))

(assert (= (and b!1543121 res!1058835) b!1543122))

(assert (= (and b!1543122 res!1058833) b!1543123))

(assert (= (and b!1543124 condMapEmpty!58381) mapIsEmpty!58381))

(assert (= (and b!1543124 (not condMapEmpty!58381)) mapNonEmpty!58381))

(get-info :version)

(assert (= (and mapNonEmpty!58381 ((_ is ValueCellFull!17982) mapValue!58381)) b!1543120))

(assert (= (and b!1543124 ((_ is ValueCellFull!17982) mapDefault!58381)) b!1543119))

(assert (= start!131796 b!1543124))

(declare-fun m!1424533 () Bool)

(assert (=> mapNonEmpty!58381 m!1424533))

(declare-fun m!1424535 () Bool)

(assert (=> b!1543122 m!1424535))

(declare-fun m!1424537 () Bool)

(assert (=> b!1543123 m!1424537))

(declare-fun m!1424539 () Bool)

(assert (=> start!131796 m!1424539))

(declare-fun m!1424541 () Bool)

(assert (=> start!131796 m!1424541))

(declare-fun m!1424543 () Bool)

(assert (=> start!131796 m!1424543))

(check-sat tp_is_empty!37785 (not b!1543122) (not start!131796) (not b!1543123) (not mapNonEmpty!58381))
(check-sat)
