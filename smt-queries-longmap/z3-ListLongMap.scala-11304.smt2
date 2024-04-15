; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131678 () Bool)

(assert start!131678)

(declare-fun mapNonEmpty!58279 () Bool)

(declare-fun mapRes!58279 () Bool)

(declare-fun tp!110807 () Bool)

(declare-fun e!857987 () Bool)

(assert (=> mapNonEmpty!58279 (= mapRes!58279 (and tp!110807 e!857987))))

(declare-datatypes ((V!58733 0))(
  ( (V!58734 (val!18936 Int)) )
))
(declare-datatypes ((ValueCell!17948 0))(
  ( (ValueCellFull!17948 (v!21733 V!58733)) (EmptyCell!17948) )
))
(declare-fun mapRest!58279 () (Array (_ BitVec 32) ValueCell!17948))

(declare-fun mapValue!58279 () ValueCell!17948)

(declare-fun mapKey!58279 () (_ BitVec 32))

(declare-datatypes ((array!102600 0))(
  ( (array!102601 (arr!49503 (Array (_ BitVec 32) ValueCell!17948)) (size!50055 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102600)

(assert (=> mapNonEmpty!58279 (= (arr!49503 _values!470) (store mapRest!58279 mapKey!58279 mapValue!58279))))

(declare-fun res!1058398 () Bool)

(declare-fun e!857988 () Bool)

(assert (=> start!131678 (=> (not res!1058398) (not e!857988))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131678 (= res!1058398 (validMask!0 mask!926))))

(assert (=> start!131678 e!857988))

(assert (=> start!131678 true))

(declare-fun e!857991 () Bool)

(declare-fun array_inv!38711 (array!102600) Bool)

(assert (=> start!131678 (and (array_inv!38711 _values!470) e!857991)))

(declare-datatypes ((array!102602 0))(
  ( (array!102603 (arr!49504 (Array (_ BitVec 32) (_ BitVec 64))) (size!50056 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102602)

(declare-fun array_inv!38712 (array!102602) Bool)

(assert (=> start!131678 (array_inv!38712 _keys!618)))

(declare-fun b!1542194 () Bool)

(declare-fun res!1058399 () Bool)

(assert (=> b!1542194 (=> (not res!1058399) (not e!857988))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102602 (_ BitVec 32)) Bool)

(assert (=> b!1542194 (= res!1058399 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1542195 () Bool)

(declare-fun tp_is_empty!37717 () Bool)

(assert (=> b!1542195 (= e!857987 tp_is_empty!37717)))

(declare-fun b!1542196 () Bool)

(declare-fun res!1058400 () Bool)

(assert (=> b!1542196 (=> (not res!1058400) (not e!857988))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542196 (= res!1058400 (and (= (size!50055 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50056 _keys!618) (size!50055 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1542197 () Bool)

(declare-fun e!857990 () Bool)

(assert (=> b!1542197 (= e!857990 tp_is_empty!37717)))

(declare-fun b!1542198 () Bool)

(assert (=> b!1542198 (= e!857991 (and e!857990 mapRes!58279))))

(declare-fun condMapEmpty!58279 () Bool)

(declare-fun mapDefault!58279 () ValueCell!17948)

(assert (=> b!1542198 (= condMapEmpty!58279 (= (arr!49503 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17948)) mapDefault!58279)))))

(declare-fun mapIsEmpty!58279 () Bool)

(assert (=> mapIsEmpty!58279 mapRes!58279))

(declare-fun b!1542199 () Bool)

(assert (=> b!1542199 (= e!857988 false)))

(declare-fun lt!665542 () Bool)

(declare-datatypes ((List!35929 0))(
  ( (Nil!35926) (Cons!35925 (h!37371 (_ BitVec 64)) (t!50615 List!35929)) )
))
(declare-fun arrayNoDuplicates!0 (array!102602 (_ BitVec 32) List!35929) Bool)

(assert (=> b!1542199 (= lt!665542 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35926))))

(assert (= (and start!131678 res!1058398) b!1542196))

(assert (= (and b!1542196 res!1058400) b!1542194))

(assert (= (and b!1542194 res!1058399) b!1542199))

(assert (= (and b!1542198 condMapEmpty!58279) mapIsEmpty!58279))

(assert (= (and b!1542198 (not condMapEmpty!58279)) mapNonEmpty!58279))

(get-info :version)

(assert (= (and mapNonEmpty!58279 ((_ is ValueCellFull!17948) mapValue!58279)) b!1542195))

(assert (= (and b!1542198 ((_ is ValueCellFull!17948) mapDefault!58279)) b!1542197))

(assert (= start!131678 b!1542198))

(declare-fun m!1423233 () Bool)

(assert (=> mapNonEmpty!58279 m!1423233))

(declare-fun m!1423235 () Bool)

(assert (=> start!131678 m!1423235))

(declare-fun m!1423237 () Bool)

(assert (=> start!131678 m!1423237))

(declare-fun m!1423239 () Bool)

(assert (=> start!131678 m!1423239))

(declare-fun m!1423241 () Bool)

(assert (=> b!1542194 m!1423241))

(declare-fun m!1423243 () Bool)

(assert (=> b!1542199 m!1423243))

(check-sat (not start!131678) tp_is_empty!37717 (not mapNonEmpty!58279) (not b!1542199) (not b!1542194))
(check-sat)
