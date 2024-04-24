; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!132116 () Bool)

(assert start!132116)

(declare-fun mapNonEmpty!58243 () Bool)

(declare-fun mapRes!58243 () Bool)

(declare-fun tp!110770 () Bool)

(declare-fun e!859516 () Bool)

(assert (=> mapNonEmpty!58243 (= mapRes!58243 (and tp!110770 e!859516))))

(declare-fun mapKey!58243 () (_ BitVec 32))

(declare-datatypes ((V!58701 0))(
  ( (V!58702 (val!18924 Int)) )
))
(declare-datatypes ((ValueCell!17936 0))(
  ( (ValueCellFull!17936 (v!21717 V!58701)) (EmptyCell!17936) )
))
(declare-fun mapValue!58243 () ValueCell!17936)

(declare-fun mapRest!58243 () (Array (_ BitVec 32) ValueCell!17936))

(declare-datatypes ((array!102742 0))(
  ( (array!102743 (arr!49566 (Array (_ BitVec 32) ValueCell!17936)) (size!50117 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102742)

(assert (=> mapNonEmpty!58243 (= (arr!49566 _values!470) (store mapRest!58243 mapKey!58243 mapValue!58243))))

(declare-fun b!1544727 () Bool)

(declare-fun res!1059281 () Bool)

(declare-fun e!859517 () Bool)

(assert (=> b!1544727 (=> (not res!1059281) (not e!859517))))

(declare-datatypes ((array!102744 0))(
  ( (array!102745 (arr!49567 (Array (_ BitVec 32) (_ BitVec 64))) (size!50118 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102744)

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102744 (_ BitVec 32)) Bool)

(assert (=> b!1544727 (= res!1059281 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(declare-fun b!1544728 () Bool)

(declare-fun e!859514 () Bool)

(declare-fun e!859518 () Bool)

(assert (=> b!1544728 (= e!859514 (and e!859518 mapRes!58243))))

(declare-fun condMapEmpty!58243 () Bool)

(declare-fun mapDefault!58243 () ValueCell!17936)

(assert (=> b!1544728 (= condMapEmpty!58243 (= (arr!49566 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17936)) mapDefault!58243)))))

(declare-fun mapIsEmpty!58243 () Bool)

(assert (=> mapIsEmpty!58243 mapRes!58243))

(declare-fun b!1544729 () Bool)

(declare-fun res!1059279 () Bool)

(assert (=> b!1544729 (=> (not res!1059279) (not e!859517))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1544729 (= res!1059279 (and (= (size!50117 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50118 _keys!618) (size!50117 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun b!1544730 () Bool)

(declare-fun tp_is_empty!37693 () Bool)

(assert (=> b!1544730 (= e!859516 tp_is_empty!37693)))

(declare-fun res!1059280 () Bool)

(assert (=> start!132116 (=> (not res!1059280) (not e!859517))))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!132116 (= res!1059280 (validMask!0 mask!926))))

(assert (=> start!132116 e!859517))

(assert (=> start!132116 true))

(declare-fun array_inv!38827 (array!102742) Bool)

(assert (=> start!132116 (and (array_inv!38827 _values!470) e!859514)))

(declare-fun array_inv!38828 (array!102744) Bool)

(assert (=> start!132116 (array_inv!38828 _keys!618)))

(declare-fun b!1544731 () Bool)

(assert (=> b!1544731 (= e!859518 tp_is_empty!37693)))

(declare-fun b!1544732 () Bool)

(assert (=> b!1544732 (= e!859517 false)))

(declare-fun lt!666700 () Bool)

(declare-datatypes ((List!35913 0))(
  ( (Nil!35910) (Cons!35909 (h!37372 (_ BitVec 64)) (t!50599 List!35913)) )
))
(declare-fun arrayNoDuplicates!0 (array!102744 (_ BitVec 32) List!35913) Bool)

(assert (=> b!1544732 (= lt!666700 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35910))))

(assert (= (and start!132116 res!1059280) b!1544729))

(assert (= (and b!1544729 res!1059279) b!1544727))

(assert (= (and b!1544727 res!1059281) b!1544732))

(assert (= (and b!1544728 condMapEmpty!58243) mapIsEmpty!58243))

(assert (= (and b!1544728 (not condMapEmpty!58243)) mapNonEmpty!58243))

(get-info :version)

(assert (= (and mapNonEmpty!58243 ((_ is ValueCellFull!17936) mapValue!58243)) b!1544730))

(assert (= (and b!1544728 ((_ is ValueCellFull!17936) mapDefault!58243)) b!1544731))

(assert (= start!132116 b!1544728))

(declare-fun m!1426239 () Bool)

(assert (=> mapNonEmpty!58243 m!1426239))

(declare-fun m!1426241 () Bool)

(assert (=> b!1544727 m!1426241))

(declare-fun m!1426243 () Bool)

(assert (=> start!132116 m!1426243))

(declare-fun m!1426245 () Bool)

(assert (=> start!132116 m!1426245))

(declare-fun m!1426247 () Bool)

(assert (=> start!132116 m!1426247))

(declare-fun m!1426249 () Bool)

(assert (=> b!1544732 m!1426249))

(check-sat (not b!1544732) (not b!1544727) (not mapNonEmpty!58243) (not start!132116) tp_is_empty!37693)
(check-sat)
