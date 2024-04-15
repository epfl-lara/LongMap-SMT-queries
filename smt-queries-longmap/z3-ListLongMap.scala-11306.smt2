; Options: -in -smt2
(set-option :produce-unsat-assumptions true)

(declare-fun start!131690 () Bool)

(assert start!131690)

(declare-fun b!1542302 () Bool)

(declare-fun e!858078 () Bool)

(declare-fun tp_is_empty!37729 () Bool)

(assert (=> b!1542302 (= e!858078 tp_is_empty!37729)))

(declare-fun b!1542303 () Bool)

(declare-fun e!858081 () Bool)

(declare-fun e!858079 () Bool)

(declare-fun mapRes!58297 () Bool)

(assert (=> b!1542303 (= e!858081 (and e!858079 mapRes!58297))))

(declare-fun condMapEmpty!58297 () Bool)

(declare-datatypes ((V!58749 0))(
  ( (V!58750 (val!18942 Int)) )
))
(declare-datatypes ((ValueCell!17954 0))(
  ( (ValueCellFull!17954 (v!21739 V!58749)) (EmptyCell!17954) )
))
(declare-datatypes ((array!102624 0))(
  ( (array!102625 (arr!49515 (Array (_ BitVec 32) ValueCell!17954)) (size!50067 (_ BitVec 32))) )
))
(declare-fun _values!470 () array!102624)

(declare-fun mapDefault!58297 () ValueCell!17954)

(assert (=> b!1542303 (= condMapEmpty!58297 (= (arr!49515 _values!470) ((as const (Array (_ BitVec 32) ValueCell!17954)) mapDefault!58297)))))

(declare-fun b!1542304 () Bool)

(declare-fun e!858077 () Bool)

(assert (=> b!1542304 (= e!858077 false)))

(declare-fun lt!665560 () Bool)

(declare-datatypes ((array!102626 0))(
  ( (array!102627 (arr!49516 (Array (_ BitVec 32) (_ BitVec 64))) (size!50068 (_ BitVec 32))) )
))
(declare-fun _keys!618 () array!102626)

(declare-datatypes ((List!35934 0))(
  ( (Nil!35931) (Cons!35930 (h!37376 (_ BitVec 64)) (t!50620 List!35934)) )
))
(declare-fun arrayNoDuplicates!0 (array!102626 (_ BitVec 32) List!35934) Bool)

(assert (=> b!1542304 (= lt!665560 (arrayNoDuplicates!0 _keys!618 #b00000000000000000000000000000000 Nil!35931))))

(declare-fun res!1058453 () Bool)

(assert (=> start!131690 (=> (not res!1058453) (not e!858077))))

(declare-fun mask!926 () (_ BitVec 32))

(declare-fun validMask!0 ((_ BitVec 32)) Bool)

(assert (=> start!131690 (= res!1058453 (validMask!0 mask!926))))

(assert (=> start!131690 e!858077))

(assert (=> start!131690 true))

(declare-fun array_inv!38717 (array!102624) Bool)

(assert (=> start!131690 (and (array_inv!38717 _values!470) e!858081)))

(declare-fun array_inv!38718 (array!102626) Bool)

(assert (=> start!131690 (array_inv!38718 _keys!618)))

(declare-fun b!1542305 () Bool)

(assert (=> b!1542305 (= e!858079 tp_is_empty!37729)))

(declare-fun mapIsEmpty!58297 () Bool)

(assert (=> mapIsEmpty!58297 mapRes!58297))

(declare-fun b!1542306 () Bool)

(declare-fun res!1058454 () Bool)

(assert (=> b!1542306 (=> (not res!1058454) (not e!858077))))

(declare-fun extraKeys!417 () (_ BitVec 32))

(assert (=> b!1542306 (= res!1058454 (and (= (size!50067 _values!470) (bvadd #b00000000000000000000000000000001 mask!926)) (= (size!50068 _keys!618) (size!50067 _values!470)) (bvsge mask!926 #b00000000000000000000000000000000) (bvsge extraKeys!417 #b00000000000000000000000000000000) (bvsle extraKeys!417 #b00000000000000000000000000000011)))))

(declare-fun mapNonEmpty!58297 () Bool)

(declare-fun tp!110825 () Bool)

(assert (=> mapNonEmpty!58297 (= mapRes!58297 (and tp!110825 e!858078))))

(declare-fun mapValue!58297 () ValueCell!17954)

(declare-fun mapRest!58297 () (Array (_ BitVec 32) ValueCell!17954))

(declare-fun mapKey!58297 () (_ BitVec 32))

(assert (=> mapNonEmpty!58297 (= (arr!49515 _values!470) (store mapRest!58297 mapKey!58297 mapValue!58297))))

(declare-fun b!1542307 () Bool)

(declare-fun res!1058452 () Bool)

(assert (=> b!1542307 (=> (not res!1058452) (not e!858077))))

(declare-fun arrayForallSeekEntryOrOpenFound!0 ((_ BitVec 32) array!102626 (_ BitVec 32)) Bool)

(assert (=> b!1542307 (= res!1058452 (arrayForallSeekEntryOrOpenFound!0 #b00000000000000000000000000000000 _keys!618 mask!926))))

(assert (= (and start!131690 res!1058453) b!1542306))

(assert (= (and b!1542306 res!1058454) b!1542307))

(assert (= (and b!1542307 res!1058452) b!1542304))

(assert (= (and b!1542303 condMapEmpty!58297) mapIsEmpty!58297))

(assert (= (and b!1542303 (not condMapEmpty!58297)) mapNonEmpty!58297))

(get-info :version)

(assert (= (and mapNonEmpty!58297 ((_ is ValueCellFull!17954) mapValue!58297)) b!1542302))

(assert (= (and b!1542303 ((_ is ValueCellFull!17954) mapDefault!58297)) b!1542305))

(assert (= start!131690 b!1542303))

(declare-fun m!1423305 () Bool)

(assert (=> b!1542304 m!1423305))

(declare-fun m!1423307 () Bool)

(assert (=> start!131690 m!1423307))

(declare-fun m!1423309 () Bool)

(assert (=> start!131690 m!1423309))

(declare-fun m!1423311 () Bool)

(assert (=> start!131690 m!1423311))

(declare-fun m!1423313 () Bool)

(assert (=> mapNonEmpty!58297 m!1423313))

(declare-fun m!1423315 () Bool)

(assert (=> b!1542307 m!1423315))

(check-sat (not mapNonEmpty!58297) (not b!1542307) (not start!131690) (not b!1542304) tp_is_empty!37729)
(check-sat)
