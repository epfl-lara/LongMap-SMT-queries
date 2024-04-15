; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131780 () Bool)

(assert start!131780)

(declare-fun res!1058857 () Bool)

(declare-fun e!858755 () Bool)

(assert (=> start!131780 (=> (not res!1058857) (not e!858755))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131780 (= res!1058857 (validMask!0 mask!926))))

(assert (=> start!131780 e!858755))

(assert (=> start!131780 true))

(declare-datatypes ((V!58869 0))(
  ( (V!58870 (val!18987 Int)) )
))
(declare-datatypes ((ValueCell!17999 0))(
  ( (ValueCellFull!17999 (v!21784 V!58869)) (EmptyCell!17999) )
))
(declare-datatypes ((array!102790 0))(
  ( (array!102791 (arr!49598 (Array (_ BitVec 32) ValueCell!17999)) (size!50150 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102790)

(declare-fun e!858754 () Bool)

(declare-fun array_inv!38783 (array!102790) Bool)

(assert (=> start!131780 (and (array_inv!38783 _values!470) e!858754)))

(declare-datatypes ((array!102792 0))(
  ( (array!102793 (arr!49599 (Array (_ BitVec 32) (_ BitVec 64))) (size!50151 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102792)

(declare-fun array_inv!38784 (array!102792) Bool)

(assert (=> start!131780 (array_inv!38784 _keys!618)))

(declare-fun mapNonEmpty!58432 () Bool)

(declare-fun mapRes!58432 () Bool)

(declare-fun tp!110960 () Bool)

(declare-fun e!858753 () Bool)

(assert (=> mapNonEmpty!58432 (= mapRes!58432 (and tp!110960 e!858753))))

(declare-fun mapKey!58432 () (_ BitVec 32))

(declare-fun mapValue!58432 () ValueCell!17999)

(declare-fun mapRest!58432 () (Array (_ BitVec 32) ValueCell!17999))

(assert (=> mapNonEmpty!58432 (= (arr!49598 _values!470) (store mapRest!58432 mapKey!58432 mapValue!58432))))

(declare-fun b!1543112 () Bool)

(declare-fun tp_is_empty!37819 () Bool)

(assert (=> b!1543112 (= e!858753 tp_is_empty!37819)))

(declare-fun b!1543113 () Bool)

(declare-fun e!858752 () Bool)

(assert (=> b!1543113 (= e!858754 (and e!858752 mapRes!58432))))

(declare-fun condMapEmpty!58432 () Bool)

(declare-fun mapDefault!58432 () ValueCell!17999)

(assert (=> b!1543113 (= condMapEmpty!58432 (= (arr!49598 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17999)) mapDefault!58432)))))

(declare-fun b!1543114 () Bool)

(declare-fun res!1058858 () Bool)

(assert (=> b!1543114 (=> (not res!1058858) (not e!858755))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543114 (= res!1058858 (and (= (size!50150 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50151 _keys!618) (size!50150 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543115 () Bool)

(assert (=> b!1543115 (= e!858755 false)))

(declare-fun lt!665695 () Bool)

(declare-datatypes ((List!35964 0))(
  ( (Nil!35961) (Cons!35960 (h!37406 (_ BitVec 64)) (t!50650 List!35964)) )
))
(declare-fun arrayNoDuplicates!0 (array!102792 (_ BitVec 32) List!35964) Bool)

(assert (=> b!1543115 (= lt!665695 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35961))))

(declare-fun b!1543116 () Bool)

(assert (=> b!1543116 (= e!858752 tp_is_empty!37819)))

(declare-fun b!1543117 () Bool)

(declare-fun res!1058859 () Bool)

(assert (=> b!1543117 (=> (not res!1058859) (not e!858755))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102792 (_ BitVec 32)) Bool)

(assert (=> b!1543117 (= res!1058859 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58432 () Bool)

(assert (=> mapIsEmpty!58432 mapRes!58432))

(assert (= (and start!131780 res!1058857) b!1543114))

(assert (= (and b!1543114 res!1058858) b!1543117))

(assert (= (and b!1543117 res!1058859) b!1543115))

(assert (= (and b!1543113 condMapEmpty!58432) mapIsEmpty!58432))

(assert (= (and b!1543113 (not condMapEmpty!58432)) mapNonEmpty!58432))

(get-info :version)

(assert (= (and mapNonEmpty!58432 ((_ is ValueCellFull!17999) mapValue!58432)) b!1543112))

(assert (= (and b!1543113 ((_ is ValueCellFull!17999) mapDefault!58432)) b!1543116))

(assert (= start!131780 b!1543113))

(declare-fun m!1423845 () Bool)

(assert (=> start!131780 m!1423845))

(declare-fun m!1423847 () Bool)

(assert (=> start!131780 m!1423847))

(declare-fun m!1423849 () Bool)

(assert (=> start!131780 m!1423849))

(declare-fun m!1423851 () Bool)

(assert (=> mapNonEmpty!58432 m!1423851))

(declare-fun m!1423853 () Bool)

(assert (=> b!1543115 m!1423853))

(declare-fun m!1423855 () Bool)

(assert (=> b!1543117 m!1423855))

(check-sat (not start!131780) (not mapNonEmpty!58432) tp_is_empty!37819 (not b!1543117) (not b!1543115))
(check-sat)
