; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131850 () Bool)

(assert start!131850)

(declare-fun b!1543605 () Bool)

(declare-fun e!859101 () Bool)

(declare-fun e!859102 () Bool)

(declare-fun mapRes!58462 () Bool)

(assert (=> b!1543605 (= e!859101 (and e!859102 mapRes!58462))))

(declare-fun condMapEmpty!58462 () Bool)

(declare-datatypes ((V!58895 0))(
  ( (V!58896 (val!18997 Int)) )
))
(declare-datatypes ((ValueCell!18009 0))(
  ( (ValueCellFull!18009 (v!21798 V!58895)) (EmptyCell!18009) )
))
(declare-datatypes ((array!102900 0))(
  ( (array!102901 (arr!49652 (Array (_ BitVec 32) ValueCell!18009)) (size!50202 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102900)

(declare-fun mapDefault!58462 () ValueCell!18009)

(assert (=> b!1543605 (= condMapEmpty!58462 (= (arr!49652 _values!470) ((as const (Array (_ BitVec 32) ValueCell!18009)) mapDefault!58462)))))

(declare-fun mapNonEmpty!58462 () Bool)

(declare-fun tp!110989 () Bool)

(declare-fun e!859104 () Bool)

(assert (=> mapNonEmpty!58462 (= mapRes!58462 (and tp!110989 e!859104))))

(declare-fun mapRest!58462 () (Array (_ BitVec 32) ValueCell!18009))

(declare-fun mapValue!58462 () ValueCell!18009)

(declare-fun mapKey!58462 () (_ BitVec 32))

(assert (=> mapNonEmpty!58462 (= (arr!49652 _values!470) (store mapRest!58462 mapKey!58462 mapValue!58462))))

(declare-fun b!1543606 () Bool)

(declare-fun res!1059077 () Bool)

(declare-fun e!859100 () Bool)

(assert (=> b!1543606 (=> (not res!1059077) (not e!859100))))

(declare-datatypes ((array!102902 0))(
  ( (array!102903 (arr!49653 (Array (_ BitVec 32) (_ BitVec 64))) (size!50203 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102902)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(assert (=> b!1543606 (= res!1059077 (and (= (size!50202 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50203 _keys!618) (size!50202 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543607 () Bool)

(assert (=> b!1543607 (= e!859100 false)))

(declare-fun lt!666011 () Bool)

(declare-datatypes ((List!35926 0))(
  ( (Nil!35923) (Cons!35922 (h!37367 (_ BitVec 64)) (t!50620 List!35926)) )
))
(declare-fun arrayNoDuplicates!0 (array!102902 (_ BitVec 32) List!35926) Bool)

(assert (=> b!1543607 (= lt!666011 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35923))))

(declare-fun b!1543608 () Bool)

(declare-fun res!1059076 () Bool)

(assert (=> b!1543608 (=> (not res!1059076) (not e!859100))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102902 (_ BitVec 32)) Bool)

(assert (=> b!1543608 (= res!1059076 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58462 () Bool)

(assert (=> mapIsEmpty!58462 mapRes!58462))

(declare-fun b!1543610 () Bool)

(declare-fun tp_is_empty!37839 () Bool)

(assert (=> b!1543610 (= e!859104 tp_is_empty!37839)))

(declare-fun res!1059078 () Bool)

(assert (=> start!131850 (=> (not res!1059078) (not e!859100))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131850 (= res!1059078 (validMask!0 mask!926))))

(assert (=> start!131850 e!859100))

(assert (=> start!131850 true))

(declare-fun array_inv!38627 (array!102900) Bool)

(assert (=> start!131850 (and (array_inv!38627 _values!470) e!859101)))

(declare-fun array_inv!38628 (array!102902) Bool)

(assert (=> start!131850 (array_inv!38628 _keys!618)))

(declare-fun b!1543609 () Bool)

(assert (=> b!1543609 (= e!859102 tp_is_empty!37839)))

(assert (= (and start!131850 res!1059078) b!1543606))

(assert (= (and b!1543606 res!1059077) b!1543608))

(assert (= (and b!1543608 res!1059076) b!1543607))

(assert (= (and b!1543605 condMapEmpty!58462) mapIsEmpty!58462))

(assert (= (and b!1543605 (not condMapEmpty!58462)) mapNonEmpty!58462))

(get-info :version)

(assert (= (and mapNonEmpty!58462 ((_ is ValueCellFull!18009) mapValue!58462)) b!1543610))

(assert (= (and b!1543605 ((_ is ValueCellFull!18009) mapDefault!58462)) b!1543609))

(assert (= start!131850 b!1543605))

(declare-fun m!1424857 () Bool)

(assert (=> mapNonEmpty!58462 m!1424857))

(declare-fun m!1424859 () Bool)

(assert (=> b!1543607 m!1424859))

(declare-fun m!1424861 () Bool)

(assert (=> b!1543608 m!1424861))

(declare-fun m!1424863 () Bool)

(assert (=> start!131850 m!1424863))

(declare-fun m!1424865 () Bool)

(assert (=> start!131850 m!1424865))

(declare-fun m!1424867 () Bool)

(assert (=> start!131850 m!1424867))

(check-sat tp_is_empty!37839 (not start!131850) (not mapNonEmpty!58462) (not b!1543607) (not b!1543608))
(check-sat)
