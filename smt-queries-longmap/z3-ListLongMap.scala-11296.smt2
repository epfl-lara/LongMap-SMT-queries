; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131682 () Bool)

(assert start!131682)

(declare-fun b!1542093 () Bool)

(declare-fun res!1058322 () Bool)

(declare-fun e!857843 () Bool)

(assert (=> b!1542093 (=> (not res!1058322) (not e!857843))))

(declare-datatypes ((array!102574 0))(
  ( (array!102575 (arr!49489 (Array (_ BitVec 32) (_ BitVec 64))) (size!50039 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102574)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102574 (_ BitVec 32)) Bool)

(assert (=> b!1542093 (= res!1058322 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542094 () Bool)

(assert (=> b!1542094 (= e!857843 false)))

(declare-fun lt!665759 () Bool)

(declare-datatypes ((List!35861 0))(
  ( (Nil!35858) (Cons!35857 (h!37302 (_ BitVec 64)) (t!50555 List!35861)) )
))
(declare-fun arrayNoDuplicates!0 (array!102574 (_ BitVec 32) List!35861) Bool)

(assert (=> b!1542094 (= lt!665759 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35858))))

(declare-fun mapIsEmpty!58210 () Bool)

(declare-fun mapRes!58210 () Bool)

(assert (=> mapIsEmpty!58210 mapRes!58210))

(declare-fun b!1542095 () Bool)

(declare-fun e!857844 () Bool)

(declare-fun e!857841 () Bool)

(assert (=> b!1542095 (= e!857844 (and e!857841 mapRes!58210))))

(declare-fun condMapEmpty!58210 () Bool)

(declare-datatypes ((V!58671 0))(
  ( (V!58672 (val!18913 Int)) )
))
(declare-datatypes ((ValueCell!17925 0))(
  ( (ValueCellFull!17925 (v!21714 V!58671)) (EmptyCell!17925) )
))
(declare-datatypes ((array!102576 0))(
  ( (array!102577 (arr!49490 (Array (_ BitVec 32) ValueCell!17925)) (size!50040 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102576)

(declare-fun mapDefault!58210 () ValueCell!17925)

(assert (=> b!1542095 (= condMapEmpty!58210 (= (arr!49490 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17925)) mapDefault!58210)))))

(declare-fun b!1542096 () Bool)

(declare-fun e!857840 () Bool)

(declare-fun tp_is_empty!37671 () Bool)

(assert (=> b!1542096 (= e!857840 tp_is_empty!37671)))

(declare-fun b!1542097 () Bool)

(assert (=> b!1542097 (= e!857841 tp_is_empty!37671)))

(declare-fun b!1542098 () Bool)

(declare-fun res!1058321 () Bool)

(assert (=> b!1542098 (=> (not res!1058321) (not e!857843))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542098 (= res!1058321 (and (= (size!50040 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50039 _keys!618) (size!50040 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58210 () Bool)

(declare-fun tp!110737 () Bool)

(assert (=> mapNonEmpty!58210 (= mapRes!58210 (and tp!110737 e!857840))))

(declare-fun mapValue!58210 () ValueCell!17925)

(declare-fun mapKey!58210 () (_ BitVec 32))

(declare-fun mapRest!58210 () (Array (_ BitVec 32) ValueCell!17925))

(assert (=> mapNonEmpty!58210 (= (arr!49490 _values!470) (store mapRest!58210 mapKey!58210 mapValue!58210))))

(declare-fun res!1058320 () Bool)

(assert (=> start!131682 (=> (not res!1058320) (not e!857843))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131682 (= res!1058320 (validMask!0 mask!926))))

(assert (=> start!131682 e!857843))

(assert (=> start!131682 true))

(declare-fun array_inv!38505 (array!102576) Bool)

(assert (=> start!131682 (and (array_inv!38505 _values!470) e!857844)))

(declare-fun array_inv!38506 (array!102574) Bool)

(assert (=> start!131682 (array_inv!38506 _keys!618)))

(assert (= (and start!131682 res!1058320) b!1542098))

(assert (= (and b!1542098 res!1058321) b!1542093))

(assert (= (and b!1542093 res!1058322) b!1542094))

(assert (= (and b!1542095 condMapEmpty!58210) mapIsEmpty!58210))

(assert (= (and b!1542095 (not condMapEmpty!58210)) mapNonEmpty!58210))

(get-info :version)

(assert (= (and mapNonEmpty!58210 ((_ is ValueCellFull!17925) mapValue!58210)) b!1542096))

(assert (= (and b!1542095 ((_ is ValueCellFull!17925) mapDefault!58210)) b!1542097))

(assert (= start!131682 b!1542095))

(declare-fun m!1423849 () Bool)

(assert (=> b!1542093 m!1423849))

(declare-fun m!1423851 () Bool)

(assert (=> b!1542094 m!1423851))

(declare-fun m!1423853 () Bool)

(assert (=> mapNonEmpty!58210 m!1423853))

(declare-fun m!1423855 () Bool)

(assert (=> start!131682 m!1423855))

(declare-fun m!1423857 () Bool)

(assert (=> start!131682 m!1423857))

(declare-fun m!1423859 () Bool)

(assert (=> start!131682 m!1423859))

(check-sat (not start!131682) tp_is_empty!37671 (not b!1542093) (not mapNonEmpty!58210) (not b!1542094))
(check-sat)
