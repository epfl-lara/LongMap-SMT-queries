; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131648 () Bool)

(assert start!131648)

(declare-fun b!1541924 () Bool)

(declare-fun e!857766 () Bool)

(declare-fun tp_is_empty!37687 () Bool)

(assert (=> b!1541924 (= e!857766 tp_is_empty!37687)))

(declare-fun mapIsEmpty!58234 () Bool)

(declare-fun mapRes!58234 () Bool)

(assert (=> mapIsEmpty!58234 mapRes!58234))

(declare-fun b!1541925 () Bool)

(declare-fun e!857762 () Bool)

(assert (=> b!1541925 (= e!857762 tp_is_empty!37687)))

(declare-fun b!1541926 () Bool)

(declare-fun res!1058264 () Bool)

(declare-fun e!857765 () Bool)

(assert (=> b!1541926 (=> (not res!1058264) (not e!857765))))

(declare-datatypes ((array!102548 0))(
  ( (array!102549 (arr!49477 (Array (_ BitVec 32) (_ BitVec 64))) (size!50029 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102548)

(declare-fun extraKeys!417 () (_ BitVec 32))

(declare-fun mask!926 () (_ BitVec 32))

(declare-datatypes ((V!58693 0))(
  ( (V!58694 (val!18921 Int)) )
))
(declare-datatypes ((ValueCell!17933 0))(
  ( (ValueCellFull!17933 (v!21718 V!58693)) (EmptyCell!17933) )
))
(declare-datatypes ((array!102550 0))(
  ( (array!102551 (arr!49478 (Array (_ BitVec 32) ValueCell!17933)) (size!50030 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102550)

(assert (=> b!1541926 (= res!1058264 (and (= (size!50030 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50029 _keys!618) (size!50030 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1541927 () Bool)

(assert (=> b!1541927 (= e!857765 false)))

(declare-fun lt!665497 () Bool)

(declare-datatypes ((List!35921 0))(
  ( (Nil!35918) (Cons!35917 (h!37363 (_ BitVec 64)) (t!50607 List!35921)) )
))
(declare-fun arrayNoDuplicates!0 (array!102548 (_ BitVec 32) List!35921) Bool)

(assert (=> b!1541927 (= lt!665497 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35918))))

(declare-fun b!1541928 () Bool)

(declare-fun e!857763 () Bool)

(assert (=> b!1541928 (= e!857763 (and e!857766 mapRes!58234))))

(declare-fun condMapEmpty!58234 () Bool)

(declare-fun mapDefault!58234 () ValueCell!17933)

(assert (=> b!1541928 (= condMapEmpty!58234 (= (arr!49478 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17933)) mapDefault!58234)))))

(declare-fun b!1541929 () Bool)

(declare-fun res!1058265 () Bool)

(assert (=> b!1541929 (=> (not res!1058265) (not e!857765))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102548 (_ BitVec 32)) Bool)

(assert (=> b!1541929 (= res!1058265 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun res!1058263 () Bool)

(assert (=> start!131648 (=> (not res!1058263) (not e!857765))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131648 (= res!1058263 (validMask!0 mask!926))))

(assert (=> start!131648 e!857765))

(assert (=> start!131648 true))

(declare-fun array_inv!38691 (array!102550) Bool)

(assert (=> start!131648 (and (array_inv!38691 _values!470) e!857763)))

(declare-fun array_inv!38692 (array!102548) Bool)

(assert (=> start!131648 (array_inv!38692 _keys!618)))

(declare-fun mapNonEmpty!58234 () Bool)

(declare-fun tp!110762 () Bool)

(assert (=> mapNonEmpty!58234 (= mapRes!58234 (and tp!110762 e!857762))))

(declare-fun mapRest!58234 () (Array (_ BitVec 32) ValueCell!17933))

(declare-fun mapValue!58234 () ValueCell!17933)

(declare-fun mapKey!58234 () (_ BitVec 32))

(assert (=> mapNonEmpty!58234 (= (arr!49478 _values!470) (store mapRest!58234 mapKey!58234 mapValue!58234))))

(assert (= (and start!131648 res!1058263) b!1541926))

(assert (= (and b!1541926 res!1058264) b!1541929))

(assert (= (and b!1541929 res!1058265) b!1541927))

(assert (= (and b!1541928 condMapEmpty!58234) mapIsEmpty!58234))

(assert (= (and b!1541928 (not condMapEmpty!58234)) mapNonEmpty!58234))

(get-info :version)

(assert (= (and mapNonEmpty!58234 ((_ is ValueCellFull!17933) mapValue!58234)) b!1541925))

(assert (= (and b!1541928 ((_ is ValueCellFull!17933) mapDefault!58234)) b!1541924))

(assert (= start!131648 b!1541928))

(declare-fun m!1423053 () Bool)

(assert (=> b!1541927 m!1423053))

(declare-fun m!1423055 () Bool)

(assert (=> b!1541929 m!1423055))

(declare-fun m!1423057 () Bool)

(assert (=> start!131648 m!1423057))

(declare-fun m!1423059 () Bool)

(assert (=> start!131648 m!1423059))

(declare-fun m!1423061 () Bool)

(assert (=> start!131648 m!1423061))

(declare-fun m!1423063 () Bool)

(assert (=> mapNonEmpty!58234 m!1423063))

(check-sat (not b!1541927) (not b!1541929) tp_is_empty!37687 (not start!131648) (not mapNonEmpty!58234))
(check-sat)
