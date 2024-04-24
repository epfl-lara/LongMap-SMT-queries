; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132158 () Bool)

(assert start!132158)

(declare-fun b!1545105 () Bool)

(declare-fun e!859829 () Bool)

(declare-fun tp_is_empty!37735 () Bool)

(assert (=> b!1545105 (= e!859829 tp_is_empty!37735)))

(declare-fun mapNonEmpty!58306 () Bool)

(declare-fun mapRes!58306 () Bool)

(declare-fun tp!110833 () Bool)

(assert (=> mapNonEmpty!58306 (= mapRes!58306 (and tp!110833 e!859829))))

(declare-datatypes ((V!58757 0))(
  ( (V!58758 (val!18945 Int)) )
))
(declare-datatypes ((ValueCell!17957 0))(
  ( (ValueCellFull!17957 (v!21738 V!58757)) (EmptyCell!17957) )
))
(declare-fun mapRest!58306 () (Array (_ BitVec 32) ValueCell!17957))

(declare-datatypes ((array!102822 0))(
  ( (array!102823 (arr!49606 (Array (_ BitVec 32) ValueCell!17957)) (size!50157 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102822)

(declare-fun mapValue!58306 () ValueCell!17957)

(declare-fun mapKey!58306 () (_ BitVec 32))

(assert (=> mapNonEmpty!58306 (= (arr!49606 _values!470) (store mapRest!58306 mapKey!58306 mapValue!58306))))

(declare-fun mapIsEmpty!58306 () Bool)

(assert (=> mapIsEmpty!58306 mapRes!58306))

(declare-fun b!1545106 () Bool)

(declare-fun e!859832 () Bool)

(assert (=> b!1545106 (= e!859832 false)))

(declare-fun lt!666763 () Bool)

(declare-datatypes ((array!102824 0))(
  ( (array!102825 (arr!49607 (Array (_ BitVec 32) (_ BitVec 64))) (size!50158 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102824)

(declare-datatypes ((List!35926 0))(
  ( (Nil!35923) (Cons!35922 (h!37385 (_ BitVec 64)) (t!50612 List!35926)) )
))
(declare-fun arrayNoDuplicates!0 (array!102824 (_ BitVec 32) List!35926) Bool)

(assert (=> b!1545106 (= lt!666763 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35923))))

(declare-fun res!1059469 () Bool)

(assert (=> start!132158 (=> (not res!1059469) (not e!859832))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132158 (= res!1059469 (validMask!0 mask!926))))

(assert (=> start!132158 e!859832))

(assert (=> start!132158 true))

(declare-fun e!859830 () Bool)

(declare-fun array_inv!38855 (array!102822) Bool)

(assert (=> start!132158 (and (array_inv!38855 _values!470) e!859830)))

(declare-fun array_inv!38856 (array!102824) Bool)

(assert (=> start!132158 (array_inv!38856 _keys!618)))

(declare-fun b!1545107 () Bool)

(declare-fun res!1059468 () Bool)

(assert (=> b!1545107 (=> (not res!1059468) (not e!859832))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102824 (_ BitVec 32)) Bool)

(assert (=> b!1545107 (= res!1059468 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1545108 () Bool)

(declare-fun e!859831 () Bool)

(assert (=> b!1545108 (= e!859831 tp_is_empty!37735)))

(declare-fun b!1545109 () Bool)

(declare-fun res!1059470 () Bool)

(assert (=> b!1545109 (=> (not res!1059470) (not e!859832))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1545109 (= res!1059470 (and (= (size!50157 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50158 _keys!618) (size!50157 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1545110 () Bool)

(assert (=> b!1545110 (= e!859830 (and e!859831 mapRes!58306))))

(declare-fun condMapEmpty!58306 () Bool)

(declare-fun mapDefault!58306 () ValueCell!17957)

(assert (=> b!1545110 (= condMapEmpty!58306 (= (arr!49606 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17957)) mapDefault!58306)))))

(assert (= (and start!132158 res!1059469) b!1545109))

(assert (= (and b!1545109 res!1059470) b!1545107))

(assert (= (and b!1545107 res!1059468) b!1545106))

(assert (= (and b!1545110 condMapEmpty!58306) mapIsEmpty!58306))

(assert (= (and b!1545110 (not condMapEmpty!58306)) mapNonEmpty!58306))

(get-info :version)

(assert (= (and mapNonEmpty!58306 ((_ is ValueCellFull!17957) mapValue!58306)) b!1545105))

(assert (= (and b!1545110 ((_ is ValueCellFull!17957) mapDefault!58306)) b!1545108))

(assert (= start!132158 b!1545110))

(declare-fun m!1426491 () Bool)

(assert (=> mapNonEmpty!58306 m!1426491))

(declare-fun m!1426493 () Bool)

(assert (=> b!1545106 m!1426493))

(declare-fun m!1426495 () Bool)

(assert (=> start!132158 m!1426495))

(declare-fun m!1426497 () Bool)

(assert (=> start!132158 m!1426497))

(declare-fun m!1426499 () Bool)

(assert (=> start!132158 m!1426499))

(declare-fun m!1426501 () Bool)

(assert (=> b!1545107 m!1426501))

(check-sat tp_is_empty!37735 (not mapNonEmpty!58306) (not start!132158) (not b!1545107) (not b!1545106))
(check-sat)
