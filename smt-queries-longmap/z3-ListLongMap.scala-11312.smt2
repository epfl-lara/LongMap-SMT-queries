; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131778 () Bool)

(assert start!131778)

(declare-fun b!1542957 () Bool)

(declare-fun e!858560 () Bool)

(declare-fun e!858562 () Bool)

(declare-fun mapRes!58354 () Bool)

(assert (=> b!1542957 (= e!858560 (and e!858562 mapRes!58354))))

(declare-fun condMapEmpty!58354 () Bool)

(declare-datatypes ((V!58799 0))(
  ( (V!58800 (val!18961 Int)) )
))
(declare-datatypes ((ValueCell!17973 0))(
  ( (ValueCellFull!17973 (v!21762 V!58799)) (EmptyCell!17973) )
))
(declare-datatypes ((array!102760 0))(
  ( (array!102761 (arr!49582 (Array (_ BitVec 32) ValueCell!17973)) (size!50132 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102760)

(declare-fun mapDefault!58354 () ValueCell!17973)

(assert (=> b!1542957 (= condMapEmpty!58354 (= (arr!49582 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17973)) mapDefault!58354)))))

(declare-fun b!1542958 () Bool)

(declare-fun e!858563 () Bool)

(declare-fun tp_is_empty!37767 () Bool)

(assert (=> b!1542958 (= e!858563 tp_is_empty!37767)))

(declare-fun res!1058754 () Bool)

(declare-fun e!858564 () Bool)

(assert (=> start!131778 (=> (not res!1058754) (not e!858564))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131778 (= res!1058754 (validMask!0 mask!926))))

(assert (=> start!131778 e!858564))

(assert (=> start!131778 true))

(declare-fun array_inv!38579 (array!102760) Bool)

(assert (=> start!131778 (and (array_inv!38579 _values!470) e!858560)))

(declare-datatypes ((array!102762 0))(
  ( (array!102763 (arr!49583 (Array (_ BitVec 32) (_ BitVec 64))) (size!50133 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102762)

(declare-fun array_inv!38580 (array!102762) Bool)

(assert (=> start!131778 (array_inv!38580 _keys!618)))

(declare-fun mapNonEmpty!58354 () Bool)

(declare-fun tp!110881 () Bool)

(assert (=> mapNonEmpty!58354 (= mapRes!58354 (and tp!110881 e!858563))))

(declare-fun mapValue!58354 () ValueCell!17973)

(declare-fun mapKey!58354 () (_ BitVec 32))

(declare-fun mapRest!58354 () (Array (_ BitVec 32) ValueCell!17973))

(assert (=> mapNonEmpty!58354 (= (arr!49582 _values!470) (store mapRest!58354 mapKey!58354 mapValue!58354))))

(declare-fun b!1542959 () Bool)

(assert (=> b!1542959 (= e!858564 false)))

(declare-fun lt!665903 () Bool)

(declare-datatypes ((List!35898 0))(
  ( (Nil!35895) (Cons!35894 (h!37339 (_ BitVec 64)) (t!50592 List!35898)) )
))
(declare-fun arrayNoDuplicates!0 (array!102762 (_ BitVec 32) List!35898) Bool)

(assert (=> b!1542959 (= lt!665903 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35895))))

(declare-fun b!1542960 () Bool)

(declare-fun res!1058753 () Bool)

(assert (=> b!1542960 (=> (not res!1058753) (not e!858564))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542960 (= res!1058753 (and (= (size!50132 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50133 _keys!618) (size!50132 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapIsEmpty!58354 () Bool)

(assert (=> mapIsEmpty!58354 mapRes!58354))

(declare-fun b!1542961 () Bool)

(assert (=> b!1542961 (= e!858562 tp_is_empty!37767)))

(declare-fun b!1542962 () Bool)

(declare-fun res!1058752 () Bool)

(assert (=> b!1542962 (=> (not res!1058752) (not e!858564))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102762 (_ BitVec 32)) Bool)

(assert (=> b!1542962 (= res!1058752 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131778 res!1058754) b!1542960))

(assert (= (and b!1542960 res!1058753) b!1542962))

(assert (= (and b!1542962 res!1058752) b!1542959))

(assert (= (and b!1542957 condMapEmpty!58354) mapIsEmpty!58354))

(assert (= (and b!1542957 (not condMapEmpty!58354)) mapNonEmpty!58354))

(get-info :version)

(assert (= (and mapNonEmpty!58354 ((_ is ValueCellFull!17973) mapValue!58354)) b!1542958))

(assert (= (and b!1542957 ((_ is ValueCellFull!17973) mapDefault!58354)) b!1542961))

(assert (= start!131778 b!1542957))

(declare-fun m!1424425 () Bool)

(assert (=> start!131778 m!1424425))

(declare-fun m!1424427 () Bool)

(assert (=> start!131778 m!1424427))

(declare-fun m!1424429 () Bool)

(assert (=> start!131778 m!1424429))

(declare-fun m!1424431 () Bool)

(assert (=> mapNonEmpty!58354 m!1424431))

(declare-fun m!1424433 () Bool)

(assert (=> b!1542959 m!1424433))

(declare-fun m!1424435 () Bool)

(assert (=> b!1542962 m!1424435))

(check-sat (not b!1542962) tp_is_empty!37767 (not b!1542959) (not mapNonEmpty!58354) (not start!131778))
(check-sat)
