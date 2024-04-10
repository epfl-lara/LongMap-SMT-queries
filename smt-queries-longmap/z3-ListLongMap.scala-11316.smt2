; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131802 () Bool)

(assert start!131802)

(declare-fun b!1543173 () Bool)

(declare-fun e!858742 () Bool)

(declare-fun e!858740 () Bool)

(declare-fun mapRes!58390 () Bool)

(assert (=> b!1543173 (= e!858742 (and e!858740 mapRes!58390))))

(declare-fun condMapEmpty!58390 () Bool)

(declare-datatypes ((V!58831 0))(
  ( (V!58832 (val!18973 Int)) )
))
(declare-datatypes ((ValueCell!17985 0))(
  ( (ValueCellFull!17985 (v!21774 V!58831)) (EmptyCell!17985) )
))
(declare-datatypes ((array!102808 0))(
  ( (array!102809 (arr!49606 (Array (_ BitVec 32) ValueCell!17985)) (size!50156 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102808)

(declare-fun mapDefault!58390 () ValueCell!17985)

(assert (=> b!1543173 (= condMapEmpty!58390 (= (arr!49606 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17985)) mapDefault!58390)))))

(declare-fun b!1543174 () Bool)

(declare-fun e!858744 () Bool)

(assert (=> b!1543174 (= e!858744 false)))

(declare-fun lt!665939 () Bool)

(declare-datatypes ((array!102810 0))(
  ( (array!102811 (arr!49607 (Array (_ BitVec 32) (_ BitVec 64))) (size!50157 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102810)

(declare-datatypes ((List!35909 0))(
  ( (Nil!35906) (Cons!35905 (h!37350 (_ BitVec 64)) (t!50603 List!35909)) )
))
(declare-fun arrayNoDuplicates!0 (array!102810 (_ BitVec 32) List!35909) Bool)

(assert (=> b!1543174 (= lt!665939 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35906))))

(declare-fun mapNonEmpty!58390 () Bool)

(declare-fun tp!110917 () Bool)

(declare-fun e!858743 () Bool)

(assert (=> mapNonEmpty!58390 (= mapRes!58390 (and tp!110917 e!858743))))

(declare-fun mapRest!58390 () (Array (_ BitVec 32) ValueCell!17985))

(declare-fun mapKey!58390 () (_ BitVec 32))

(declare-fun mapValue!58390 () ValueCell!17985)

(assert (=> mapNonEmpty!58390 (= (arr!49606 _values!470) (store mapRest!58390 mapKey!58390 mapValue!58390))))

(declare-fun b!1543175 () Bool)

(declare-fun tp_is_empty!37791 () Bool)

(assert (=> b!1543175 (= e!858740 tp_is_empty!37791)))

(declare-fun b!1543176 () Bool)

(declare-fun res!1058862 () Bool)

(assert (=> b!1543176 (=> (not res!1058862) (not e!858744))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102810 (_ BitVec 32)) Bool)

(assert (=> b!1543176 (= res!1058862 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun mapIsEmpty!58390 () Bool)

(assert (=> mapIsEmpty!58390 mapRes!58390))

(declare-fun b!1543177 () Bool)

(declare-fun res!1058860 () Bool)

(assert (=> b!1543177 (=> (not res!1058860) (not e!858744))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1543177 (= res!1058860 (and (= (size!50156 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50157 _keys!618) (size!50156 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1543178 () Bool)

(assert (=> b!1543178 (= e!858743 tp_is_empty!37791)))

(declare-fun res!1058861 () Bool)

(assert (=> start!131802 (=> (not res!1058861) (not e!858744))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131802 (= res!1058861 (validMask!0 mask!926))))

(assert (=> start!131802 e!858744))

(assert (=> start!131802 true))

(declare-fun array_inv!38595 (array!102808) Bool)

(assert (=> start!131802 (and (array_inv!38595 _values!470) e!858742)))

(declare-fun array_inv!38596 (array!102810) Bool)

(assert (=> start!131802 (array_inv!38596 _keys!618)))

(assert (= (and start!131802 res!1058861) b!1543177))

(assert (= (and b!1543177 res!1058860) b!1543176))

(assert (= (and b!1543176 res!1058862) b!1543174))

(assert (= (and b!1543173 condMapEmpty!58390) mapIsEmpty!58390))

(assert (= (and b!1543173 (not condMapEmpty!58390)) mapNonEmpty!58390))

(get-info :version)

(assert (= (and mapNonEmpty!58390 ((_ is ValueCellFull!17985) mapValue!58390)) b!1543178))

(assert (= (and b!1543173 ((_ is ValueCellFull!17985) mapDefault!58390)) b!1543175))

(assert (= start!131802 b!1543173))

(declare-fun m!1424569 () Bool)

(assert (=> b!1543174 m!1424569))

(declare-fun m!1424571 () Bool)

(assert (=> mapNonEmpty!58390 m!1424571))

(declare-fun m!1424573 () Bool)

(assert (=> b!1543176 m!1424573))

(declare-fun m!1424575 () Bool)

(assert (=> start!131802 m!1424575))

(declare-fun m!1424577 () Bool)

(assert (=> start!131802 m!1424577))

(declare-fun m!1424579 () Bool)

(assert (=> start!131802 m!1424579))

(check-sat tp_is_empty!37791 (not start!131802) (not b!1543176) (not mapNonEmpty!58390) (not b!1543174))
(check-sat)
